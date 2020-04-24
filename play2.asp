<!--#include file="PL_config.asp"-->
<!--#include file="PL_INC/PL_Path.Asp"-->
<%
if request("id")="" then
		response.write"<SCRIPT language=JavaScript>alert('出错啦! 至少要选择歌曲一首以上才能连播!');"
		response.write"javascript:window.close();</SCRIPT>"
		response.end()
	else
end if
id=replace(request("id")," ","")
Dim MusicID,MusicArray,MusicNum
MusicID=request.QueryString("id")&","
MusicArray=Split(MusicID, ",")
MusicNum = UBound(MusicArray)-1
%>
<SCRIPT language=javascript>
  <%
For i=0 To MusicNum
MusicArray(i)=replace(MusicArray(i)," ","")
set rs=server.createobject("adodb.recordset")
sql="select * from MusicList where id ="&musicarray(i)
rs.open sql,conn,1,3
'更新点击数
if rs("hits")<>"" then
rs("hits")=rs("hits")+1
rs.update
else
rs("hits")="1"
rs.update
end if

PL_song_path=rs("Song_Path")
if PL_song_path="0" then
PL_path=song_path
elseif PL_song_path="1" then
PL_path=song_path1
elseif PL_song_path="2" then
PL_path=song_path2
elseif PL_song_path="3" then
PL_path=song_path3
elseif PL_song_path="4" then
PL_path=song_path4
elseif PL_song_path="5" then
PL_path=song_path5
elseif PL_song_path="6" then
PL_path=song_path6
else
PL_path="http://s2.7t7t.com:81"
end if

%>
mkList("<%=PL_path%><%=rs("Wma")%>","<%=rs("MusicName")%>","","","<%=rs("Singer")%>","<%=rs("Specialid")%>","<%=rs("Id")%>");
<% 
rs.close
set rs=nothing
next
%></SCRIPT>

<%
Function GetUrl() '获取当前URL
Dim strHostName,strScriptName,strSubUrl,strRequestItem 
strHostName=CStr(Request.ServerVariables("LOCAL_ADDR"))
strScriptName=CStr(Request.ServerVariables("SCRIPT_NAME"))
strSubUrl=""
If Request.QueryString<>"" Then
   strScriptName=strScriptName&"?"
   For Each strRequestItem In Request.QueryString
    If InStr(strScriptName,strRequestItem)=0 Then
     If strSubUrl="" Then
      strSubUrl=strSubUrl&strRequestItem&"="&Server.URLEncode(Request.QueryString(""&strRequestItem&""))
     Else
      strSubUrl=strSubUrl&"&"&strRequestItem&"="&Server.URLEncode(Request.QueryString(""&strRequestItem&""))
     End If
    End If
   Next
End If
'GetUrl="http://"&strHostName&strScriptName&strSubUrl '当前全部网址
GetUrl="play_img/playsonglists.asp?"&strSubUrl
End Function
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>歌曲播放 - <%=WebName%></TITLE><LINK 
href="play_img/music07css.css" type=text/css rel=stylesheet>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content=品络音乐系统 name=Author>
<META content=music.jnnc.com name=Keywords>
<META content=asf,asx,wma,wmx,wmv,wvx,mp3,wav,mid name=Description><LINK 
href="play_img/jnnc.css" type=text/css rel=stylesheet>
<script language="JavaScript">
//自动调整窗口到屏幕中间 body要加onload=winsize(); onresize=winsize();
var x=640;
var y=480;
var xx=(window.screen.width-x)/2;
var yy=(window.screen.height-y)/2;
function winsize(){
window.resizeTo(x,y);
window.moveTo(xx,yy);
setTimeout("winsize()",50)}</script>

<SCRIPT language=JavaScript src="play_img/jnnc.js"></SCRIPT>

<SCRIPT language=JavaScript src="play_img/set.js"></SCRIPT>

<SCRIPT language=JScript event=openStateChange(sf) 
for=JNNC>evtOSChg(sf);</SCRIPT>

<SCRIPT language=JScript event=playStateChange(ns) 
for=JNNC>evtPSChg(ns);</SCRIPT>

<SCRIPT language=JScript event=error() for=JNNC>evtWmpError();</SCRIPT>

<SCRIPT language=JScript event=Buffering(bf) for=JNNC>evtWmpBuff(bf);</SCRIPT>

<SCRIPT language=JavaScript src="play_img/imgchg.js"></SCRIPT>

<SCRIPT type=text/javascript>

function changen(a)
{
document.getElementById("listbox").style.backgroundImage="none"
document.getElementById("wordbox").style.backgroundImage="none"
a.style.backgroundImage="url(images/playqie1_16.gif)"
if(a.id=="listbox")
{ 
  document.getElementById("listbox").className="wirth12b"
  document.getElementById("wordbox").className="eng12b"
  document.getElementById("play_list").style.display=""
  document.getElementById("word").style.display="none"
}
else
{
   document.getElementById("play_list").style.display="none"
   document.getElementById("word").style.display=""
     document.getElementById("listbox").className="eng12b"
  document.getElementById("wordbox").className="wirth12b"
}
}
</SCRIPT>


<STYLE type=text/css>BODY {
	BACKGROUND-COLOR: #333300
}
</STYLE>

