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
   Response.write "�������ID�����д���<br><A HREF=# onclick=""Javascript:history.back(-1)""><FONT  COLOR=#FF0000>������ﷵ��</FONT></A>"
   Response.End
ElseIf int(Sid)< int(eid) Then
   Response.write "���������ʼIDС�ڽ���ID<br><A HREF=# onclick=""Javascript:history.back(-1)""><FONT  COLOR=#FF0000>������ﷵ��</FONT></A>"
   Response.End
End If

If Sid=Eid Then
   Msg="��������Ĺ����Ѿ����,ллʹ��!<br>"
   MusicMake
Else
   Msg="��������HTML��,��ȴ�......<br>"
   MusicMake
   MakeNextPage
End IF

Sub MusicMake
Response.write "<HTML>"
Response.write "<HEAD>"
Response.write "<TITLE>����������ȫ�Զ������ɼ�&TOM��ʲɼ�</TITLE>"
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
	i=instr(gcname,"��")
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
	'�ɼ���ʿ�ʼ
	url="http://search.tom.com/mp3/lyric.php?word="&gcname&"+"&gs&"&mimetype=all"
	zpl=GetHttp(URL)
	Set fs = Server.CreateObject("Scripting.FileSystemObject")
			tid = server.mappath("tom.txt")
			Set a = fs.CreateTextFile(tid)
			a.Write id
			a.close
	set fs=nothing
	'�滻��ʼ
	body=GetStr(zpl,"<img src=""http://ad.tom.com/search/mp3/templet/listen/mp3_icon_hlp.gif"" width=13 height=13 border=0 alt=""LRC���ʹ�ð���""></a><br>","</td></tr>")
	body=replace(body,"<font color=red>"," ")
	body=replace(body,"</font>"," ")
	body=replace(body,"<br><br>","<br>")
	
	
	if Instr(body,"http://") = False then
		If Rs.Eof And Rs.Bof Then
			Rs.AddNew
		End If
			rs("songwords")=checksql(body)
			rs.Update
			jfgc="<font color=""#FF0000"">�ɼ���ʳɹ���д�����ݿ�ɹ�����ʲ����г�����... ...</font>"
		else
		jfgc="�Բ���û�и�ʣ��ɼ�ʧ��"
		rs.close 
		conn.close 
		set rs=nothing 
		set conn=nothing
	End If
	
	Response.Write "�������ƣ�"&gcname1&"<br>"
	response.flush
	Response.Write "�������ƣ�"&gs1&"<br>"
	response.flush
	Response.Write "��ʣ�<br>"&jfgc&"<br>"
	response.flush
End Sub


Sub MakeNextPage
Response.write "<meta http-equiv=""refresh"" content=""0;url='tomcj.asp?Sid="&sid&"&Eid="&Eid+1&"&Co="&Co+1&"'"">"
Response.write "</body>"
Response.write "</html>"
End Sub
%>