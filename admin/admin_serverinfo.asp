<%@ Language="VBScript" %>
<%' Option Explicit %>
<!--#include file="Const.Asp"-->
<%CheckAdmin3%>
<script language=javascript>
 <!--
 var startTime,endTime;
 var d=new Date();
 startTime=d.getTime();
 //-->
 </script>
<%
'��ʹ�������������ֱ�ӽ����н����ʾ�ڿͻ���
'Response.Buffer = False
Dim starttime
starttime=timer()*1000
'�������������
Dim ObjTotest(26,4)

ObjTotest(0,0) = "MSWC.AdRotator"
ObjTotest(1,0) = "MSWC.BrowserType"
ObjTotest(2,0) = "MSWC.NextLink"
ObjTotest(3,0) = "MSWC.Tools"
ObjTotest(4,0) = "MSWC.Status"
ObjTotest(5,0) = "MSWC.Counters"
ObjTotest(6,0) = "IISSample.ContentRotator"
ObjTotest(7,0) = "IISSample.PageCounter"
ObjTotest(8,0) = "MSWC.PermissionChecker"
ObjTotest(9,0) = "Scripting.FileSystemObject"
	ObjTotest(9,1) = "(FSO �ı��ļ���д)"
ObjTotest(10,0) = "adodb.connection"
	ObjTotest(10,1) = "(ADO ���ݶ���)"
	
ObjTotest(11,0) = "SoftArtisans.FileUp"
	ObjTotest(11,1) = "(SA-FileUp �ļ��ϴ�)"
ObjTotest(12,0) = "SoftArtisans.FileManager"
	ObjTotest(12,1) = "(SoftArtisans �ļ�����)"
ObjTotest(13,0) = "LyfUpload.UploadFile"
	ObjTotest(13,1) = "(���Ʒ���ļ��ϴ����)"
ObjTotest(14,0) = "Persits.Upload.1"
	ObjTotest(14,1) = "(ASPUpload �ļ��ϴ�)"
ObjTotest(15,0) = "w3.upload"
	ObjTotest(15,1) = "(Dimac �ļ��ϴ�)"

ObjTotest(16,0) = "JMail.SmtpMail"
	ObjTotest(16,1) = "(Dimac JMail �ʼ��շ�) <a href='http://www.ajiang.net'>�����ֲ�����</a>"
ObjTotest(17,0) = "CDONTS.NewMail"
	ObjTotest(17,1) = "(���� SMTP ����)"
ObjTotest(18,0) = "Persits.MailSender"
	ObjTotest(18,1) = "(ASPemail ����)"
ObjTotest(19,0) = "SMTPsvg.Mailer"
	ObjTotest(19,1) = "(ASPmail ����)"
ObjTotest(20,0) = "DkQmail.Qmail"
	ObjTotest(20,1) = "(dkQmail ����)"
ObjTotest(21,0) = "Geocel.Mailer"
	ObjTotest(21,1) = "(Geocel ����)"
ObjTotest(22,0) = "IISmail.Iismail.1"
	ObjTotest(22,1) = "(IISmail ����)"
ObjTotest(23,0) = "SmtpMail.SmtpMail.1"
	ObjTotest(23,1) = "(SmtpMail ����)"
	
ObjTotest(24,0) = "SoftArtisans.ImageGen"
	ObjTotest(24,1) = "(SA ��ͼ���д���)"
ObjTotest(25,0) = "W3Image.Image"
	ObjTotest(25,1) = "(Dimac ��ͼ���д���)"

public IsObj,VerObj,TestObj

'���Ԥ�����֧��������汾

for i=0 to 25
	on error resume next
	IsObj=false
	VerObj=""
	'dim TestObj
	TestObj=""
	set TestObj=server.CreateObject(ObjTotest(i,0))
	If -2147221005 <> Err then		'��л����iAmFisher�ı�����
		IsObj = True
		VerObj = TestObj.version
		if VerObj="" or isnull(VerObj) then VerObj=TestObj.about
	end if
	ObjTotest(i,2)=IsObj
	ObjTotest(i,3)=VerObj
next

'�������Ƿ�֧�ּ�����汾���ӳ���
sub ObjTest(strObj)
	on error resume next
	IsObj=false
	VerObj=""
	TestObj=""
	set TestObj=server.CreateObject (strObj)
	If -2147221005 <> Err then		'��л����iAmFisher�ı�����
		IsObj = True
		VerObj = TestObj.version
		if VerObj="" or isnull(VerObj) then VerObj=TestObj.about
	end if	
