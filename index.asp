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
<meta name="generator" content="�����Ȩ��Ʒ��Ƽ� - ��վ����͹�����ר�� | PinLuo.Com"></HEAD>
<BODY><!-- Ʒ������ϵͳ ������ʼ-->
<DIV align=center></DIV><!-- Ʒ������ϵͳ ��������--><!-- ��Ҫ��һ�����ֿ�ʼ -->
<DIV id=rows1><!-- ��߲��ֿ�ʼ -->
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
          <TD class=wirth12b align=right width=46>�ʺţ�</TD>
          <TD width=141><INPUT class=finput id=UserName name=UserName> </TD></TR>
        <TR>
          <TD width=13>&nbsp;</TD>
          <TD class=wirth12b align=right height=30>���룺</TD>
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
                  <td width="187" colspan="2" rowspan="2" align="center" class="wirth12b">��ӭ����<font color=#FF00FF><%=Request.Cookies("Www_PinLuo_Com_user")("PL_username")%></font></a>  <br> <a href="User/PL_messanger.asp?action=sendin" target=_blank class="txt">��赥(���յ�0�ε��)</a>  <br> <a href="User/PL_UserCollect.asp?action=show" target="messanger" class="txt">�ҵ������ղؼ�</a><br />
                  <a href="javascript:open_window('PL_upload.asp','_blank','width=370,height=390,scrollbars=no')" class="txt" >�ϴ���ϲ���ĸ���</a><br />
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
            height=22><%=webname%>��2007�����ȫ�¸İ棬������������;���������ϴ����ܣ�����ͨ��ע���Ϊ��Ա���Ϳ�ӵ���ϴ����ܣ����Խ���ϲ���ĸ��������ѹ�����θİ�ȫ���������ṩ����������ĸ����������ѹ���������԰��</TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD><IMG height=13 src="pinluo.com_style1/music07zjqie_40.gif" width=200></TD></TR>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE></DIV></DIV><!-- ��߲��ֽ��� --><!-- �ұ���Ҫ���ݿ�ʼ -->


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
              
			<!--��ר���б�ʼ-->
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
                      <TD align=middle><A title="����ר����<%=rs("name")%>&nbsp;&nbsp;<%=rs("NClass")%>&nbsp;&nbsp;<%=rs("times")%> "
                        href="PL_ShowSpecial.asp?Specialid=<%=rs("SpecialID")%>" 
                        target=_self><IMG class=picline height=96 alt="����ר����<%=rs("name")%>&nbsp;&nbsp;<%=rs("NClass")%>&nbsp;&nbsp;<%=rs("times")%>" src="<%=rs("pic")%>" width=96 
                        border=0></A></TD></TR>
                    <TR>				
                      <TD class=g13tit align=middle><A class=g13tit 
                        title="����ר����<%=rs("name")%>&nbsp;&nbsp;<%=rs("NClass")%>&nbsp;&nbsp;<%=rs("times")%>"  
                        href="PL_ShowSpecial.asp?Specialid=<%=rs("SpecialID")%>" 
                        target=_self><%PL_name=rs("name")
                          if len(PL_name)>9 then PL_name=left(PL_name,9)&"��"
                          response.write PL_name
                            %></A></TD></TR>
                    <TR>
                      <TD class=gray13tit align=middle><A class=gray12t title="<%=rs("NClass")%>" href="PL_Singer.asp?NClassid=<%=rs("nclassID")%>"><%PL_NClass5=rs("NClass")
                          if len(PL_NClass5)>9 then PL_NClass5=left(PL_NClass5,9)&"��"
                          response.write PL_NClass5%></A></TD></TR></TBODY></TABLE></TD>
						
<%rs.movenext
         end if
