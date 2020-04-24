<!--#include file="const.asp"-->
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
IsAdmin=session("IsAdmin")
If IsAdmin=true Then
	set rs=server.createobject("adodb.recordset")
	AdminID=session("AdminID")
	sql="select * from admin where id="&AdminID
	rs.open sql,conn,1,3
	if not rs.EOF then
		rs("LogoutTime")=now()
		rs.Update
		Session("AdminID")=""
		Session("IsAdmin")=""
		Session("KEY")=""
		rs.Close
		set rs=nothing
	else
		response.write"数据库出错！"
		Response.end
	end if
end if
conn.close
set conn=nothing	
response.redirect ("login.asp")
%>
