<%@ LANGUAGE = VBScript.Encode %>
<!--#include file="PL_config.asp"-->
<!--#include file="PL_Function.asp"-->
<!--#include file="PL_INC/PL_index_Function.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE><%=WebName%></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="pinluo.com_style1/music07css.css" type=text/css rel=stylesheet>
<SCRIPT src="pinluo.com_style1/Js.js"></SCRIPT>
<META content="MSHTML 6.00.6000.16587" name=GENERATOR>
<meta name="keywords" content="<%=Keywords%>">
<meta name="description" content="<%=Keywords%>">
<link href="<%=favicon%>" rel="shortcut icon">
<meta name="generator" content="程序版权：品络科技 - 网站建设和广告设计专家 | PinLuo.Com"></HEAD>
<BODY><!-- 品络音乐系统 导航开始-->
<DIV align=center></DIV><!-- 品络音乐系统 导航结束--><!-- 主要第一屏部分开始 -->
<DIV id=rows1><!-- 左边部分开始 -->
<DIV id=leftcont>
<DIV>
<OBJECT 
codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0 
height=180 width=200 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000><PARAM NAME="movie" VALUE="pinluo.com_style1/musiclogo.swf"><PARAM NAME="quality" VALUE="high">
                              <embed src="pinluo.com_style1/musiclogo.swf" quality="high" 
pluginspage="http://www.macromedia.com/go/getflashplayer" 
type="application/x-shockwave-flash" width="200" height="180"></embed>        
</OBJECT></DIV>
<DIV>
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=200 border=0>
  <TBODY>
  <TR>
    <TD vAlign=top background=pinluo.com_style1/music07zjqie_13.gif height=87>
      <%if len(Request.Cookies("Www_PinLuo_Com_user")("PL_usercheck"))<>32 then%>
	  <table class="tableBorder" cellSpacing=0 cellPadding=0 width=200 border=0>
        <FORM name=userlogin method="post" action="user/UserChkLogin.asp" target="_parent">
        <TBODY>
        <TR>
          <TD vAlign=top width=13><IMG height=32 
            src="pinluo.com_style1/music07zjqie_11.gif" width=13></TD>
          <TD class=wirth12b align=right width=46>帐号：</TD>
          <TD width=141><INPUT class=finput id=UserName name=UserName> </TD></TR>
        <TR>
          <TD width=13>&nbsp;</TD>
          <TD class=wirth12b align=right height=30>密码：</TD>
          <TD height=30><INPUT class=finput id=password type=password 
            name=password></TD></TR>
        <TR>
          <TD colSpan=3 height=30>
            <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD align=middle width="21%" bgColor=#a9e148 height=29>
                  <DIV align=center><A href="Reg.asp" 
                  target=_blank><IMG height=20 src="pinluo.com_style1/but1_17.gif" 
                  width=42 border=0></A></DIV></TD>
                <TD align=middle width="23%" bgColor=#a9e148><INPUT type=image 
                  height=20 width=42 src="pinluo.com_style1/but_17.gif" align=middle 
                  target="('Reg.asp','_blank','')"> </TD>
                <TD align=middle width="35%" bgColor=#a9e148>
                  <DIV align=center><A 
                  href="javascript:open_window('PL_upload.asp','_blank','width=378,height=393 scrollbars=no')"><IMG 
                  height=20 src="pinluo.com_style1/but_19.gif" width=65 
                  border=0></A></DIV></TD></TR></TBODY></TABLE></TD></TR></FORM></TBODY></TABLE>
	<%else%>
	  <table class="tableBorder" width="200" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="13" valign="top"><img src="pinluo.com_style1/music07zjqie_11.gif" width="13" height="32" /></td>
                  <td width="187" colspan="2" rowspan="2" align="center" class="wirth12b">欢迎您：<font color=#FF00FF><%=Request.Cookies("Www_PinLuo_Com_user")("PL_username")%></font></a>  <br> <a href="User/PL_messanger.asp?action=sendin" target=_blank class="txt">点歌单(新收到0次点歌)</a>  <br> <a href="User/PL_UserCollect.asp?action=show" target="messanger" class="txt">我的音乐收藏夹</a><br />
                  <a href="javascript:open_window('PL_upload.asp','_blank','width=370,height=390,scrollbars=no')" class="txt" >上传我喜欢的歌曲</a><br />
                </td>
                </tr>
                <tr>
                  <td width="13" height="30">&nbsp;</td>
                </tr>
                <tr>
                  <td height="30" colspan="3"><table class="tableBorder" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="21%" height="29" align="center" bgcolor="#a9e148"><input type="image" src="pinluo.com_style1/but_18.gif" width="42" height="20"  onclick="javascript:window.open('User/PL_UserLogout.asp','_top','')"/></td>
                      <td width="23%" align="center" bgcolor="#a9e148"><input type="image" src="pinluo.com_style1/but1_18.gif" width="42" height="20" onClick="javascript:window.open('User/PL_UserModify.asp','_blank','')" /></td>
                       <td width="35%" align="center" bgcolor="#a9e148"><a href="javascript:open_window('PL_upload.asp','_blank','width=378,height=393,scrollbars=no')"><img src="pinluo.com_style1/but_19.gif" width="65" height="20" border="0" /></a></td>
                    </tr>
                   </table></td>
                </tr>
              </table>
	  <%end if%>
	  </TD></TR>
  <TR>
    <TD height=1><IMG height=1 src="pinluo.com_style1/music07zjqie_21.gif" 
    width=200></TD></TR>
  <TR>
    <TD align=middle bgColor=#baeb51 height=5></TD></TR>
  <TR>
    <TD align=middle bgColor=#baeb51 height=32>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="96%" border=0>
        <TBODY>
        <TR>
          <TD class=black12 align=left 
            height=22><%=webname%>于2007年国庆全新改版，增加人气排名;增加网友上传功能，网友通过注册成为会员，就可拥有上传功能，可以将你喜爱的歌曲与网友共享。这次改版全心致力于提供更多更好听的歌曲并与网友共建网上乐园！</TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD><IMG height=13 src="pinluo.com_style1/music07zjqie_40.gif" width=200></TD></TR>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE></DIV></DIV><!-- 左边部分结束 --><!-- 右边主要内容开始 -->


