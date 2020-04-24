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
'不使用输出缓冲区，直接将运行结果显示在客户端
'Response.Buffer = False
Dim starttime
starttime=timer()*1000
'声明待检测数组
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
	ObjTotest(9,1) = "(FSO 文本文件读写)"
ObjTotest(10,0) = "adodb.connection"
	ObjTotest(10,1) = "(ADO 数据对象)"
	
ObjTotest(11,0) = "SoftArtisans.FileUp"
	ObjTotest(11,1) = "(SA-FileUp 文件上传)"
ObjTotest(12,0) = "SoftArtisans.FileManager"
	ObjTotest(12,1) = "(SoftArtisans 文件管理)"
ObjTotest(13,0) = "LyfUpload.UploadFile"
	ObjTotest(13,1) = "(刘云峰的文件上传组件)"
ObjTotest(14,0) = "Persits.Upload.1"
	ObjTotest(14,1) = "(ASPUpload 文件上传)"
ObjTotest(15,0) = "w3.upload"
	ObjTotest(15,1) = "(Dimac 文件上传)"

ObjTotest(16,0) = "JMail.SmtpMail"
	ObjTotest(16,1) = "(Dimac JMail 邮件收发) <a href='http://www.ajiang.net'>中文手册下载</a>"
ObjTotest(17,0) = "CDONTS.NewMail"
	ObjTotest(17,1) = "(虚拟 SMTP 发信)"
ObjTotest(18,0) = "Persits.MailSender"
	ObjTotest(18,1) = "(ASPemail 发信)"
ObjTotest(19,0) = "SMTPsvg.Mailer"
	ObjTotest(19,1) = "(ASPmail 发信)"
ObjTotest(20,0) = "DkQmail.Qmail"
	ObjTotest(20,1) = "(dkQmail 发信)"
ObjTotest(21,0) = "Geocel.Mailer"
	ObjTotest(21,1) = "(Geocel 发信)"
ObjTotest(22,0) = "IISmail.Iismail.1"
	ObjTotest(22,1) = "(IISmail 发信)"
ObjTotest(23,0) = "SmtpMail.SmtpMail.1"
	ObjTotest(23,1) = "(SmtpMail 发信)"
	
ObjTotest(24,0) = "SoftArtisans.ImageGen"
	ObjTotest(24,1) = "(SA 的图像读写组件)"
ObjTotest(25,0) = "W3Image.Image"
	ObjTotest(25,1) = "(Dimac 的图像读写组件)"

public IsObj,VerObj,TestObj

'检查预查组件支持情况及版本

for i=0 to 25
	on error resume next
	IsObj=false
	VerObj=""
	'dim TestObj
	TestObj=""
	set TestObj=server.CreateObject(ObjTotest(i,0))
	If -2147221005 <> Err then		'感谢网友iAmFisher的宝贵建议
		IsObj = True
		VerObj = TestObj.version
		if VerObj="" or isnull(VerObj) then VerObj=TestObj.about
	end if
	ObjTotest(i,2)=IsObj
	ObjTotest(i,3)=VerObj
next

'检查组件是否被支持及组件版本的子程序
sub ObjTest(strObj)
	on error resume next
	IsObj=false
	VerObj=""
	TestObj=""
	set TestObj=server.CreateObject (strObj)
	If -2147221005 <> Err then		'感谢网友iAmFisher的宝贵建议
		IsObj = True
		VerObj = TestObj.version
		if VerObj="" or isnull(VerObj) then VerObj=TestObj.about
	end if	
End sub
%>
<html>
<head>
<title>服务器的相关信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="admin.css" rel="stylesheet" type="text/css">
</head>
<body>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="3" cellspacing="1">
    <tr> 
      <th width="27%" height=25 class="tableHeaderText">服 务 器 信 息</th></tr>
    <tr>
      <td height=22 class="TableBody1">
