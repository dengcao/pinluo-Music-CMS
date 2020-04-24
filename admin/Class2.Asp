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
act=request("act")
ClassID=request.QueryString("ClassID")
if act="rename" then
	FunRename
elseif act="del" then
	FunDel
elseif act="add" then
	FunAdd
else
	errmsg=errmsg+"<br>"+"<li>操作出错！请联系管理员"
	founderr=true
end if
if founderr=true then
	call error()
else

end if

function FunRename
if trim(request.form("Class"))="" then
	errmsg=errmsg+"<br>"+"<li>分类名不能为空！"
	founderr=true
else
	set rs=server.createobject("adodb.recordset")
	sql = "SELECT * FROM class where classid=" & ClassID
	rs.Open sql,conn,1,3
	if err.Number<>0 then
		err.clear
		errmsg=errmsg+"<br>"+"<li>操作出错！请联系管理员"
		founderr=true
	else
		rs("class") = request.form("Class")
		rs.Update

	end if
	rs.Close
	set rs=nothing
	conn.close
	set conn=nothing
end if
end function

function FunDel
	sql="delete from class where classid=" & ClassID
	conn.execute sql
'删除相关栏目对应分类
	sql="delete from Sclass where classid=" & ClassID
	conn.execute sql
'删除相关栏目对应歌手
	sql="delete from Nclass where classid=" & ClassID
	conn.execute sql
'删除相关栏目对应专辑
	sql="delete from Special where classid=" & ClassID
	conn.execute sql
	if err.Number<>0 then
		err.clear
		errmsg=errmsg+"<br>"+"<li>操作出错！请联系管理员"
		founderr=true
	end if
end function

function FunAdd
if trim(request("Class"))="" then
	errmsg=errmsg+"<br>"+"<li>分类名不能为空！"
	founderr=true
else
	set rs=server.createobject("adodb.recordset")
	sql = "SELECT * FROM class where (classid IS NULL)"
	rs.Open sql,conn,1,3
	if err.Number<>0 then
		err.clear
		errmsg=errmsg+"<br>"+"<li>操作出错！请联系管理员"
		founderr=true
	else
		rs.AddNew
		rs("class") = request.form("Class")
		rs.Update
	end if
	rs.Close
	set rs=nothing
	conn.close
	set conn=nothing
end if
end function
Response.Redirect "Class.Asp"
%>
