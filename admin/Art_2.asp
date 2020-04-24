<!--#include file="Const.Asp"-->
<%CheckAdmin3%>
<%PageName="Art_2"%>
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
	errmsg=errmsg+"<br>"+"<li>操作错误！请联系管理员"
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
		errmsg=errmsg+"<br>"+"<li>栏目名称不能为空！"
		call error()
		Response.End 
	end if
	set rs=server.createobject("adodb.recordset")
	sql = "SELECT * FROM Sclass where Sclassid=" & SClassid
	rs.Open sql,conn, 1, 3
	if err.Number<>0 then
		err.clear
		errmsg=errmsg+"<br>"+"<li>操作错误！请联系管理员"
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
	Rem '删除三级栏目
	sql="delete from Nclass where Sclassid=" & SClassid
	conn.execute sql
	Rem '删除相关商品
	sql="delete from special where Sclassid=" & SClassid
	conn.execute sql
	if err.Number<>0 then
		err.clear
		errmsg=errmsg+"<br>"+"<li>操作错误！请联系管理员"
		founderr=true
	end if
end function
	
function FunAdd
	SClass=trim(request.form("SClass"))
	Classid=request.QueryString("Classid")
	if SClass="" then
		errmsg=errmsg+"<br>"+"<li>栏目名称不能为空！"
		call error()
		Response.End 
	end if
	set rs=server.createobject("adodb.recordset")
	sql = "SELECT * FROM Sclass where (Sclassid IS NULL)"
	rs.Open sql,conn, 1, 3
	if err.Number<>0 then
		err.clear
		errmsg=errmsg+"<br>"+"<li>操作错误！请联系管理员"
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
