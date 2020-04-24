<!--#include file="function.asp"-->
<%CheckAdmin1%>
<!--#include file="6tingconn.asp"-->
<%
founderr=false
username=request.form("username")
password=request.form("password")
if username="" or password="" then
	errmsg=errmsg+"<br>"+"<li>管理员名称和密码都不能为空！"
	founderr=true
	call error()
	Response.End 
end if

set rs=server.CreateObject("ADODB.RecordSet")

if request("act")="edit" and request.QueryString("id")<>"" then
	id=request("id")
	sql="select * from admin where id="& checksql(request.QueryString("id"))
	rs.open sql,conn1,3,2
	if not rs.eof then
		rs("Username")=username
		rs("Password")=password
		rs.update
	end if
	rs.close
elseif request("act")="add" then
	sql="select * from admin where username='"&username&"'"
	rs.open sql,conn1,3,2
	if (rs.eof and rs.bof) then
		rs.addnew
		rs("Username")=UserName
		rs("Password")=Password
		rs.update
	end if
	rs.close()
end if
set rs=nothing
conn1.close
set conn1=nothing
response.redirect "6ting9.asp"
%>
<html></html>