<!--#include file="const.asp"-->
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
ID=request.QueryString("id")
SiteName=trim(request.form("SiteName"))
SiteUrl=trim(request.form("SiteUrl"))
LogoUrl=trim(request.form("LogoUrl"))
SiteAdmin=trim(request.form("SiteAdmin"))
SiteIntro=trim(request.form("SiteIntro"))
act=request("act")
name=trim(request.form("submit"))
founderr=false

if act="add" or act="edit" then
	if trim(SiteName)="" then
		errmsg=errmsg+"<br>"+"<li>站名不能为空！"
		founderr=true
	end if
	if trim(SiteUrl)="" then
		errmsg=errmsg+"<br>"+"<li>网址不能为空！"
		founderr=true
	end if

	set rs=server.createobject("adodb.recordset")
	if act="edit" then sql="select * from FriendSite where ID="&ID
	if act="add" then sql="select * from FriendSite"
	rs.open sql,conn,1,3
	if act="edit" then
		if rs.eof then
			errmsg=errmsg+"<br>"+"<li>操作错误！请联系管理员"
			call error()
			Response.End 
		end if
	end if
	if act="add" then
		rs.addnew
	end if
	rs("SiteName")=SiteName
	rs("SiteUrl")=SiteUrl
	if SiteAdmin="" then
		rs("SiteAdmin")=""
	else
		rs("SiteAdmin")=SiteAdmin
	end if
	if LogoUrl="" then
		rs("LogoUrl")=""
	else
		rs("LogoUrl")=LogoUrl
	end if
	if SiteIntro="" then
		rs("SiteIntro")=""
	else
		rs("SiteIntro")=SiteIntro
	end if
	rs.update
	rs.close
	set rs=nothing
elseif act="del" then
	sql="delete from FriendSite where id=" & ID
	conn.execute sql
	 Response.Redirect "Admin_LinkSite.asp"
elseif act="set" then
	set rs=server.createobject("adodb.recordset")
	sql="Select isOK from FriendSite where IsOK=1"
	rs.open sql,conn,1,3
	if not rs.eof then
		do while not rs.eof
			rs("IsOK")=0
			rs.update
		rs.movenext
		loop
	end if
	rs.close

	Checked=replace(request("checked")," ","")
	CheckedNum=Split(Checked,",")
	HowLong=UBound(checkedNum)
	for i=0 to HowLong
		sql="Select IsOK from FriendSite where ID="&CheckedNum(i)
		rs.open sql,conn,1,3
		if not rs.EOF then
			do while not rs.EOF 
				rs("isOK")=1
				rs.update
			rs.MoveNext
			loop
		end if
		rs.close
	next
	set rs=nothing
elseif act="SetIsGood" then
	set rs=server.createobject("adodb.recordset")
	sql="Select IsGood from FriendSite where ID="&id
	rs.open sql,conn,1,3
	if not rs.EOF then
		if rs("IsGood")=true then
			rs("IsGood")=0
		else
			rs("isGood")=1
		end if
		rs.update
	end if
	rs.close
	set rs=nothing
end if
conn.close
set conn=nothing
if founderr=true then
	call error()
else
        Response.Redirect "Admin_LinkSite.asp"
end if
%>
