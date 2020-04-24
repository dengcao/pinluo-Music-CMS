<%@ LANGUAGE = VBScript.Encode %>
<!--#include file="PL_config.asp"-->
<!--#include file="PL_Function.asp"-->
<% '读取当前专辑开始
Specialid=Trim(Request.QueryString("Specialid"))
set rs=server.createobject("adodb.recordset")
sql="SELECT * FROM Special where Specialid = "&Specialid
rs.open sql,conn,1,1
if rs.eof and rs.bof then 
	response.Write("对不起，当前的专辑不存在，可能已经被删除，或没有通过管理员审核。")
    Response.End 
        else
PL_zj_title=rs("Name")
PL_zj_singer=rs("NClass")
		end if%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<HTML><HEAD><TITLE>《<%=PL_zj_title%>》 <%=PL_zj_singer%>   - 专辑查看 - <%=WebName%></TITLE>
<LINK href="pinluo.com_style1/music07css.css" type=text/css rel=stylesheet>
<SCRIPT src="pinluo.com_style1/Js.js"></SCRIPT>
<META content="MSHTML 6.00.6000.16587" name=GENERATOR>
<meta name="keywords" content="<%=Keywords%>">
<meta name="description" content="<%=Keywords%>">
<link href="<%=favicon%>" rel="shortcut icon">
<meta name="generator" content="程序版权：品络科技 - 网站建设和广告设计专家 | PinLuo.Com"></HEAD>
<BODY><!-- 品络音乐系统 导航开始-->
<DIV align=center></DIV><!-- 品络音乐系统 导航结束--><!-- 主要居中部分开始 -->
<DIV id=all><!-- 左边部分开始 -->
<DIV id=leftcont>
<DIV>
<OBJECT 
codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0 
height=180 width=200 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000><PARAM NAME="movie" VALUE="pinluo.com_style1/musiclogo.swf"><PARAM NAME="quality" VALUE="high">
                              <embed src="pinluo.com_style1/musiclogo.swf" quality="high" 
pluginspage="http://www.macromedia.com/go/getflashplayer" 
type="application/x-shockwave-flash" width="200" height="180"></embed>        
</OBJECT>

<!--#include file="PL_INC/PL_inc_login.asp"-->


<DIV><!--新歌排行开始 -->
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
			 
			 </TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
          <TD vAlign=top align=right width=37><IMG height=164 
            src="pinluo.com_style1/music07zjqie_09.gif" width=37 useMap=#Map 
            border=0></TD></TR></TBODY></TABLE>
<TR>
    <TD align=middle>
      <!--#include file="PL_INC/PL_inc_search.asp"--></TD></TR></TBODY></TABLE><MAP id=Map 
name=Map><AREA shape=RECT coords=10,94,35,165 
  href="PL_Speciallist.asp<%if NClassid<>"" then%>?NClassid=<%=NClassid%><%elseif SClassID<>"" then%>?SClassID=<%=SClassID%><%else%><%end if%>"></MAP></DIV>
<DIV id=main>
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=768 border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=left width=9 
    background=pinluo.com_style1/music07zjlin_37.gif><IMG height=11 
      src="pinluo.com_style1/music07zjqie_26.gif" width=9></TD>
    <TD style="BORDER-TOP: #8dcf46 1px solid" vAlign=top width=343 
    bgColor=#effdd6 height=150>
      <table class="tableBorder" cellSpacing=2 cellPadding=2 width="100%" border=0>
        <TBODY>
        <TR>

<% '读取当前专辑开始
set rs=server.createobject("adodb.recordset")
sql="SELECT * FROM Special where Specialid = "&Specialid
rs.open sql,conn,1,1
if rs.eof and rs.bof then 
	response.Write("参数错误，请输入正确的参数")
    Response.End 
        else