<!--#include file="PL_INC/PL_top.asp"-->



<DIV id=newdisc>
<STYLE type=text/css>BODY {
	MARGIN: 0px
}
</STYLE>

<table class="tableBorder" cellSpacing=0 cellPadding=0 width=780 border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=left width=12 rowSpan=2><IMG height=18 
      src="pinluo.com_style1/music07zjqie_06.gif" width=12></TD>
    <TD vAlign=top align=left>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=left width=41><IMG height=302 
            src="pinluo.com_style1/music07homeqie_03.gif" width=46></TD>
          <TD class=tbline1 bgColor=#eefdcc>
             <table class="tableBorder" height=160 cellSpacing=5 cellPadding=0 width="100%" 
              border=0><TBODY>
              
			<!--新专辑列表开始-->
			    <%
'set rs=conn.execute("SELECT * from Special where IsGood=1 order by SpecialID desc")
set rs=conn.execute("SELECT * from Special order by SpecialID desc, isgood desc")
for i = 2 to 3
%><TR>
<%for j = 1 to 5
if not rs.eof then  %>
                <TD align=middle width="20%" bgColor=#ffffff>
                  <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <TR>
                      <TD align=middle><A title="最新专辑：<%=rs("name")%>&nbsp;&nbsp;<%=rs("NClass")%>&nbsp;&nbsp;<%=rs("times")%> "
                        href="PL_ShowSpecial.asp?Specialid=<%=rs("SpecialID")%>" 
                        target=_self><IMG class=picline height=96 alt="最新专辑：<%=rs("name")%>&nbsp;&nbsp;<%=rs("NClass")%>&nbsp;&nbsp;<%=rs("times")%>" src="<%=rs("pic")%>" width=96 
                        border=0></A></TD></TR>
                    <TR>				
                      <TD class=g13tit align=middle><A class=g13tit 
                        title="最新专辑：<%=rs("name")%>&nbsp;&nbsp;<%=rs("NClass")%>&nbsp;&nbsp;<%=rs("times")%>"  
                        href="PL_ShowSpecial.asp?Specialid=<%=rs("SpecialID")%>" 
                        target=_self><%PL_name=rs("name")
                          if len(PL_name)>9 then PL_name=left(PL_name,9)&"…"
                          response.write PL_name
                            %></A></TD></TR>
                    <TR>
                      <TD class=gray13tit align=middle><A class=gray12t title="<%=rs("NClass")%>" href="PL_Singer.asp?NClassid=<%=rs("nclassID")%>"><%PL_NClass5=rs("NClass")
                          if len(PL_NClass5)>9 then PL_NClass5=left(PL_NClass5,9)&"…"
                          response.write PL_NClass5%></A></TD></TR></TBODY></TABLE></TD>
						
