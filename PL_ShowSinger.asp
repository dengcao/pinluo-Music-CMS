<%@ LANGUAGE = VBScript.Encode %>
<!--#include file="PL_config.asp"-->
<!--#include file="PL_Function.asp"-->
<%SClassid=Trim(Request.QueryString("SClassid"))
SClass_abcd=Trim(Request.QueryString("SClass_abcd"))%>
<%if SClassid<>"" then
set rs=server.createobject("adodb.recordset")
sql="SELECT * FROM SClass where SClassid = "&SClassid
rs.open sql,conn,1,1
if rs.eof and rs.bof then 
	response.Write("对不起，当前的栏目不存在，可能已经被删除，或没有通过管理员审核。")
    Response.End 
        else
PL_title2=rs("SClass")
PL_title=PL_title2&" - "
		end if
		else
PL_title="歌手列表 "&SClass_abcd&" - "
		end if%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE><%=PL_title%><%=WebName%></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="pinluo.com_style1/music07css.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="pinluo.com_style1/Js.js" 
type=text/javascript></SCRIPT>

<STYLE type=text/css>#all #main #singer .gray13tit .black12 #intro {
	CLEAR: none; FLOAT: left; OVERFLOW: hidden; WIDTH: 150px; HEIGHT: 100px
}
</STYLE>

<META content="MSHTML 6.00.6000.16587" name=GENERATOR></HEAD>
<BODY><!-- 品络音乐系统 导航开始-->
<DIV align=center></DIV><!-- 品络音乐系统 导航结束--><!-- 主要居中部分开始 -->
<DIV id=all><!-- 左边部分开始 -->
<DIV id=leftcont><LINK href="pinluo.com_style1/music07css.css" type=text/css 
rel=stylesheet>
<DIV id=leftcont>
<DIV>
<OBJECT 
codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0 
height=180 width=200 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000><PARAM NAME="movie" VALUE="pinluo.com_style1/musiclogo.swf"><PARAM NAME="quality" VALUE="high">
                              <embed src="pinluo.com_style1/musiclogo.swf" quality="high" 
pluginspage="http://www.macromedia.com/go/getflashplayer" 
type="application/x-shockwave-flash" width="200" height="180"></embed>        
</OBJECT></DIV>

<!--#include file="PL_INC/PL_inc_login.asp"-->


<DIV><!--新歌排行开始 -->
<!--新歌排行开始 -->
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=200 border=0>
  <TBODY>
  <TR>
    <TD class=wtit14line align=middle 
    background=pinluo.com_style1/music07zjqie_42.gif height=28>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="31%">&nbsp;</TD>
          <TD class=wtit14line align=left 
    width="69%">新歌排行</TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle bgColor=#f1fdcb>

<table class="tableBorder" cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
		<!--读取最新歌曲列表-->
<%call PL_Shownewsonglist(10)%>

        </TBODY></TABLE></TD></TR>
  <TR>
    <TD vAlign=top><IMG height=10 
      src="pinluo.com_style1/music07zjqie_66.gif" width=200></TD></TR>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE></DIV>

	
	<!--新歌排行结束 -->
	
	
	
<DIV><!--热歌排行开始 -->
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=200 border=0>
  <TBODY>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07zjqie_42.gif 
    height=28>

      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="31%">&nbsp;</TD>
          <TD class=wtit14line align=left 
    width="69%">热歌排行</TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle bgColor=#f1fdcb>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
		<!--读取热门歌曲列表-->
	<%call PL_Showhotsonglist(10)%>

</TBODY></TABLE></TD></TR>
  <TR>
    <TD vAlign=top><IMG height=10 
      src="pinluo.com_style1/music07zjqie_66.gif" width=200></TD></TR>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE></DIV><!--热歌排行结束 -->
<DIV><!--热门歌手开始 -->
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=200 border=0>
  <TBODY>
  <TR>
    <TD class=wtit14line align=middle 
    background=pinluo.com_style1/music07zjqie_42.gif height=28>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="31%">&nbsp;</TD>
          <TD class=wtit14line align=left 
    width="69%">热门歌手</TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle bgColor=#f1fdcb>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="96%" border=0>
        <TBODY>
        		
		<!--读取热门歌手列表-->
	<%call PL_ShowhotSinger()%>
        
		</TBODY></TABLE></TD></TR>
  <TR>
    <TD vAlign=top><IMG height=10 
      src="pinluo.com_style1/music07zjqie_66.gif" width=200></TD></TR>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE></DIV><!--热门歌手结束 -->
