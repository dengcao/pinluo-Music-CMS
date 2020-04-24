<!--#include file="Const.Asp"-->
<%CheckAdmin2%>
<%PageName="Art"%>
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
    <td height="22" colspan="3" align="center" background="images/manage/admin_bg_1.gif"><strong>分 类 管 理</strong></td>
  </tr>
  
<form method="POST" action="Art_2.asp?act=add&Classid=<%=rs("Classid")%>" align="center">
  <tr class="tdbg">
    <td height="30" class="forumrow"><div align="center">总类</div></td>
    <td width="535" class="forumrow"><div align="center">生成html</div></td>
    <td width="325" class="forumrow"><div align="center">添加歌手分类</div></td>
  </tr>
</form>
                 
             
<%
do while not rs.eof
	i=i+1
%>  
		
              
                   <form method="POST" action="Art_2.asp?act=add&Classid=<%=rs("Classid")%>" align="center">
  <tr class="tdbg"> 
    <td width="247" height="30" class="forumrow"><div align="center"><a title="点击进入管理 <%=rs("class")%> 的二级分类" href=Art_3.asp?id=<%=rs("Classid")%>><%=rs("Class")%></a></div></td>
	
    <td class="forumrow"><div align="center"><a title='生成<%=rs("class")%>的所有歌手列表' href='make_typeall.asp?type=all&zzyy=<%=rs("classid")%>'><font color=BLUE>生成歌手列表</font></a></div></td>
    <td class="forumrow"><div align="center"><input type="text" name="SClass" size="15">&nbsp;&nbsp;<input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" type="submit" value="添 加" name="B1"></div></td>
  </tr>
  </form>
  <%
if (i mod (MaxList/2)=0) and i>=(MaxList/2) then

	end if
	if i>=MaxList then exit do
    rs.movenext
	loop
	rs.close
		%>
</table>

<% 
set rs=nothing
conn.close
set conn=nothing
%>
</body>
</html>
