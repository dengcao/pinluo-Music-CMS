<!--#include file="const.asp"-->
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
   dim sql 
   dim rs
   set rs=server.createobject("adodb.recordset")
   sql="delete from MusicList where id="&request.QueryString("ID")
   rs.open sql,conn,1,1
   '-------------------删除相关的文本歌词和LRC歌词----------------
   conn.execute("delete from TextWord where MusicID="&request.QueryString("ID")&"")
   conn.execute("delete from LrcWord where MusicID="&request.QueryString("ID")&"")
   '--------------------------------------------------------------
   conn.close
   set conn=nothing
classid=request("classid")
SClassid=request("Sclassid")
Nclassid=request("Nclassid")
page=request("page")
response.redirect "Admin_Allmusic.Asp?classid="+classid+"&SClassid="+SClassid+"&Nclassid="+Nclassid+"&page="& page
%>