<DIV><!--网友上传开始 -->
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=200 border=0>
  <TBODY>
  <TR>
    <TD class=wtit14line align=middle 
    background=pinluo.com_style1/music07zjqie_42.gif height=28>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="31%">&nbsp;</TD>
          <TD class=wtit14line align=left 
    width="69%">推荐歌曲</TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle bgColor=#f1fdcb>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="94%" border=0>
        <TBODY>
		
		<!--读取推荐歌曲列表-->
	<%call PL_ShowIsgoodsonglist(10)%>
	
        </TBODY></TABLE></TD></TR>
		

  <TR>
    <TD vAlign=top><IMG height=10 
      src="pinluo.com_style1/music07zjqie_66.gif" width=200></TD></TR>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE></DIV><!--网友上传结束 --></DIV></DIV><!-- 左边部分结束 --><!-- 右边主要内容开始 -->


<!--#include file="PL_INC/PL_top.asp"-->


<DIV id=newdisc>
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=780 border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=left width=12 rowSpan=2><IMG height=18 
      src="pinluo.com_style1/music07zjqie_06.gif" width=12></TD>
    <TD vAlign=top align=left>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=left width=41><IMG height=164 
            src="pinluo.com_style1/music07zjqie_07.gif" width=41></TD>
          <TD class=tbline1 bgColor=#eefdcc>
            <table class="tableBorder" height=160 cellSpacing=5 cellPadding=0 width="100%" 
              border=0><TBODY>
			                       
			 <%call PL_Shownewzhuanji(5) '读取最新专辑列表，5个%>	 
			 
			 </TBODY></TABLE></TD>
          <TD vAlign=top align=right width=37><IMG height=164 
            src="pinluo.com_style1/music07zjqie_09.gif" width=37 useMap=#Map 
            border=0></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD align=middle>
      

      <!--#include file="PL_INC/PL_inc_search.asp"--></TD></TR></TBODY></TABLE><MAP id=Map 
name=Map><AREA shape=RECT coords=10,94,35,165 
  href="PL_Speciallist.asp<%if NClassid<>"" then%>?NClassid=<%=NClassid%><%elseif SClassID<>"" then%>?SClassID=<%=SClassID%><%else%><%end if%>"></MAP></DIV>
<DIV id=main>
<DIV id=singer>
<DIV id=div>
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=768 border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=left width=9 
    background=pinluo.com_style1/music07zjlin_37.gif><IMG height=11 
      src="pinluo.com_style1/music07zjqie_26.gif" width=9></TD>
    <TD style="BORDER-TOP: #8dcf46 1px solid" vAlign=top align=middle 
    bgColor=#effdd6>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width=200 border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=left width=12 bgColor=#8dcf46 height=22><IMG 
            height=22 src="pinluo.com_style1/music07zjqie_32.gif" width=11></TD>
          <TD class=wtit14line align=middle width=206 bgColor=#8dcf46 
            height=22><%if PL_title2<>"" then
			response.Write PL_title2
			else
			response.Write SClass_abcd
			end if%></TD>
          <TD vAlign=top align=right width=10 bgColor=#8dcf46 height=22><IMG 
            height=22 src="pinluo.com_style1/music07zjqie_34.gif" 
        width=10></TD></TR></TBODY></TABLE></TD>
    <TD vAlign=top align=right width=11 
    background=pinluo.com_style1/music07zjlin_38.gif><IMG height=11 
      src="pinluo.com_style1/music07zjqie_29.gif" 
width=11></TD></TR></TBODY></TABLE>
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=768 border=0>
  <TBODY>
  <TR>
    <TD class=tbline align=middle bgColor=#f4ffea colSpan=2>
      <table class="tableBorder" cellSpacing=2 cellPadding=2 width="95%" bgColor=#effdd6 border=0>
        <TBODY>
        <!--按ABCD排列开始-->
		<%if SClassid="" then
		PL_SClassID2=""
		else
		PL_SClassID2=SClassid
		end if
		
		if SClass_abcd="" then
		call PL_ShowABCD("0-9",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("A",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("B",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("C",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("D",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("E",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("F",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("G",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("H",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("I",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("J",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("K",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("L",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("M",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("N",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("O",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("P",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("Q",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("R",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("S",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("T",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("U",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("V",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("W",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("X",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("Y",PL_SClassID2) 'abcd,SClassID
		call PL_ShowABCD("Z",PL_SClassID2) 'abcd,SClassID
		else
		call PL_ShowABCD(SClass_abcd,PL_SClassID2) 'abcd,SClassID
		end if%>
		<!--按ABCD排列结束-->
        </TBODY></TABLE></TD></TR>
  <TR>
    <TD vAlign=bottom align=left 
    background=pinluo.com_style1/music07zjlin_116.gif bgColor=#f4ffea 
    height=11><IMG height=11 src="pinluo.com_style1/music07zjqie_111.gif" 
      width=9></TD>
    <TD vAlign=bottom align=right 
    background=pinluo.com_style1/music07zjlin_116.gif bgColor=#f4ffea 
    height=11><IMG height=11 src="pinluo.com_style1/music07zjqie_112.gif" 
      width=11></TD></TR></TBODY></TABLE></DIV></DIV><!-- 右边主要内容结束 --></DIV>
	  <!-- 主要居中部分结束 -->
<!--#include file="PL_bottom.asp"-->