<!--#include file="PL_config.asp"-->
<!--#include file="user/PL_user_check_safe.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>自助上传歌曲 - <%=WebName%></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="pinluo.com_style1/music07css.css" type=text/css rel=stylesheet>
<STYLE type=text/css>.STYLE1 {
	COLOR: #ff0000
}
</STYLE>

<SCRIPT type=text/javascript>
function CheckForm()
{
   if (document.myform.song.value=="")
  {
    alert("歌曲名称不能为空！");
	document.myform.song.focus();
	founderr =false
	return false;
  }	  
 
  if (document.myform.singer.value=="")
  {
    alert("歌手名不能为空！");
	document.myform.singer.focus();
	founderr =false
	return false;
  }
  
  if (document.myform.songfile.value=="")
  {
    alert("还没上传歌曲文件！");
	document.myform.word.focus();
	
	return false;
  }  
  return true;  
}
function vcheck(aa,bb)
{
  if(aa.value!="")
  {
    bb.style.display =""   
  }
  else if(aa.value =="")
  {
    bb.style.display ="none"
  }
  
}
</SCRIPT>

<META content="MSHTML 6.00.6000.16587" name=GENERATOR></HEAD>
<BODY>
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=378 border=0>
  <TBODY>
  <TR>
    <TD>
      <DIV id=song>
      <table class="tableBorder" cellSpacing=1 cellPadding=0 width=378 bgColor=#66aa02 border=0>
        <TBODY>
        <TR>
          <TD vAlign=top width=376 bgColor=#ffffff>
            <table class="tableBorder" cellSpacing=0 cellPadding=0 width=376 border=0>
              <TBODY>
              <TR>
                <TD align=middle background=pinluo.com_style1/playqie_06.gif 
                height=28>
                  <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <TR>
                      <TD align=middle width="32%"><SPAN 
                        class=gnavt14line><%=WebName%></SPAN></TD>
                      <TD class=black12 align=left 
                    width="68%">仙乐飘飘，让您一饱耳福……</TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD>
                  <table class="tableBorder" cellSpacing=0 cellPadding=0 width=376 border=0>
                    <TBODY>
                    <TR>
                      <TD vAlign=top align=left width=6 bgColor=#f0f9ce 
                      rowSpan=2><IMG height=131 
                        src="pinluo.com_style1/playqie_08.gif" width=6></TD>
                      <TD vAlign=top bgColor=#f0f9ce>
                        <table class="tableBorder" cellSpacing=3 cellPadding=0 width="100%" 
                        bgColor=#66aa02 border=0>
                          <TBODY>
                          <TR>
                            <TD vAlign=top bgColor=#ffffff height=160>
                              <table class="tableBorder" cellSpacing=2 cellPadding=2 width="100%">
                                <FORM id=form1 name=myform 
                                onsubmit="return CheckForm();" 
                                action=uploadsave.asp method=post target=_self>
                                <TBODY>
                                <TR>
                                <TD class=sg12b align=middle width="31%" 
                                background=pinluo.com_style1/music07zjqie_17.gif 
                                height=25><SPAN class=STYLE1>*</SPAN>歌曲名：<IMG 
                                id=vsong style="DISPLAY: none" height=16 
                                src="pinluo.com_style1/11.gif" width=16 
                                name=vsong></TD>
                                <TD class=sg12b align=left width="69%" 
                                background=pinluo.com_style1/music07zjqie_17.gif 
                                height=25><INPUT class=finput id=song 
                                style="WIDTH: 200px" onchange=vcheck(this,vsong) 
                                name=song> </TD></TR>
                                <TR>
                                <TD class=sg12b align=middle bgColor=#e4fcb0 
                                height=25><SPAN class=STYLE1>*</SPAN>演唱者：<IMG 
                                id=vsinger style="DISPLAY: none" height=16 
                                src="pinluo.com_style1/11.gif" width=16 
                                name=vsinger></TD>
                                <TD class=eng10b align=left bgColor=#e4fcb0 
                                height=25><SPAN class=sg12b><INPUT class=finput 
                                id=singer style="WIDTH: 200px" 
                                onchange=vcheck(this,vsinger) name=singer> 
                                </SPAN></TD></TR>
                                <TR>
                                <TD class=sg12b vAlign=center align=middle 
                                bgColor=#f3fede height=25>文本歌词<BR>(仅供查询)</TD>
                                <TD class=black12 align=left bgColor=#f3fede 
                                height=25><TEXTAREA id=word style="BORDER-RIGHT: #99cc00 1px solid; BORDER-TOP: #99cc00 1px solid; BORDER-LEFT: #99cc00 1px solid; WIDTH: 200px; BORDER-BOTTOM: #99cc00 1px solid; HEIGHT: 150px" name=word rows=5 cols=10></TEXTAREA></TD></TR>
                                <TR>
                                <TD class=black12 align=middle 
                                bgColor=#caf65d><SPAN class=sg12b><SPAN 
                                class=STYLE1>*</SPAN>歌曲文件： <IMG id=vsongurl 
                                style="DISPLAY: none" height=16 
                                src="pinluo.com_style1/11.gif" width=16 
                                name=vsongurl></SPAN> <INPUT id=songfile 
                                type=hidden name=songfile></TD>
                                <TD class=black12 align=left 
                                bgColor=#caf65d><SPAN class=sg12b><IFRAME 
                                src="pinluo.com_style1/upsong.htm" frameBorder=0 
                                width=240 scrolling=no 
                                height=22></IFRAME></SPAN></TD></TR>
                                <TR>
                                <TD class=black12 align=middle 
                                bgColor=#caf65d><LABEL><SPAN class=sg12b>lrc 
                                歌词：<IMG id=vwordurl style="DISPLAY: none" 
                                height=16 src="pinluo.com_style1/11.gif" width=16 
                                name=vwordurl></SPAN> <INPUT id=wordfile 
                                type=hidden name=wordfile> </LABEL></TD>
                                <TD class=black12 align=left 
                                bgColor=#caf65d><SPAN class=sg12b><IFRAME 
                                src="pinluo.com_style1/upword.htm" frameBorder=0 
                                width=240 scrolling=no 
                                height=22></IFRAME></SPAN></TD></TR>
                                <TR>
                                <TD class=black12 align=middle bgColor=#caf65d 
                                colSpan=2 height=25><SPAN id=msg 
                                style="COLOR: #ff0000"></SPAN></TD></TR>
                                <TR>
                                <TD class=black12 align=middle bgColor=#caf65d 
                                colSpan=2 height=25><LABEL><INPUT id=imageField 
                                type=image src="pinluo.com_style1/btu_33.gif" 
                                name=imageField> &nbsp;&nbsp;&nbsp;&nbsp;<IMG 
                                height=21 
                                src="pinluo.com_style1/music07zjqie1_33.gif" 
                                width=42></LABEL></TD></TR></FORM></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
                      <TD vAlign=top align=right width=6 bgColor=#f0f9ce 
                      height=173 rowSpan=2>&nbsp;</TD></TR>
                    <TR>
                      <TD vAlign=top bgColor=#f0f9ce 
                  height=10></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE><IMG 
height=131 src="pinluo.com_style1/playqie_10.gif" width=6> </BODY></HTML>