<STYLE>TD {
	FONT-SIZE: 9pt; LINE-HEIGHT: 17px
}
BODY {
	FONT-SIZE: 9pt; MARGIN: 0px 5px 5px; LINE-HEIGHT: 17px
}
#lrcollbox TD {
	FONT-SIZE: 12px; FONT-FAMILY: "宋体"
}
#lrcollbox FONT {
	FONT-SIZE: 12px; FONT-FAMILY: "宋体"
}
#lrcoll TD {
	CURSOR: default; COLOR: #ffffff
}
#lrcbox {
	COLOR: #00ff00
}
#lrcfilter {
	FILTER: alpha(opacity=100)
}
#lrcbc {
	COLOR: #ffff33
}
#CourseButtonBox {
	Z-INDEX: 7; LEFT: 19px; WIDTH: 248px; TOP: 127px; HEIGHT: 11px
}
#ButtonBox {
	Z-INDEX: 8; LEFT: 277px; WIDTH: 76px; POSITION: absolute; TOP: 128px; HEIGHT: 11px
}
TD {
	FONT-SIZE: 9pt; LINE-HEIGHT: 17px
}
BODY {
	MARGIN-TOP: 0px; FONT-SIZE: 9pt; LINE-HEIGHT: 17px; BACKGROUND-COLOR: #ffffff
}
#lrcollbox TD {
	FONT-SIZE: 14px; FONT-FAMILY: 宋体
}
#lrcollbox FONT {
	FONT-SIZE: 14px; FONT-FAMILY: 宋体
}
#lrcoll TD {
	CURSOR: default; COLOR: #577113
}
#lrcbox {
	FONT-SIZE: 16px; COLOR: #ccff00
}
#lrcfilter {
	FILTER: alpha(opacity=50)
}
#lrcbc {
	FONT-SIZE: 16px; COLOR: #ffff66
}
#word {
	OVERFLOW: hidden; WIDTH: 358px; HEIGHT: 160px
}
#play_list {
	Z-INDEX: 9; OVERFLOW: hidden; WIDTH: 358px; HEIGHT: 160px
}
.STYLE1 {
	COLOR: #333300
}
</STYLE>

<META content="MSHTML 6.00.6000.16587" name=GENERATOR></HEAD>
<BODY oncontextmenu=window.event.returnValue=false onselectstart=event.returnValue=false ondragstart=window.event.returnValue=false scroll=yes onload=winsize();initJNNC();>
<DIV style="HEIGHT: 3px"></DIV>
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=599 border=0>
  <TBODY>
  <TR>
    <TD vAlign=top width=379>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width=378 border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=left>
            <table class="tableBorder" cellSpacing=1 cellPadding=0 width=378 bgColor=#66aa02 
            border=0>
              <TBODY>
              <TR>
                <TD vAlign=top width=376 bgColor=#000000>
                  <table class="tableBorder" cellSpacing=0 cellPadding=0 width=376 border=0>
                    <TBODY>
                    <TR>
                      <TD background=play_img/playqie_06.gif height=28>
                        <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" 
