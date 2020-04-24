<!--#include file="const.asp"-->
<%CheckAdmin2%>
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
Page=request.QueryString("Page")
Askclassid=request.QueryString("Askclassid")
Asksclassid=request.QueryString("Asksclassid")
AskNclassid=request.QueryString("AskNclassid")
Specialid=request.QueryString("Specialid")
if act<>"SetIsGood" then
	act=request("act")
end if
set rs=server.createobject("adodb.recordset")

if act="SetIsGood" then
		sql="select IsGood,Date from Special where Specialid="&Specialid
		rs.open sql,conn,1,3
		if not rs.EOF then
			if rs("IsGood")=true then
				rs("IsGood")=0
			else
				rs("IsGood")=1
				rs("Date") = Now()
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
Response.Write("<script>alert(""恭喜!修改已成功"");location.href=""Admin_Allspecial.Asp?Classid="+AskClassid+"&SClassid="+AskSClassid+"&NClassid="+AskNClassid+"&Page="+Page+""";</script>")
	Response.End
%>
