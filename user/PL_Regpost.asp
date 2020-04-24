<!--#include file="../PL_config.asp"-->
<!--#include file="PL_user_Function.Asp"-->
<!--#include file="../PL_INC/md5.asp"-->
<%
'禁止站外提交表单数据
server_v1=Cstr(Request.ServerVariables("HTTP_REFERER"))
server_v2=Cstr(Request.ServerVariables("SERVER_NAME"))
if mid(server_v1,8,len(server_v2))<>server_v2 then
response.write "<br><br><center><table class='tableBorder' border=1 cellpadding=20 bordercolor=black bgcolor=#EEEEEE width=450>"
response.write "<tr><td style=&apos;font:9pt Verdana&apos;>"
response.write "<font color=red>对不起！你提交的数据路径有误，系统禁止从外部站点直接提交数据！</font>"
response.write "</td></tr></table></center>"
response.end()
end if
%>
<%' CSName 可以更改，注意保持和Aspxweb_Code.asp里的一致

If Request.Form("code") <> "" Then
	If ValidCode("CSName",Request.Form("codeKey"),Request.Form("code")) Then
		'Response.Write "恭喜您，输入的验证码正确！"
	Else
	response.Write("<script type='text/JavaScript'>alert('输入的验证码错误！');location.href='javascript:history.back();';</script>")
'		Response.Write "<font color=red>输入的验证码错误！</font>"
'	Response.Write "&nbsp;&nbsp;<input type=button value=返回 onclick='location.href=location.href'>"
	Response.End
	End If

else
response.Write("<script type='text/JavaScript'>alert('请输入验证码！');location.href='javascript:history.back();';</script>")
response.end
End If

Rem 判断验证码输入是否正确的函数
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
'修改用户资料
act=Trim(Request.Form("act"))
if act="xiugai" then
PL_username=Request.Cookies("Www_PinLuo_Com_user")("PL_username")
PL_userid=Request.Cookies("Www_PinLuo_Com_user")("PL_userid")
set rs=server.createobject("adodb.recordset")
sql="select * from [User] where(username='"&PL_username&"' and id='"&PL_userid&"')"
'order by ID desc, hits desc, isgood desc
rs.open sql,conn,1,3
if md5(request.form("oldpassword"))<>rs("password") then
response.Write("<script type='text/JavaScript'>alert('\n\n您输入的旧密码不正确！\n\n为了系统的安全，您不能完成资料的修改！\n\n请重新输入正确的密码！\n\n');location.href='javascript:history.back();';</script>")
response.end()
end if

if Request("newpassword")<>"" then

if Len(Request("newpassword"))>20 or Len(Request("newpassword"))<6 then
response.Write("<script type='text/JavaScript'>alert('请输入正确的新密码！密码的位数必须大于6而小于20！');location.href='javascript:history.back();';</script>")
response.end()
else
	newpassword=Request("newpassword")
end if

if newpassword<>Request("newpassword2") then
response.Write("<script type='text/JavaScript'>alert('您输入的新密码和确认密码不一致！');location.href='javascript:history.back();';</script>")
response.end()
else
end if

end if

if request.form("wenti")="" then
response.Write("<script type='text/JavaScript'>alert('请输入密码保护的提示问题！');location.href='javascript:history.back();';</script>")
response.end()
else
end if


if IsValidEmail(trim(Request("Email")))=false then
response.Write("<script type='text/JavaScript'>alert('您的Email有错误！');location.href='javascript:history.back();';</script>")
response.end()
else
	Email=trim(Request("Email"))
end if

if qianming<>"" and Len(qianming)>100 then
response.Write("<script type='text/JavaScript'>alert('您输入的签名不能多于100字符！');location.href='javascript:history.back();';</script>")
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
		rs("lockuser")=true '(VIP用户审核)
		else
		rs("lockuser")=false
		end if
		rs.update
response.Write("<script type='text/JavaScript'>alert('恭喜您！您的会员资料修改成功！');location.href='PL_UserModify.asp';</script>")

rs.close
set rs=nothing
conn.close
set conn=nothing
response.End()
end if



'下面为注册新用户

if Request("UserName")="" or len(Request("UserName"))>20 or len(Request("UserName"))<3 then
response.Write("<script type='text/JavaScript'>alert('请输入正确的用户名！');location.href='javascript:history.back();';</script>")
response.end()
else
	UserName=trim(Request("UserName"))
end if
if Request("password")="" or Len(Request("password"))>20 or Len(Request("password"))<6 then
response.Write("<script type='text/JavaScript'>alert('请输入正确的密码！密码的位数必须大于6而小于20！');location.href='javascript:history.back();';</script>")
response.end()
else
	password=Request("password")
end if

if password<>Request("password2") then
response.Write("<script type='text/JavaScript'>alert('您输入的密码和确认密码不一致！');location.href='javascript:history.back();';</script>")
response.end()
else
end if


if request.form("wenti")="" or request.form("wenti")="" then
response.Write("<script type='text/JavaScript'>alert('请输入密码保护的提示问题和答案！');location.href='javascript:history.back();';</script>")
response.end()
else
end if

if IsValidEmail(trim(Request("Email")))=false then
response.Write("<script type='text/JavaScript'>alert('您的Email有错误！');location.href='javascript:history.back();';</script>")
response.end()
else
	Email=trim(Request("Email"))
end if

if qianming<>"" and Len(qianming)>100 then
response.Write("<script type='text/JavaScript'>alert('您输入的签名不能多于100字符！');location.href='javascript:history.back();';</script>")
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
response.Write("<script type='text/JavaScript'>alert('对不起，您输入的用户名已经被注册，请重新输入！');location.href='javascript:history.back();';</script>")
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
		rs("lockuser")=true '(VIP用户审核)
		else
		rs("lockuser")=False 
		end if
		rs.update
	end if
	rs.close
	set rs=nothing
response.Write("<script type='text/JavaScript'>alert('恭喜您！会员注册成功！');location.href='../index.asp';</script>")

conn.close
set conn=nothing
%>
