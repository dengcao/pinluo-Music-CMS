<!--#include file="PL_config.asp"-->
<%id=Trim(Request.QueryString("id"))%>
<title> - ╦Х╢йобть - <%=webname%></title>
<%
	set rs=server.createobject("adodb.recordset")
	sql = "SELECT * FROM MusicList where id="&id
	rs.Open sql,conn, 1,1
		PL_musicname=rs("musicname")
		PL_singer=rs("singer")
	rs.Close
	set rs=nothing
	conn.close
	set conn=nothing
	response.Redirect("http://mp3.baidu.com/m?tn=baidump3lyric&word="&PL_musicname&"&ct=150994944&lm=-1&lf=3")
%>