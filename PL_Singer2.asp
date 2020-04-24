<%@ LANGUAGE = VBScript.Encode %>
<!--#include file="PL_config.asp"-->
<%
NClassID=Trim(Request.QueryString("NClassID"))
set PL_rs=server.createobject("adodb.recordset")
PL_sql="SELECT * FROM NClass where (NClassID='"&NClassID&"') order by NClass desc"', isgood desc
PL_rs.open PL_sql,conn,1,1
response.Write "NClassID：歌手ID："&(PL_rs("NClassID"))&"<br><br>"
response.Write "NClass：歌手："&(PL_rs("NClass"))&"<br><br>"
response.Write "SClassID：栏目："&(PL_rs("SClassID"))&"<br><br>"
response.Write "abcd：栏目："&(PL_rs("abcd"))&"<br><br>"
PL_rs.close
%>