End sub
%>
<html>
<head>
<title>�������������Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="admin.css" rel="stylesheet" type="text/css">
</head>
<body>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="3" cellspacing="1">
    <tr> 
      <th width="27%" height=25 class="tableHeaderText">�� �� �� �� Ϣ</th></tr>
    <tr>
      <td height=22 class="TableBody1">
<font class=fonts>��ķ������Ƿ�֧��ASP</font>
<br>���������������ʾ���Ŀռ䲻֧��ASP��
<br>1�����ʱ��ļ�ʱ��ʾ���ء�
<br>2�����ʱ��ļ�ʱ�������ơ�&lt;%@ Language="VBScript" %&gt;�������֡�
</td></tr></table><br>
	<table class="tableBorder" width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
          <tr><th colspan=2>�� ���������йز���</th></tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;��������</td><td class="forumRow">&nbsp;<%=Request.ServerVariables("SERVER_NAME")%></td>
	  </tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;������IP</td><td class="forumRow">&nbsp;<%=Request.ServerVariables("LOCAL_ADDR")%></td>
	  </tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;�������˿�</td><td class="forumRow">&nbsp;<%=Request.ServerVariables("SERVER_PORT")%></td>
	  </tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;������ʱ��</td><td class="forumRow">&nbsp;<%=now%></td>
	  </tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;IIS�汾</td><td class="forumRow">&nbsp;<%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
	  </tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;�ű���ʱʱ��</td><td class="forumRow">&nbsp;<%=Server.ScriptTimeout%> ��</td>
	  </tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;���ļ�·��</td><td class="forumRow">&nbsp;<%=Request.ServerVariables("PATH_TRANSLATED")%></td>
	  </tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;������CPU����</td><td class="forumRow">&nbsp;<%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%> ��</td>
	  </tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;��������������</td><td class="forumRow">&nbsp;<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
	  </tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;����������ϵͳ</td><td class="forumRow">&nbsp;<%=Request.ServerVariables("OS")%></td>
	  </tr>
	</table>
<br>
<%
Dim strClass
	strClass = Trim(Request.Form("classname"))
	If "" <> strClass then
	Response.Write "<br>��ָ��������ļ������"
	Dim Verobj1
	ObjTest(strClass)
	  If Not IsObj then 
		Response.Write "<br><font color=red>���ź����÷�������֧�� " & strclass & " �����</font>"
	  Else
		if VerObj="" or isnull(VerObj) then 
			Verobj1="�޷�ȡ�ø�����汾"
		Else
			Verobj1="������汾�ǣ�" & VerObj
		End If
		Response.Write "<br><font class=fonts>��ϲ���÷�����֧�� " & strclass & " �����" & verobj1 & "</font>"
	  End If
	  Response.Write "<br>"
	end if
	%>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
<tr><th colspan=2>�� IIS�Դ���ASP���</th></tr>
	<tr height=23 align=center><td width=70% class=forumHeaderBackgroundAlternate>�� �� �� ��</td><td width=30% class=forumHeaderBackgroundAlternate>֧�ּ��汾</td></tr>
	<%For i=0 to 10%>
	<tr>
		<td height=20 class=forumRowHighlight>&nbsp;<%=ObjTotest(i,0) & "<font color=#888888>&nbsp;" & ObjTotest(i,1)%></font></td>
		<td class=forumRow>&nbsp;<%
		If Not ObjTotest(i,2) Then 
			Response.Write "<font color=red><b>��</b></font>"
		Else
			Response.Write "<font class=fonts><b>��</b></font> <a title='" & ObjTotest(i,3) & "'>" & left(ObjTotest(i,3),11) & "</a>"
		End If%></td>
	</tr>
	<%next%>
</table>

<br>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
<tr><th colspan=2>�� �������ļ��ϴ��͹������</th></tr>
	<tr height=23 align=center><td width=70% class=forumHeaderBackgroundAlternate>�� �� �� ��</td><td width=30% class=forumHeaderBackgroundAlternate>֧�ּ��汾</td></tr>
	<%For i=11 to 15%>
	<tr height="18" class=backq>
		<td height=20 class=forumRowHighlight>&nbsp;<%=ObjTotest(i,0) & "<font color=#888888>&nbsp;" & ObjTotest(i,1)%></font></td>
		<td class=forumRow>&nbsp;<%
		If Not ObjTotest(i,2) Then 
			Response.Write "<font color=red><b>��</b></font>"
		Else
			Response.Write "<font class=fonts><b>��</b></font> <a title='" & ObjTotest(i,3) & "'>" & left(ObjTotest(i,3),11) & "</a>"
		End If%></td>
	</tr>
	<%next%>
