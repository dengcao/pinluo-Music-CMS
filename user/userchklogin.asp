<!--#include file="../PL_config.asp"-->
<%
server_v1=Cstr(Request.ServerVariables("HTTP_REFERER"))
server_v2=Cstr(Request.ServerVariables("SERVER_NAME"))
if mid(server_v1,8,len(server_v2))<>server_v2 then
response.write "<br><br><center><table border=1 cellpadding=20 bordercolor=black bgcolor=#EEEEEE width=450>"
response.write "<tr><td style=&apos;font:9pt Verdana&apos;>"
response.write "<font color=red>对不起！你提交的数据路径有误，系统禁止从外部站点直接提交数据！</font>"
response.write "</td></tr></table></center>"
response.end()
end if
%>
<!--#include file="PL_user_Function.Asp"-->
<!--#include file="../PL_INC/md5.asp"-->
<%
dim username,password
username=Trim(Request.Form("username"))
password=md5(Trim(Request.Form("password")))
PL_cookiepath="/"
'dim exec,conn,rs
exec="select * from [User] where(username='"&username&"' and password='"&password&"')"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn,1,1
if not rs.eof then
'GetValidateCode(30)
PL_passwordmd5=md5(password)
PL_vipdate=rs("vipdate")
PL_userid=rs("id")
'randomize
'randnum = rnd*9999999
randnum=GetValidateCode(30)
Response.Cookies("Www_PinLuo_Com_user").path=PL_cookiepath
Response.Cookies("Www_PinLuo_Com_user")("PL_userid")=PL_userid
Response.Cookies("Www_PinLuo_Com_user")("PL_rand")=randnum
Response.Cookies("Www_PinLuo_Com_user")("PL_username") = username
Response.Cookies("Www_PinLuo_Com_user")("PL_password") = PL_passwordmd5
Response.Cookies("Www_PinLuo_Com_user")("PL_vipdate") = PL_vipdate
Response.Cookies("Www_PinLuo_Com_user")("PL_usercheck") = md5(randnum&PL_vipdate&PL_userid&username&PL_passwordmd5)

rs.Close
conn.Close
response.Redirect "index.asp"
else
Response.Cookies("Www_PinLuo_Com_user").path=PL_cookiepath
Response.Cookies("Www_PinLuo_Com_user")("PL_userid")=""
Response.Cookies("Www_PinLuo_Com_user")("PL_rand") = ""
Response.Cookies("Www_PinLuo_Com_user")("PL_username") = ""
Response.Cookies("Www_PinLuo_Com_user")("PL_password") = ""
Response.Cookies("Www_PinLuo_Com_user")("PL_vipdate") = ""
Response.Cookies("Www_PinLuo_Com_user")("PL_usercheck") = ""
response.Write("<script type='text/JavaScript'>alert('对不起！您输入的用户名或密码错误! 请重新输入！');location.href='javascript:history.back();';</script>")
response.Write("对不起！您输入的用户名或密码错误! 请重新输入！")
Response.End
end if
%>