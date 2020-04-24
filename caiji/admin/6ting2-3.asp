<!--#include file="function.asp"-->
<%CheckAdmin1%>
<!--#include file="6tingconn.asp"-->
<%
founderr=false
id=checksql(request.form("id"))
mp3name=request.form("mp3name")
musll=request.form("musll")
musicnamelist=request.form("musicnamelist")
musicid=request.form("musicid")
mp3path=request.form("mp3path")
cjmp3path=request.form("cjmp3path")
wmapath=request.form("wmapath")
xzmp3path=request.form("xzmp3path")
Cookie=request.form("Cookie")

id=bqtf(id)
mp3name=bqtf(mp3name)
musll=bqtf(musll)
musicnamelist=bqtf(musicnamelist)
musicid=bqtf(musicid)
mp3path=bqtf(mp3path)
cjmp3path=bqtf(cjmp3path)
wmapath=bqtf(wmapath)
xzmp3path=bqtf(xzmp3path)
Cookie=bqtf(Cookie)

if id="" or mp3name="" or musll="" or musicnamelist="" or musicid="" or mp3path="" or cjmp3path="" then
	errmsg=errmsg+"<br>"+"<li>请你接要求填写好相关内容！"
	founderr=true
	call error()
	Response.End 
end if

set rs=server.CreateObject("ADODB.RecordSet")
	sql="select * from const where id="&id
	rs.open sql,conn1,3,2
		rs("mp3name")=mp3name
		rs("musll")=musll
		rs("musicnamelist")=musicnamelist
		rs("musicid")=musicid
		rs("mp3path")=mp3path
		rs("cjmp3path")=cjmp3path
		rs("wmapath")=wmapath
		rs("xzmp3path")=xzmp3path
		rs("Cookie")=Cookie
		rs.update
	rs.close()
set rs=nothing
conn1.close
set conn1=nothing
response.redirect "6ting1.asp"
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>第六音乐厅通用音音采集器--添加采集站点完成</title>
</head>

<body>

</body>
</html>
