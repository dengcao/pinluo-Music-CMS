<!--#include file="Const.Asp"-->
<%CheckAdmin3%>
<%PageName="Art_2"%>
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
act=request("act")
ClassID=request.form("Classid")
founderr=false

if act="rename" then
	FunRename
elseif act="del" then
	FunDel
elseif act="add" then
	FunAdd
else
	errmsg=errmsg+"<br>"+"<li>������������ϵ����Ա"
	founderr=true
end if

if founderr=true then
	call error()
else

end if

function FunRename
	SClassid=request.QueryString("SClassid")
	SClass=trim(request.form("Sclass"))
	if SClass="" then
		errmsg=errmsg+"<br>"+"<li>��Ŀ���Ʋ���Ϊ�գ�"
		call error()
		Response.End 
	end if
	set rs=server.createobject("adodb.recordset")
	sql = "SELECT * FROM Sclass where Sclassid=" & SClassid
	rs.Open sql,conn, 1, 3
	if err.Number<>0 then
		err.clear
		errmsg=errmsg+"<br>"+"<li>������������ϵ����Ա"
		founderr=true
	else
		rs("Sclass") = Sclass
		rs.Update
	end if
	rs.Close

	set rs=nothing
	conn.close
	set conn=nothing
end function

function FunDel
	SClassid=request("SClassid")
	sql="delete from Sclass where Sclassid=" & SClassid
	conn.execute sql
	Rem 'ɾ��������Ŀ
	sql="delete from Nclass where Sclassid=" & SClassid
	conn.execute sql
	Rem 'ɾ�������Ʒ
	sql="delete from special where Sclassid=" & SClassid
	conn.execute sql
	if err.Number<>0 then
		err.clear
		errmsg=errmsg+"<br>"+"<li>������������ϵ����Ա"
		founderr=true
	end if
end function
	
function FunAdd
	SClass=trim(request.form("SClass"))
	Classid=request.QueryString("Classid")
	if SClass="" then
		errmsg=errmsg+"<br>"+"<li>��Ŀ���Ʋ���Ϊ�գ�"
		call error()
		Response.End 
	end if
	set rs=server.createobject("adodb.recordset")
	sql = "SELECT * FROM Sclass where (Sclassid IS NULL)"
	rs.Open sql,conn, 1, 3
	if err.Number<>0 then
		err.clear
		errmsg=errmsg+"<br>"+"<li>������������ϵ����Ա"
		founderr=true
	else
		rs.AddNew
		rs("Sclass") = SClass
		rs("Classid") = Classid
		rs.Update
	end if
	rs.Close
	set rs=nothing
	conn.close
	set conn=nothing
end function
Response.Redirect "Art_3.asp?id="&classid&""
%>