<font class=fonts>你的服务器是否支持ASP</font>
<br>出现以下情况即表示您的空间不支持ASP：
<br>1、访问本文件时提示下载。
<br>2、访问本文件时看到类似“&lt;%@ Language="VBScript" %&gt;”的文字。
</td></tr></table><br>
	<table class="tableBorder" width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
          <tr><th colspan=2>■ 服务器的有关参数</th></tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;服务器名</td><td class="forumRow">&nbsp;<%=Request.ServerVariables("SERVER_NAME")%></td>
	  </tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;服务器IP</td><td class="forumRow">&nbsp;<%=Request.ServerVariables("LOCAL_ADDR")%></td>
	  </tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;服务器端口</td><td class="forumRow">&nbsp;<%=Request.ServerVariables("SERVER_PORT")%></td>
	  </tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;服务器时间</td><td class="forumRow">&nbsp;<%=now%></td>
	  </tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;IIS版本</td><td class="forumRow">&nbsp;<%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
	  </tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;脚本超时时间</td><td class="forumRow">&nbsp;<%=Server.ScriptTimeout%> 秒</td>
	  </tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;本文件路径</td><td class="forumRow">&nbsp;<%=Request.ServerVariables("PATH_TRANSLATED")%></td>
	  </tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;服务器CPU数量</td><td class="forumRow">&nbsp;<%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%> 个</td>
	  </tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;服务器解译引擎</td><td class="forumRow">&nbsp;<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
	  </tr>
	  <tr>
		<td height=20 class=forumRowHighlight>&nbsp;服务器操作系统</td><td class="forumRow">&nbsp;<%=Request.ServerVariables("OS")%></td>
	  </tr>
	</table>
<br>
<%
Dim strClass
	strClass = Trim(Request.Form("classname"))
	If "" <> strClass then
	Response.Write "<br>您指定的组件的检查结果："
	Dim Verobj1
	ObjTest(strClass)
	  If Not IsObj then 
		Response.Write "<br><font color=red>很遗憾，该服务器不支持 " & strclass & " 组件！</font>"
	  Else
		if VerObj="" or isnull(VerObj) then 
			Verobj1="无法取得该组件版本"
		Else
			Verobj1="该组件版本是：" & VerObj
		End If
		Response.Write "<br><font class=fonts>恭喜！该服务器支持 " & strclass & " 组件。" & verobj1 & "</font>"
	  End If
	  Response.Write "<br>"
	end if
	%>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
<tr><th colspan=2>■ IIS自带的ASP组件</th></tr>
	<tr height=23 align=center><td width=70% class=forumHeaderBackgroundAlternate>组 件 名 称</td><td width=30% class=forumHeaderBackgroundAlternate>支持及版本</td></tr>
	<%For i=0 to 10%>
	<tr>
		<td height=20 class=forumRowHighlight>&nbsp;<%=ObjTotest(i,0) & "<font color=#888888>&nbsp;" & ObjTotest(i,1)%></font></td>
		<td class=forumRow>&nbsp;<%
		If Not ObjTotest(i,2) Then 
			Response.Write "<font color=red><b>×</b></font>"
		Else
			Response.Write "<font class=fonts><b>√</b></font> <a title='" & ObjTotest(i,3) & "'>" & left(ObjTotest(i,3),11) & "</a>"
		End If%></td>
	</tr>
	<%next%>
</table>

<br>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
<tr><th colspan=2>■ 常见的文件上传和管理组件</th></tr>
	<tr height=23 align=center><td width=70% class=forumHeaderBackgroundAlternate>组 件 名 称</td><td width=30% class=forumHeaderBackgroundAlternate>支持及版本</td></tr>
	<%For i=11 to 15%>
	<tr height="18" class=backq>
		<td height=20 class=forumRowHighlight>&nbsp;<%=ObjTotest(i,0) & "<font color=#888888>&nbsp;" & ObjTotest(i,1)%></font></td>
		<td class=forumRow>&nbsp;<%
		If Not ObjTotest(i,2) Then 
			Response.Write "<font color=red><b>×</b></font>"
		Else
			Response.Write "<font class=fonts><b>√</b></font> <a title='" & ObjTotest(i,3) & "'>" & left(ObjTotest(i,3),11) & "</a>"
		End If%></td>
	</tr>
	<%next%>
