<!--#include file="../PL_config.asp"-->
<!--#include file="PL_user_Function.Asp"-->
<!--#include file="../PL_INC/md5.asp"-->
<%
'��ֹվ���ύ������
server_v1=Cstr(Request.ServerVariables("HTTP_REFERER"))
server_v2=Cstr(Request.ServerVariables("SERVER_NAME"))
if mid(server_v1,8,len(server_v2))<>server_v2 then
response.write "<br><br><center><table class='tableBorder' border=1 cellpadding=20 bordercolor=black bgcolor=#EEEEEE width=450>"
response.write "<tr><td style=&apos;font:9pt Verdana&apos;>"
response.write "<font color=red>�Բ������ύ������·������ϵͳ��ֹ���ⲿվ��ֱ���ύ���ݣ�</font>"
response.write "</td></tr></table></center>"
response.end()
end if
%>
<%' CSName ���Ը��ģ�ע�Ᵽ�ֺ�Aspxweb_Code.asp���һ��

If Request.Form("code") <> "" Then
	If ValidCode("CSName",Request.Form("codeKey"),Request.Form("code")) Then
		'Response.Write "��ϲ�����������֤����ȷ��"
	Else
	response.Write("<script type='text/JavaScript'>alert('�������֤�����');location.href='javascript:history.back();';</script>")
'		Response.Write "<font color=red>�������֤�����</font>"
'	Response.Write "&nbsp;&nbsp;<input type=button value=���� onclick='location.href=location.href'>"
	Response.End
	End If

else
response.Write("<script type='text/JavaScript'>alert('��������֤�룡');location.href='javascript:history.back();';</script>")
response.end
End If

Rem �ж���֤�������Ƿ���ȷ�ĺ���
Function ValidCode(pSN,k,c)
	Dim s,i
	s = Session(pSN)
	k = ";"&k&":"
	ValidCode = False
	i = InStr(s,k)
	If i > 0 Then
		If InStr(s,k&c&";") > 0 Then ValidCode = True
		Session(pSN) = Left(s,i) & Right(s,Len(s)-InStr(i+1,s,";"))
	End If
End Function
%>
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
'�޸��û�����
act=Trim(Request.Form("act"))
if act="xiugai" then
PL_username=Request.Cookies("Www_PinLuo_Com_user")("PL_username")
PL_userid=Request.Cookies("Www_PinLuo_Com_user")("PL_userid")
set rs=server.createobject("adodb.recordset")
sql="select * from [User] where(username='"&PL_username&"' and id='"&PL_userid&"')"
'order by ID desc, hits desc, isgood desc
rs.open sql,conn,1,3
if md5(request.form("oldpassword"))<>rs("password") then
response.Write("<script type='text/JavaScript'>alert('\n\n������ľ����벻��ȷ��\n\nΪ��ϵͳ�İ�ȫ��������������ϵ��޸ģ�\n\n������������ȷ�����룡\n\n');location.href='javascript:history.back();';</script>")
response.end()
end if

if Request("newpassword")<>"" then

if Len(Request("newpassword"))>20 or Len(Request("newpassword"))<6 then
response.Write("<script type='text/JavaScript'>alert('��������ȷ�������룡�����λ���������6��С��20��');location.href='javascript:history.back();';</script>")
response.end()
else
	newpassword=Request("newpassword")
end if

if newpassword<>Request("newpassword2") then
response.Write("<script type='text/JavaScript'>alert('��������������ȷ�����벻һ�£�');location.href='javascript:history.back();';</script>")
response.end()
else
end if

end if

if request.form("wenti")="" then
response.Write("<script type='text/JavaScript'>alert('���������뱣������ʾ���⣡');location.href='javascript:history.back();';</script>")
response.end()
else
end if


if IsValidEmail(trim(Request("Email")))=false then
response.Write("<script type='text/JavaScript'>alert('����Email�д���');location.href='javascript:history.back();';</script>")
response.end()
else
	Email=trim(Request("Email"))
end if

