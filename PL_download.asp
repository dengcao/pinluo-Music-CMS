<!--#include file="PL_config.asp"-->
<!--#include file="PL_INC/PL_Path.Asp"-->
<%id=request("id")
set rs=server.createobject("adodb.recordset")
sql="select * from MusicList where id ="&id
rs.open sql,conn,1,1
PL_song_path=rs("Song_Path")
if PL_song_path="0" then
PL_path=song_path
elseif PL_song_path="1" then
PL_path=song_path1
elseif PL_song_path="2" then
PL_path=song_path2
elseif PL_song_path="3" then
PL_path=song_path3
elseif PL_song_path="4" then
PL_path=song_path4
elseif PL_song_path="5" then
PL_path=song_path5
elseif PL_song_path="6" then
PL_path=song_path6
else
PL_path="http://s2.7t7t.com:81"
end if%>
<!--<title>歌曲下载</title>歌曲下载涉及到著作版权等法律问题，<br />
所以本站暂时停止提供下载。<br />
谢谢您支持国内正版唱片的发展。-->
<!--如要下载，请到百度MP3或yahooMP3去下载。-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="<%=rs("MusicName")%>,<%=keywords%>">
<meta name="description" content="<%=rs("MusicName")%>,<%=keywords%>">
<link href="<%=favicon%>" rel="shortcut icon">
<meta name="generator" content="网站作者：品络科技 - 网站建设和广告设计专家 | PinLuo.Com">
<title>歌曲下载《<%=rs("MusicName")%>》 -  <%=webname%></title>
<style type="text/css">
<!--
body {
	background-color: #0080FF;
}
body,td,th {
	font-size: 12px;
}
.STYLE2 {color: #999999}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
.STYLE5 {color: #F5F5F5}
-->
</style></head>
<body>

<table width="300" align="center" cellpadding="0" cellspacing="5" bgcolor="#f4f4f4" style="border:1px solid #dcdcdc; margin-top:100px">
  <tr>
    <td height="50" align="center" bgcolor="#FFFFFF">
      <p><a href="<%=PL_path%><%=rs("Wma")%>"><img src="pinluo.com_style1/download_cms.gif" alt="点击下载" width="140" height="55" border="0"></a></p>
    <p class="STYLE2"><br /></p>    </td>
  </tr>
</table>
  <table width="300" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
    <td height="40" align="center"><a href="<%=weburl%>" target="_blank" class="STYLE5"><%=webname%></a></td>
  </tr>
</table>

</body>
</html>


<%
rs.close
set rs=nothing
%>