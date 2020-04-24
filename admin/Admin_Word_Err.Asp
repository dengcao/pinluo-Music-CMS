<!--#include file="const.asp"-->
<!--#include file="Top.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
<%CheckAdmin1%>
<%
'
'☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
'★                                                                   ★
'☆                     品络音乐程序系统1.0                              ☆
'★                                                                   ★
'☆     空间域名: 品络  www.pinluo.com                                  ☆
'★                                                                   ★
'☆     程序制作: 草札  www.caozha.com                                  ☆
'★                                                                   ★
'★     源码基于Apache-2.0免费开源，请保留声明和链接！                      ★
'☆                                                                   ☆
'☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
'
'
founderr=false

Dim ID,MusicID,SinGer,MusicName,SpecialName,Words,AddUser

ID	    = Request("id")
Words       = Request("Words")
Flag        = Request("Flag")
AddUser     = Request("AddUser")

Set Rs = Server.Createobject("adodb.recordset")
If id = "" Then
	errmsg=errmsg+"<br><li>请先选择歌曲！</li>"
	founderr=true
Else
	sql="Select * From TextWord Where ID=" & id
	Rs.open sql,conn,1,3
	If not rs.EOF Then
		Rs("Words")       = Words
		If Flag = 1 And Words<>"" Then
			Rs("Flag") = True
		Else
			Rs("Flag") = False
		End If
		Rs("AddUser")     = AddUser
		Rs("AddTime")     = Now()
		Rs.update
		MusicID 	= Rs("MusicID")
	    SinGer 	    = Rs("SinGer")
		MusicName 	= Rs("MusicName")
		SpecialName = Rs("SpecialName") 
		Words 		= Rs("Words")
		AddUser 	= Rs("AddUser")
		AddTime 	= Rs("AddTime")
		Set fso = Server.CreateObject("Scripting.FileSystemObject")
		'-------------------同步生成播放页歌词和独立歌词-------------------
		set fw = fso.CreateTextFile(Server.MapPath("/Word/a306.com_"&MusicID&".html"),TRUE)  '若有则覆盖
		'--------------------生成独立歌词-------------------------------------
		fw.writeline"<html><head>"&vbcrlf
		fw.writeline"<title>查看《"&rs("MusicName")&"》歌词 - 本歌词由品络科技收集整理 - 港台 内地 日韩 欧美 流行歌曲 免费下载试听</title>"&vbcrlf
		fw.writeline"<LINK href='../../Images/Css3.Css' rel=stylesheet type=text/css>"&vbcrlf
		fw.writeline"</head>"&vbcrlf
		fw.writeline"<body bgcolor='#ECFBFF' leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"&vbcrlf
		fw.writeline"<table class="tableBorder" width='300' HEIGHT='100%' border='0' align='center' cellpadding='0' cellspacing='1' bgcolor='#ECFBFF'>"&vbcrlf
		fw.writeline"<tr>"&vbcrlf
		fw.writeline"<td valign='top'><div align='center'><img src='../Images/ccc.gif' width='300' height='8'><br><b><font color='#003366'>查看：《"&MusicName&"》歌词</font></b><br><img src='../Images/ccc.gif' width='300' height='5'></div>"&vbcrlf
		fw.writeline"<div name=Mtext style='width:300px;height:400px;font-face:Arial;padding:3;overflow=auto;border:inset 1px;'>"&vbcrlf
		fw.writeline"<input type='button' class='lrcbutton' value=' 歌词报错 ' onClick=window.open('../User/WordErr.Asp?id="&MusicID&"','','width=500,height=210,top=190,left=320,resizable=no')>&nbsp;"&vbcrlf
		fw.writeline"<input type='button' class='lrcbutton' value=' 提交歌词 ' onClick=window.open('../User/Word.Asp?id="&MusicID&"','','width=500,height=339,top=190,left=320,resizable=no')><br><br>"&vbcrlf
		fw.writeline Words&"<br>" & vbCrLf
		fw.writeline"<div id='adduser' align='right'>感谢{<b>" & AddUser & "</b>}提供歌词</div><br>"&vbcrlf
		fw.writeline"</div></td>"&vbcrlf
		fw.writeline"</tr></table></body></html>"
		fw.close
		set fw=nothing
		response.Write("&nbsp;&nbsp;&nbsp;"&MusicID&"独立歌词生成完毕！<br>")
		response.Flush()
  		'--------------------生成播放页歌词-------------------------------------
  		set fwr = fso.CreateTextFile(Server.MapPath("/PlayWord/a306.com_"&MusicID&".html"),TRUE)
		fwr.writeline"<html><head>"&vbcrlf
		fwr.writeline"<title>查看《"&MusicName&"》歌词 - 本歌词由品络科技收集整理 - a306.com港台 内地 日韩 欧美 流行歌曲 免费下载试听</title>"&vbcrlf
		fwr.writeline"<LINK href='../Images/Css3.Css' rel=stylesheet type=text/css>"&vbcrlf
		fwr.writeline"</head>"&vbcrlf
		fwr.writeline"<body bgcolor='#ffffff' leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"&vbcrlf
		fwr.writeline"<table class="tableBorder" width='100%' HEIGHT='100%' border='0' align='center' cellpadding='10' cellspacing='1' bgcolor='#ffffff'>"&vbcrlf
		fwr.writeline"<tr>"&vbcrlf
		fwr.writeline"<td valign='top'>"&vbcrlf
		fwr.writeline"<input type='button' class='lrcbutton' value=' 歌词报错 ' onClick=window.open('../User/WordErr.Asp?Type=TextWord&id="&MusicID&"','','width=500,height=210,top=190,left=320,resizable=no')>&nbsp;"&vbcrlf
		fwr.writeline"<input type='button' class='lrcbutton' value=' 提交歌词 ' onClick=window.open('../User/Word.Asp?id="&MusicID&"','','width=500,height=339,top=190,left=320,resizable=no')><br><br>"&vbcrlf
		fwr.writeline"<font color='#333333'>"&Words&"</font><br>"&vbcrlf
		fwr.writeline"<div id='adduser' align='right'>感谢{<b>" & AddUser & "</b>}提供歌词</div><br>"&vbcrlf
		fwr.writeline"</td>"&vbcrlf
		fwr.writeline"</tr></table></body></html>"&vbcrlf
		'--------------------生成播放页歌词完毕------------------------------------
		fwr.close
		set fwr=nothing
		Set fso = Nothing
		response.Write("&nbsp;&nbsp;&nbsp;"&MusicID&"播放页歌词生成完毕！<br>")
		response.Flush()
%>
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=100% align=center border=0>
  <TBODY>
    <TR>
      <TD height=50></TD>
    </TR>
  </TBODY>
</TABLE>
<table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
    <tr class="title">
      <td width="100%" Class="title">
          <table class="tableBorder" border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td width="100%" class="forumrow" height="80" align="center">
                <b><img src="Images/OK.gif" width="150" height="47"></b>
                <p><a href="Admin_LrcWord.Asp"><b>返 回</b> </a>
              </td>
            </tr>
          </table>
      </td>
    </tr>
  </table>
<%
	Else
		errmsg=errmsg+"<br><li>选择歌曲错误！</li>"
		call error()
	End if
	Rs.close
End If
Set Rs = Nothing
Conn.Close
Set Conn = Nothing
%>
