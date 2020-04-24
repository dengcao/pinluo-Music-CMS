<!--#include file="function.asp"-->
<!--#include file="6tingconn.asp"-->

<%
username=checksql(trim(Request.form("username")))
password=checksql(trim(Request.form("password")))
if username="" or password="" then Response.Redirect ("index.asp")
set rs = server.createobject("adodb.recordset")
sql="select id,LoginTimes,LoginTime,LoginIP from admin where username='"&username&"'and password='"&password&"'"
rs.open sql,conn1,1,3
if not rs.EOF then
	rs("LoginTimes")=rs("LoginTimes")+1
	rs("LoginTime")=now()
	rs("LoginIP")=Request.ServerVariables("REMOTE_ADDR")
	rs.Update

	Session("AdminID")=rs("id")
	Session("IsAdmin")=true
    	Session.timeout=900
	Response.Redirect ("admin.asp")
else
	errmsg="请输入正确的管理员名字和密码！"
	call error()
	Response.End 
end if
rs.close
set rs=nothing
conn1.close
set conn1=nothing
%>