Intro=rs("Intro") '专辑简介
	
	 %>
          <TD align=middle width="42%" rowSpan=5><A 
            href="#"><IMG 
            class=picline height=120 alt="专辑：<%=rs("name")%>" 
            src="<%=weblanmu%><%=rs("pic")%>" width=120 
            border=0></A></TD>
          <TD class=gray13tit align=left width="58%" height=20><STRONG>专 
            辑：</STRONG><A class=gray13tit 
            href="#PL_01"><%=rs("name")%></A><BR></TD></TR>
        <TR>
          <TD class=gray13tit align=left height=20><STRONG>歌 手：</STRONG><SPAN 
            class=txt><%=rs("NClass")%></SPAN><BR></TD></TR>
        <TR>
          <TD class=gray13tit align=left height=20><STRONG>语 种：</STRONG><SPAN 
            class=txt><%=rs("yuyan")%></SPAN><BR></TD></TR>
        <TR>
          <TD class=gray13tit align=left height=20><STRONG>发行公司：</STRONG><SPAN 
            class=txt><%=rs("gongsi")%></SPAN></TD></TR>
        <TR>
          <TD class=gray13tit align=left height=20><STRONG>发行时间：</STRONG><SPAN 
            class=txt><%=rs("times")%></SPAN></TD></TR></TBODY></TABLE></TD>
    <TD style="BORDER-TOP: #8dcf46 1px solid" vAlign=top align=middle width=403 
    bgColor=#effdd6>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="91%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=left width=12 bgColor=#8dcf46 height=22><IMG 
            height=22 src="pinluo.com_style1/music07zjqie_32.gif" 
width=11></TD>
          <TD class=wirth12b align=middle width=206 bgColor=#8dcf46 
            height=22><SPAN class=txt><%PL_NClass=rs("NClass")
                          if len(PL_NClass)>9 then PL_NClass=left(PL_NClass,9)&"…"
                          response.write PL_NClass%></SPAN> 专辑列表</TD>
			
          <TD vAlign=top align=right width=10 bgColor=#8dcf46 height=22><IMG 
            height=22 src="pinluo.com_style1/music07zjqie_34.gif" 
width=10></TD>
          <TD class=g12t vAlign=bottom align=right width=140 height=22><A 
            class=g12t 
            href="PL_speciallist.asp?nclassid=<%NClassID=rs("nclassid")
			response.Write NClassID%>">&lt;&lt;更多</A></TD></TR></TBODY></TABLE>
					
			<%rs.close '读取结束
			end if
			
			set rs=server.createobject("adodb.recordset")
sql="SELECT * FROM Special where NClassID = "&NClassID&" order by SpecialID desc, isgood desc"
rs.open sql,conn,1,1
PL_zj_i=0
PL_zj_max=4 '最多显示该歌手的4个相关专辑
			%>
						
      <DIV id=foler><table class="tableBorder" height=98 cellSpacing=5 cellPadding=0 width="100%" border=0>
  <TBODY>  <TR><%
do while not rs.eof
PL_zj_i=PL_zj_i+1
	 %>

    <TD vAlign=top align=middle width="20%" height=88>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD align=middle><A title="最新专辑：<%=rs("name")%>" 
            href="PL_ShowSpecial.asp?Specialid=<%=rs("Specialid")%>" 
            target=_parent><IMG class=picline height=80 
            alt="最新专辑：<%=rs("name")%>" 
            src="<%=weblanmu%><%=rs("pic")%>" width=80 
            border=0></A></TD></TR>
        <TR>
          <TD class=g13tit align=middle><A class=green12u 
            title="最新专辑：<%=rs("name")%>" 
            href="Pl_ShowSpecial.asp?Specialid=<%=rs("Specialid")%>" 
            target=_parent><%PL_name=rs("name")
                          if len(PL_name)>6 then PL_name=left(PL_name,6)&"…"
                          response.write PL_name
                            %></A></TD></TR></TBODY></TABLE></TD>
			
						<%
if PL_zj_i>=PL_zj_max then exit do
rs.movenext
loop
rs.close '读取结束
%>
			
			</TR></TBODY></TABLE></DIV></TD>

    <TD vAlign=top align=right width=11 
    background=pinluo.com_style1/music07zjlin_38.gif><IMG height=11 
      src="pinluo.com_style1/music07zjqie_29.gif" 
width=11></TD></TR></TBODY></TABLE>
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=768 border=0>
  <TBODY>
  <TR>
    <TD class=tbline align=middle bgColor=#f4ffea colSpan=2>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=left width="1%" bgColor=#8dcf46><IMG height=22 
            src="pinluo.com_style1/music07zjqie_69.gif" width=9><a name="PL_01"></a></TD>
          <TD align=middle width="98%" bgColor=#8dcf46>
            <table class="tableBorder" cellSpacing=0 borderColorDark=#ecffd9 cellPadding=0 
            width="100%" borderColorLight=#000000 border=0>
              <TBODY>
			  
			  <% '读取该专辑下的歌曲列表
				set rs=server.createobject("adodb.recordset")
sql="SELECT * FROM MusicList where Specialid = "&Specialid
rs.open sql,conn,1,1
if rs.eof and rs.bof then 
	response.Write("参数错误，请输入正确的参数")
    Response.End 
        else