<%rs.movenext
         end if
next%></TR>
<%next %>
<%rs.close%>
			<!--新专辑列表结束-->
			
              <TR></TR></TBODY></TABLE></TD>
          <TD vAlign=top align=right width=37><IMG 
            height=302 src="pinluo.com_style1/music07homeqie_05.gif" width=37 
            useMap=#Map border=0></TD>
        </TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD align=middle>
      

      <!--#include file="PL_INC/PL_inc_search.asp"--></TD></TR></TBODY></TABLE></DIV><!-- 右边主要内容结束 --></DIV><!-- 第一屏部分结束 --><!-- 第二部分开始 -->
<DIV id=rows2><!-- 第二部分新歌排行开始 -->
<DIV id=ph1>

<table class="tableBorder" cellSpacing=0 cellPadding=0 width=320 border=0>
  <FORM name=song1 onSubmit="javascript:return lbsong(this);" action=play.asp 
  target=Listen>
  <TBODY>
  <TR>
    <TD class=gnavt14line align=middle 
    background=pinluo.com_style1/music07homeqie_10.gif colSpan=5 height=33>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="18%">&nbsp;</TD>
          <TD align=left 
    width="82%"><a href="PL_Speciallist.asp" target="_self" class=wtit14line>新歌排行</a></TD>
        </TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <!--读取新歌列表-->
	  <%call PL_Index_Showsonglist("new",10) '读取前10首新歌%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song1)"><IMG class=hand 
      title=选择显示的所有歌曲 height=20 alt=选择显示的所有歌曲 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="全 选"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song1)"><IMG 
      id=chkOthers height=20 alt=反向选择歌曲 src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=请先选择你想听的歌曲后再点击连播 width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- 第二部分新歌排行结束 --><!-- 第二部分歌曲排行开始 -->
<DIV id=ph2>

<table class="tableBorder" cellSpacing=0 cellPadding=0 width=320 border=0>
  <FORM name=song2 onSubmit="javascript:return lbsong(this);" action=play.asp 
  target=Listen>
  <TBODY>
  <TR>
    <TD class=gnavt14line align=middle 
    background=pinluo.com_style1/music07homeqie_10.gif colSpan=5 height=33>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="18%">&nbsp;</TD>
          <TD class=wtit14line align=left 
    width="82%"><a href="PL_Speciallist.asp" target="_self" class=wtit14line>单曲排行</a></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist("hot",10) '读取前10首热门歌%>
	  
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song2)"><IMG class=hand 
      title=选择显示的所有歌曲 height=20 alt=选择显示的所有歌曲 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="全 选"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song2)"><IMG 
      id=chkOthers height=20 alt=反向选择歌曲 src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=请先选择你想听的歌曲后再点击连播 width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- 第二部分歌曲排行结束 --><!-- 第二部分歌手排行开始 -->
<DIV id=ph3>
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=320 border=0>
  <TBODY>
  <TR>
    <TD background=pinluo.com_style1/music07homeqie_10.gif height=33>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
	    <FORM name=song11 onSubmit="javascript:return lbsong(this);" action=play.asp 
  target=Listen>
        <TBODY>
        <TR>
          <TD width="18%">&nbsp;</TD>
          <TD class=wtit14line align=left 
    width="82%"><a href="PL_Speciallist.asp" target="_self" class=wtit14line>推荐歌曲</a></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle bgColor=#ffffff height=254>
	
	<%call PL_Index_Showsonglist("isgood",10) '读取前10首推荐歌%>
    </TD></TR>
  <TR>
    <TD class=sg12b align=middle background=pinluo.com_style1/music07homeqie_25.gif 
    height=28><A href="javascript:CheckAll(song11)"><IMG class=hand 
      title=选择显示的所有歌曲 height=20 alt=选择显示的所有歌曲 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="全 选"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song11)"><IMG 
      id=chkOthers height=20 alt=反向选择歌曲 src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=请先选择你想听的歌曲后再点击连播 width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></TBODY></FORM></TABLE></DIV><!-- 第二部分歌手排行结束 --></DIV><!-- 第二部分结束 --><!-- 第三部分开始 -->
<DIV id=rows3><!-- 第三部分老歌排行开始 -->
<DIV id=ph4>

