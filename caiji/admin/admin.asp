<html>

<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<title>音乐后台管理中心</title>
</head>
<!--#include file="function.asp"-->
<base target="contents">
<%
CheckAdmin1
PageName="admin"
%>
<frameset framespacing="0" border="0" frameborder="0" rows="26,*">
  <frame name="banner" scrolling="no" noresize target="contents" src="admincopy.asp">
  <frameset cols="204,*">
    <frame name="contents" target="main" src="6tingadmin-left.asp">
    <frame name="frmright" scrolling="auto" src="Announce.asp">
  </frameset>
  <noframes>
  <body>

  <p>此网页使用了框架，但您的浏览器不支持框架。</p>

  </body>
  </noframes>
</frameset>

</html>