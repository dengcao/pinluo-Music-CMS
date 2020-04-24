<!--#include file="const.asp"-->
<%CheckAdmin1%>
<%PageName="V800_3"%>
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
set rs=server.createobject("adodb.recordset")
set rs2=server.createobject("adodb.recordset")

sql="select * from class order by classid"
rs.open sql,conn,1,1
i=request("id")
if i="" then i=rs("Classid")
do while not rs.eof
rs.movenext
loop
rs.close
sql="select * from class where classid="&i
rs.open sql,conn,1,1
if rs.eof then
else
%>
<table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
  <tr class="title"> 
    <td height="22" colspan="3" align="center" background="images/manage/admin_bg.gif"><strong>歌 手 分 类 管 理</strong></td>
  </tr>
        <tr>
          <td width="100%" class="forumrow">
                  <table class="tableBorder" width="100%" border="0" cellspacing="0" cellpadding="0"  align=center>
                 
<%
		sql2="select * from SClass where Classid="&rs("Classid")&" order by Sclassid"
		rs2.open sql2,conn,1,1
		if rs2.eof then
		else
		j=0
			do while not rs2.eof
			j=j+1
%>
	
                  <form method="POST" action="Admin_Nclass_Err.Asp?act=add&Classid=<%=rs("Classid")%>&SClassid=<%=rs2("SClassid")%>" align="center">
                    <tr>
                      <td class="forumrow" width="26%">&nbsp;<%=rs2("SClassid")%>.<a title="管理 <%=rs2("sclass")%> 所属的歌手" href=Admin_Nclass_Edit.Asp?Classid=<%=rs("Classid")%>&SClassid=<%=rs2("SClassid")%>><%=rs2("SClass")%></a></td>
                      <td class="forumrow" width="51%">
                      歌手姓名：
                      <input size=13 type="text" name="NClass">
                      字母索引：
                      <input size=6 type="text" name="Abcd">
                      <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" type="submit" value="添 加" name="B1">                       </td>
                    </tr>
                   </form>
                
                
<%
			rs2.movenext
			loop
		end if
		rs2.close
end if
rs.close
%>
  </table>
		  </td>
        </tr>
      </table>
<% 
set rs=nothing
set rs2=nothing
conn.close
set conn=nothing
%>
</body>
</html>
