<!--#include file="const.asp"-->
<%CheckAdmin1%>
<%PageName="V800_4"%>
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
    <td height="22" colspan="3" align="center"><strong>添 加 编 辑 专 辑 (第一步)</strong></td>
  </tr></table>
         <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
                  
<%
		sql2="select * from SClass where Classid="&rs("Classid")&" order by Sclassid"
		rs2.open sql2,conn,1,1
		if rs2.eof then
		else
			j=0
			do while not rs2.eof
			j=j+1
%>

	                   <tr>
                      <td width="100%" class="forumrow">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=j%>.&nbsp;&nbsp;&nbsp;<a title="进入管理 <%=rs2("sclass")%> 所属歌手 " href=Admin_special_Add.Asp?Classid=<%=rs("Classid")%>&SClassid=<%=rs2("SClassid")%>><%=rs2("SClass")%></font></a></td>
                     
              
                  
<%
			rs2.movenext
			loop
		end if
		rs2.close
end if
rs.close
%>
      </table>
<% 
set rs=nothing
set rs2=nothing
conn.close
set conn=nothing
%>
</body>
</html>
