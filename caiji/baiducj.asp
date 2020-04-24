<!-- #include File="Function.asp" -->
<!--#include file="6tingconn.asp"-->
<%CheckAdmin1%>
<!-- #include File="conn.asp" -->
<%
id=Request("eid")



Response.write "<HTML>"
Response.write "<HEAD>"
Response.write "<TITLE>第六音乐厅全自动歌曲采集&百度歌词采集</TITLE>"
Response.write "<META http-equiv=Content-Type content=""text/html; charset=gb2312"">"
Response.write "<META content=""MSHTML 6.00.2800.1400"" name=GENERATOR>"
Response.write "<link rel=""stylesheet"" href=""Style.css"" type=""text/css"">"
Response.write "</HEAD>"
Response.write "<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0 marginheight=0 marginwidth=0>"
Response.write "<b><font color=#FF0000>"&Sid&"</font>/<font color=#FF0000>"&Eid&"</font>"
Response.write Msg&"</b>"
Response.write "<IE:Download ID=""oDownload"" STYLE=""behavior:url(#default#download)"" />"




	Response.write "<table class="tableBorder" border=0 width=100% height=300 align=center><tr>"
	Response.write  "<td width=28% height=200 valign=top>"
	set rs=server.createobject("adodb.recordset")
	'sql="select * from MusicList where id =1465"
	sql="Select  * From MusicList Where id="&id
	rs.Open Sql,Conn,3,3
	
	
	
	url="main.asp?j="&id&""
	zpl=GetHttp(URL)
	Set fs = Server.CreateObject("Scripting.FileSystemObject")
			tid = server.mappath("baidu.txt")
			Set a = fs.CreateTextFile(tid)
			a.Write id
			a.close
	set fs=nothing
	'百度
	SongPath=GetStr(zpl,"歌曲地址","歌曲地址")
	MusicName=GetStr(zpl,"歌曲名","歌曲名")
	SpecialID=GetStr(zpl,"专辑ID","专辑ID")
	Special=GetStr(zpl,"专辑名","专辑名")
	Singer=GetStr(zpl,"歌手ID","歌手ID")
	SingerID=GetStr(zpl,"歌手名","歌手名")
	SclassID=GetStr(zpl,"分类ID","分类ID")
	Sclass=GetStr(zpl,"分类名","分类名")
	SclassHTML=GetStr(zpl,"分类HTML","分类HTML")
	SongWord=GetStr(zpl,"歌词","歌词")


'var u1200="0/1/2/1349/1361/1364.wma"; 歌曲地址
'var M1200="VVVV";歌曲名
'var N1200="110";专辑ID
'var N_1200="嘻武门";专辑名
'var S1200="1073";歌手ID
'var S_1200="LMF乐团 LMF";歌手名
'var C1200="3";分类ID
'var C_1200="乐队组合";分类名
'var Chtml_1200="yuedui";分类HTML
'var W_1200="";歌词


If Rs.Eof And Rs.Bof Then
Rs.AddNew
End If
rs("Wma")=SongPath
rs("MusicName")=MusicName
rs("Singer")=Singer
rs("Nclassid")=SingerID
rs("Sclassid")=SclassID
rs("Specialid")=Specialid
rs.Update

set SPrs=server.createobject("adodb.recordset")
	'sql="select * from Special where SpecialID =1465"
	sql="Select  * From Special Where SpecialID="&SpecialID
	SPrs.Open Sql,Conn,3,3
If SPrs.Eof And SPrs.Bof Then
SPRs.AddNew
End If
SPrs("Special")=Name
SPrs("MusicName")=MusicName
SPrs("Nclass")=Nclass
SPrs("Nclassid")=SingerID
SPrs("Sclassid")=SclassID
SPrs("Sclass")=Sclass
SPrs("Specialid")=Specialid
SPrs.Update
	
set Nrs=server.createobject("adodb.recordset")
	'sql="select * from MusicList where id =1465"
	sql="Select  * From Nclass Where Nclassid="&Nclassid
	Nrs.Open Sql,Conn,3,3
If Nrs.Eof And Nrs.Bof Then
Nrs.AddNew
End If
Nrs("ABC")=getpychar(left(Nclass,1))
Nrs("Nclass")=Nclass
Nrs("Nclassid")=SingerID
Nrs("Sclassid")=SclassID
Nrs("Sclass")=Sclass
Nrs.Update

set Srs=server.createobject("adodb.recordset")
	'sql="select * from MusicList where id =1465"
	sql="Select  * From Sclass Where Sclassid="&Sclassid
	Srs.Open Sql,Conn,3,3
If Srs.Eof And Srs.Bof Then
Srs.AddNew
End If
Srs("Classid")=1
Srs("Sclassid")=SclassID
Srs("Sclass")=Sclass
Srs.Update	
	
	
jfgc="<font color=""#FF0000"">采集歌词成功，写入数据库成功，歌词不在列出来了... ...</font>"
	


rs.close
SPrs.close 
Nrs.close 
Srs.close 
conn.close 
set rs=nothing 
set SPrs=nothing 
set Nrs=nothing 
set Srs=nothing 
set conn=nothing
	
	
	Response.Write "歌曲名称："&MusicName&"<br>"
	response.flush
	Response.Write "歌手名称："&Singer&"<br>"
	response.flush
	Response.Write "歌词：<br>"&SongWord&"<br>"
	response.flush

%>