border=0>
                          <TBODY>
                          <TR>
                            <TD align=middle width="32%"><SPAN 
                              class=gnavt14line>在线试听</SPAN></TD>
                            <TD class=black12 align=left 
                              width="68%">仙乐飘飘，让您一饱耳福……</TD></TR></TBODY></TABLE></TD></TR>
                    <TR>
                      <TD>
                        <table class="tableBorder" cellSpacing=0 cellPadding=0 width=376 border=0>
                          <TBODY>
                          <TR>
                            <TD vAlign=top align=left width=6><IMG height=131 
                              src="play_img/playqie_08.gif" width=6></TD>
                            <TD vAlign=top width=364 
                            background=play_img/playqie_10.gif height=119>
                              <OBJECT id=JNNC 
                              codeBase=http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,4,5,715 
                              type=application/x-oleobject height=0 
                              standby="Loading Microsoft Windows Media Player components..." 
                              align=baseline border=0 
                              classid=CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6><PARAM NAME="autoStart" VALUE="0"><PARAM NAME="balance" VALUE="0"><PARAM NAME="currentPosition" VALUE="0"><PARAM NAME="currentMarker" VALUE="0"><PARAM NAME="enableContextMenu" VALUE="false"><PARAM NAME="enableErrorDialogs" VALUE="false"><PARAM NAME="enabled" VALUE="true"><PARAM NAME="fullScreen" VALUE="false"><PARAM NAME="invokeURLs" VALUE="false"><PARAM NAME="mute" VALUE="false"><PARAM NAME="playCount" VALUE="1"><PARAM NAME="rate" VALUE="1"><PARAM NAME="uiMode" VALUE="invisible"><PARAM NAME="volume" VALUE="100"></OBJECT>
                              <DIV id=capText 
                              style="DISPLAY: none; PADDING-LEFT: 5px; WIDTH: 100%; COLOR: white; PADDING-TOP: 3px; HEIGHT: 0pt; BACKGROUND-COLOR: rgb(0,0,0)">
                              <P class=title>&nbsp;&nbsp;听吧为您奉献&nbsp;&#8482;</P></DIV>
                              <table class="tableBorder" height=119 cellSpacing=0 cellPadding=0 
                              width=364 border=0>
                                <TBODY>
                                <TR>
                                <TD>
                                <table class="tableBorder" id=Table_01 height=120 cellSpacing=0 
                                cellPadding=0 width=365 border=0>
                                <TBODY>
                                <TR>
                                <TD colSpan=17><IMG height=11 alt="" 
                                src="play_img/player.gif" width=364></TD>
                                <TD><IMG height=11 alt="" 
                                src="play_img/Spacer.gif" width=1></TD></TR>
                                <TR>
                                <TD rowSpan=11><IMG height=108 alt="" 
                                src="play_img/player-03.gif" width=14></TD>
                                <TD onclick=chgTimeFmt() noWrap align=middle 
                                background=play_img/player-04.gif colSpan=9 
                                height=19><SPAN class=time id=disp2 
                                title="时间长度显示方式 (正常/倒数)" 
                                style="PADDING-BOTTOM: 2px; WIDTH: 105px; CURSOR: default"><STRONG><FONT 
                                color=#333300>00:00 | 
                                00:00</FONT></STRONG></SPAN></TD>
                                <TD vAlign=top align=right 
                                background=play_img/player-05.gif colSpan=5 
                                height=37 rowSpan=2><IMG id=scope height=33 
                                src="play_img/act.gif" width=86 
                                name=scope></TD>
                                <TD colSpan=2 rowSpan=9><IMG height=88 alt="" 
                                src="play_img/player-06.gif" width=38></TD>
                                <TD><IMG height=19 alt="" 
                                src="play_img/Spacer.gif" width=1></TD></TR>
                                <TR>
                                <TD background=play_img/player-07.gif 
                                colSpan=9 height=17>
                                <MARQUEE scrollAmount=2 scrollDelay=70>
                                <SPAN 
                                id=disp1 
                                style="FONT-SIZE: 12px">品络音乐真情为你服务</SPAN>
                                </MARQUEE></TD>
                                <TD><IMG height=18 alt="" 
                                src="play_img/Spacer.gif" width=1></TD></TR>
                                <TR>
                                <TD colSpan=14><IMG height=9 alt="" 
                                src="play_img/player-08.gif" width=312></TD>
                                <TD><IMG height=9 alt="" 
                                src="play_img/Spacer.gif" width=1></TD></TR>
                                <TR>
                                <TD colSpan=2><IMG height=2 alt="" 
                                src="play_img/player-09.gif" width=45></TD>
                                <TD rowSpan=5><IMG 
                                onmouseover="imgtog('playt',2)" title=播放 
                                style="CURSOR: default" onclick=startJNNC() 
                                onmouseout="imgtog('playt',3)" height=40 
                                src="play_img/player-10.gif" width=40 border=0 
                                name=playt></TD>
                                <TD colSpan=11 rowSpan=2><IMG height=3 alt="" 
                                src="play_img/player-11.gif" width=227></TD>
                                <TD><IMG height=2 alt="" 
                                src="play_img/Spacer.gif" width=1></TD></TR>
                                <TR>
                                <TD rowSpan=2><IMG 
                                onmouseover="imgtog('stopt',2)" title=停止 
                                style="CURSOR: default" onclick=wmpStop() 
                                onmouseout="imgtog('stopt',3)" height=36 
                                src="play_img/player-12.gif" width=36 border=0 
                                name=stopt></TD>
                                <TD rowSpan=5><IMG height=40 alt="" 
                                src="play_img/player-13.gif" width=9></TD>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=1></TD></TR>
                                <TR>
                                <TD rowSpan=4><IMG height=39 alt="" 
                                src="play_img/player-14.gif" width=10></TD>
                                <TD rowSpan=2><IMG 
                                onmouseover="imgtog('pauzt',2)" title=暂停．继续 
                                style="CURSOR: default" onclick=wmpPP() 
                                onmouseout="imgtog('pauzt',3)" height=36 
                                src="play_img/player-15.gif" width=36 border=0 
                                name=pauzt></TD>
                                <TD rowSpan=4><IMG height=39 alt="" 
                                src="play_img/player-16.gif" width=12></TD>
                                <TD rowSpan=2><IMG 
                                onmouseover="imgtog('prevt',2)" title=上一首曲目 
                                style="CURSOR: default" onclick=playPrev() 
                                onmouseout="imgtog('prevt',3)" height=36 
                                src="play_img/player-17.gif" width=36 border=0 
                                name=prevt></TD>
                                <TD rowSpan=4><IMG height=39 alt="" 
                                src="play_img/player-18.gif" width=11></TD>
                                <TD colSpan=2 rowSpan=2><IMG 
                                onmouseover="imgtog('nextt',2)" title=下一首曲目 
                                style="CURSOR: default" onclick=playNext() 
                                onmouseout="imgtog('nextt',3)" height=36 
                                src="play_img/player-19.gif" width=36 border=0 
                                name=nextt></TD>
                                <TD colSpan=3 rowSpan=4><IMG height=39 alt="" 
                                src="play_img/player-20.gif" width=50></TD>
                                <TD rowSpan=2><IMG 
                                onmouseover="imgtog('vmute',2)" title=静音模式 
                                style="CURSOR: default" onclick=wmpMute() 
                                onmouseout="imgtog('vmute',3)" height=36 
                                src="play_img/player-21.gif" width=36 
                                align=absMiddle border=0 name=vmute></TD>
                                <TD><IMG height=35 alt="" 
                                src="play_img/Spacer.gif" width=1></TD></TR>
                                <TR>
                                <TD rowSpan=3><IMG height=4 alt="" 
                                src="play_img/player-22.gif" width=36></TD>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=1></TD></TR>
                                <TR>
                                <TD rowSpan=2><IMG height=3 alt="" 
                                src="play_img/player-23.gif" width=36></TD>
                                <TD rowSpan=2><IMG height=3 alt="" 
                                src="play_img/player-24.gif" width=36></TD>
                                <TD colSpan=2 rowSpan=2><IMG height=3 alt="" 
                                src="play_img/player-25.gif" width=36></TD>
                                <TD rowSpan=2><IMG height=3 alt="" 
                                src="play_img/player-26.gif" width=36></TD>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=1></TD></TR>
                                <TR>
                                <TD><IMG height=2 alt="" 
                                src="play_img/player-27.gif" width=40></TD>
                                <TD><IMG height=2 alt="" 
                                src="play_img/Spacer.gif" width=1></TD></TR>
                                <TR>
                                <TD background=play_img/player-28.gif 
                                colSpan=11 height=11>
                                <DIV id=CourseButtonBox 
                                style="WIDTH: 247px; HEIGHT: 11px"><IMG 
                                onmouseup=button_up() onmousemove=button_move() 
                                onmousedown=button_down() id=CourseButton 
                                style="LEFT: 0pt; WIDTH: 19px; POSITION: relative; HEIGHT: 11px" 
                                height=11 src="play_img/bar.gif" 
                                width=19></DIV></TD>
                                <TD rowSpan=2><IMG height=20 alt="" 
                                src="play_img/player-29.gif" width=18></TD>
                                <TD background=play_img/player-30.gif 
                                colSpan=3 height=11>
                                <DIV id=VolumeButtonBox 
                                style="WIDTH: 72px; HEIGHT: 11px"><IMG 
                                onmouseup=button_up() onmousemove=button_move() 
                                onmousedown=button_down() id=VolumeButton 
                                title=控制音量 
                                style="LEFT: 54px; WIDTH: 19px; POSITION: relative; HEIGHT: 11px" 
                                height=11 src="play_img/bar.gif" width=19 
                                name=VolumeButton></DIV></TD>
                                <TD rowSpan=2><IMG height=20 alt="" 
                                src="play_img/player-31.gif" width=13></TD>
                                <TD><IMG height=11 alt="" 
                                src="play_img/Spacer.gif" width=1></TD></TR>
                                <TR>
                                <TD colSpan=11><IMG height=9 alt="" 
                                src="play_img/player-32.gif" width=247></TD>
                                <TD colSpan=3><IMG height=9 alt="" 
                                src="play_img/player-33.gif" width=72></TD>
                                <TD><IMG height=9 alt="" 
                                src="play_img/Spacer.gif" width=1></TD></TR>
                                <TR>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=14></TD>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=36></TD>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=9></TD>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=40></TD>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=10></TD>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=36></TD>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=12></TD>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=36></TD>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=11></TD>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=7></TD>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=29></TD>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=21></TD>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=18></TD>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=11></TD>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=36></TD>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=25></TD>
                                <TD><IMG height=1 alt="" 
                                src="play_img/Spacer.gif" width=13></TD>
                                <TD></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                              <DIV id=capText 
                              style="DISPLAY: none; PADDING-LEFT: 5px; WIDTH: 100%; COLOR: white; PADDING-TOP: 3px; HEIGHT: 0pt; BACKGROUND-COLOR: rgb(0,0,0)">
                              <P 
                            class=title>&nbsp;&nbsp;听吧为您奉献&nbsp;&#8482;</P></DIV></TD>
                            <TD vAlign=top align=right width=6><IMG height=131 
                              src="play_img/playqie_10.gif" 
                          width=6></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD height=10></TD></TR>
        <TR>
          <TD>
            <DIV id=song>
            <table class="tableBorder" cellSpacing=1 cellPadding=0 width=378 bgColor=#66aa02 
            border=0>
              <TBODY>
              <TR>
                <TD vAlign=top width=376 bgColor=#000000>
                  <table class="tableBorder" cellSpacing=0 cellPadding=0 width=376 border=0>
                    <TBODY>
                    <TR>
                      <TD vAlign=bottom align=middle 
                      background=play_img/playqie_06.gif height=28>
                        <table class="tableBorder" cellSpacing=0 cellPadding=0 width=230 border=0>
                          <TBODY>
                          <TR>
                            <TD class="wirth12b STYLE1" id=listbox 
                            style="CURSOR: hand" onclick=changen(this) 
                            align=middle width=101 
                            background=play_img/playqie1_16.gif>我的音乐盒</TD>
                            <TD class=eng12b align=middle>&nbsp;</TD>
                            <TD class=eng12b id=wordbox style="CURSOR: hand" 
                            onclick=changen(this);setcenter() align=middle 
                            width=101>歌词对照</TD></TR></TBODY></TABLE></TD></TR>
                    <TR>
                      <TD>
                        <table class="tableBorder" cellSpacing=0 cellPadding=0 width=376 border=0>
                          <TBODY>
                          <TR>
                            <TD vAlign=top align=left width=6 
                              bgColor=#f0f9ce><IMG height=131 
                              src="play_img/playqie_08.gif" width=6></TD>
                            <TD vAlign=top bgColor=#f0f9ce>
                              <table class="tableBorder" cellSpacing=3 cellPadding=0 width="100%" 
                              bgColor=#66aa02 border=0>
                                <TBODY>
                                <TR>
                                <TD vAlign=top height=160><!--原来160-->
                                <DIV id=play_list>
                                <DIV align=center><IFRAME 
                                src="play_img/jnncpl.htm" frameBorder=0 
                                width="100%" scrolling=no 
                                height=332></IFRAME></DIV></DIV>
                                <CENTER>
                                <DIV id=word style="DISPLAY: none">
                                <DIV id=lrcollbox 
                                style="OVERFLOW: hidden; WIDTH: 358px; HEIGHT: 389px; BACKGROUND-COLOR: #264d00">
                                <table class="tableBorder" oncontextmenu="return false;" id=lrcoll 
                                style="POSITION: relative; TOP: -20px" 
                                cellSpacing=0 cellPadding=0 width="100%" 
                                border=0>
                                <TBODY>
                                <TR>
                                <TD id=lrcwt1 noWrap align=middle 
                                height=20></TD></TR>
                                <TR>
                                <TD id=lrcwt2 noWrap align=middle 
                                height=20></TD></TR>
                                <TR>
                                <TD id=lrcwt3 noWrap align=middle 
                                height=20></TD></TR>
                                <TR>
                                <TD id=lrcwt4 noWrap align=middle 
                                height=20></TD></TR>
                                <TR>
                                <TD id=lrcwt5 noWrap align=middle 
                                height=20></TD></TR>
                                <TR>
                                <TD id=lrcwt6 noWrap align=middle 
                                height=20></TD></TR>
                                <TR>
                                <TD id=lrcwt7 noWrap align=middle 
                                height=20></TD></TR>
                                <TR>
                                <TD id=lrcwt8 noWrap align=middle 
                                height=20></TD></TR>
                                <TR>
                                <TD id=lrcwt9 noWrap align=middle 
                                height=20></TD></TR>
                                <TR>
                                <TD noWrap align=middle height=20>
                                <table class="tableBorder" cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD noWrap height=20><SPAN id=lrcwt10 
                                style="HEIGHT: 20px"></SPAN></TD></TR>
                                <TR 
                                style="Z-INDEX: 6; POSITION: relative; TOP: -20px">
                                <TD noWrap height=20>
                                <DIV id=lrcfilter 
                                style="OVERFLOW: hidden; WIDTH: 100%; COLOR: rgb(255,255,51); HEIGHT: 20px"></DIV></TD></TR></TBODY></TABLE></TD></TR>
                                <TR style="POSITION: relative; TOP: -20px">
                                <TD noWrap align=middle height=20>
                                <table class="tableBorder" cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD noWrap height=20><SPAN id=lrcbox 
                                style="HEIGHT: 20px">歌词加载中</SPAN></TD></TR>
                                <TR 
                                style="Z-INDEX: 6; POSITION: relative; TOP: -20px">
                                <TD noWrap height=20>
                                <DIV id=lrcbc 
                                style="OVERFLOW: hidden; WIDTH: 0pt; HEIGHT: 20px"></DIV></TD></TR></TBODY></TABLE></TD></TR>
                                <TR style="POSITION: relative; TOP: -40px">
                                <TD id=lrcwt11 noWrap align=middle 
                                height=20></TD></TR>
                                <TR style="POSITION: relative; TOP: -40px">
                                <TD id=lrcwt12 noWrap align=middle 
                                height=20></TD></TR>
                                <TR style="POSITION: relative; TOP: -40px">
                                <TD id=lrcwt13 noWrap align=middle 
                                height=20></TD></TR>
                                <TR style="POSITION: relative; TOP: -40px">
                                <TD id=lrcwt14 noWrap align=middle 
                                height=20></TD></TR>
                                <TR style="POSITION: relative; TOP: -40px">
                                <TD id=lrcwt15 noWrap align=middle 
                                height=20></TD></TR>
                                <TR style="POSITION: relative; TOP: -40px">
                                <TD id=lrcwt16 noWrap align=middle 
                                height=20></TD></TR>
                                <TR style="POSITION: relative; TOP: -40px">
                                <TD id=lrcwt17 noWrap align=middle 
                                height=20></TD></TR>
                                <TR style="POSITION: relative; TOP: -40px">
                                <TD id=lrcwt18 noWrap align=middle 
                                height=20></TD></TR>
                                <TR style="POSITION: relative; TOP: -40px">
                                <TD id=lrcwt19 noWrap align=middle 
                                height=20></TD></TR></TBODY></TABLE></DIV></DIV></CENTER></TD></TR></TBODY></TABLE></TD>
                            <TD vAlign=top align=right width=6 bgColor=#f0f9ce 
                            height=173><IMG height=131 
                              src="play_img/playqie_10.gif" 
                          width=6></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>
      <SCRIPT language=JavaScript>