next%></TR>
<%next %>
<%rs.close%>
			<!--��ר���б����-->
			
              <TR></TR></TBODY></TABLE></TD>
          <TD vAlign=top align=right width=37><IMG 
            height=302 src="pinluo.com_style1/music07homeqie_05.gif" width=37 
            useMap=#Map border=0></TD>
        </TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD align=middle>
      

      <!--#include file="PL_INC/PL_inc_search.asp"--></TD></TR></TBODY></TABLE></DIV><!-- �ұ���Ҫ���ݽ��� --></DIV><!-- ��һ�����ֽ��� --><!-- �ڶ����ֿ�ʼ -->
<DIV id=rows2><!-- �ڶ������¸����п�ʼ -->
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
    width="82%"><a href="PL_Speciallist.asp" target="_self" class=wtit14line>�¸�����</a></TD>
        </TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <!--��ȡ�¸��б�-->
	  <%call PL_Index_Showsonglist("new",10) '��ȡǰ10���¸�%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song1)"><IMG class=hand 
      title=ѡ����ʾ�����и��� height=20 alt=ѡ����ʾ�����и��� 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="ȫ ѡ"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song1)"><IMG 
      id=chkOthers height=20 alt=����ѡ����� src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=����ѡ���������ĸ������ٵ������ width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- �ڶ������¸����н��� --><!-- �ڶ����ָ������п�ʼ -->
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
    width="82%"><a href="PL_Speciallist.asp" target="_self" class=wtit14line>��������</a></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist("hot",10) '��ȡǰ10�����Ÿ�%>
	  
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song2)"><IMG class=hand 
      title=ѡ����ʾ�����и��� height=20 alt=ѡ����ʾ�����и��� 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="ȫ ѡ"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song2)"><IMG 
      id=chkOthers height=20 alt=����ѡ����� src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=����ѡ���������ĸ������ٵ������ width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- �ڶ����ָ������н��� --><!-- �ڶ����ָ������п�ʼ -->
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
    width="82%"><a href="PL_Speciallist.asp" target="_self" class=wtit14line>�Ƽ�����</a></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle bgColor=#ffffff height=254>
	
	<%call PL_Index_Showsonglist("isgood",10) '��ȡǰ10���Ƽ���%>
    </TD></TR>
  <TR>
    <TD class=sg12b align=middle background=pinluo.com_style1/music07homeqie_25.gif 
    height=28><A href="javascript:CheckAll(song11)"><IMG class=hand 
      title=ѡ����ʾ�����и��� height=20 alt=ѡ����ʾ�����и��� 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="ȫ ѡ"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song11)"><IMG 
      id=chkOthers height=20 alt=����ѡ����� src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=����ѡ���������ĸ������ٵ������ width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></TBODY></FORM></TABLE></DIV><!-- �ڶ����ָ������н��� --></DIV><!-- �ڶ����ֽ��� --><!-- �������ֿ�ʼ -->
<DIV id=rows3><!-- ���������ϸ����п�ʼ -->
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
      width="82%"><a href="PL_ShowSinger.asp?SClassid=1" target="_self" class=wtit14line>�����и������¸���</a></TD>
        </TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist(1,10) '��ȡǰ10����ĿIDΪ1�ĸ�����%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song3)"><IMG class=hand 
      title=ѡ����ʾ�����и��� height=20 alt=ѡ����ʾ�����и��� 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="ȫ ѡ"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song3)"><IMG 
      id=chkOthers height=20 alt=����ѡ����� src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=����ѡ���������ĸ������ٵ������ width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- ���������ϸ����н��� --><!-- �������ֵ�Ӱ���п�ʼ -->
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
      width="82%"><a href="PL_ShowSinger.asp?SClassid=2" target="_self" class=wtit14line>����Ů�������¸���</a></TD>
        </TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist(2,10) '��ȡǰ10����ĿIDΪ2�ĸ�����%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song4)"><IMG class=hand 
      title=ѡ����ʾ�����и��� height=20 alt=ѡ����ʾ�����и��� 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="ȫ ѡ"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song4)"><IMG 
      id=chkOthers height=20 alt=����ѡ����� src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=����ѡ���������ĸ������ٵ������ width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- �������ֵ�Ӱ���н��� --><!-- �����������������п�ʼ -->
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
    width="82%"><a href="PL_ShowSinger.asp?SClassid=3" target="_self" class=wtit14line>������� ���¸���</a></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist(3,10) '��ȡǰ10����ĿIDΪ3�ĸ�����%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song5)"><IMG class=hand 
      title=ѡ����ʾ�����и��� height=20 alt=ѡ����ʾ�����и��� 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="ȫ ѡ"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song5)"><IMG 
      id=chkOthers height=20 alt=����ѡ����� src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=����ѡ���������ĸ������ٵ������ width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- �������������ֽ��� --></DIV><!-- �������ֽ��� -->

