<!--#include file="const.asp"-->
<%CheckAdmin3%>
<%pagename="admin_Smusicdel"%>
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
'dim sql 
'dim rs
'set rs=server.createobject("adodb.recordset")
'sql="delete from [Basic] where id="&request.QueryString("ID")
'rs.open sql,conn,1,1
conn.execute("delete from [Basic] where id="&request.QueryString("ID"))
conn.close
set conn=nothing
id=request("id")
page=request("page")
Response.Write("<script>alert(""恭喜!删除点歌资料已成功"");location.href=""Admin_SMusicMana.asp"";</script>")
	Response.End
%>
