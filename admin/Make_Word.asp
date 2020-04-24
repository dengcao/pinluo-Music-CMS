<!--#include file="Const.Asp"-->
<!--#include file="Top.Asp"-->
<%CheckAdmin1%>
<%PageName="Make_Word"%>
<LINK href="admin.css" type=text/css rel=stylesheet>
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
server.ScriptTimeout=9999
if request("gx")=1 then
min=request("min")
max=request("max")
if min="" and max="" then mysql=" order by MusicID"
if min<>"" and max="" then mysql=" where MusicID>="&min&" order by MusicID"
if min="" and max<>"" then mysql=" where MusicID<="&max&" order by MusicID"
if min<>"" and max<>"" then mysql=" where MusicID>="&min&" and MusicID<="&max&" order by MusicID"
SqlNum = (Max - Min) + 1
   On Error Resume Next
  '################ 生成歌词Shtml页面 #品络科技###############
    Set Fso = Server.CreateObject("Scripting.FileSystemObject")
    sql="SELECT Top " & SqlNum & " id,MusicID,MusicName,Words,AddUser FROM TextWord "&mysql
    Set Rs = Conn.Execute(Sql) 
    i=0
    while not rs.eof
	if rs("Words")<>"" then 
		words=rs("Words")
	else 
		words="<div align='center'><b>抱歉，没有找到与之相关的歌词</b><br><br>"
	end if
	set fw = fso.CreateTextFile(Server.MapPath("/Word/"&rs("MusicID")&".html"),TRUE)  '若有则覆盖
  '################ 生成歌词开始 #品络科技###############
fw.writeline"<html><head>"&vbcrlf
fw.writeline"<title>查看《"&rs("MusicName")&"》歌词 - 本歌词由"&WebName&"音乐网收集整理 - "&WebUrl&"</title>"&vbcrlf
fw.writeline"<LINK href='../../Images/Css3.Css' rel=stylesheet type=text/css>"&vbcrlf
fw.writeline"</head>"&vbcrlf
fw.writeline"<body bgcolor='#ECFBFF' leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"&vbcrlf
fw.writeline"<table class="tableBorder" width='300' HEIGHT='100%' border='0' align='center' cellpadding='0' cellspacing='1' bgcolor='#ECFBFF'>"&vbcrlf
fw.writeline"<tr>"&vbcrlf
fw.writeline"<td valign='top'><div align='center'><img src='../Images/ccc.gif' width='300' height='8'><br><b><font color='#003366'>查看：《"&rs("MusicName")&"》歌词</font></b><br><img src='../Images/ccc.gif' width='300' height='5'></div>"&vbcrlf
fw.writeline"<div name=Mtext style='width:300px;height:400px;font-face:Arial;padding:3;overflow=auto;border:inset 1px;'>"&vbcrlf
fw.writeline"<input type='button' class='lrcbutton' value=' 歌词报错 ' onClick=window.open('../User/WordErr.Asp?Type=TextWord&id="&rs("MusicID")&"','','width=500,height=210,top=190,left=320,resizable=no')>&nbsp;"&vbcrlf
fw.writeline"<input type='button' class='lrcbutton' value=' 提交歌词 ' onClick=window.open('../User/Word.Asp?id="&rs("MusicID")&"','','width=500,height=339,top=190,left=320,resizable=no')><br><br>"&vbcrlf
fw.writeline Words&"<br>"&vbcrlf
fw.writeline"<div id='adduser' align='right'>感谢{<b>" & Rs("AddUser") & "</b>}提供歌词</div><br>"&vbcrlf
fw.writeline"</div></td></tr></table>"&vbcrlf
fw.writeline"<script language='javascript' src='/user/SongHot.asp?SongType=3&KeyName="&rs("MusicName")&"'></script>"&vbcrlf
fw.writeline"</body></html>"
  '################ 生成歌词结束 #品络科技###############
    fw.close
	response.Write("&nbsp;&nbsp;&nbsp;"&rs("MusicID")&"歌词生成完毕！<br>")
	response.Flush()
    rs.movenext
	wend
    rs.close
    set rs=nothing
    conn.close
    set conn=nothing
%>
<script>alert('恭喜，生成歌词页成功！');history.back();</Script>
<%
Else
	Dim MusicCount
	MusicCount = Conn.Execute("Select Count(ID) From LrcWord")(0)
%>
  <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
  <tr class="title"> 
    <td height="22" colspan="3" align="center"><strong>生 成 歌 词 独 立 歌 词 页</strong></td>
  </tr>
              <tr><td height="18" align="center" class="forumrow">请注意此处填入的数值，一次生成5000个页面以内，如从ID“1”至ID“5000”</td>
              </tr>
		<tr>
          <td width="100%" class="forumrow"><FORM name=form1 action=Make_Word.asp?gx=1 method=post>
          <p align="center">从ID:<input type="text" name="min" size="20" value="1">&nbsp;至ID:<input type="text" name="max" size="20" value="<%=MusicCount%>">&nbsp;&nbsp;<input type="submit" value="提 交" name="B1"></p>
        </form></td>
        </tr>
      </table>
<%
conn.close
set conn=nothing
end if%>