PL_i=0
PL_max=rs.recordcount
%>
			  
              <TR>
                <TD class=wirth12b align=middle>
                  <FORM class=wirth12b  action=PL_showspecial.asp?classid=9&amp;Sclassid=47&amp;Nclassid=248&amp;Specialid=2126 
                  method=post>共<FONT color=#ff0000><B>&nbsp;<%=PL_max%>&nbsp;</B></FONT>首 &nbsp;首页 
                  上一页&nbsp; 下一页 末页 &nbsp;页次:<STRONG><FONT 
                  color=#ff0000>1/1</FONT></STRONG>页 转到: <SELECT 
                  onchange=javascript:submit() size=1 name=page> <OPTION 
                    value=1 selected>第1页</OPTION></SELECT> 
            </FORM></TD></TR></TBODY></TABLE></TD>
          <TD vAlign=top align=right width="1%" bgColor=#8dcf46><IMG height=22 
            src="pinluo.com_style1/music07zjqie_72.gif" width=7></TD></TR>
        <TR>
          <TD vAlign=top align=middle colSpan=3>
            <table class="tableBorder" borderColor=#8dcf46 cellSpacing=1 cellPadding=2 width="100%" 
            bgColor=#8dcf46 border=0>
              <FORM name=song onSubmit="javascript:return lbsong(this);" 
              action=Play.asp target=Listen>
              <TBODY>
              <TR>
                <TD class=g13tit align=middle width="5%" bgColor=#f3f3f3 
                height=30><STRONG class=sg12b>选择</STRONG></TD>
                <TD class=sg12b align=middle width="39%" bgColor=#f3f3f3 
                height=30>歌曲名称</TD>
                <TD class=sg12b align=middle width="5%" bgColor=#f3f3f3 
                height=30>点击数</TD>
                <TD class=sg12b align=middle width="5%" bgColor=#f3f3f3 
                height=30>试听</TD>
                <TD class=sg12b align=middle width="5%" bgColor=#f3f3f3 
                height=30>下载</TD>
                <TD class=sg12b align=middle width="5%" bgColor=#f3f3f3 
                height=30>歌词</TD>
                <TD class=sg12b align=middle width="5%" bgColor=#f3f3f3 
                height=30>点播</TD>
                <TD class=sg12b align=middle width="5%" bgColor=#f3f3f3 
                height=30>收藏</TD></TR>
				
				<%
do while not rs.eof
PL_i=PL_i+1
	 %>
	 
              <TR>
                <TD align=middle width="5%" bgColor=#ffffff 
                  height=28><LABEL><INPUT id=id type=checkbox value="<%=rs("id")%>" 
                  name=id> </LABEL></TD>
                <TD class=gray13tit align=left bgColor=#ffffff height=28><%=PL_i%>.<A 
                  class=gray13tit 
                  href="javascript:open_window('Play.asp?id=<%=rs("id")%>','Listen','width=275,height=116')"><%=rs("musicname")%></A></TD>
                <TD class=gray13tit align=middle width="5%" bgColor=#ffffff 
                height=28><SPAN class=txt><%=rs("hits")%></SPAN></TD>
                <TD align=middle width="5%" bgColor=#ffffff height=28><A 
                  href="javascript:open_window1('Play.asp?id=<%=rs("id")%>','Listen','width=275,height=116')"><IMG 
                  height=15 src="pinluo.com_style1/music07zjqie_77.gif" 
                  width=15 border=0></A> </TD>
                <TD align=middle width="5%" bgColor=#ffffff height=28><A 
                  onclick="return call(this.href);" 
                  href="PL_download.asp?id=<%=rs("id")%>" 
                  target=_blank><IMG height=16 
                  src="pinluo.com_style1/music07zjqie_79.gif" width=16 
                  border=0></A> </TD>
                <TD align=middle width="5%" bgColor=#ffffff height=28><A 
                  href="http://so.mp3.qihoo.com/index.html?kw=<%=rs("singer")%> - <%=rs("musicname")%>&amp;m=171096&amp;type=6" 
                  target=_blank><IMG height=16 
                  src="pinluo.com_style1/music07zjqie_81.gif" width=16 
                  border=0></A></TD>
                <TD align=middle width="5%" bgColor=#ffffff height=28><A 
                  href="javascript:open_window('User/PL_WriteSMusic.asp?id=<%=rs("id")%>','WriteSMusic','width=397,height=322,scrollbars=no')"><IMG 
                  height=13 src="pinluo.com_style1/music07zjqie_84.gif" 
                  width=14 border=0></A></TD>
                <TD align=middle width="5%" bgColor=#ffffff height=28><A 
                  href="javascript:open_window('User/PL_UserCollect.asp?action=add&amp;id=<%=rs("id")%>','WriteSMusic','width=778,height=400,scrollbars=no')"><IMG 
                  height=14 src="pinluo.com_style1/music07zjqie_87.gif" 
                  width=13 border=0></A></TD></TR>
				  
				  			
			<%
