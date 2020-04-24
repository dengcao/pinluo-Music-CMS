<!--#include file="Const.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
<%CheckAdmin1%>
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
page=trim(request.querystring("page"))
AskClassid=trim(request.querystring("AskClassid"))
AskSClassid=trim(request.querystring("AskSClassid"))
AskNClassid=trim(request.querystring("AskNClassid"))
Wma=trim(request.form("Wma"))
MusicName=trim(request.form("MusicName"))
classid=trim(request.form("classid"))
Sclassid=trim(request.form("Sclassid"))
Nclassid=trim(request.form("Nclassid"))
Specialid=trim(request.form("Specialid"))
set rs=server.createobject("adodb.recordset")
founerr=false
if act<>"SetIsGood" then
act=request("act")
end if

if act="SetIsGood" then
		sql="select IsGood from MusicList where id="&request("id") 
		rs.open sql,conn,1,3
		if not rs.EOF then
			if rs("IsGood")=true then
				rs("IsGood")=0
			else
				rs("IsGood")=1
			end if
			rs.update
		end if
		rs.close
	else
		conn.close
		set conn=nothing
		errmsg=errmsg+"<li>操作错误！请联系管理员</li>"
		call error()
		Response.End
	end if
	set rs=nothing
	conn.close
	set conn=nothing
Response.Write("<script>alert(""恭喜!修改已成功"");location.href=""Admin_Allmusic.Asp?Classid="+AskClassid+"&SClassid="+AskSClassid+"&NClassid="+AskNClassid+"&Page="+Page+""";</script>")
%>