</table>

<br>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
<tr><th colspan=2>■ 常见的收发邮件组件</th></tr>
	<tr height=23 align=center><td width=70% class=forumHeaderBackgroundAlternate>组 件 名 称</td><td width=30% class=forumHeaderBackgroundAlternate>支持及版本</td></tr>
	<%For i=16 to 23%>
	<tr height="18" class=backq>
		<td height=20 class=forumRowHighlight>&nbsp;<%=ObjTotest(i,0) & "<font color=#888888>&nbsp;" & ObjTotest(i,1)%></font></td>
		<td class=forumRow>&nbsp;<%
		If Not ObjTotest(i,2) Then 
			Response.Write "<font color=red><b>×</b></font>"
		Else
			Response.Write "<font class=fonts><b>√</b></font> <a title='" & ObjTotest(i,3) & "'>" & left(ObjTotest(i,3),11) & "</a>"
		End If%></td>
	</tr>
	<%next%>
</table>
<BR>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
<tr><th colspan=2>■ 图像处理组件</th></tr>
	<tr height=23 align=center><td width=70% class=forumHeaderBackgroundAlternate>组 件 名 称</td><td width=30% class=forumHeaderBackgroundAlternate>支持及版本</td></tr>
	<%For i=24 to 25%>
	<tr height="20">
		<td height=20 class=forumRowHighlight>&nbsp;<%=ObjTotest(i,0) & "<font color=#888888>&nbsp;" & ObjTotest(i,1)%></font></td>
		<td class=forumRow>&nbsp;<%
		If Not ObjTotest(i,2) Then 
			Response.Write "<font color=red><b>×</b></font>"
		Else
			Response.Write "<font class=fonts><b>√</b></font> <a title='" & ObjTotest(i,3) & "'>" & left(ObjTotest(i,3),11) & "</a>"
		End If%></td>
	</tr>
	<%next%>
</table>

<br>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
<tr><th>■ 其他组件支持情况检测</th></tr>
<tr height=23 align=center><td width=70% class=forumHeaderBackgroundAlternate>
在下面的输入框中输入你要检测的组件的ProgId或ClassId。</td></tr>
<FORM action=<%=Request.ServerVariables("SCRIPT_NAME")%> method=post id=form1 name=form1>
	<tr height="23">
		<td align=center class=forumRow height=30><input class=kuang type=text value="" name="classname" size=40>
<INPUT type=submit value=" 确 定 " class=kuang id=submit1 name=submit1>
<INPUT type=reset value=" 重 填 " class=kuang id=reset1 name=reset1> 
</td>
	  </tr>
</FORM>
</table>

<%if ObjTest("Scripting.FileSystemObject") then

	set fsoobj=server.CreateObject("Scripting.FileSystemObject")

%>

<br>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
<tr><th colspan=6>■ 服务器磁盘信息</th></tr>
  <tr height="20" align=center>
	<td width="100" class=forumHeaderBackgroundAlternate>盘符和磁盘类型</td>
	<td width="50" class=forumHeaderBackgroundAlternate>就绪</td>
	<td width="80" class=forumHeaderBackgroundAlternate>卷标</td>
	<td width="60" class=forumHeaderBackgroundAlternate>文件系统</td>
	<td width="80" class=forumHeaderBackgroundAlternate>可用空间</td>
	<td width="80" class=forumHeaderBackgroundAlternate>总空间</td>
  </tr>
<%

	' 测试磁盘信息的想法来自“COCOON ASP 探针”
	
	set drvObj=fsoobj.Drives
	for each d in drvObj
%>
  <tr height="18" align=center>
	<td class=forumRowHighlight align="right"><%=cdrivetype(d.DriveType) & " " & d.DriveLetter%>:</td>
<%
	if d.DriveLetter = "A" then	'为防止影响服务器，不检查软驱
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
<tr><th colspan=5>■ 当前文件夹信息 <%
	dPath = server.MapPath("./")
	set dDir = fsoObj.GetFolder(dPath)
	set dDrive = fsoObj.GetDrive(dDir.Drive)