if PL_i>=PL_max then exit do
rs.movenext
loop
rs.close '读取歌曲列表结束
			end if%>
			             
              
			  
              <TR>
                <TD align=middle bgColor=#f3f3f3 colSpan=8 height=32><A 
                  href="javascript:CheckAll(song)"><IMG height=20 
                  src="pinluo.com_style1/music07zjqie_95.gif" width=42 
                  border=0></A>&nbsp;&nbsp;&nbsp;&nbsp;<A 
                  href="javascript:CheckOthers(song)"><IMG height=20 
                  src="pinluo.com_style1/music07zjqie_97.gif" width=42 
                  border=0></A>&nbsp;&nbsp;&nbsp;&nbsp;<INPUT type=image 
                  height=20 width=42 
                  src="pinluo.com_style1/music07zjqie_99.gif">&nbsp;&nbsp;&nbsp;&nbsp;<A 
                  href="javascript:open_window('PL_upload.asp','_blank','width=378,height=393 scrollbars=no')"><IMG 
                  height=20 src="pinluo.com_style1/music07zjqie_101.gif" 
                  width=69 border=0></A></TD></TR>

				  </FORM></TBODY></TABLE></TD></TR>
        <TR>
          <TD vAlign=bottom align=left bgColor=#8dcf46><IMG height=22 
            src="pinluo.com_style1/music07zjqie_107.gif" width=9></TD>
          <TD align=middle bgColor=#8dcf46>
            <FORM class=wirth12b 
            action=jngd_showspecial.asp?classid=9&amp;Sclassid=47&amp;Nclassid=248&amp;Specialid=2126 
            method=post>共<FONT color=#ff0000><B>&nbsp;<%=PL_max%>&nbsp;</B></FONT>首 &nbsp;首页 
            上一页&nbsp; 下一页 末页 &nbsp;页次:<STRONG><FONT 
            color=#ff0000>1/1</FONT></STRONG>页 转到: <SELECT 
            onchange=javascript:submit() size=1 name=page> <OPTION value=1 
              selected>第1页</OPTION></SELECT> </FORM>
            <table class="tableBorder" cellSpacing=0 borderColorDark=#ecffd9 cellPadding=0 
            width="100%" borderColorLight=#000000 border=0>
              <TBODY>
              <TR>
                <TD class=wirth12b align=middle></TD></TR></TBODY></TABLE></TD>
          <TD vAlign=bottom align=right bgColor=#8dcf46><IMG height=22 
            src="pinluo.com_style1/music07zjqie_108.gif" 
        width=7></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline align=middle bgColor=#f4ffea colSpan=2>
      <DIV 
      style="OVERFLOW-Y: auto; OVERFLOW-X: hidden; WIDTH: 760px; HEIGHT: 300px">
      <table class="tableBorder" cellSpacing=2 cellPadding=2 width="95%" border=0>
        <TBODY>
        <TR>
          <TD class=gray13tit align=left 
height=25><STRONG>专辑简介：</STRONG></TD></TR>
        <TR>
          <TD class=gray13tit align=left>
            <P><%if Intro<>null then
			response.Write Intro
			else
			response.Write("暂无简介。")
			end if%></P></TD></TR></TBODY></TABLE></DIV></TD></TR>
  <TR>
    <TD vAlign=bottom align=left 
    background=pinluo.com_style1/music07zjlin_116.gif bgColor=#f4ffea 
    height=11><IMG height=11 src="pinluo.com_style1/music07zjqie_111.gif" 
      width=9></TD>
    <TD vAlign=bottom align=right 
    background=pinluo.com_style1/music07zjlin_116.gif bgColor=#f4ffea 
    height=11><IMG height=11 src="pinluo.com_style1/music07zjqie_112.gif" 
      width=11></TD></TR></TBODY></TABLE></DIV><!-- 右边主要内容结束 --></DIV>
	  <!-- 主要居中部分结束 -->
<!--#include file="PL_bottom.asp"-->