if qianming<>"" and Len(qianming)>100 then
response.Write("<script type='text/JavaScript'>alert('�������ǩ�����ܶ���100�ַ���');location.href='javascript:history.back();';</script>")
response.end()
else
end if

        if request.form("newpassword")<>"" then
		rs("password")=md5(request.form("newpassword"))
		end if
		
		rs("email")=email
		rs("qq")=request.form("qq")
		rs("loginDate")=NOW()
        rs("loginIP")=Request.ServerVariables("REMOTE_ADDR")
		rs("wenti")=request.form("wenti")
		
		if request.form("daan")<>"" then
		rs("daan")=request.form("daan")
		end if
		
		if request.form("Address")<>"" then rs("Address")=request.form("Address")
		if request.form("qianming")<>"" then rs("qianming")=request.form("qianming")
		if request.form("Tel")<>"" then rs("Tel")=request.form("Tel")
		if request.form("Sex")<>"" then rs("Sex")=request.form("Sex")
		if request.form("Youbian")<>"" then rs("Youbian")=request.form("Youbian")
		if request.form("Name")<>"" and request.form("Shenfenzheng")<>"" then
			rs("Name")=request("Name")
			rs("Shenfenzheng")=request("Shenfenzheng")
			else
		end if
		rs("addDate")=NOW()
		if request.form("vipdate")<>rs("vipdate") and request.form("vipdate")>0 then
		rs("lockuser")=true '(VIP�û����)
		else
		rs("lockuser")=false
		end if
		rs.update
response.Write("<script type='text/JavaScript'>alert('��ϲ�������Ļ�Ա�����޸ĳɹ���');location.href='PL_UserModify.asp';</script>")

rs.close
set rs=nothing
conn.close
set conn=nothing
response.End()
end if



'����Ϊע�����û�

if Request("UserName")="" or len(Request("UserName"))>20 or len(Request("UserName"))<3 then
response.Write("<script type='text/JavaScript'>alert('��������ȷ���û�����');location.href='javascript:history.back();';</script>")
response.end()
else
	UserName=trim(Request("UserName"))
end if
if Request("password")="" or Len(Request("password"))>20 or Len(Request("password"))<6 then
response.Write("<script type='text/JavaScript'>alert('��������ȷ�����룡�����λ���������6��С��20��');location.href='javascript:history.back();';</script>")
response.end()
else
	password=Request("password")
end if

if password<>Request("password2") then
response.Write("<script type='text/JavaScript'>alert('������������ȷ�����벻һ�£�');location.href='javascript:history.back();';</script>")
response.end()
else
end if


if request.form("wenti")="" or request.form("wenti")="" then
response.Write("<script type='text/JavaScript'>alert('���������뱣������ʾ����ʹ𰸣�');location.href='javascript:history.back();';</script>")
response.end()
else
end if

if IsValidEmail(trim(Request("Email")))=false then
response.Write("<script type='text/JavaScript'>alert('����Email�д���');location.href='javascript:history.back();';</script>")
response.end()
else
	Email=trim(Request("Email"))
end if

if qianming<>"" and Len(qianming)>100 then
response.Write("<script type='text/JavaScript'>alert('�������ǩ�����ܶ���100�ַ���');location.href='javascript:history.back();';</script>")
response.end()
else
end if

youbian=Request("youbian")


'if Request("qq")="" or Len(Request("qq"))<5 then
'response.Write("")
'response.end()
'else
	qq=Request("qq")
'end if

	set rs=server.createobject("adodb.recordset")
	sql="select * from [user] where username='"&username&"'"
	rs.open sql,conn,1,3
	if not rs.eof or username=WebName then
response.Write("<script type='text/JavaScript'>alert('�Բ�����������û����Ѿ���ע�ᣬ���������룡');location.href='javascript:history.back();';</script>")
response.end()
	else
		rs.addnew
		rs("username")=username
		rs("password")=md5(request.form("password"))
		rs("email")=email
		rs("qq")=qq
		rs("loginDate")=NOW()
        rs("loginIP")=Request.ServerVariables("REMOTE_ADDR")
		rs("vipdate")=request.form("vipdate")
		rs("wenti")=request.form("wenti")
		rs("daan")=request.form("daan")
		if request.form("Address")<>"" then rs("Address")=request.form("Address")
		if request.form("qianming")<>"" then rs("qianming")=request.form("qianming")
		if request.form("Tel")<>"" then rs("Tel")=request.form("Tel")
		if request.form("Sex")<>"" then rs("Sex")=request.form("Sex")
		if request.form("Youbian")<>"" then rs("Youbian")=request.form("Youbian")
		if request.form("Name")<>"" and request.form("Shenfenzheng")<>"" then
			rs("Name")=request("Name")
			rs("Shenfenzheng")=request("Shenfenzheng")
			else
		end if
		rs("addDate")=NOW()
		if request.form("vipdate")>0 then
		rs("lockuser")=true '(VIP�û����)
		else
		rs("lockuser")=False 
		end if
		rs.update
	end if
	rs.close
	set rs=nothing
response.Write("<script type='text/JavaScript'>alert('��ϲ������Աע��ɹ���');location.href='../index.asp';</script>")

conn.close
set conn=nothing
%>