%>
文件夹: <%=dPath%></th></tr>
  <tr height="23" align="center">
	<td width="75" class=forumHeaderBackgroundAlternate>已用空间</td>
	<td width="75" class=forumHeaderBackgroundAlternate>可用空间</td>
	<td width="75" class=forumHeaderBackgroundAlternate>文件夹数</td>
	<td width="75" class=forumHeaderBackgroundAlternate>文件数</td>
	<td width="150" class=forumHeaderBackgroundAlternate>创建时间</td>
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
<tr><th colspan=2>■ 磁盘文件操作速度测试</th></tr>
<tr height="20" align=center>
	<td colspan=2 class=forumRow><%
	
	Response.Write "正在重复创建、写入和删除文本文件50次..."

	dim thetime3,tempfile,iserr

iserr=false
	t1=timer
	tempfile=server.MapPath("./") & "\aspchecktest.txt"
	for i=1 to 50
		Err.Clear

		set tempfileOBJ = FsoObj.CreateTextFile(tempfile,true)
		if Err <> 0 then
			Response.Write "创建文件错误！"
			iserr=true
			Err.Clear
			exit for
		end if
		tempfileOBJ.WriteLine "Only for test. Ajiang ASPcheck"
		if Err <> 0 then
			Response.Write "写入文件错误！"
			iserr=true
			Err.Clear
			exit for
		end if
		tempfileOBJ.close
		Set tempfileOBJ = FsoObj.GetFile(tempfile)
		tempfileOBJ.Delete 
		if Err <> 0 then
			Response.Write "删除文件错误！"
			iserr=true
			Err.Clear
			exit for
		end if
		set tempfileOBJ=nothing
	next
	t2=timer
if iserr <> true then
	thetime3=cstr(int(( (t2-t1)*10000 )+0.5)/10)
	Response.Write "...已完成！<font color=red>" & thetime3 & "毫秒</font>。"

%>
</td></tr>
  <tr height=23 align=center>
	<td width=70% class=forumHeaderBackgroundAlternate>供 对 照 的 服 务 器</td>
	<td width=30% class=forumHeaderBackgroundAlternate>完成时间(毫秒)</td>
  </tr>
  <tr height=18>
	<td height=20 class=forumRowHighlight>&nbsp;<a href="http://www.ajiang.net">阿江的个人主机（DDR512M赛扬1.7G,希捷7200转/2M）</a></td><td class=forumRow>&nbsp;140～200</td>
  </tr>
  <tr height=18>
	<td height=20 class=forumRowHighlight>&nbsp;<a href="http://www.ajiang.net">阿江单位的电脑（SD256M赛扬660,希捷5400转）</a></td><td class=forumRow>&nbsp;350～600</td>
  </tr>
  <tr height=18>
	<td height=20 class=forumRowHighlight>&nbsp;<font color=red>这台服务器: <%=Request.ServerVariables("SERVER_NAME")%></font>&nbsp;</td><td class=forumRow>&nbsp;<font color=red><%=thetime3%></font></td>
  </tr>
</table>
<%
end if
	
	set fsoobj=nothing

end if%>
<br>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
<tr><th colspan=3>■ ASP脚本解释和运算速度测试</th></tr>
<tr height="20" align=center>
	<td colspan=3 class=forumRow>
<%

	'感谢网际同学录 http://www.5719.net 推荐使用timer函数
	'因为只进行50万次计算，所以去掉了是否检测的选项而直接检测
	
	Response.Write "整数运算测试，正在进行50万次加法运算..."
	dim t1,t2,lsabc,thetime,thetime2
	t1=timer
	for i=1 to 500000
		lsabc= 1 + 1
	next
	t2=timer
	thetime=cstr(int(( (t2-t1)*10000 )+0.5)/10)
	Response.Write "...已完成！<font color=red>" & thetime & "毫秒</font>。<br>"


	Response.Write "浮点运算测试，正在进行20万次开方运算..."
	t1=timer
	for i=1 to 200000
		lsabc= 2^0.5
	next
	t2=timer
	thetime2=cstr(int(( (t2-t1)*10000 )+0.5)/10)
	Response.Write "...已完成！<font color=red>" & thetime2 & "毫秒</font>。<br>"
