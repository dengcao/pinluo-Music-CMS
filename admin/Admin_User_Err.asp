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
id=request.QueryString("id")
act=request("act")
set rs=server.CreateObject("ADODB.RecordSet")
if act="edit" then
	username=trim(request.form("username"))
	password=trim(request.form("password"))
	Sex=trim(request.form("Sex"))
	Email=trim(request.form("Email"))
	Tel=trim(request.form("Tel"))
	Name=trim(request.form("Name"))
	Address=trim(request.form("Address"))
	Shenfenzheng=trim(request.form("Shenfenzheng"))
	qq=trim(request.form("qq"))
	vipdate=trim(request.form("vipdate"))
	if username="" or password="" or Sex="" then
		errmsg="<br>�û����ƣ�������Ա𶼲���Ϊ�գ�</li>"
		call error()
		Response.End 
	end if
	sql="select * from [user] where id="& request("id")
	rs.open sql,conn,1,3
	if not rs.eof then
		rs("Username")=username
		
		if password<>rs("Password") then
		rs("Password")=md5(password)
		end if
		
		rs("Sex")=Sex

		if Email="" then
			rs("Email")=null
		else
			rs("Email")=Email
		end if

		if Tel="" then
			rs("Tel")=null
		else
			rs("Tel")=Tel
		end if

		if Name="" then
			rs("Name")=null
		else
			rs("Name")=Name
		end if

		if Address="" then
			rs("Address")=null
		else
			rs("Address")=Address
		end if

		if Shenfenzheng="" then
			rs("Shenfenzheng")=null
		else
			rs("Shenfenzheng")=Shenfenzheng
		end if
		if qq="" then
			rs("qq")=null
		else
			rs("qq")=qq
		end if
		if vipdate="" or vipdate<=0 then
			rs("vipdate")=0
			rs("lockuser")=true
		else
			rs("vipdate")=vipdate
			rs("lockuser")=false
		end if

		rs.update
	end if
	rs.close
elseif act="lock" then
	sql="select * from [user] where id="&id
	rs.open sql,conn,1,3
	if not rs.eof then
		if rs("lockuser")=false then
			rs("lockuser")=1
		else
			rs("lockuser")=0
		end if
		rs.update
	end if
	rs.close
elseif act="cz" then
	sql="select * from [user] where id="&id
	rs.open sql,conn,1,3
	if not rs.eof then
	vipdate=trim(request.form("vipdate"))
	adddate=trim(request.form("adddate"))

	rs("adddate")=adddate
	if vipdate="" or vipdate<=0 then
			rs("vipdate")=0
			rs("lockuser")=1
		else
			rs("vipdate")=vipdate
			rs("lockuser")=0
	end if
	rs.update
	end if
	rs.close
end if
set rs=nothing
conn.close
set conn=nothing
Response.Write("<script>alert(""��ϲ!�޸������ѳɹ�"");location.href=""Admin_User.asp"";</script>")
	Response.End
%>