<table class="tableBorder" cellSpacing=0 cellPadding=0 width=320 border=0>
  <FORM name=song3 onSubmit="javascript:return lbsong(this);" action=play.asp 
  target=Listen>
  <TBODY>
  <TR>
    <TD class=gnavt14line align=middle 
    background=pinluo.com_style1/music07homeqie_10.gif colSpan=5 height=33>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="18%">&nbsp;</TD>
          <TD class=wtit14line align=left 
      width="82%"><a href="PL_ShowSinger.asp?SClassid=1" target="_self" class=wtit14line>华人男歌手最新歌曲</a></TD>
        </TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist(1,10) '读取前10首栏目ID为1的歌曲。%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song3)"><IMG class=hand 
      title=选择显示的所有歌曲 height=20 alt=选择显示的所有歌曲 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="全 选"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song3)"><IMG 
      id=chkOthers height=20 alt=反向选择歌曲 src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=请先选择你想听的歌曲后再点击连播 width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- 第三部分老歌排行结束 --><!-- 第三部分电影排行开始 -->
<DIV id=ph5>

<table class="tableBorder" cellSpacing=0 cellPadding=0 width=320 border=0>
  <FORM name=song4 onSubmit="javascript:return lbsong(this);" action=play.asp 
  target=Listen>
  <TBODY>
  <TR>
    <TD class=gnavt14line align=middle 
    background=pinluo.com_style1/music07homeqie_10.gif colSpan=5 height=33>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="18%">&nbsp;</TD>
          <TD class=wtit14line align=left 
      width="82%"><a href="PL_ShowSinger.asp?SClassid=2" target="_self" class=wtit14line>华人女歌手最新歌曲</a></TD>
        </TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist(2,10) '读取前10首栏目ID为2的歌曲。%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song4)"><IMG class=hand 
      title=选择显示的所有歌曲 height=20 alt=选择显示的所有歌曲 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="全 选"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song4)"><IMG 
      id=chkOthers height=20 alt=反向选择歌曲 src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=请先选择你想听的歌曲后再点击连播 width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- 第三部分电影排行结束 --><!-- 第三部分轻音乐排行开始 -->
<DIV id=ph6>

<table class="tableBorder" cellSpacing=0 cellPadding=0 width=320 border=0>
  <FORM name=song5 onSubmit="javascript:return lbsong(this);" action=play.asp 
  target=Listen>
  <TBODY>
  <TR>
    <TD class=gnavt14line align=middle 
    background=pinluo.com_style1/music07homeqie_10.gif colSpan=5 height=33>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="18%">&nbsp;</TD>
          <TD class=wtit14line align=left 
    width="82%"><a href="PL_ShowSinger.asp?SClassid=3" target="_self" class=wtit14line>华人组合 最新歌曲</a></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist(3,10) '读取前10首栏目ID为3的歌曲。%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song5)"><IMG class=hand 
      title=选择显示的所有歌曲 height=20 alt=选择显示的所有歌曲 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="全 选"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song5)"><IMG 
      id=chkOthers height=20 alt=反向选择歌曲 src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=请先选择你想听的歌曲后再点击连播 width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- 第三部分轻音乐结束 --></DIV><!-- 第三部分结束 -->

<!-- 第六部分老歌排行开始 -->
<DIV id=rows3>
<DIV id=ph4>

<table class="tableBorder" cellSpacing=0 cellPadding=0 width=320 border=0>
  <FORM name=song12 onSubmit="javascript:return lbsong(this);" action=play.asp 
  target=Listen>
  <TBODY>
  <TR>
    <TD class=gnavt14line align=middle 
    background=pinluo.com_style1/music07homeqie_10.gif colSpan=5 height=33>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="18%">&nbsp;</TD>
          <TD class=wtit14line align=left 
      width="82%"><a href="PL_ShowSinger.asp?SClassid=4" target="_self" class=wtit14line>日韩男歌手最新歌曲</a></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist(4,10) '读取前10首栏目ID为4的歌曲。%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song12)"><IMG class=hand 
      title=选择显示的所有歌曲 height=20 alt=选择显示的所有歌曲 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="全 选"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song12)"><IMG 
      id=chkOthers height=20 alt=反向选择歌曲 src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=请先选择你想听的歌曲后再点击连播 width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- 第三部分老歌排行结束 --><!-- 第三部分电影排行开始 -->