%>
</td></tr>
  <tr height=23 align=center>
	<th width=70%>供对照的服务器及完成时间(毫秒)</td>
    <th nowrap>整数运算</td><th nowrap>浮点运算</td>
  </tr>
  <tr height=15%>
	<td height=20 class=forumRowHighlight>&nbsp;<a href="http://www.100u.com?come=aspcheck&keyword=虚拟主机"
	>百优科技 100u 主机, <font color=#888888>2003-11-1</font></a></td><td class=forumRow>&nbsp;181～233</td><td class=forumRow>&nbsp;156～218</td>
  </tr>
  <tr height=18>
	<td height=20 class=forumRowHighlight>&nbsp;<a href="http://www.west263.com/index.asp?ads=ajiang"
	>西部数码 west263 主机, <font color=#888888>2003-11-1</font></a></td><td class=forumRow>&nbsp;171～233</td><td class=forumRow>&nbsp;156～171</td>
  </tr>
  <tr height=18>
	<td height=20 class=forumRowHighlight>&nbsp;<a href="http://www.linkwww.com "
	>联网科技 linkwww 主机,  <font color=#888888>2003-11-1</font></a></td><td class=forumRow>&nbsp;181～203</td><td class=forumRow>&nbsp;171</td>
  </tr>
  <tr height=18>
	<td height=20 class=forumRowHighlight>&nbsp;<a href="http://www.9s5.com/"
	>就是我www.9s5.com全功能(ASP+PHP+JSP)主机,<font color=#888888>2003-11-1</font></a></td><td class=forumRow>&nbsp;171～187</td><td class=forumRow>&nbsp;156～171</td>
  </tr>
  <tr height=18>
	<td height=20 class=forumRowHighlight>&nbsp;<a href="http://www.dnsmy.com/"
	>永讯网络 Dnsmy 主机, <font color=#888888>2003-11-1</font></a></td><td class=forumRow>&nbsp;155～180</td><td class=forumRow>&nbsp;122～172</td>
  </tr>
  <tr height=18>
	<td height=20 class=forumRowHighlight>&nbsp;<a href="http://www.senye.net/"
	>胜易网络 Senye.net 主机, <font color=#888888>2003-10-28</font></a></td><td class=forumRow>&nbsp;171～187</td><td class=forumRow>&nbsp;156～171</td>
  </tr>
  <tr height=18>
	<td height=20 class=forumRowHighlight>&nbsp;<font color=red>这台服务器: <%=Request.ServerVariables("SERVER_NAME")%></font>&nbsp;</td><td class=forumRow nowrap>&nbsp;<font color=red><%=thetime%></font></td><td  class=forumRow nowrap>&nbsp;<font color=red><%=thetime2%></font></td>
  </tr>
</table>
<BR>
<table class="tableBorder" border=0 width=90% align=center cellspacing=0 cellpadding=0>
<tr><td align=center>
本程序由阿江(<a href="mailto:info@ajiang.net?subject=阿江探针">info@ajiang.net</a>)编写，转载时请保留这些信息
</td></tr>
</table>
</BODY>
</HTML>

<%
function cdrivetype(tnum)
    Select Case tnum
        Case 0: cdrivetype = "未知"
        Case 1: cdrivetype = "可移动磁盘"
        Case 2: cdrivetype = "本地硬盘"
        Case 3: cdrivetype = "网络磁盘"
        Case 4: cdrivetype = "CD-ROM"
        Case 5: cdrivetype = "RAM 磁盘"
    End Select
end function

function cIsReady(trd)
    Select Case trd
		case true: cIsReady="<font class=fonts><b>√</b></font>"
		case false: cIsReady="<font color='red'><b>×</b></font>"
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