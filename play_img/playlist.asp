<!--#include file="../PL_config.asp"-->
<!--#include file="../PL_Function.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><title>播放列表 - 品络音乐系统</title>
<LINK href="playlist_files/music07css.css" type=text/css rel=stylesheet>
<SCRIPT type=text/javascript>
function show(div)
{
   document.getElementById("show1").style.display="none"
   document.getElementById("show2").style.display="none"
   document.getElementById("show3").style.display="none"
   div.style.display=""
  
}

</SCRIPT>

<SCRIPT language=JavaScript src="playlist_files/Js.js" 
type=text/javascript></SCRIPT>

<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.6000.16587" name=GENERATOR></HEAD>
<BODY>
<table class="tableBorder" height=374 cellSpacing=1 cellPadding=0 width=212 bgColor=#66aa02 
border=0>
  <TBODY>
  <TR>
    <TD background=playlist_files/playqie_03.gif bgColor=#ffffff height=29>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="25%">&nbsp;</TD>
          <TD class=gnavt14line align=left width="75%"><A class=gnavt14line 
            href="javascript:show(show1)">新歌排行</A></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD id=show1 vAlign=top align=middle bgColor=#ffffff>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width=210 border=0>
        <FORM name=song1 onSubmit="javascript:return lbsong2(this);" 
        action=../play.asp target=Listen>
        <TBODY>
        <TR>
          <TD vAlign=top align=middle>
            <table class="tableBorder" cellSpacing=1 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=black12 align=middle bgColor=#e8efd6 colSpan=2 
                height=27>排行</TD>
                <TD class=black12 align=middle bgColor=#e8efd6 colSpan=2 
                height=27>歌曲-歌手</TD></TR>
              <%call PL_Showplaysonglist("new",10)%>
			  </TBODY></TABLE></TD></TR>
        <TR>
          <TD align=middle bgColor=#e8efd6 colSpan=5 height=28><A 
            href="javascript:CheckAll(song1)"><IMG class=hand title=选择显示的所有歌曲 
            height=20 alt=选择显示的所有歌曲 src="playlist_files/music07zjqie_95.gif" 
            width=42 border=0 name=chkall value="全 选"></A>&nbsp;&nbsp;<A 
            href="javascript:CheckOthers(song1)"><IMG id=chkOthers height=20 
            alt=反向选择歌曲 src="playlist_files/music07zjqie_97.gif" width=42 
            border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
            height=20 alt=请先选择你想听的歌曲后再点击连播 width=42 
            src="playlist_files/music07zjqie_99.gif" 
        name=B1></TD></TR></FORM></TBODY></TABLE></TD></TR>
  <TR>
    <TD background=playlist_files/playqie_03.gif bgColor=#ffffff height=29>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="25%">&nbsp;</TD>
          <TD class=gnavt14line align=left width="75%"><A class=gnavt14line 
            href="javascript:show(show2)">热歌排行</A></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD id=show2 style="DISPLAY: none" vAlign=top align=middle 
      bgColor=#ffffff><table class="tableBorder" cellSpacing=0 cellPadding=0 width=210 border=0>
        <FORM name=song2 onSubmit="javascript:return lbsong2(this);" 
        action=../play.asp target=Listen>
        <TBODY>
        <TR>
          <TD vAlign=top align=middle>
            <table class="tableBorder" cellSpacing=1 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=black12 align=middle bgColor=#e8efd6 colSpan=2 
                height=27>排行</TD>
                <TD class=black12 align=middle bgColor=#e8efd6 colSpan=2 
                height=27>歌曲-歌手</TD></TR>
              <TR onmousemove=change(this) onmouseout=rechange(this)>
                <TD align=middle width="11%" height=21><LABEL><INPUT id=id 
                  type=checkbox value=28193 name=id> </LABEL></TD>
                <TD align=middle width="11%" height=21><IMG height=16 alt="" 
                  src="playlist_files/1.gif" width=17></TD>
                <TD class=g12t align=left width="54%" height=21><A class=g12t 
                  onmousemove="this.className='black12';" title=原来我一直都不孤单 
                  onmouseout="this.className='g12t';" 
                  href="javascript:open_window('ShowMusic.asp?id=28193','showmusic','width=378,height=161,scrollbars=no')" 
                  name=links>原来我一直都不孤</A></TD>
                <TD class=gray12t align=left width="24%"><A class=gray12t 
                  href="http://music.jnnc.com/playlist.asp#">陈楚生</A></TD></TR>
              <TR onmousemove=change(this) onmouseout=rechange(this)>
                <TD align=middle width="11%" height=21><LABEL><INPUT id=id 
                  type=checkbox value=28194 name=id> </LABEL></TD>
                <TD align=middle width="11%" height=21><IMG height=16 alt="" 
                  src="playlist_files/2.gif" width=17></TD>
                <TD class=g12t align=left width="54%" height=21><A class=g12t 
                  onmousemove="this.className='black12';" title=有没有人告诉你 
                  onmouseout="this.className='g12t';" 
                  href="javascript:open_window('ShowMusic.asp?id=28194','showmusic','width=378,height=161,scrollbars=no')" 
                  name=links>有没有人告诉你</A></TD>
                <TD class=gray12t align=left width="24%"><A class=gray12t 
                  href="http://music.jnnc.com/playlist.asp#">陈楚生</A></TD></TR>
              <TR onmousemove=change(this) onmouseout=rechange(this)>
                <TD align=middle width="11%" height=21><LABEL><INPUT id=id 
                  type=checkbox value=28274 name=id> </LABEL></TD>
                <TD align=middle width="11%" height=21><IMG height=16 alt="" 
                  src="playlist_files/3.gif" width=17></TD>
                <TD class=g12t align=left width="54%" height=21><A class=g12t 
                  onmousemove="this.className='black12';" title=用心去爱 
                  onmouseout="this.className='g12t';" 
                  href="javascript:open_window('ShowMusic.asp?id=28274','showmusic','width=378,height=161,scrollbars=no')" 
                  name=links>用心去爱</A></TD>
                <TD class=gray12t align=left width="24%"><A class=gray12t 
                  href="http://music.jnnc.com/playlist.asp#">韩雪</A></TD></TR>
              <TR onmousemove=change(this) onmouseout=rechange(this)>
                <TD align=middle width="11%" height=21><LABEL><INPUT id=id 
                  type=checkbox value=28271 name=id> </LABEL></TD>
                <TD align=middle width="11%" height=21><IMG height=16 alt="" 
                  src="playlist_files/4.gif" width=17></TD>
                <TD class=g12t align=left width="54%" height=21><A class=g12t 
                  onmousemove="this.className='black12';" title=有你抱着我 
                  onmouseout="this.className='g12t';" 
                  href="javascript:open_window('ShowMusic.asp?id=28271','showmusic','width=378,height=161,scrollbars=no')" 
                  name=links>有你抱着我</A></TD>
                <TD class=gray12t align=left width="24%"><A class=gray12t 
                  href="http://music.jnnc.com/playlist.asp#">韩雪</A></TD></TR>
              <TR onmousemove=change(this) onmouseout=rechange(this)>
                <TD align=middle width="11%" height=21><LABEL><INPUT id=id 
                  type=checkbox value=28270 name=id> </LABEL></TD>
                <TD align=middle width="11%" height=21><IMG height=16 alt="" 
                  src="playlist_files/5.gif" width=17></TD>
                <TD class=g12t align=left width="54%" height=21><A class=g12t 
                  onmousemove="this.className='black12';" title=紫藤花 
                  onmouseout="this.className='g12t';" 
                  href="javascript:open_window('ShowMusic.asp?id=28270','showmusic','width=378,height=161,scrollbars=no')" 
                  name=links>紫藤花</A></TD>
                <TD class=gray12t align=left width="24%"><A class=gray12t 
                  href="http://music.jnnc.com/playlist.asp#">韩雪</A></TD></TR>
              <TR onmousemove=change(this) onmouseout=rechange(this)>
                <TD align=middle width="11%" height=21><LABEL><INPUT id=id 
                  type=checkbox value=28190 name=id> </LABEL></TD>
                <TD align=middle width="11%" height=21><IMG height=16 alt="" 
                  src="playlist_files/6.gif" width=17></TD>
                <TD class=g12t align=left width="54%" height=21><A class=g12t 
                  onmousemove="this.className='black12';" title=寻找 
                  onmouseout="this.className='g12t';" 
                  href="javascript:open_window('ShowMusic.asp?id=28190','showmusic','width=378,height=161,scrollbars=no')" 
                  name=links>寻找</A></TD>
                <TD class=gray12t align=left width="24%"><A class=gray12t 
                  href="http://music.jnnc.com/playlist.asp#">陈楚生</A></TD></TR>
              <TR onmousemove=change(this) onmouseout=rechange(this)>
                <TD align=middle width="11%" height=21><LABEL><INPUT id=id 
                  type=checkbox value=28273 name=id> </LABEL></TD>
                <TD align=middle width="11%" height=21><IMG height=16 alt="" 
                  src="playlist_files/7.gif" width=17></TD>
                <TD class=g12t align=left width="54%" height=21><A class=g12t 
                  onmousemove="this.className='black12';" title=握你的手 
                  onmouseout="this.className='g12t';" 
                  href="javascript:open_window('ShowMusic.asp?id=28273','showmusic','width=378,height=161,scrollbars=no')" 
                  name=links>握你的手</A></TD>
                <TD class=gray12t align=left width="24%"><A class=gray12t 
                  href="http://music.jnnc.com/playlist.asp#">韩雪</A></TD></TR>
              <TR onmousemove=change(this) onmouseout=rechange(this)>
                <TD align=middle width="11%" height=21><LABEL><INPUT id=id 
                  type=checkbox value=28192 name=id> </LABEL></TD>
                <TD align=middle width="11%" height=21><IMG height=16 alt="" 
                  src="playlist_files/8.gif" width=17></TD>
                <TD class=g12t align=left width="54%" height=21><A class=g12t 
                  onmousemove="this.className='black12';" title="La La La" 
                  onmouseout="this.className='g12t';" 
                  href="javascript:open_window('ShowMusic.asp?id=28192','showmusic','width=378,height=161,scrollbars=no')" 
                  name=links>La La La</A></TD>
                <TD class=gray12t align=left width="24%"><A class=gray12t 
                  href="http://music.jnnc.com/playlist.asp#">陈楚生</A></TD></TR>
              <TR onmousemove=change(this) onmouseout=rechange(this)>
                <TD align=middle width="11%" height=21><LABEL><INPUT id=id 
                  type=checkbox value=28199 name=id> </LABEL></TD>
                <TD align=middle width="11%" height=21><IMG height=16 alt="" 
                  src="playlist_files/9.gif" width=17></TD>
                <TD class=g12t align=left width="54%" height=21><A class=g12t 
                  onmousemove="this.className='black12';" title=蝴蝶秀 
                  onmouseout="this.className='g12t';" 
                  href="javascript:open_window('ShowMusic.asp?id=28199','showmusic','width=378,height=161,scrollbars=no')" 
                  name=links>蝴蝶秀</A></TD>
                <TD class=gray12t align=left width="24%"><A class=gray12t 
                  href="http://music.jnnc.com/playlist.asp#">罗志祥</A></TD></TR>
              <TR onmousemove=change(this) onmouseout=rechange(this)>
                <TD align=middle width="11%" height=21><LABEL><INPUT id=id 
                  type=checkbox value=28191 name=id> </LABEL></TD>
                <TD align=middle width="11%" height=21><IMG height=16 alt="" 
                  src="playlist_files/10.gif" width=17></TD>
                <TD class=g12t align=left width="54%" height=21><A class=g12t 
                  onmousemove="this.className='black12';" title=Sing 
                  onmouseout="this.className='g12t';" 
                  href="javascript:open_window('ShowMusic.asp?id=28191','showmusic','width=378,height=161,scrollbars=no')" 
                  name=links>Sing</A></TD>
                <TD class=gray12t align=left width="24%"><A class=gray12t 
                  href="http://music.jnnc.com/playlist.asp#">陈楚生</A></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD align=middle bgColor=#e8efd6 colSpan=5 height=28><A 
            href="javascript:CheckAll(song2)"><IMG class=hand title=选择显示的所有歌曲 
            height=20 alt=选择显示的所有歌曲 src="playlist_files/music07zjqie_95.gif" 
            width=42 border=0 name=chkall value="全 选"></A>&nbsp;&nbsp;<A 
            href="javascript:CheckOthers(song2)"><IMG id=chkOthers height=20 
            alt=反向选择歌曲 src="playlist_files/music07zjqie_97.gif" width=42 
            border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
            height=20 alt=请先选择你想听的歌曲后再点击连播 width=42 
            src="playlist_files/music07zjqie_99.gif" 
        name=B1></TD></TR></FORM></TBODY></TABLE></TD></TR>
  <TR>
    <TD background=playlist_files/playqie_03.gif bgColor=#ffffff height=29>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="25%">&nbsp;</TD>
          <TD class=gnavt14line align=left width="75%"><A class=gnavt14line 
            href="javascript:show(show3)">网友上传</A></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD id=show3 style="DISPLAY: none" vAlign=top align=middle 
      bgColor=#ffffff><table class="tableBorder" cellSpacing=0 cellPadding=0 width=210 border=0>
        <FORM name=song3 onSubmit="javascript:return lbsong2(this);" 
        action=../play.asp target=Listen>
        <TBODY>
        <TR>
          <TD vAlign=top align=middle>
            <table class="tableBorder" cellSpacing=1 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD class=black12 align=middle bgColor=#e8efd6 colSpan=2 
                height=27>排行</TD>
                <TD class=black12 align=middle bgColor=#e8efd6 colSpan=2 
                height=27>歌曲-网友</TD></TR>
              <TR onmousemove=change(this) onmouseout=rechange(this)>
                <TD align=middle width="11%" height=21><LABEL><INPUT id=id 
                  type=checkbox value=28080 name=id> </LABEL></TD>
                <TD align=middle width="11%" height=21><IMG height=16 alt="" 
                  src="playlist_files/1.gif" width=17></TD>
                <TD class=g12t align=left width="54%" height=21><A class=g12t 
                  onmousemove="this.className='black12';" title=催眠 
                  onmouseout="this.className='g12t';" 
                  href="javascript:open_window('ShowMusic.asp?id=28080','showmusic','width=378,height=161,scrollbars=no')">催眠</A></TD>
                <TD class=gray12t align=left width="24%"><A class=gray12t 
                  href="http://music.jnnc.com/playlist.asp#">superhoty</A></TD></TR>
              <TR onmousemove=change(this) onmouseout=rechange(this)>
                <TD align=middle width="11%" height=21><LABEL><INPUT id=id 
                  type=checkbox value=28079 name=id> </LABEL></TD>
                <TD align=middle width="11%" height=21><IMG height=16 alt="" 
                  src="playlist_files/2.gif" width=17></TD>
                <TD class=g12t align=left width="54%" height=21><A class=g12t 
                  onmousemove="this.className='black12';" title=彩虹（电台版） 
                  onmouseout="this.className='g12t';" 
                  href="javascript:open_window('ShowMusic.asp?id=28079','showmusic','width=378,height=161,scrollbars=no')">彩虹（电台版）</A></TD>
                <TD class=gray12t align=left width="24%"><A class=gray12t 
                  href="http://music.jnnc.com/playlist.asp#">summeryu</A></TD></TR>
              <TR onmousemove=change(this) onmouseout=rechange(this)>
                <TD align=middle width="11%" height=21><LABEL><INPUT id=id 
                  type=checkbox value=28081 name=id> </LABEL></TD>
                <TD align=middle width="11%" height=21><IMG height=16 alt="" 
                  src="playlist_files/3.gif" width=17></TD>
                <TD class=g12t align=left width="54%" height=21><A class=g12t 
                  onmousemove="this.className='black12';" title=一大片品络 
                  onmouseout="this.className='g12t';" 
                  href="javascript:open_window('ShowMusic.asp?id=28081','showmusic','width=378,height=161,scrollbars=no')">一大片品络</A></TD>
                <TD class=gray12t align=left width="24%"><A class=gray12t 
                  href="http://music.jnnc.com/playlist.asp#">分飞翼</A></TD></TR>
              <TR onmousemove=change(this) onmouseout=rechange(this)>
                <TD align=middle width="11%" height=21><LABEL><INPUT id=id 
                  type=checkbox value=28082 name=id> </LABEL></TD>
                <TD align=middle width="11%" height=21><IMG height=16 alt="" 
                  src="playlist_files/4.gif" width=17></TD>
                <TD class=g12t align=left width="54%" height=21><A class=g12t 
                  onmousemove="this.className='black12';" title=漂浮地铁 
                  onmouseout="this.className='g12t';" 
                  href="javascript:open_window('ShowMusic.asp?id=28082','showmusic','width=378,height=161,scrollbars=no')">漂浮地铁</A></TD>
                <TD class=gray12t align=left width="24%"><A class=gray12t 
                  href="http://music.jnnc.com/playlist.asp#">crystaltake</A></TD></TR>
              <TR onmousemove=change(this) onmouseout=rechange(this)>
                <TD align=middle width="11%" height=21><LABEL><INPUT id=id 
                  type=checkbox value=29313 name=id> </LABEL></TD>
                <TD align=middle width="11%" height=21><IMG height=16 alt="" 
                  src="playlist_files/5.gif" width=17></TD>
                <TD class=g12t align=left width="54%" height=21><A class=g12t 
                  onmousemove="this.className='black12';" title=不落的太阳 
                  onmouseout="this.className='g12t';" 
                  href="javascript:open_window('ShowMusic.asp?id=29313','showmusic','width=378,height=161,scrollbars=no')">不落的太阳</A></TD>
                <TD class=gray12t align=left width="24%"><A class=gray12t 
                  href="http://music.jnnc.com/playlist.asp#">锦锦</A></TD></TR>
              <TR onmousemove=change(this) onmouseout=rechange(this)>
                <TD align=middle width="11%" height=21><LABEL><INPUT id=id 
                  type=checkbox value=29312 name=id> </LABEL></TD>
                <TD align=middle width="11%" height=21><IMG height=16 alt="" 
                  src="playlist_files/6.gif" width=17></TD>
                <TD class=g12t align=left width="54%" height=21><A class=g12t 
                  onmousemove="this.className='black12';" title=海阔品络 
                  onmouseout="this.className='g12t';" 
                  href="javascript:open_window('ShowMusic.asp?id=29312','showmusic','width=378,height=161,scrollbars=no')">海阔品络</A></TD>
                <TD class=gray12t align=left width="24%"><A class=gray12t 
                  href="http://music.jnnc.com/playlist.asp#">iricoenan</A></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD align=middle bgColor=#e8efd6 colSpan=5 height=28><A 
            href="javascript:CheckAll(song3)"><IMG class=hand title=选择显示的所有歌曲 
            height=20 alt=选择显示的所有歌曲 src="playlist_files/music07zjqie_95.gif" 
            width=42 border=0 name=chkall value="全 选"></A>&nbsp;&nbsp;<A 
            href="javascript:CheckOthers(song3)"><IMG id=chkOthers height=20 
            alt=反向选择歌曲 src="playlist_files/music07zjqie_97.gif" width=42 
            border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
            height=20 alt=请先选择你想听的歌曲后再点击连播 width=42 
            src="playlist_files/music07zjqie_99.gif" 
        name=B1></TD></TR></FORM></TBODY></TABLE></TD></TR></TBODY></TABLE></BODY></HTML>