<DIV id=ph5>

<table class="tableBorder" cellSpacing=0 cellPadding=0 width=320 border=0>
  <FORM name=song13 onSubmit="javascript:return lbsong(this);" action=play.asp 
  target=Listen>
  <TBODY>
  <TR>
    <TD class=gnavt14line align=middle 
    background=pinluo.com_style1/music07homeqie_10.gif colSpan=5 height=33>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="18%">&nbsp;</TD>
          <TD class=wtit14line align=left 
      width="82%"><a href="PL_ShowSinger.asp?SClassid=5" target="_self" class=wtit14line>日韩女歌手最新歌曲</a></TD>
        </TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist(5,10)%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song13)"><IMG class=hand 
      title=选择显示的所有歌曲 height=20 alt=选择显示的所有歌曲 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="全 选"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song13)"><IMG 
      id=chkOthers height=20 alt=反向选择歌曲 src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=请先选择你想听的歌曲后再点击连播 width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- 第三部分电影排行结束 --><!-- 第三部分轻音乐排行开始 -->
<DIV id=ph6>

<table class="tableBorder" cellSpacing=0 cellPadding=0 width=320 border=0>
  <FORM name=song14 onSubmit="javascript:return lbsong(this);" action=play.asp 
  target=Listen>
  <TBODY>
  <TR>
    <TD class=gnavt14line align=middle 
    background=pinluo.com_style1/music07homeqie_10.gif colSpan=5 height=33>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="18%">&nbsp;</TD>
          <TD class=wtit14line align=left 
    width="82%"><a href="PL_ShowSinger.asp?SClassid=6" target="_self" class=wtit14line>日韩组合 最新歌曲</a></TD>
        </TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist(6,10)%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song14)"><IMG class=hand 
      title=选择显示的所有歌曲 height=20 alt=选择显示的所有歌曲 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="全 选"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song14)"><IMG 
      id=chkOthers height=20 alt=反向选择歌曲 src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=请先选择你想听的歌曲后再点击连播 width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- 第三部分轻音乐结束 --></DIV><!-- 第六部分结束 -->

<!-- 第七部分老歌排行开始 -->
<DIV id=rows3>
<DIV id=ph4>

<table class="tableBorder" cellSpacing=0 cellPadding=0 width=320 border=0>
  <FORM name=song15 onSubmit="javascript:return lbsong(this);" action=play.asp 
  target=Listen>
  <TBODY>
  <TR>
    <TD class=gnavt14line align=middle 
    background=pinluo.com_style1/music07homeqie_10.gif colSpan=5 height=33>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="18%">&nbsp;</TD>
          <TD class=wtit14line align=left 
      width="82%"><a href="PL_ShowSinger.asp?SClassid=7" target="_self" class=wtit14line>欧美歌手 最新歌曲</a></TD>
        </TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist(7,10)%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song15)"><IMG class=hand 
      title=选择显示的所有歌曲 height=20 alt=选择显示的所有歌曲 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="全 选"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song15)"><IMG 
      id=chkOthers height=20 alt=反向选择歌曲 src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=请先选择你想听的歌曲后再点击连播 width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- 第三部分老歌排行结束 --><!-- 第三部分电影排行开始 -->
<DIV id=ph5>

<table class="tableBorder" cellSpacing=0 cellPadding=0 width=320 border=0>
  <FORM name=song16 onSubmit="javascript:return lbsong(this);" action=play.asp 
  target=Listen>
  <TBODY>
  <TR>
    <TD class=gnavt14line align=middle 
    background=pinluo.com_style1/music07homeqie_10.gif colSpan=5 height=33>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="18%">&nbsp;</TD>
          <TD class=wtit14line align=left 
      width="82%"><a href="PL_ShowSinger.asp?SClassid=8" target="_self" class=wtit14line>影视音乐 最新歌曲</a></TD>
        </TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist(8,10)%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song16)"><IMG class=hand 
      title=选择显示的所有歌曲 height=20 alt=选择显示的所有歌曲 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="全 选"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song16)"><IMG 
      id=chkOthers height=20 alt=反向选择歌曲 src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=请先选择你想听的歌曲后再点击连播 width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- 第三部分电影排行结束 --><!-- 第三部分轻音乐排行开始 -->
<DIV id=ph6>