<!-- ���������ϸ����п�ʼ -->
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
      width="82%"><a href="PL_ShowSinger.asp?SClassid=4" target="_self" class=wtit14line>�պ��и������¸���</a></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist(4,10) '��ȡǰ10����ĿIDΪ4�ĸ�����%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song12)"><IMG class=hand 
      title=ѡ����ʾ�����и��� height=20 alt=ѡ����ʾ�����и��� 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="ȫ ѡ"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song12)"><IMG 
      id=chkOthers height=20 alt=����ѡ����� src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=����ѡ���������ĸ������ٵ������ width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- ���������ϸ����н��� --><!-- �������ֵ�Ӱ���п�ʼ -->
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
      width="82%"><a href="PL_ShowSinger.asp?SClassid=5" target="_self" class=wtit14line>�պ�Ů�������¸���</a></TD>
        </TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist(5,10)%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song13)"><IMG class=hand 
      title=ѡ����ʾ�����и��� height=20 alt=ѡ����ʾ�����и��� 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="ȫ ѡ"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song13)"><IMG 
      id=chkOthers height=20 alt=����ѡ����� src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=����ѡ���������ĸ������ٵ������ width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- �������ֵ�Ӱ���н��� --><!-- �����������������п�ʼ -->
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
    width="82%"><a href="PL_ShowSinger.asp?SClassid=6" target="_self" class=wtit14line>�պ���� ���¸���</a></TD>
        </TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist(6,10)%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song14)"><IMG class=hand 
      title=ѡ����ʾ�����и��� height=20 alt=ѡ����ʾ�����и��� 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="ȫ ѡ"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song14)"><IMG 
      id=chkOthers height=20 alt=����ѡ����� src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=����ѡ���������ĸ������ٵ������ width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- �������������ֽ��� --></DIV><!-- �������ֽ��� -->

<!-- ���߲����ϸ����п�ʼ -->
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
      width="82%"><a href="PL_ShowSinger.asp?SClassid=7" target="_self" class=wtit14line>ŷ������ ���¸���</a></TD>
        </TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist(7,10)%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song15)"><IMG class=hand 
      title=ѡ����ʾ�����и��� height=20 alt=ѡ����ʾ�����и��� 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="ȫ ѡ"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song15)"><IMG 
      id=chkOthers height=20 alt=����ѡ����� src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=����ѡ���������ĸ������ٵ������ width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- ���������ϸ����н��� --><!-- �������ֵ�Ӱ���п�ʼ -->
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
      width="82%"><a href="PL_ShowSinger.asp?SClassid=8" target="_self" class=wtit14line>Ӱ������ ���¸���</a></TD>
        </TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist(8,10)%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song16)"><IMG class=hand 
      title=ѡ����ʾ�����и��� height=20 alt=ѡ����ʾ�����и��� 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="ȫ ѡ"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song16)"><IMG 
      id=chkOthers height=20 alt=����ѡ����� src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=����ѡ���������ĸ������ٵ������ width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- �������ֵ�Ӱ���н��� --><!-- �����������������п�ʼ -->
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
    width="82%"><a href="PL_ShowSinger.asp?SClassid=9" target="_self" class=wtit14line>�ģ����� ���¸���</a></TD>
        </TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=254>
      <%call PL_Index_Showsonglist(9,10)%>
	  </TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song17)"><IMG class=hand 
      title=ѡ����ʾ�����и��� height=20 alt=ѡ����ʾ�����и��� 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="ȫ ѡ"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song17)"><IMG 
      id=chkOthers height=20 alt=����ѡ����� src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=����ѡ���������ĸ������ٵ������ width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- �������������ֽ��� --></DIV><!-- ���߲��ֽ��� -->