//self.moveTo(0,0);
//self.resizeTo(screen.availWidth,screen.availHeight);
self.resizeTo(630,495);
</SCRIPT>
      <SPAN id=lrcdata><!--
[00:00.00]抱歉，歌词同步功能正在调整中
[03:50.90]品络音乐系统 仙乐飘飘，让您一饱耳福……
--></SPAN>
      <SCRIPT language=JavaScript>

moveflag = false;
movable = false;

var lrcO;  
var ffbb = 0;  

function lrcClass(tt)  
{  
  this.inr = [];  

  this.oTime = 0;  

  this.dts = -1;  
  this.dte = -1;  
  this.dlt = -1;  
  this.ddh;  
  this.fjh;  

  lrcbc.style.width = 0;  

  if(/\[offset\:(\-?\d+)\]/i.test(tt))  
    this.oTime = RegExp.$1/1000;  
   
  tt = tt.replace(/\[\:\][^$\n]*(\n|$)/g,"$1");  
  tt = tt.replace(/\[[^\[\]\:]*\]/g,"");  
  tt = tt.replace(/\[[^\[\]]*[^\[\]\d]+[^\[\]]*\:[^\[\]]*\]/g,"");  
  tt = tt.replace(/\[[^\[\]]*\:[^\[\]]*[^\[\]\d\.]+[^\[\]]*\]/g,"");  
  tt = tt.replace(/<[^<>]*[^<>\d]+[^<>]*\:[^<>]*>/g,"");  
  tt = tt.replace(/<[^<>]*\:[^<>]*[^<>\d\.]+[^<>]*>/g,"");  

  while(/\[[^\[\]]+\:[^\[\]]+\]/.test(tt))  
  {  
    tt = tt.replace(/((\[[^\[\]]+\:[^\[\]]+\])+[^\[\r\n]*)[^\[]*/,"\n");  
    var zzzt = RegExp.$1;  
    /^(.+\])([^\]]*)$/.exec(zzzt);  
    var ltxt = RegExp.$2;  
    var eft = RegExp.$1.slice(1,-1).split("][");  
    for(var ii=0; ii<eft.length; ii++)  
    {  
      var sf = eft[ii].split(":");  
      var tse = parseInt(sf[0],10) * 60 + parseFloat(sf[1]);  
      var sso = { t:[] , w:[] , n:ltxt }  
      sso.t[0] = tse-this.oTime;  
      this.inr[this.inr.length] = sso;  
    }  
  }  
  this.inr = this.inr.sort( function(a,b){return a.t[0]-b.t[0];} );  

  for(var ii=0; ii<this.inr.length; ii++)  
  {  
    while(/<[^<>]+\:[^<>]+>/.test(this.inr[ii].n))  
    {  
      this.inr[ii].n = this.inr[ii].n.replace(/<(\d+)\:([\d\.]+)>/,"%=%");  
      var tse = parseInt(RegExp.$1,10) * 60 + parseFloat(RegExp.$2);  
      this.inr[ii].t[this.inr[ii].t.length] = tse-this.oTime;  
    }  
    lrcbc.innerHTML = "<font>"+ this.inr[ii].n.replace(/&/g,"&").replace(/</g,"<").replace(/>/g,">").replace(/%=%/g,"</font><font>") +" </font>";  
    var fall = lrcbc.getElementsByTagName("font");  
    for(var wi=0; wi<fall.length; wi++)  
      this.inr[ii].w[this.inr[ii].w.length] = fall[wi].offsetWidth;  
    this.inr[ii].n = lrcbc.innerText;  
  }  

  this.run = function(tme)  
  {  
    if(tme<this.dts || tme>=this.dte)  
    {  
      var ii;  
      for(ii=this.inr.length-1; ii>=0 && this.inr[ii].t[0]>tme; ii--){}  
      if(ii<0) return;  
      this.ddh = this.inr[ii].t;  
      this.fjh = this.inr[ii].w;  
      this.dts = this.inr[ii].t[0];  
      this.dte = (ii<this.inr.length-1)?this.inr[ii+1].t[0]:JNNC.currentMedia.duration;  

      lrcwt1.innerText = this.retxt(ii-10);  
      lrcwt2.innerText = this.retxt(ii-9);  
      lrcwt3.innerText = this.retxt(ii-8);  
      lrcwt4.innerText = this.retxt(ii-7);  
      lrcwt5.innerText = this.retxt(ii-6);  
      lrcwt6.innerText = this.retxt(ii-5);  
      lrcwt7.innerText = this.retxt(ii-4);  
      lrcwt8.innerText = this.retxt(ii-3);  
      lrcwt9.innerText = this.retxt(ii-2);  
      lrcwt10.innerText = this.retxt(ii-1);  
      lrcfilter.innerText = this.retxt(ii-1);  
      lrcwt11.innerText = this.retxt(ii+1);  
      lrcwt12.innerText = this.retxt(ii+2);  
      lrcwt13.innerText = this.retxt(ii+3);  
      lrcwt14.innerText = this.retxt(ii+4);  
      lrcwt15.innerText = this.retxt(ii+5);  
      lrcwt16.innerText = this.retxt(ii+6);  
      lrcwt17.innerText = this.retxt(ii+7);  
      lrcwt18.innerText = this.retxt(ii+8);  
      lrcwt19.innerText = this.retxt(ii+9);  
      this.print(this.retxt(ii));  
      if(this.dlt==ii-1)  
      {  
        clearTimeout(lrcO);  
        golrcoll(0);  
        golrcolor(0);  
      }  
      this.dlt = ii;  
    }  
    var bbw = 0;  
    var ki;  
    for(ki=0; ki<this.ddh.length && this.ddh[ki]<=tme; ki++)  
      bbw += this.fjh[ki];  
    var kt = ki-1;  
    var sc = ((ki<this.ddh.length)?this.ddh[ki]:this.dte) - this.ddh[kt];  
    var tc = tme - this.ddh[kt];  
    bbw -= this.fjh[kt] - tc / sc * this.fjh[kt];  
    if(bbw>lrcbox.offsetWidth)  
      bbw = lrcbox.offsetWidth;  
    lrcbc.style.width = Math.round(bbw);  
  }  

  this.retxt = function(i)  
  {  
    return (i<0 || i>=this.inr.length)?"":this.inr[i].n;  
  }  

  this.print = function(txt)  
  {  
    lrcbox.innerText = txt;  
    lrcbc.innerText = txt;  
  }  

  this.print("music.jnnc.com");  
  lrcwt1.innerText = "";  
  lrcwt2.innerText = "";  
  lrcwt3.innerText = "";  
  lrcwt4.innerText = "";  
  lrcwt5.innerText = "";  
  lrcwt6.innerText = "";  
  lrcwt8.innerText = "";  
  lrcwt9.innerText = "";  
  lrcwt10.innerText = "";  
  lrcwt11.innerText = "";  
  lrcwt12.innerText = "";  
  lrcwt13.innerText = "";  
  lrcwt14.innerText = "";  
  lrcwt15.innerText = "";  
  lrcwt16.innerText = "";  
  lrcwt17.innerText = "";  
  lrcwt18.innerText = "";  
  lrcwt19.innerText = "";  
}  

