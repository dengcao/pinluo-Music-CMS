<!--#include file="Const.Asp"-->
<%CheckAdmin3%>
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
founderr=false
if trim(request.form("WebName"))="" then
errmsg=errmsg+"<br>"+"<li>网站名称不能为空！"
founderr=true
end if
if trim(request.form("WebUrl"))="" then
errmsg=errmsg+"<br>"+"<li>网站地址不能为空！"
founderr=true
end if
if trim(request.form("Webmulu"))="" then
errmsg=errmsg+"<br>"+"<li>安装目录不能为空！如果是根目录，请填写/"
founderr=true
end if
if trim(request.form("AdminEmail"))="" then
errmsg=errmsg+"<br>"+"<li>站长QQ不能为空！"
founderr=true
end if
if trim(request.form("Front"))="" then
errmsg=errmsg+"<br>"+"<li>路径前缀不能为空！"
founderr=true
end if
if trim(request.form("keywords"))="" then
errmsg=errmsg+"<br>"+"<li>网站关键此不能为空！"
founderr=true
end if
if trim(request.form("count"))="" then
errmsg=errmsg+"<br>"+"<li>统计代码不能为空！"
founderr=true
end if
if trim(request.form("beian"))="" then
errmsg=errmsg+"<br>"+"<li>备案信息不能为空！"
founderr=true
end if
if trim(request.form("bottominfo"))="" then
errmsg=errmsg+"<br>"+"<li>底部信息不能为空！"
founderr=true
end if
if trim(request.form("Copyright"))="" then
errmsg=errmsg+"<br>"+"<li>网站版权不能为空！"
founderr=true
end if
if trim(request.form("Ver"))="" then
errmsg=errmsg+"<br>"+"<li>程序版本不能为空！"
founderr=true
end If
if trim(request.form("weekpai"))="" then
errmsg=errmsg+"<br>"+"<li>周排行不能为空！"
founderr=true
end if

if founderr=true then
call error()
else
set rs=server.createobject("adodb.recordset")
sql="select * from const"
rs.open sql,conn,1,3
rs("WebName")=request.form("WebName")
rs("WebUrl")=request.form("WebUrl")
rs("webmulu")=request.form("webmulu")
rs("Sms")=request.form("Sms")
rs("Weekpai")=request.form("Weekpai")
if trim(request.form("Copyright"))="" then
rs("Copyright")=null
else
rs("Copyright")=request.form("Copyright")
end if
if trim(request.form("Ver"))="" then
rs("Ver")=null
else
rs("Ver")=request.form("Ver")
end if
if trim(request.form("AdminEmail"))="" then
rs("AdminEmail")=null
else
rs("AdminEmail")=request.form("AdminEmail")
end if
if trim(request.form("WebPost1"))="" then
rs("WebPost1")=null
else
rs("WebPost1")=request.form("WebPost1")
end if
if trim(request.form("WebPost2"))="" then
rs("WebPost2")=null
else
rs("WebPost2")=request.form("WebPost2")
end if
if trim(request.form("WebPost3"))="" then
rs("WebPost3")=null
else
rs("WebPost3")=request.form("WebPost3")
end if
if trim(request.form("WebPost4"))="" then
rs("WebPost4")=null
else
rs("WebPost4")=request.form("WebPost4")
end if

if trim(request.form("Weburl1"))="" then
rs("Weburl1")=null
else
rs("Weburl1")=request.form("Weburl1")
end if
if trim(request.form("Weburl2"))="" then
rs("Weburl2")=null
else
rs("Weburl2")=request.form("Weburl2")
end if
if trim(request.form("Weburl3"))="" then
rs("Weburl3")=null
else
rs("Weburl3")=request.form("Weburl3")
end if
if trim(request.form("Weburl4"))="" then
rs("Weburl4")=null
else
rs("Weburl4")=request.form("Weburl4")
end if

if trim(request.form("Front"))="" then
rs("Front")=null
else
rs("Front")=request.form("Front")
end if
if trim(request.form("keywords"))="" then
rs("keywords")=null
else
rs("keywords")=request.form("keywords")
end if
if trim(request.form("count"))="" then
rs("count")=null
else
rs("count")=request.form("count")
end if
if trim(request.form("beian"))="" then
rs("beian")=null
else
rs("beian")=request.form("beian")
end if
if trim(request.form("bottominfo"))="" then
rs("bottominfo")=null
else
rs("bottominfo")=request.form("bottominfo")
end if
rs.update
rs.close
set rs=nothing
conn.close
set conn=nothing

Response.Write("<script>alert(""恭喜!修改基本资料已成功"");location.href=""Admin_Setup.asp"";</script>")
	Response.End
end if
conn.close
set conn=nothing
%>
<p>&nbsp;</p>