<!-- ���Ĳ��ֿ�ʼ -->
<DIV id=rows4><!-- ���Ĳ��������ϴ���ʼ -->
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
    width="75%"><a href="PL_ShowSinger.asp?SClassid=12" target="_self" class=wtit14line>Ӱ�Ӻϼ� ���¸���</a></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle height=127>
      <%call PL_Index_Showsonglist(12,6) '��ȡǰ6����ĿIDΪ9�ĸ�����%></TD></TR>
  <TR>
    <TD align=middle background=pinluo.com_style1/music07homeqie_25.gif colSpan=5 
    height=28><A href="javascript:CheckAll(song6)"><IMG class=hand 
      title=ѡ����ʾ�����и��� height=20 alt=ѡ����ʾ�����и��� 
      src="pinluo.com_style1/music07zjqie_95.gif" width=42 border=0 name=chkall 
      value="ȫ ѡ"></A>&nbsp;&nbsp;<A href="javascript:CheckOthers(song6)"><IMG 
      id=chkOthers height=20 alt=����ѡ����� src="pinluo.com_style1/music07zjqie_97.gif" 
      width=42 border=0 name=chkOthers></A>&nbsp;&nbsp;<INPUT id=B1 type=image 
      height=20 alt=����ѡ���������ĸ������ٵ������ width=42 
      src="pinluo.com_style1/music07zjqie_99.gif" 