function loadfile(url)  
{  
  JNNC.url = url;  
  JNNC.controls.play();  
  file.select();  
  document.selection.clear();  
  onfocus=file.blur();  
}  

function bb()  
{  
  ffbb = ffbb - 0.5;  
}  

function ff()  
{  
  ffbb = ffbb + 0.5;  
}  

function lrcrun()  
{  
  with(JNNC)  
  {  
    curobj.run(controls.currentPosition + ffbb);  
  }  
}  

function golrcoll(s)  
{  
  lrcoll.style.top = -2-(s++)*3;  
  if(s<=6)  
    lrcO = setTimeout("golrcoll("+s+")",100);  
}  

function golrcolor(t)  
{  
  lrcfilter.filters.alpha.opacity = 100-(t++)*10;  
  if(t<=10)  
    setTimeout("golrcolor("+t+")",60);  
}  

function killErrors()  
{  
  return true;  
}  
window.onerror = killErrors;  
function switchDisp(disptext)
{
curobj = new lrcClass(disptext);
abc = setInterval("lrcrun()",10);
}

function MakeMovable(element)
{
  element.attachEvent("onmousedown",onmousedown); 
  element.attachEvent("onmouseup",onmouseup);
  element.attachEvent("onmousemove",onmousemove);
  flagmove = false;
  var s_y, o_y;
  curpot = 0;

  function onmousedown()
  {
    if(event.button!=1 || moveflag || !movable) {flagmove = true; return;}
    clearTimeout(lrc0);
    if(curdlt>0) lowcolor(eval("lrcbc"+curdlt));
    lowcolor(eval("lrcbc"+(curdlt+1)));
    lowlight(eval("lrcbox"+(curdlt+1)));
    if(lrcoll.style.pixelTop>120) lrcoll.style.top = 120;
    if(lrcoll.style.pixelTop<-((lrcobj.inr.length-1)*20-120)) lrcoll.style.top = -((lrcobj.inr.length-1)*20-120);
    s_y = event.clientY;
    o_y = lrcoll.style.pixelTop;
    element.style.cursor = "n-resize";
    element.setCapture();
    moveflag = true;
  }

  function onmousemove()
  {
    if(event.button!=1 || !moveflag || flagmove) return;
    var offy = event.clientY-s_y;
    if(o_y+offy<=120 && o_y+offy>=-((lrcobj.inr.length-1)*20-120))
      lrcoll.style.top = o_y+offy;
    if(o_y+offy>120) lrcoll.style.top = 120;
    if(o_y+offy<-((lrcobj.inr.length-1)*20-120)) lrcoll.style.top = -((lrcobj.inr.length-1)*20-120);
    var pot = Math.floor((lrcoll.style.pixelTop-120)/-20);
    if(pot!=curpot)
    {
      lowlight(eval("lrcbox"+(curpot+1)));
      curpot = pot;
      highlight(eval("lrcbox"+(curpot+1)));
    }
  }

  function onmouseup()
  {
    if(!moveflag || flagmove) {flagmove = false; return;}
    if(JNNC.playState==3)
    {
      if(lrcoll.style.pixelTop<=120 && lrcoll.style.pixelTop>100)
        lrcobj.dte = -1;
      else
        lrcobj.dte = lrcobj.inr[Math.floor((lrcoll.style.pixelTop-120)/-20)-1].t[0];
      if(lrcobj.inr[Math.floor((lrcoll.style.pixelTop-120)/-20)].t[0]<0)
        JNNC.controls.currentPosition = 0;
      else
        JNNC.controls.currentPosition = lrcobj.inr[Math.floor((lrcoll.style.pixelTop-120)/-20)].t[0];
      lrcobj.dlt = Math.floor((lrcoll.style.pixelTop-120)/-20);
      lrctop = lrcoll.style.pixelTop;
    }
    else
    {
      lowlight(eval("lrcbox"+(curpot+1)));
      highlight(eval("lrcbox"+(curdlt+1)));
      lrcoll.style.top = o_y;
    }
    lrc0 = setTimeout("lrcrun()",10);
    element.releaseCapture();
    element.style.cursor = "hand";
    moveflag = false;
  }
}
var _curMMSmi="";
</SCRIPT>

      <SCRIPT language=JScript event=currentItemChange() for=JNNC>