<table class="tableBorder" cellSpacing=0 cellPadding=0 width=320 border=0>
  <FORM name=song17 onSubmit="javascript:return lbsong(this);" action=play.asp 
  target=Listen>
  <TBODY>
  <TR>
    <TD class=gnavt14line align=middle 
    background=pinluo.com_style1/music07homeqie_10.gif colSpan=5 height=33>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="18%">&nbsp;</TD>
          <TD class=wtit14line align=left 
    width="82%"><a href="PL_ShowSinger.asp?SClassid=9" target="_self" class=wtit14line>ＤＪ舞曲 最新歌曲</a></TD>
        </TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist(9,10)%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song17)"><IMG class=hand 
      title=选择显示的所有歌曲 height=20 alt=选择显示的所有歌曲 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="全 选"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song17)"><IMG 
      id=chkOthers height=20 alt=反向选择歌曲 src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=请先选择你想听的歌曲后再点击连播 width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- 第三部分轻音乐结束 --></DIV><!-- 第七部分结束 -->

<!-- 第四部分开始 -->
<DIV id=rows4><!-- 第四部分网友上传开始 -->
<DIV id=upload>

<table class="tableBorder" cellSpacing=0 cellPadding=0 width=320 border=0>
  <FORM name=song6 onSubmit="javascript:return lbsong(this);" action=play.asp 
  target=Listen>
  <TBODY>
  <TR>
    <TD class=gnavt14line align=middle 
    background=pinluo.com_style1/music07homeqie_34.gif colSpan=5 height=33>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="25%">&nbsp;</TD>
          <TD class=wtit14line align=left 
    width="75%"><a href="PL_ShowSinger.asp?SClassid=12" target="_self" class=wtit14line>影视合辑 最新歌曲</a></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=127>
      <%call PL_Index_Showsonglist(12,6) '读取前6首栏目ID为9的歌曲。%></TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song6)"><IMG class=hand 
      title=选择显示的所有歌曲 height=20 alt=选择显示的所有歌曲 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="全 选"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song6)"><IMG 
      id=chkOthers height=20 alt=反向选择歌曲 src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=请先选择你想听的歌曲后再点击连播 width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- 第四部分网友上传结束 --><!-- 第四部分点播开始 -->
