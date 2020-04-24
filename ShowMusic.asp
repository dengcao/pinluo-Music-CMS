<!--#include file="PL_config.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%id=Trim(Request.QueryString("id"))
set rs=server.createobject("adodb.recordset")
sql="SELECT * FROM MusicList where id = "&id
rs.open sql,conn,1,3
if rs.eof and rs.bof then 
	response.Write("对不起，当前要查看的歌曲不存在，可能已经被删除，或没有通过管理员审核。")
    Response.End 
        else
		
if rs("hits")<>"" then
rs("hits")=rs("hits")+1
rs.update
else
rs("hits")=1
rs.update
end if
		%>
<HTML><HEAD><TITLE>歌曲：<%=rs("musicName")%>  -  <%=webname%></TITLE>
<LINK href="pinluo.com_style1/newmusic.css" type=text/css rel=stylesheet>
<LINK href="pinluo.com_style1/music07css.css" type=text/css rel=stylesheet>
<STYLE>TD {
	FONT-SIZE: 9pt; COLOR: #000000
}
A:visited {
	COLOR: #000000; TEXT-DECORATION: none
}
A:link {
	COLOR: #000000; TEXT-DECORATION: none
}
A:hover {
	COLOR: #ff0000; TEXT-DECORATION: none
}
INPUT {
	BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; FONT-SIZE: 9pt; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; POSITION: relative; HEIGHT: 20px; BACKGROUND-COLOR: #f6f6f6
}
TEXTAREA {
	BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; FONT-SIZE: 9pt; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid; BACKGROUND-COLOR: #efefef
}
SELECT {
	FONT-SIZE: 9pt; BACKGROUND-COLOR: #ffffff
}
FIELDSET {
	BORDER-RIGHT: #5094e0 1px solid; BORDER-TOP: #5094e0 1px solid; FONT-SIZE: 9pt; BORDER-LEFT: #5094e0 1px solid; WIDTH: 100%; COLOR: #5094e0; BORDER-BOTTOM: #5094e0 1px solid; TEXT-ALIGN: left
}
.TableLine {
	BORDER-COLLAPSE: collapse
}
BODY {
	FONT-SIZE: 9pt; SCROLLBAR-HIGHLIGHT-COLOR: #e8eeff; SCROLLBAR-SHADOW-COLOR: #ffffff; COLOR: #000000; SCROLLBAR-3DLIGHT-COLOR: #ffffff; LINE-HEIGHT: 150%; SCROLLBAR-ARROW-COLOR: #000000; SCROLLBAR-TRACK-COLOR: #ffffff; FONT-FAMILY: 宋体; SCROLLBAR-DARKSHADOW-COLOR: #ffffff; SCROLLBAR-BASE-COLOR: #93bad7
}
</STYLE>

<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="pinluo.com_style1/music07css.css" type=text/css rel=stylesheet>
<STYLE type=text/css>.STYLE1 {
	FONT-SIZE: 16px
}
.STYLE2 {
	FONT-SIZE: 14px
}
</STYLE>

<SCRIPT language=JavaScript src="pinluo.com_style1/Js.js" 
type=text/javascript></SCRIPT>
<script language="JavaScript">
//自动调整窗口到屏幕中间 body要加onload=winsize(); onresize=winsize();
var x=388;
var y=261;
var xx=(window.screen.width-x)/2;
var yy=(window.screen.height-y)/2;
function winsize(){
window.resizeTo(x,y);
window.moveTo(xx,yy);
setTimeout("winsize()",50)}</script>
<META content="MSHTML 6.00.6000.16587" name=GENERATOR></HEAD>
<BODY onload=winsize();>
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
                        class=gnavt14line>歌曲查看</SPAN></TD>
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
                            <TD vAlign=top bgColor=#ffffff height=91>
                              <table class="tableBorder" cellSpacing=2 cellPadding=0 width="100%">
                                <TBODY>
                                <TR>
                                <TD class=sg12b align=middle width="50%" 
                                background=pinluo.com_style1/music07zjqie_17.gif 
                                bgColor=#ccff33 height=36>歌曲：<%=rs("musicName")%> </TD>
                                <TD class=sg12b align=middle width="50%" 
                                background=pinluo.com_style1/music07zjqie_17.gif 
                                bgColor=#ccff33>歌手：<A 
                                href="PL_ShowSinger.asp?Classid=12&amp;SClassid=49&amp;NClassid=201" 
                                target=_blank><%=rs("singer")%></A></TD></TR>
                                <TR>
                                <TD class=org12 align=middle bgColor=#e4fcb0 
                                height=32>专辑：<A 
                                href="PL_ShowSpecial.asp?Specialid=<%=rs("Specialid")%>" 
                                target=_blank>点击查看该专辑</A></TD>
                                <TD class=org12 align=middle bgColor=#e4fcb0 
                                height=32>点击：<%=rs("hits")%></TD></TR>
                                <TR>
                                <TD class=black12 align=middle bgColor=#f3fede 
                                colSpan=2 height=27><A 
                                href="javascript:open_window('Play.asp?id=<%=rs("id")%>','Listen','width=275,height=116')"><SPAN 
                                class=txt>试听</SPAN></A> <SPAN class=txt>&nbsp; 
                                <A onClick="return call(this.href);" 
                                href="PL_download.asp?id=<%=rs("id")%>" 
                                target=_blank>下载</A> &nbsp; <A 
                                href="PL_show_geci.asp?id=<%=rs("id")%>" 
                                target=_blank>歌词</A> &nbsp; <A class=txt 
                                href="javascript:open_window('User/PL_WriteSMusic.asp?id=<%=rs("id")%>','WriteSMusic','width=397,height=322,scrollbars=no')">点歌</A> 
                                &nbsp; <A 
                                href="javascript:open_window('User/PL_UserCollect.asp?action=add&amp;id=<%=rs("id")%>','WriteSMusic','width=778,height=400,scrollbars=no')">收藏</A></SPAN></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
                      <TD vAlign=top align=right width=6 bgColor=#f0f9ce 
                      height=173 rowSpan=2><IMG height=131 
                        src="pinluo.com_style1/playqie_10.gif" width=6></TD></TR>
                    <TR>
                      <TD vAlign=top bgColor=#f0f9ce 
                  height=2></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE></BODY></HTML>
 <%end if%>