var xmlhttp;
if (window.XMLHttpRequest) { 
  xmlhttp = new XMLHttpRequest();
}else { 
	if (window.ActiveXObject) {
		try {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (ee) {
			xmlhttp = new ActiveXObject("MSXML.XMLHTTP");
		}
	}
}
function fnDo(){
 //alert("运行");alert(objMmInfo[cActIdx].mmSmi)
  
  if (_curMMSmi == "" || (_curMMSmi != "" && objMmInfo[cActIdx].mmSmi != _curMMSmi)) {
    xmlhttp.Open("GET", "LrcGet.asp?url="+objMmInfo[cActIdx].mmSmi, true);  
	//alert("发送")
    xmlhttp.onreadystatechange = fnRun;  
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 
    xmlhttp.Send(null);
  }
  _curMMSmi = objMmInfo[cActIdx].mmSmi;
}
function fnRun(){
  var xmlDom = new ActiveXObject("Microsoft.XmlDom");
  //alert(xmlhttp.readyState )
  if ((xmlhttp.readyState == 4) && (xmlhttp.status == 200)){
 //alert(xmlhttp.status)
	var myroot = bytes2BSTR(xmlhttp.responseBody);
    if (myroot != null){
      switchDisp(myroot);
    }else{
      switchDisp("[00:00.00]抱歉，暂无歌词！[05:00.00]music.jnnc.com");
    }
  }
}
fnDo();
</SCRIPT>

      <SCRIPT language=VBScript>
Function bytes2BSTR(arrBytes) 
strReturn = "" 
arrBytes = CStr(arrBytes) 
For i = 1 To LenB(arrBytes) 
ThisCharCode = AscB(MidB(arrBytes, i, 1)) 
If ThisCharCode < &H80 Then 
strReturn = strReturn & Chr(ThisCharCode) 
Else 
NextCharCode = AscB(MidB(arrBytes, i+1, 1)) 
strReturn = strReturn & Chr(CLng(ThisCharCode) * &H100 + CInt(NextCharCode)) 
i = i + 1 
End If 
Next 
bytes2BSTR = strReturn 
End Function
</SCRIPT>
    </TD>
    <TD vAlign=top width=13>&nbsp;</TD>
    <TD vAlign=top align=right width=0>
      <table class="tableBorder" style="DISPLAY: none" cellSpacing=1 cellPadding=0 width=212 
      bgColor=#66aa02 border=0>
        <TBODY>
        <TR>
          <TD background=play_img/playqie_03.gif bgColor=#000000 height=29>
            <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width="25%">&nbsp;</TD>
                <TD class=gnavt14line align=left 
            width="75%">新歌排行</TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD vAlign=top align=middle bgColor=#000000>
            <table class="tableBorder" cellSpacing=0 cellPadding=0 width=210 border=0>
              <TBODY>
              <TR>
                <TD vAlign=top align=middle>
                  <table class="tableBorder" cellSpacing=1 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <TR>
                      <TD class=black12 align=middle bgColor=#e8efd6 colSpan=2 
                      height=22>排行</TD>
                      <TD class=black12 align=middle bgColor=#e8efd6 colSpan=2 
                      height=22>歌曲-歌手</TD></TR>
                    <TR>
                      <TD align=middle width="11%" height=22><LABEL><INPUT 
                        id=checkbox type=checkbox name=checkbox> </LABEL></TD>
                      <TD align=middle width="11%" height=22><IMG height=16 
                        alt="" src="play_img/music07zjqie_45.gif" width=17></TD>
                      <TD class=g12t align=left width="54%" height=22><A 
                        class=g12t 
                        href="http://music.jnnc.com/song.asp?id=29626&amp;id=29627&amp;id=29628&amp;id=29629&amp;id=29630&amp;id=29631&amp;id=29632&amp;id=29633&amp;id=29634&amp;id=29635&amp;id=29636&amp;id=29637&amp;id=29638&amp;id=29639&amp;x=37&amp;y=11#">有没有人告诉你</A></TD>
                      <TD class=gray12t align=left width="24%"><A 
                        class=gray12t 
                        href="http://music.jnnc.com/song.asp?id=29626&amp;id=29627&amp;id=29628&amp;id=29629&amp;id=29630&amp;id=29631&amp;id=29632&amp;id=29633&amp;id=29634&amp;id=29635&amp;id=29636&amp;id=29637&amp;id=29638&amp;id=29639&amp;x=37&amp;y=11#">陈楚生</A></TD></TR>
                    <TR>
                      <TD align=middle height=22><INPUT id=checkbox2 
                        type=checkbox name=checkbox2></TD>
                      <TD align=middle height=22><IMG height=16 alt="" 
                        src="play_img/music07zjqie_48.gif" width=17></TD>
                      <TD class=g12t align=left height=22>&nbsp;</TD>
                      <TD class=gray12t align=left height=22>&nbsp;</TD></TR>
                    <TR>
                      <TD align=middle height=22><INPUT id=checkbox3 
                        type=checkbox name=checkbox3></TD>
                      <TD align=middle height=22><IMG height=16 alt="" 
                        src="play_img/music07zjqie_50.gif" width=17></TD>
                      <TD class=g12t align=left height=22>&nbsp;</TD>
                      <TD class=gray12t align=left height=22>&nbsp;</TD></TR>
                    <TR>
                      <TD align=middle height=22><INPUT id=checkbox4 
                        type=checkbox name=checkbox4></TD>
                      <TD align=middle height=22><IMG height=16 alt="" 
                        src="play_img/music07zjqie_52.gif" width=17></TD>
                      <TD class=g12t align=left height=22>&nbsp;</TD>
                      <TD class=gray12t align=left height=22>&nbsp;</TD></TR>
                    <TR>
                      <TD align=middle height=22><INPUT id=checkbox5 
                        type=checkbox name=checkbox5></TD>
                      <TD align=middle height=22><IMG height=16 alt="" 
                        src="play_img/music07zjqie_54.gif" width=17></TD>
                      <TD class=g12t align=left height=22>&nbsp;</TD>
                      <TD class=gray12t align=left height=22>&nbsp;</TD></TR>
                    <TR>
                      <TD align=middle height=22><INPUT id=checkbox6 
                        type=checkbox name=checkbox6></TD>
                      <TD align=middle height=22><IMG height=16 alt="" 
                        src="play_img/music07zjqie_56.gif" width=17></TD>
                      <TD class=g12t align=left height=22>&nbsp;</TD>
                      <TD class=gray12t align=left height=22>&nbsp;</TD></TR>
                    <TR>
                      <TD align=middle height=22><INPUT id=checkbox7 
                        type=checkbox name=checkbox7></TD>
                      <TD align=middle height=22><IMG height=16 alt="" 
                        src="play_img/music07zjqie_58.gif" width=17></TD>
                      <TD class=g12t align=left height=22>&nbsp;</TD>
                      <TD class=gray12t align=left height=22>&nbsp;</TD></TR>
                    <TR>
                      <TD align=middle height=22><INPUT id=checkbox8 
                        type=checkbox name=checkbox8></TD>
                      <TD align=middle height=22><IMG height=16 alt="" 
                        src="play_img/music07zjqie_60.gif" width=17></TD>
                      <TD class=g12t align=left height=22>&nbsp;</TD>
                      <TD class=gray12t align=left height=22>&nbsp;</TD></TR>
                    <TR>
                      <TD align=middle height=22><INPUT id=checkbox9 
                        type=checkbox name=checkbox9></TD>
                      <TD align=middle height=22><IMG height=16 alt="" 
                        src="play_img/music07zjqie_62.gif" width=17></TD>
                      <TD class=g12t align=left height=22>&nbsp;</TD>
                      <TD class=gray12t align=left height=22>&nbsp;</TD></TR>
                    <TR>
                      <TD align=middle height=22><INPUT id=checkbox10 
                        type=checkbox name=checkbox10></TD>
                      <TD align=middle height=22><IMG height=16 alt="" 
                        src="play_img/music07zjqie_64.gif" width=17></TD>
                      <TD class=g12t align=left height=22>&nbsp;</TD>
                      <TD class=gray12t align=left 
                    height=22>&nbsp;</TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD align=middle bgColor=#e8efd6 colSpan=5 height=28><IMG 
                  height=20 src="play_img/music07zjqie_95.gif" 
                  width=42>&nbsp;&nbsp;<IMG height=20 
                  src="play_img/music07zjqie_97.gif" width=42>&nbsp;&nbsp;<IMG 
                  height=20 src="play_img/music07zjqie_99.gif" 
              width=42></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD background=play_img/playqie_03.gif bgColor=#000000 height=29>
            <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width="25%">&nbsp;</TD>
                <TD class=gnavt14line align=left 
            width="75%">热歌排行</TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD background=play_img/playqie_03.gif bgColor=#000000 height=29>
            <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width="25%">&nbsp;</TD>
                <TD class=gnavt14line align=left 
            width="75%">歌手排行</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><IFRAME 
      src="playlist.html" frameBorder=0 width=212 scrolling=no 
      height=374></IFRAME></TD></TR>
  <TR>
    <TD vAlign=top align=left colSpan=3>
      

      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <SCRIPT language=JavaScript src="play_img/Js.js" 
        type=text/javascript></SCRIPT>

        <TBODY>
        <TR>
          <TD style="BORDER-TOP: #b0dd7c 1px solid" vAlign=top align=left 
          width=55><IMG height=47 src="play_img/playqie_15.gif" width=55></TD>
          <TD style="BORDER-TOP: #b0dd7c 1px solid" vAlign=top align=left 
          background=play_img/playqie_18.gif>
            <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD vAlign=top align=left>
                  <FORM id="form1" name="form1" onSubmit="return CheckForm();" 
                  action="PL_search.asp" method="get" target=_blank>
                  <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <TR>
                      <TD width="8%"><INPUT id=radio type=radio CHECKED 
                        value=0 name=t> 
                      <SPAN class=g12t>歌曲 </SPAN></TD>
                      <TD width="8%" height=21><INPUT id=radio2 type=radio 
                        value=1 name=t> 
                      <SPAN class=g12t>歌手 </LABEL></SPAN></TD>
                      <TD width="8%"><INPUT id=radio2 type=radio value=2 
                        name=t> 
                      <SPAN class=g12t>专辑</SPAN></TD>
                      <TD width="8%"><INPUT id=radio2 type=radio value=3 
                        name=t> 
                      <SPAN class=g12t>歌词</SPAN> </TD>
                      <TD align=middle width="19%" height=21><INPUT 
                        class=finput id=kw name=kw></TD>
                      <TD align=middle width="8%" height=21><A 
                        href="javascript:submit();"><INPUT type=image height=21 
                        width=42 src="play_img/btu_33.gif" name=image> </A></TD>
                      <TD class=gray12t width="20%" 
                    height=21><!--热门:--></TD></TR></TBODY></TABLE></FORM></TD></TR>
              <TR>
                <TD class=sg12b vAlign=bottom align=middle>按歌手字母查询：<SPAN 
                  style="FONT-SIZE: 6px"><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=0-9" 
                  target=_blank>0-9</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=A" 
                  target=_blank>A</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=B" 
                  target=_blank>B</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=C" 
                  target=_blank>C</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=D" 
                  target=_blank>D</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=E" 
                  target=_blank>E</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=F" 
                  target=_blank>F</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=G" 
                  target=_blank>G</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=H" 
                  target=_blank>H</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=J" 
                  target=_blank>J</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=K" 
                  target=_blank>K</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=L" 
                  target=_blank>L</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=M" 
                  target=_blank>M</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=N" 
                  target=_blank>N</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=O" 
                  target=_blank>O</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=P" 
                  target=_blank>P</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=Q" 
                  target=_blank>Q</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=R" 
                  target=_blank>R</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=S" 
                  target=_blank>S</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=T" 
                  target=_blank>T</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=V" 
                  target=_blank>V</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=W" 
                  target=_blank>W</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=X" 
                  target=_blank>X</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=Y" 
                  target=_blank>Y</A> </B><B><A class=eng12b 
                  href="PL_ShowSinger.asp?SClass_abcd=Z" 
                  target=_blank>Z</A> </B></SPAN></TD></TR></TBODY></TABLE></TD>
          <TD style="BORDER-TOP: #b0dd7c 1px solid" vAlign=top align=right 
          width=12><IMG height=47 src="play_img/playqie_19.gif" 
        width=12></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<SCRIPT type=text/javascript>
function setcenter()
{
document.getElementById("word").scrollTop=100
}
</SCRIPT>
<%=count%>
</BODY></HTML>
