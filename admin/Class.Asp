<!--#include file="Const.Asp"-->
<%CheckAdmin1%>
<%PageName="Class"%>
<!--#include file="Top.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
<%
'
'☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
'★                                                                   ★
'☆                     品络音乐程序系统1.0                              ☆
'★                                                                   ★
'☆     空间域名: 品络  www.pinluo.com                                  ☆
'★                                                                   ★
'☆     程序制作: 草札  www.caozha.com                                  ☆
'★                                                                   ★
'★     源码基于Apache-2.0免费开源，请保留声明和链接！                      ★
'☆                                                                   ☆
'☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
'
'
dim i
i=0 
MaxList=80
set rs=server.createobject("adodb.recordset")
sql="select * from class order by classid"
rs.open sql,conn,1,1
i=request("id")
if i="" then i=rs("Classid")
%>

<table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
  <tr class="title"> 
    <td height="22" colspan="3" align="center" background="images/manage/admin_bg_1.gif"><strong>总 题 管 理</strong></td>
  </tr>
  <%
do while not rs.eof
	i=i+1
%>  
		  <form method="POST" action="Class2.Asp?act=rename&Classid=<%=rs("Classid")%>" id=form1 name=form1>
  <tr class="tdbg">
    <td height="30" class="forumrow"><%=rs("Classid")%>.<%=rs("Class")%></td>
    <td width="609" class="forumrow"><input size=20 type="text" name="Class" value="<%=rs("Class")%>">&nbsp;&nbsp;<input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" type="submit" value="改 名" name="Submit"></td>
    <td width="325" class="forumrow"><!--<a title='生成 <%=rs("class")%> 的所有二级分类' href='make_typeall.asp?type=all&zzyy=<%=rs("classid")%>'><font color=BLUE>生成分类HTM文件</font></a>-->   <a onClick="javascript:if (!window.confirm('您确认要删除吗？此操作不可恢复，请慎重操作！')){return false;};" title="不到万一请不要用此功能" href='Class2.Asp?act=del&Classid=<%=rs("ClassID")%>'><font color=red>删除</font></a></td>
  </tr>
  </form>
  <%
	if (i mod (MaxList/2)=0) and i>=(MaxList/2) then
%>

<%
	end if
	if i>=MaxList then exit do
    rs.movenext
	loop
	rs.close
	%>
  <tr class="tdbg"> 
    <td width="173" height="30"><strong>添加总类：</strong></td>
	<form method="POST" action="Class2.Asp?act=add">
    <td><input type="text" name="Class" size="20">  &nbsp;<input type="submit" value="添 加" name="B3" style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"></td>
    <td></td>
  </tr>
</table>

<% 
set rs=nothing
conn.close
set conn=nothing
%>
</body>
</html>