</table>

<br>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
<tr><th colspan=2>�� �������շ��ʼ����</th></tr>
	<tr height=23 align=center><td width=70% class=forumHeaderBackgroundAlternate>�� �� �� ��</td><td width=30% class=forumHeaderBackgroundAlternate>֧�ּ��汾</td></tr>
	<%For i=16 to 23%>
	<tr height="18" class=backq>
		<td height=20 class=forumRowHighlight>&nbsp;<%=ObjTotest(i,0) & "<font color=#888888>&nbsp;" & ObjTotest(i,1)%></font></td>
		<td class=forumRow>&nbsp;<%
		If Not ObjTotest(i,2) Then 
			Response.Write "<font color=red><b>��</b></font>"
		Else
			Response.Write "<font class=fonts><b>��</b></font> <a title='" & ObjTotest(i,3) & "'>" & left(ObjTotest(i,3),11) & "</a>"
		End If%></td>
	</tr>
	<%next%>
</table>
<BR>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
<tr><th colspan=2>�� ͼ�������</th></tr>
	<tr height=23 align=center><td width=70% class=forumHeaderBackgroundAlternate>�� �� �� ��</td><td width=30% class=forumHeaderBackgroundAlternate>֧�ּ��汾</td></tr>
	<%For i=24 to 25%>
	<tr height="20">
		<td height=20 class=forumRowHighlight>&nbsp;<%=ObjTotest(i,0) & "<font color=#888888>&nbsp;" & ObjTotest(i,1)%></font></td>
		<td class=forumRow>&nbsp;<%
		If Not ObjTotest(i,2) Then 
			Response.Write "<font color=red><b>��</b></font>"
		Else
			Response.Write "<font class=fonts><b>��</b></font> <a title='" & ObjTotest(i,3) & "'>" & left(ObjTotest(i,3),11) & "</a>"
		End If%></td>
	</tr>
	<%next%>
</table>

<br>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
<tr><th>�� �������֧��������</th></tr>
<tr height=23 align=center><td width=70% class=forumHeaderBackgroundAlternate>
��������������������Ҫ���������ProgId��ClassId��</td></tr>
<FORM action=<%=Request.ServerVariables("SCRIPT_NAME")%> method=post id=form1 name=form1>
	<tr height="23">
		<td align=center class=forumRow height=30><input class=kuang type=text value="" name="classname" size=40>
<INPUT type=submit value=" ȷ �� " class=kuang id=submit1 name=submit1>
<INPUT type=reset value=" �� �� " class=kuang id=reset1 name=reset1> 
</td>
	  </tr>
</FORM>
</table>

<%if ObjTest("Scripting.FileSystemObject") then

	set fsoobj=server.CreateObject("Scripting.FileSystemObject")

%>

<br>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
<tr><th colspan=6>�� ������������Ϣ</th></tr>
  <tr height="20" align=center>
	<td width="100" class=forumHeaderBackgroundAlternate>�̷��ʹ�������</td>
	<td width="50" class=forumHeaderBackgroundAlternate>����</td>
	<td width="80" class=forumHeaderBackgroundAlternate>���</td>
	<td width="60" class=forumHeaderBackgroundAlternate>�ļ�ϵͳ</td>
	<td width="80" class=forumHeaderBackgroundAlternate>���ÿռ�</td>
	<td width="80" class=forumHeaderBackgroundAlternate>�ܿռ�</td>
  </tr>
<%

	' ���Դ�����Ϣ���뷨���ԡ�COCOON ASP ̽�롱
	
	set drvObj=fsoobj.Drives
	for each d in drvObj
%>
  <tr height="18" align=center>
	<td class=forumRowHighlight align="right"><%=cdrivetype(d.DriveType) & " " & d.DriveLetter%>:</td>
<%
	if d.DriveLetter = "A" then	'Ϊ��ֹӰ������������������
		Response.Write "<td class=forumRow></td><td class=forumRow></td><td class=forumRow></td><td class=forumRow></td><td class=forumRow></td>"
	else
%>
	<td class=forumRow><%=cIsReady(d.isReady)%></td>
	<td class=forumRow><%=d.VolumeName%></td>
	<td class=forumRow><%=d.FileSystem%></td>
	<td align="right" class=forumRow><%=cSize(d.FreeSpace)%></td>
	<td align="right" class=forumRow><%=cSize(d.TotalSize)%></td>
<%
	end if
%>
  </tr>
<%
	next
%>
</td></tr>
</table>