<DIV id=player>
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=654 border=0>
  <TBODY>
  <TR>
    <TD background=pinluo.com_style1/music07homeqie_35.gif height=33>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="11%">&nbsp;</TD>
          <TD class=wtit14line align=left 
    width="89%">温馨点歌吧</TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle bgColor=#ffffff height=135>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="99%" border=0>
        <TBODY>
        <TR>
          <TD align=left bgColor=#f3f3f3 height=22><SPAN class=org12><SPAN 
            class=gray12t>·</SPAN>chenbingcai</SPAN><SPAN 
            class=gray12t>为</SPAN><SPAN class=blue12>wo</SPAN><SPAN 
            class=gray12t>点播</SPAN><A 
            href="javascript:open_window('ShowMusic.asp?id=28193','Listen','width=376,height=150,scrollbars=no')"><SPAN 
            class=green12u>[原来我一直都不孤单]</SPAN></A><SPAN 
            class=gray12t>附言:祝你年年发财,事事如意......</SPAN></TD></TR>
        <TR>
          <TD align=left bgColor=#ffffff height=22><SPAN class=org12><SPAN 
            class=gray12t>·</SPAN>楼上的猫</SPAN><SPAN class=gray12t>为</SPAN><SPAN 
            class=blue12>巧克力糖球</SPAN><SPAN class=gray12t>点播</SPAN><A 
            href="javascript:open_window('ShowMusic.asp?id=10723','Listen','width=376,height=150,scrollbars=no')"><SPAN 
            class=green12u>[烟花]</SPAN></A><SPAN 
            class=gray12t>附言:祝你年年发财,事事如意......</SPAN></TD></TR>
        <TR>
          <TD align=left bgColor=#f3f3f3 height=22><SPAN class=org12><SPAN 
            class=gray12t>·</SPAN>楼上的猫</SPAN><SPAN class=gray12t>为</SPAN><SPAN 
            class=blue12>巧克力糖球</SPAN><SPAN class=gray12t>点播</SPAN><A 
            href="javascript:open_window('ShowMusic.asp?id=14855','Listen','width=376,height=150,scrollbars=no')"><SPAN 
            class=green12u>[偶遇]</SPAN></A><SPAN 
            class=gray12t>附言:祝你年年发财,事事如意......</SPAN></TD></TR>
        <TR>
          <TD align=left bgColor=#ffffff height=22><SPAN class=org12><SPAN 
            class=gray12t>·</SPAN>楼上的猫</SPAN><SPAN class=gray12t>为</SPAN><SPAN 
            class=blue12>巧克力糖球</SPAN><SPAN class=gray12t>点播</SPAN><A 
            href="javascript:open_window('ShowMusic.asp?id=10566','Listen','width=376,height=150,scrollbars=no')"><SPAN 
            class=green12u>[呐喊]</SPAN></A><SPAN 
            class=gray12t>附言:祝你年年发财,事事如意......</SPAN></TD></TR>
        <TR>
          <TD align=left bgColor=#f3f3f3 height=22><SPAN class=org12><SPAN 
            class=gray12t>·</SPAN>楼上的猫</SPAN><SPAN class=gray12t>为</SPAN><SPAN 
            class=blue12>巧克力糖球</SPAN><SPAN class=gray12t>点播</SPAN><A 
            href="javascript:open_window('ShowMusic.asp?id=10570','Listen','width=376,height=150,scrollbars=no')"><SPAN 
            class=green12u>[遗失的美好]</SPAN></A><SPAN 
            class=gray12t>附言:祝你年年发财,事事如意......</SPAN></TD></TR>
        <TR>
          <TD align=left bgColor=#ffffff height=22><SPAN class=org12><SPAN 
            class=gray12t>·</SPAN>楼上的猫</SPAN><SPAN class=gray12t>为</SPAN><SPAN 
            class=blue12>巧克力糖球</SPAN><SPAN class=gray12t>点播</SPAN><A 
            href="javascript:open_window('ShowMusic.asp?id=19103','Listen','width=376,height=150,scrollbars=no')"><SPAN 
            class=green12u>[香水百合]</SPAN></A><SPAN 
            class=gray12t>附言:祝你年年发财,事事如意......</SPAN></TD></TR>
        <TR>
          <TD align=left bgColor=#f3f3f3 height=22><SPAN class=org12><SPAN 
            class=gray12t>·</SPAN>楼上的猫</SPAN><SPAN class=gray12t>为</SPAN><SPAN 
            class=blue12>巧克力糖球</SPAN><SPAN class=gray12t>点播</SPAN><A 
            href="javascript:open_window('ShowMusic.asp?id=24887','Listen','width=376,height=150,scrollbars=no')"><SPAN 
            class=green12u>[C大调 (Le tea奇异果法式果茶 广告歌)]</SPAN></A><SPAN 
            class=gray12t>附言:祝你年年发财,事事如意......</SPAN></TD></TR>
        <TR>
          <TD align=left bgColor=#ffffff height=22><SPAN class=org12><SPAN 
            class=gray12t>·</SPAN>楼上的猫</SPAN><SPAN class=gray12t>为</SPAN><SPAN 
            class=blue12>巧克力糖球</SPAN><SPAN class=gray12t>点播</SPAN><A 
            href="javascript:open_window('ShowMusic.asp?id=24886','Listen','width=376,height=150,scrollbars=no')"><SPAN 
            class=green12u>[不痛 (韩剧[你来自哪颗星]全球中文指定曲)]</SPAN></A><SPAN 
            class=gray12t>附言:祝你年年发财,事事如意......</SPAN></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD vAlign=top align=middle bgColor=#ffffff>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width=654 border=0>
        <TBODY>
        <TR>
          <TD vAlign=bottom align=left width=10><IMG height=10 
            src="pinluo.com_style1/music07homeqie_39.gif" width=10></TD>
          <TD vAlign=bottom align=left width=634>
            <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD bgColor=#82d31b height=1></TD></TR></TBODY></TABLE></TD>
          <TD vAlign=bottom align=right width=11><IMG height=10 
            src="pinluo.com_style1/music07homeqie_41.gif" 
    width=11></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV><!-- 第四部分点播结束 --></DIV><!-- 第四部分结束 --><!-- 第五部分开始 -->
<DIV id=rows5>
<DIV id=radio1><IFRAME src="pinluo.com_style1/live.htm" frameBorder=0 width="100%" 
scrolling=no height=187></IFRAME></DIV></DIV><!-- 第五部分结束 -->
<map name="Map"><area shape="rect" coords="10,233,36,302" href="PL_Speciallist.asp" target="_self" alt="查看全部专辑">
</map>
<!--#include file="PL_bottom.asp"-->