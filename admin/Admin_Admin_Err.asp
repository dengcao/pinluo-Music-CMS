<!--#include file="Const.Asp"-->
<%CheckAdmin3%>
<%
'
'����������������������������������������������������
'��                                                                   ��
'��                     Ʒ�����ֳ���ϵͳ1.0                              ��
'��                                                                   ��
'��     �ռ�����: Ʒ��  www.pinluo.com                                  ��
'��                                                                   ��
'��     ��������: ����  www.caozha.com                                  ��
'��                                                                   ��
'��     Դ�����Apache-2.0��ѿ�Դ���뱣�����������ӣ�                      ��
'��                                                                   ��
'����������������������������������������������������
'
'
founderr=false

username=request.form("username")
password=request.form("password")
oskey=request.form("oskey")
if username="" or password="" then
	errmsg=errmsg+"<br>"+"<li>����Ա���ƺ����붼����Ϊ�գ�"
	founderr=true
	call error()
	Response.End 
end if

set rs=server.CreateObject("ADODB.RecordSet")

if request("act")="edit" and request.QueryString("id")<>"" then
	id=request("id")
	sql="select * from admin where id="& request.QueryString("id")
	rs.open sql,conn,3,2
	if not rs.eof then
		rs("oskey")=oskey
		rs("Username")=username
		Rs("password") = md5(Request.Form("password"))
		rs.update
	end if
	rs.close
elseif request("act")="add" then
	sql="select * from admin where username='"&username&"'"
	rs.open sql,conn,3,2
	if (rs.eof and rs.bof) then
		rs.addnew
		rs("oskey")=oskey
		rs("Username")=UserName
		Rs("password") = md5(Request.Form("password"))
		rs.update
	end if
	rs.close
end if
set rs=nothing
conn.close
set conn=nothing
response.redirect "Admin_Admin.Asp"
%>
<html></html>