<br>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
<tr><th colspan=5>�� ��ǰ�ļ�����Ϣ <%
	dPath = server.MapPath("./")
	set dDir = fsoObj.GetFolder(dPath)
	set dDrive = fsoObj.GetDrive(dDir.Drive)
%>
�ļ���: <%=dPath%></th></tr>
  <tr height="23" align="center">
	<td width="75" class=forumHeaderBackgroundAlternate>���ÿռ�</td>
	<td width="75" class=forumHeaderBackgroundAlternate>���ÿռ�</td>
	<td width="75" class=forumHeaderBackgroundAlternate>�ļ�����</td>
	<td width="75" class=forumHeaderBackgroundAlternate>�ļ���</td>
	<td width="150" class=forumHeaderBackgroundAlternate>����ʱ��</td>
  </tr>
  <tr height="20" align="center">
	<td class=forumRow><%=cSize(dDir.Size)%></td>
	<td class=forumRow><%=cSize(dDrive.AvailableSpace)%></td>
	<td class=forumRow><%=dDir.SubFolders.Count%></td>
	<td class=forumRow><%=dDir.Files.Count%></td>
	<td class=forumRow><%=dDir.DateCreated%></td>
  </tr>
</td></tr>
</table>

<br>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
<tr><th colspan=2>�� �����ļ������ٶȲ���</th></tr>
<tr height="20" align=center>
	<td colspan=2 class=forumRow><%
	
	Response.Write "�����ظ�������д���ɾ���ı��ļ�50��..."

	dim thetime3,tempfile,iserr

iserr=false
	t1=timer
	tempfile=server.MapPath("./") & "\aspchecktest.txt"
	for i=1 to 50
		Err.Clear

		set tempfileOBJ = FsoObj.CreateTextFile(tempfile,true)
		if Err <> 0 then
			Response.Write "�����ļ�����"
			iserr=true
			Err.Clear
			exit for
		end if
		tempfileOBJ.WriteLine "Only for test. Ajiang ASPcheck"
		if Err <> 0 then
			Response.Write "д���ļ�����"
			iserr=true
			Err.Clear
			exit for
		end if
		tempfileOBJ.close
		Set tempfileOBJ = FsoObj.GetFile(tempfile)
		tempfileOBJ.Delete 
		if Err <> 0 then
			Response.Write "ɾ���ļ�����"
			iserr=true
			Err.Clear
			exit for
		end if
		set tempfileOBJ=nothing
	next
	t2=timer
if iserr <> true then
	thetime3=cstr(int(( (t2-t1)*10000 )+0.5)/10)
	Response.Write "...����ɣ�<font color=red>" & thetime3 & "����</font>��"

%>
</td></tr>
  <tr height=23 align=center>
	<td width=70% class=forumHeaderBackgroundAlternate>�� �� �� �� �� �� ��</td>
	<td width=30% class=forumHeaderBackgroundAlternate>���ʱ��(����)</td>
  </tr>
  <tr height=18>
	<td height=20 class=forumRowHighlight>&nbsp;<a href="http://www.ajiang.net">�����ĸ���������DDR512M����1.7G,ϣ��7200ת/2M��</a></td><td class=forumRow>&nbsp;140��200</td>
  </tr>
  <tr height=18>
	<td height=20 class=forumRowHighlight>&nbsp;<a href="http://www.ajiang.net">������λ�ĵ��ԣ�SD256M����660,ϣ��5400ת��</a></td><td class=forumRow>&nbsp;350��600</td>
  </tr>
  <tr height=18>
	<td height=20 class=forumRowHighlight>&nbsp;<font color=red>��̨������: <%=Request.ServerVariables("SERVER_NAME")%></font>&nbsp;</td><td class=forumRow>&nbsp;<font color=red><%=thetime3%></font></td>
  </tr>
</table>
<%
end if
	
	set fsoobj=nothing

end if%>
<br>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
<tr><th colspan=3>�� ASP�ű����ͺ������ٶȲ���</th></tr>
<tr height="20" align=center>
	<td colspan=3 class=forumRow>
<%

	'��л����ͬѧ¼ http://www.5719.net �Ƽ�ʹ��timer����
	'��Ϊֻ����50��μ��㣬����ȥ�����Ƿ����ѡ���ֱ�Ӽ��
	
	Response.Write "����������ԣ����ڽ���50��μӷ�����..."
	dim t1,t2,lsabc,thetime,thetime2
	t1=timer
	for i=1 to 500000
		lsabc= 1 + 1
	next
	t2=timer
	thetime=cstr(int(( (t2-t1)*10000 )+0.5)/10)
	Response.Write "...����ɣ�<font color=red>" & thetime & "����</font>��<br>"


	Response.Write "����������ԣ����ڽ���20��ο�������..."
	t1=timer
	for i=1 to 200000
		lsabc= 2^0.5
	next
	t2=timer
	thetime2=cstr(int(( (t2-t1)*10000 )+0.5)/10)
	Response.Write "...����ɣ�<font color=red>" & thetime2 & "����</font>��<br>"
