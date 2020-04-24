<%@ LANGUAGE = VBScript.Encode %>
<!--#include file="PL_config.asp"-->
<!--#include file="PL_Function.asp"-->
<%NClassid=Trim(Request.QueryString("NClassid"))
SClassID=Trim(Request.QueryString("SClassID"))
if SClassID<>"" then
exec="select * from SClass where SClassID="&SClassID  '降序是desc，升序是asc
set rs=server.createobject("adodb.recordset")
rs.open exec,conn,1,1
PL_title=rs("SClass")&" - 专辑列表"
elseif NClassid<>"" then
exec="SELECT * FROM NClass where NClassid="&NClassid
set rs=server.createobject("adodb.recordset")
rs.open exec,conn,1,1
PL_title=rs("NClass")&" - 专辑列表"
else
PL_title="全部专辑列表"
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE><%=PL_title%> - <%=WebName%></TITLE><LINK 
href="pinluo.com_style1/music07css.css" type=text/css rel=stylesheet>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="pinluo.com_style1/music07css.css" type=text/css rel=stylesheet>
<STYLE type=text/css>.STYLE1 {
	FONT-SIZE: 9px; COLOR: #f4ffea
}
</STYLE>

<META content="MSHTML 6.00.6000.16587" name=GENERATOR>
<meta name="keywords" content="<%=Keywords%>">
<meta name="description" content="<%=Keywords%>">
<link href="<%=favicon%>" rel="shortcut icon">
<meta name="generator" content="程序版权：品络科技 - 网站建设和广告设计专家 | PinLuo.Com"></HEAD>
<BODY><!-- 品络音乐系统 导航开始-->
<DIV align=center></DIV><!-- 品络音乐系统 导航结束--><!-- 主要居中部分开始 -->
<DIV id=all><!-- 左边部分开始 -->
<DIV id=leftcont>
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
    <TD height=5></TD></TR></TBODY></TABLE></DIV><!--新歌排行结束 -->
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
<table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD vAlign=top width=10 bgColor=#f4ffea height=11><IMG height=11 
      src="pinluo.com_style1/music07zjqie_26.gif" width=9></TD>
    <TD style="BORDER-TOP: #8dcf46 1px solid" vAlign=top align=right width=747 
    bgColor=#f4ffea height=11><SPAN class=STYLE1>&nbsp;</SPAN></TD>
    <TD vAlign=top align=right width=11 bgColor=#f4ffea height=11><IMG 
      height=11 src="pinluo.com_style1/music07zjqie_29.gif" 
  width=11></TD></TR></TBODY></TABLE>
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=768 border=0>
  <TBODY>
  <TR>
    <TD class=tbline align=middle bgColor=#f4ffea colSpan=2>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
					    <%
'set rs=conn.execute("SELECT * from Special where IsGood=1 order by SpecialID desc")
'set rs=conn.execute("SELECT * from Special order by SpecialID desc, isgood desc")
'rs.open exec,conn,1,1
if NClassid<>"" and SClassID<>"" then
exec="SELECT * FROM Special where NClassid="&NClassid&" and SClassID="&SClassID&" order by SpecialID desc, isgood desc"
elseif SClassID<>"" then
exec="select * from Special where SClassID="&SClassID&" order by SpecialID desc, isgood desc" '降序是desc，升序是asc
elseif NClassid<>"" then
exec="SELECT * FROM Special where NClassid="&NClassid&" order by SpecialID desc, isgood desc"
else
exec="SELECT * FROM Special order by SpecialID desc, isgood desc"', isgood desc
end if
set rs=server.createobject("adodb.recordset")
rs.open exec,conn,1,1

rs.PageSize=5 '定义每页显示多少条信息
pagecount=rs.PageCount 
page=int(request.QueryString ("page"))
if page<=0 then page=1
if request.QueryString("page")="" then
page=1
end if
rs.AbsolutePage=page

maxtiao=rs.recordcount

