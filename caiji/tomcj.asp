<!--#include file="6tingconn.asp"-->
<%CheckAdmin1%>
<!-- #include File="Function.asp" -->
<!-- #include File="conn.asp" -->
<%
Dim sid,eid,Co,Msg
Server.ScriptTimeOut=99999
sid=Request("sid")
eid=Request("eid")
id=eid
Co=Request("Co")
If Co="" or Not IsNumeric(Co) Then Co=1
If sid="" or Not IsNumeric(sid) Or eid="" Or Not IsNumeric(eid) Then
   Response.write "您输入的ID参数有错误<br><A HREF=# onclick=""Javascript:history.back(-1)""><FONT  COLOR=#FF0000>请点这里返回</FONT></A>"
   Response.End
ElseIf int(Sid)< int(eid) Then
   Response.write "您输入的起始ID小于结束ID<br><A HREF=# onclick=""Javascript:history.back(-1)""><FONT  COLOR=#FF0000>请点这里返回</FONT></A>"
   Response.End
End If

If Sid=Eid Then
   Msg="你所请求的功能已经完成,谢谢使用!<br>"
   MusicMake
Else
   Msg="正在生成HTML中,请等待......<br>"
   MusicMake
   MakeNextPage
End IF

Sub MusicMake
Response.write "<HTML>"
Response.write "<HEAD>"
Response.write "<TITLE>第六音乐厅全自动歌曲采集&TOM歌词采集</TITLE>"
Response.write "<META http-equiv=Content-Type content=""text/html; charset=gb2312"">"
Response.write "<META content=""MSHTML 6.00.2800.1400"" name=GENERATOR>"
Response.write "<link rel=""stylesheet"" href=""Style.css"" type=""text/css"">"
Response.write "</HEAD>"
Response.write "<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0 marginheight=0 marginwidth=0>"
Response.write "<b><font color=#FF0000>"&Sid&"</font>/<font color=#FF0000>"&Eid&"</font>"
Response.write Msg&"</b>"
Response.write "<IE:Download ID=""oDownload"" STYLE=""behavior:url(#default#download)"" />"

MakeIMG
End Sub

Sub MakeIMG
	Response.write "<table class="tableBorder" border=0 width=100% height=300 align=center><tr>"
	Response.write  "<td width=28% height=200 valign=top>"
	set rs=server.createobject("adodb.recordset")
	'sql="select * from MusicList where id =1465"
	sql="Select top 1 * From MusicList Where id="&id
	rs.Open Sql,Conn,3,3
	gcname=rs("musicname")
	gs=rs("singer")
	
	gcname1=gcname
	gs1=gs
	
	gcname=replace(gcname,"&nbsp;","")
	i=instr(gcname,"(")
	if i>0 then
		gcname=left(gcname,i-1)
	end if
	i=instr(gcname,"-")
	if i>0 then
		gcname=left(gcname,i-1)
	end if
	i=instr(gcname,"【")
	if i>0 then
		gcname=left(gcname,i-1)
	end if
	i=instr(gcname,"_")
	if i>0 then
		gcname=left(gcname,i-1)
	end if
	
	i=instr(gs,"(")
	if i>0 then
		gs=left(gs,i-1)
	end if
	i=instr(gs,"-")
	if i>0 then
		gs=left(gs,i-1)
	end if
	'采集歌词开始
	url="http://search.tom.com/mp3/lyric.php?word="&gcname&"+"&gs&"&mimetype=all"
	zpl=GetHttp(URL)
	Set fs = Server.CreateObject("Scripting.FileSystemObject")
			tid = server.mappath("tom.txt")
			Set a = fs.CreateTextFile(tid)
			a.Write id
			a.close
	set fs=nothing
	'替换开始
	body=GetStr(zpl,"<img src=""http://ad.tom.com/search/mp3/templet/listen/mp3_icon_hlp.gif"" width=13 height=13 border=0 alt=""LRC歌词使用帮助""></a><br>","</td></tr>")
	body=replace(body,"<font color=red>"," ")
	body=replace(body,"</font>"," ")
	body=replace(body,"<br><br>","<br>")
	
	
	if Instr(body,"http://") = False then
		If Rs.Eof And Rs.Bof Then
			Rs.AddNew
		End If
			rs("songwords")=checksql(body)
			rs.Update
			jfgc="<font color=""#FF0000"">采集歌词成功，写入数据库成功，歌词不在列出来了... ...</font>"
		else
		jfgc="对不起没有歌词，采集失败"
		rs.close 
		conn.close 
		set rs=nothing 
		set conn=nothing
	End If
	
	Response.Write "歌曲名称："&gcname1&"<br>"
	response.flush
	Response.Write "歌手名称："&gs1&"<br>"
	response.flush
	Response.Write "歌词：<br>"&jfgc&"<br>"
	response.flush
End Sub


Sub MakeNextPage
Response.write "<meta http-equiv=""refresh"" content=""0;url='tomcj.asp?Sid="&sid&"&Eid="&Eid+1&"&Co="&Co+1&"'"">"
Response.write "</body>"
Response.write "</html>"
End Sub
%>