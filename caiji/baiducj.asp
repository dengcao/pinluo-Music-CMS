<!-- #include File="Function.asp" -->
<!--#include file="6tingconn.asp"-->
<%CheckAdmin1%>
<!-- #include File="conn.asp" -->
<%
id=Request("eid")



Response.write "<HTML>"
Response.write "<HEAD>"
Response.write "<TITLE>����������ȫ�Զ������ɼ�&�ٶȸ�ʲɼ�</TITLE>"
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
	'�ٶ�
	SongPath=GetStr(zpl,"������ַ","������ַ")
	MusicName=GetStr(zpl,"������","������")
	SpecialID=GetStr(zpl,"ר��ID","ר��ID")
	Special=GetStr(zpl,"ר����","ר����")
	Singer=GetStr(zpl,"����ID","����ID")
	SingerID=GetStr(zpl,"������","������")
	SclassID=GetStr(zpl,"����ID","����ID")
	Sclass=GetStr(zpl,"������","������")
	SclassHTML=GetStr(zpl,"����HTML","����HTML")
	SongWord=GetStr(zpl,"���","���")


'var u1200="0/1/2/1349/1361/1364.wma"; ������ַ
'var M1200="VVVV";������
'var N1200="110";ר��ID
'var N_1200="������";ר����
'var S1200="1073";����ID
'var S_1200="LMF���� LMF";������
'var C1200="3";����ID
'var C_1200="�ֶ����";������
'var Chtml_1200="yuedui";����HTML
'var W_1200="";���


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
	
	
jfgc="<font color=""#FF0000"">�ɼ���ʳɹ���д�����ݿ�ɹ�����ʲ����г�����... ...</font>"
	


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
	
	
	Response.Write "�������ƣ�"&MusicName&"<br>"
	response.flush
	Response.Write "�������ƣ�"&Singer&"<br>"
	response.flush
	Response.Write "��ʣ�<br>"&SongWord&"<br>"
	response.flush

%>