%>

        <TR>
          <TD vAlign=top align=left width="1%" bgColor=#8dcf46><IMG height=22 
            src="pinluo.com_style1/music07zjqie_69.gif" width=9></TD>
          <TD align=middle width="98%" bgColor=#8dcf46><SPAN class=wirth12b>
            <FORM class=wirth12b method=get>共&nbsp;<FONT color=#ff0000><B><%response.write maxtiao%></B></FONT>&nbsp;张专辑 &nbsp;<A class=wirth12b 
            href="PL_SpecialList.asp?NClassid=<%=NClassid%>&SClassID=<%=SClassID%>&page=1">首页</A>&nbsp; 
            <A class=wirth12b 
            href="PL_SpecialList.asp?NClassid=<%=NClassid%>&SClassID=<%=SClassID%>&page=<%=page-1%>">上一页</A>&nbsp; <A class=wirth12b 
            href="PL_SpecialList.asp?NClassid=<%=NClassid%>&SClassID=<%=SClassID%>&page=<%=page+1%>">下一页</A> &nbsp;<A class=wirth12b 
            href="PL_SpecialList.asp?NClassid=<%=NClassid%>&SClassID=<%=SClassID%>&page=<%=pagecount%>">末页</A> 
            &nbsp;页次：<STRONG><FONT color=#ff0000><%=page%>/<%=pagecount%></FONT></STRONG>&nbsp;页 
            转到：<select name='page' size=1 onchange='javascript:window.location.href=this.options[this.selectedIndex].value'><%for i=1 to pagecount%><option value="?NClassid=<%=NClassid%>&SClassID=<%=SClassID%>&page=<%=i%>"<%if i=page then%> selected<%else%><%end if%>>第<%=i%>页</option><%next%></select></FORM></SPAN></TD>
          <TD vAlign=top align=right width="1%" bgColor=#8dcf46><IMG height=22 
            src="pinluo.com_style1/music07zjqie_72.gif" width=7></TD></TR>
        <TR>
          <TD vAlign=top align=middle colSpan=3>
            <table class="tableBorder" height=160 cellSpacing=5 cellPadding=0 width="100%" 
              border=0><TBODY>
			  
              <!--专辑列表开始-->

			<%for i=1 to rs.PageSize%> 
        <%if rs.EOF then 
        exit for
        end if%>


<TR>			  
<%
for j = 1 to 5
if not rs.eof then  %>			  
                <TD align=middle width="20%" bgColor=#ffffff>
                  <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <TR>
                      <TD align=middle height=134><A 
                        href="PL_showspecial.asp?Specialid=<%=rs("Specialid")%>" 
                        target=_blank><IMG 
                        class=picline height=96 
                        src="<%=rs("pic")%>" 
                        width=96 border=0> </A></TD></TR>
                    <TR>
                      <TD class=gray13tit align=middle height=42><A 
                        class=g13tit title="<%=rs("name")%>" 
                        href="PL_showspecial.asp?Specialid=<%=rs("Specialid")%>" target=_blank><%PL_name=rs("name")
                          if len(PL_name)>10 then PL_name=left(PL_name,10)&"…"
                          response.write PL_name
                            %></A><BR><A class=gray12t title="<%=rs("NClass")%>" 
                        href="PL_Singer.asp?NClassid=<%=rs("NClassID")%>" target=_blank><%PL_NClass=rs("NClass")
                          if len(PL_NClass)>10 then PL_NClass=left(PL_NClass,10)&"…"
                          response.write PL_NClass
                            %></A></TD></TR></TBODY></TABLE></TD>

						 
						<%
						rs.movenext
		end if
next%></TR>

		<%if not rs.EOF then
		rs.movenext
		else
		end if
		  next
		  %>
		  
					
					<!--专辑列表结束-->
					
			  </TBODY></TABLE></TD></TR>
        <TR>
          <TD vAlign=bottom align=left bgColor=#8dcf46><IMG height=22 
            src="pinluo.com_style1/music07zjqie_107.gif" width=9></TD>
          <TD align=middle bgColor=#8dcf46>
            <FORM class=wirth12b method=get>共&nbsp;<FONT color=#ff0000><B><%response.write maxtiao%></B></FONT>&nbsp;张专辑 &nbsp;<A class=wirth12b 
            href="PL_SpecialList.asp?NClassid=<%=NClassid%>&SClassID=<%=SClassID%>&page=1">首页</A>&nbsp; 
            <A class=wirth12b 
            href="PL_SpecialList.asp?NClassid=<%=NClassid%>&SClassID=<%=SClassID%>&page=<%=page-1%>">上一页</A>&nbsp; <A class=wirth12b 
            href="PL_SpecialList.asp?NClassid=<%=NClassid%>&SClassID=<%=SClassID%>&page=<%=page+1%>">下一页</A> &nbsp;<A class=wirth12b 
            href="PL_SpecialList.asp?NClassid=<%=NClassid%>&SClassID=<%=SClassID%>&page=<%=pagecount%>">末页</A> 
            &nbsp;页次：<STRONG><FONT color=#ff0000><%=page%>/<%=pagecount%></FONT></STRONG>&nbsp;页 
            转到：<select name='page' size=1 onchange='javascript:window.location.href=this.options[this.selectedIndex].value'><%for i=1 to pagecount%><option value="?NClassid=<%=NClassid%>&SClassID=<%=SClassID%>&page=<%=i%>"<%if i=page then%> selected<%else%><%end if%>>第<%=i%>页</option><%next%></select></FORM></TD>
          <TD vAlign=bottom align=right bgColor=#8dcf46><IMG height=22 
            src="pinluo.com_style1/music07zjqie_108.gif" 
        width=7></TD></TR></TBODY></TABLE></TD></TR>
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