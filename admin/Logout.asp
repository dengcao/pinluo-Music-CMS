<!--#include file="const.asp"-->
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
IsAdmin=session("IsAdmin")
If IsAdmin=true Then
	set rs=server.createobject("adodb.recordset")
	AdminID=session("AdminID")
	sql="select * from admin where id="&AdminID
	rs.open sql,conn,1,3
	if not rs.EOF then
		rs("LogoutTime")=now()
		rs.Update
		Session("AdminID")=""
		Session("IsAdmin")=""
		Session("KEY")=""
		rs.Close
		set rs=nothing
	else
		response.write"���ݿ����"
		Response.end
	end if
end if
conn.close
set conn=nothing	
response.redirect ("login.asp")
%>
