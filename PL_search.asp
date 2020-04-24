<%@ LANGUAGE = VBScript.Encode %>
<!--#include file="PL_config.asp"-->
<!--#include file="PL_Function.asp"-->
<%kw=Trim(Request("kw")) '关键词
t=Trim(Request("t")) '搜索类型%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>“ <%=kw%> ” - <%if t=0 then%>歌曲<%elseif t=1 then%>歌手<%elseif t=2 then%>专辑<%elseif t=3 then%>歌词<%else%><%end if%>搜索结果 - <%=webname%></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="pinluo.com_style1/music07css.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="pinluo.com_style1/Js.js" type=text/javascript></SCRIPT>

<STYLE type=text/css>
.STYLE1 {
	FONT-SIZE: 12px; COLOR: #333333
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
	color: #FF3366;
}
a:active {
	text-decoration: none;
}
.STYLE2 {font-size: 10px}
</STYLE>

<META content="MSHTML 6.00.6000.16587" name=GENERATOR></HEAD>
<BODY>
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=700 border=0>
  <TBODY>
  <TR>
    <TD width=200 height=147 rowSpan=3><IMG height=180 
      src="pinluo.com_style1/music07zjqie_021.gif" width=220></TD>
    <TD vAlign=center align=left width=500 height=60><SPAN 
      class=black12>仙乐飘飘，<%=webname%>让您一饱耳福……</SPAN></TD></TR>
  <TR>
    <TD vAlign=bottom align=left height=50>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
        <TR>
          <TD width=21 bgColor=#e8efd6><IMG height=47 
            src="pinluo.com_style1/music07zjqie_116.gif" width=21></TD>
          <TD class=gnavt14line align=middle width=437 bgColor=#e8efd6>您搜索的关键词：<font color="#FF0000"><b><%=kw%></b></font></TD>
          <TD align=right width=22 bgColor=#e8efd6><IMG height=47 
            src="pinluo.com_style1/music07zjqie_118.gif" 
        width=22></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD vAlign=top align=middle height=70>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="52%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=left width=19 bgColor=#8dcf46 height=22><IMG 
            height=22 src="pinluo.com_style1/music07zjqie_32.gif" width=11></TD>
          <TD align=center width=337 bgColor=#8dcf46 height=22><SPAN 
            class=STYLE1>搜索类型：&nbsp;<%if t=0 then%><font color="#FF0000"><b>歌曲</b></font><%else%><a href="?t=0&kw=<%=kw%>" title="试试搜索歌曲：&nbsp;<%=kw%>&nbsp;&nbsp;"><font color="#000000">歌曲</font></a><%end if%>&nbsp;&nbsp;<%if t=1 then%><font color="#FF0000"><b>歌手</b></font><%else%><a href="?t=1&kw=<%=kw%>" title="试试搜索歌手：&nbsp;<%=kw%>&nbsp;&nbsp;"><font color="#000000">歌手</font></a><%end if%>&nbsp;&nbsp;<%if t=2 then%><font color="#FF0000"><b>专辑</b></font><%else%><a href="?t=2&kw=<%=kw%>" title="试试搜索专辑：&nbsp;<%=kw%>&nbsp;&nbsp;"><font color="#000000">专辑</font></a><%end if%>&nbsp;&nbsp;<%if t=3 then%><font color="#FF0000"><b>歌词</b></font><%else%><a href="?t=3&kw=<%=kw%>" title="试试搜索歌词：&nbsp;<%=kw%>&nbsp;&nbsp;"><font color="#000000">歌词</font></a><%end if%></SPAN></TD>
          <TD vAlign=top align=right width=10 bgColor=#8dcf46 height=22><IMG 
            height=22 src="pinluo.com_style1/music07zjqie_34.gif" 
        width=10></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD vAlign=top align=middle colSpan=2 height=311>
      
	  <%call PL_Showsearch(t,10) '读取搜索结果，每页显示10首%> 
	  
	<!-- 搜索栏目开始 -->
	
	  <SCRIPT type=text/javascript>
<!--
function CheckForm()
{ 
 
  if (document.form1.kw.value=="")
  {
    alert("请填写搜索内容！");
	document.form1.kw.focus();	return false;
  }
 
  return true;  
}
-->
</SCRIPT>
	  <table class="tableBorder" width="94%" border=0 align="center" cellPadding=0 cellSpacing=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=left width=41 
          background=pinluo.com_style1/music07zjqie_17.gif><IMG height=46 
            src="pinluo.com_style1/music07zjqie_16.gif" width=40></TD>
          <TD width="615" vAlign=top background=pinluo.com_style1/music07zjqie_17.gif>
            <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD vAlign=top align=left>
                  <FORM id=form1 name=form1 onSubmit="return CheckForm();" 
                  action="PL_search.asp" method="post" target="_self">
                  <table class="tableBorder" cellSpacing=0 cellPadding=0 width="99%" border=0>
                    <TBODY><tr><TD height=8></td></tr>
                    <TR>
                      <TD width="17%">&nbsp;&nbsp;&nbsp;
                        <INPUT id=id type=radio<%if t=0 then%> CHECKED<%end if%> value=0 
                        name=t>
                        <SPAN class=g13tit>歌曲 </SPAN></TD>
                      <TD width="11%" height=21><INPUT id=id type=radio<%if t=1 then%> CHECKED<%end if%> value=1 
                        name=t> 
                      <SPAN class=g13tit>歌手</SPAN> </LABEL></TD>
                      <TD width="12%"><INPUT id=id type=radio<%if t=2 then%> CHECKED<%end if%> value=2 name=t> 
                        <SPAN class=g13tit>专辑</SPAN></TD>
                      <TD width="11%"><INPUT id=id type=radio<%if t=3 then%> CHECKED<%end if%> value=3 name=t> 
                        <SPAN class=g13tit>歌词</SPAN> </TD>
                      <TD align=middle width="21%" height=21><INPUT name=kw 
                        class=finput id=kw value="<%=kw%>"></TD>
                      <TD align=middle width="9%" height=21><A 
                        href="javascript:submit();">
                        <INPUT type=image height=21 
                        width=42 src="pinluo.com_style1/btu_33.gif"></A></TD>
                      <TD class=gray12t width="19%" height=21>&nbsp;</TD>
                    </TR></TBODY></TABLE></FORM></TD></TR>
              <TR>
                <TD height="18" align=middle vAlign=bottom class=sg12b>
				
				<%call PL_ShowABCDlanmu() '读取分类ABCD导航栏目%></TD>
              </TR>
            </TBODY></TABLE></TD>
        <TD vAlign=top align=right width=5 
          background=pinluo.com_style1/music07zjqie_17.gif><img 
            src="pinluo.com_style1/music07zjqie_19.gif" 
        width=5 height=46></TD>
      </TR></TBODY></TABLE>
	  
    </TD></TR></TBODY></TABLE>
<!--#include file="PL_bottom.asp"-->