%>
</td></tr>
  <tr height=23 align=center>
	<th width=70%>�����յķ����������ʱ��(����)</td>
    <th nowrap>��������</td><th nowrap>��������</td>
  </tr>
  <tr height=15%>
	<td height=20 class=forumRowHighlight>&nbsp;<a href="http://www.100u.com?come=aspcheck&keyword=��������"
	>���ſƼ� 100u ����, <font color=#888888>2003-11-1</font></a></td><td class=forumRow>&nbsp;181��233</td><td class=forumRow>&nbsp;156��218</td>
  </tr>
  <tr height=18>
	<td height=20 class=forumRowHighlight>&nbsp;<a href="http://www.west263.com/index.asp?ads=ajiang"
	>�������� west263 ����, <font color=#888888>2003-11-1</font></a></td><td class=forumRow>&nbsp;171��233</td><td class=forumRow>&nbsp;156��171</td>
  </tr>
  <tr height=18>
	<td height=20 class=forumRowHighlight>&nbsp;<a href="http://www.linkwww.com "
	>�����Ƽ� linkwww ����,  <font color=#888888>2003-11-1</font></a></td><td class=forumRow>&nbsp;181��203</td><td class=forumRow>&nbsp;171</td>
  </tr>
  <tr height=18>
	<td height=20 class=forumRowHighlight>&nbsp;<a href="http://www.9s5.com/"
	>������www.9s5.comȫ����(ASP+PHP+JSP)����,<font color=#888888>2003-11-1</font></a></td><td class=forumRow>&nbsp;171��187</td><td class=forumRow>&nbsp;156��171</td>
  </tr>
  <tr height=18>
	<td height=20 class=forumRowHighlight>&nbsp;<a href="http://www.dnsmy.com/"
	>��Ѷ���� Dnsmy ����, <font color=#888888>2003-11-1</font></a></td><td class=forumRow>&nbsp;155��180</td><td class=forumRow>&nbsp;122��172</td>
  </tr>
  <tr height=18>
	<td height=20 class=forumRowHighlight>&nbsp;<a href="http://www.senye.net/"
	>ʤ������ Senye.net ����, <font color=#888888>2003-10-28</font></a></td><td class=forumRow>&nbsp;171��187</td><td class=forumRow>&nbsp;156��171</td>
  </tr>
  <tr height=18>
	<td height=20 class=forumRowHighlight>&nbsp;<font color=red>��̨������: <%=Request.ServerVariables("SERVER_NAME")%></font>&nbsp;</td><td class=forumRow nowrap>&nbsp;<font color=red><%=thetime%></font></td><td  class=forumRow nowrap>&nbsp;<font color=red><%=thetime2%></font></td>
  </tr>
</table>
<BR>
<table class="tableBorder" border=0 width=90% align=center cellspacing=0 cellpadding=0>
<tr><td align=center>
�������ɰ���(<a href="mailto:info@ajiang.net?subject=����̽��">info@ajiang.net</a>)��д��ת��ʱ�뱣����Щ��Ϣ
</td></tr>
</table>
</BODY>
</HTML>

<%
function cdrivetype(tnum)
    Select Case tnum
        Case 0: cdrivetype = "δ֪"
        Case 1: cdrivetype = "���ƶ�����"
        Case 2: cdrivetype = "����Ӳ��"
        Case 3: cdrivetype = "�������"
        Case 4: cdrivetype = "CD-ROM"
        Case 5: cdrivetype = "RAM ����"
    End Select
end function

function cIsReady(trd)
    Select Case trd
		case true: cIsReady="<font class=fonts><b>��</b></font>"
		case false: cIsReady="<font color='red'><b>��</b></font>"
	End Select
end function

function cSize(tSize)
    if tSize>=1073741824 then
		cSize=int((tSize/1073741824)*1000)/1000 & " GB"
    elseif tSize>=1048576 then
    	cSize=int((tSize/1048576)*1000)/1000 & " MB"
    elseif tSize>=1024 then
		cSize=int((tSize/1024)*1000)/1000 & " KB"
	else
		cSize=tSize & "B"
	end if
end function
%>