name=B1></TD></TR></FORM></TBODY></TABLE></DIV><!-- ���Ĳ��������ϴ����� --><!-- ���Ĳ��ֵ㲥��ʼ -->
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
    width="89%">��ܰ����</TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle bgColor=#ffffff height=135>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="99%" border=0>
        <TBODY>
        <TR>
          <TD align=left bgColor=#f3f3f3 height=22><SPAN class=org12><SPAN 
            class=gray12t>��</SPAN>chenbingcai</SPAN><SPAN 
            class=gray12t>Ϊ</SPAN><SPAN class=blue12>wo</SPAN><SPAN 
            class=gray12t>�㲥</SPAN><A 
            href="javascript:open_window('ShowMusic.asp?id=28193','Listen','width=376,height=150,scrollbars=no')"><SPAN 
            class=green12u>[ԭ����һֱ�����µ�]</SPAN></A><SPAN 
            class=gray12t>����:ף�����귢��,��������......</SPAN></TD></TR>
        <TR>
          <TD align=left bgColor=#ffffff height=22><SPAN class=org12><SPAN 
            class=gray12t>��</SPAN>¥�ϵ�è</SPAN><SPAN class=gray12t>Ϊ</SPAN><SPAN 
            class=blue12>�ɿ�������</SPAN><SPAN class=gray12t>�㲥</SPAN><A 
            href="javascript:open_window('ShowMusic.asp?id=10723','Listen','width=376,height=150,scrollbars=no')"><SPAN 
            class=green12u>[�̻�]</SPAN></A><SPAN 
            class=gray12t>����:ף�����귢��,��������......</SPAN></TD></TR>
        <TR>
          <TD align=left bgColor=#f3f3f3 height=22><SPAN class=org12><SPAN 
            class=gray12t>��</SPAN>¥�ϵ�è</SPAN><SPAN class=gray12t>Ϊ</SPAN><SPAN 
            class=blue12>�ɿ�������</SPAN><SPAN class=gray12t>�㲥</SPAN><A 
            href="javascript:open_window('ShowMusic.asp?id=14855','Listen','width=376,height=150,scrollbars=no')"><SPAN 
            class=green12u>[ż��]</SPAN></A><SPAN 
            class=gray12t>����:ף�����귢��,��������......</SPAN></TD></TR>
        <TR>
          <TD align=left bgColor=#ffffff height=22><SPAN class=org12><SPAN 
            class=gray12t>��</SPAN>¥�ϵ�è</SPAN><SPAN class=gray12t>Ϊ</SPAN><SPAN 
            class=blue12>�ɿ�������</SPAN><SPAN class=gray12t>�㲥</SPAN><A 
            href="javascript:open_window('ShowMusic.asp?id=10566','Listen','width=376,height=150,scrollbars=no')"><SPAN 
            class=green12u>[�ź�]</SPAN></A><SPAN 
            class=gray12t>����:ף�����귢��,��������......</SPAN></TD></TR>
        <TR>
          <TD align=left bgColor=#f3f3f3 height=22><SPAN class=org12><SPAN 
            class=gray12t>��</SPAN>¥�ϵ�è</SPAN><SPAN class=gray12t>Ϊ</SPAN><SPAN 
            class=blue12>�ɿ�������</SPAN><SPAN class=gray12t>�㲥</SPAN><A 
            href="javascript:open_window('ShowMusic.asp?id=10570','Listen','width=376,height=150,scrollbars=no')"><SPAN 
            class=green12u>[��ʧ������]</SPAN></A><SPAN 
            class=gray12t>����:ף�����귢��,��������......</SPAN></TD></TR>
        <TR>
          <TD align=left bgColor=#ffffff height=22><SPAN class=org12><SPAN 
            class=gray12t>��</SPAN>¥�ϵ�è</SPAN><SPAN class=gray12t>Ϊ</SPAN><SPAN 
            class=blue12>�ɿ�������</SPAN><SPAN class=gray12t>�㲥</SPAN><A 
            href="javascript:open_window('ShowMusic.asp?id=19103','Listen','width=376,height=150,scrollbars=no')"><SPAN 
            class=green12u>[��ˮ�ٺ�]</SPAN></A><SPAN 
            class=gray12t>����:ף�����귢��,��������......</SPAN></TD></TR>
        <TR>
          <TD align=left bgColor=#f3f3f3 height=22><SPAN class=org12><SPAN 
            class=gray12t>��</SPAN>¥�ϵ�è</SPAN><SPAN class=gray12t>Ϊ</SPAN><SPAN 
            class=blue12>�ɿ�������</SPAN><SPAN class=gray12t>�㲥</SPAN><A 
            href="javascript:open_window('ShowMusic.asp?id=24887','Listen','width=376,height=150,scrollbars=no')"><SPAN 
            class=green12u>[C��� (Le tea�������ʽ���� ����)]</SPAN></A><SPAN 
            class=gray12t>����:ף�����귢��,��������......</SPAN></TD></TR>
        <TR>
          <TD align=left bgColor=#ffffff height=22><SPAN class=org12><SPAN 
            class=gray12t>��</SPAN>¥�ϵ�è</SPAN><SPAN class=gray12t>Ϊ</SPAN><SPAN 
            class=blue12>�ɿ�������</SPAN><SPAN class=gray12t>�㲥</SPAN><A 
            href="javascript:open_window('ShowMusic.asp?id=24886','Listen','width=376,height=150,scrollbars=no')"><SPAN 
            class=green12u>[��ʹ (����[�������Ŀ���]ȫ������ָ����)]</SPAN></A><SPAN 
            class=gray12t>����:ף�����귢��,��������......</SPAN></TD></TR></TBODY></TABLE></TD></TR>
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
    width=11></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV><!-- ���Ĳ��ֵ㲥���� --></DIV><!-- ���Ĳ��ֽ��� --><!-- ���岿�ֿ�ʼ -->
<DIV id=rows5>
<DIV id=radio1><IFRAME src="pinluo.com_style1/live.htm" frameBorder=0 width="100%" 
scrolling=no height=187></IFRAME></DIV></DIV><!-- ���岿�ֽ��� -->
<map name="Map"><area shape="rect" coords="10,233,36,302" href="PL_Speciallist.asp" target="_self" alt="�鿴ȫ��ר��">
</map>
<!--#include file="PL_bottom.asp"-->