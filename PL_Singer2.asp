<%@ LANGUAGE = VBScript.Encode %>
<!--#include file="PL_config.asp"-->
<%
NClassID=Trim(Request.QueryString("NClassID"))
set PL_rs=server.createobject("adodb.recordset")
PL_sql="SELECT * FROM NClass where (NClassID='"&NClassID&"') order by NClass desc"', isgood desc
PL_rs.open PL_sql,conn,1,1
response.Write "NClassID������ID��"&(PL_rs("NClassID"))&"<br><br>"
response.Write "NClass�����֣�"&(PL_rs("NClass"))&"<br><br>"
response.Write "SClassID����Ŀ��"&(PL_rs("SClassID"))&"<br><br>"
response.Write "abcd����Ŀ��"&(PL_rs("abcd"))&"<br><br>"
PL_rs.close
%>
