<%@ LANGUAGE = VBScript.Encode %>
<!--#include file="PL_config.asp"-->
<!--#include file="PL_Function.asp"-->
<% '��ȡ��ǰ���ֿ�ʼ
NClassID=Trim(Request.QueryString("NClassID"))
set PL_rs=server.createobject("adodb.recordset")
PL_sql="SELECT * FROM NClass where NClassID="&NClassID&" order by NClass desc"', isgood desc
PL_rs.open PL_sql,conn,1,1
if PL_rs.eof and PL_rs.bof then 
	response.Write("�Բ��𣬵�ǰ�ĸ��ֲ����ڣ������Ѿ���ɾ������û��ͨ������Ա��ˡ�")
    Response.End 
        else
NClass=PL_rs("NClass")     '��ȡ���ֵ�����
da=PL_rs("da")             '��ȡ���ֵļ��
SClassid=PL_rs("SClassid") '��ȡ���ֶ�Ӧ����Ŀ�����绪���и��֣�Ů���ֵ�
NClass_Abcd=PL_rs("Abcd") '��ȡ���ֶ�Ӧ��Abcd�������ƣ�����A��B��
NClass_pic=PL_rs("pic")    '��ȡ����ͼƬ��
PL_rs.close
		end if%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<HTML><HEAD><TITLE><%=NClass%>   - �鿴���ֵ�ȫ��ר��������Ϣ - <%=WebName%></TITLE>
<LINK href="pinluo.com_style1/music07css.css" type=text/css rel=stylesheet>
<SCRIPT src="pinluo.com_style1/Js.js"></SCRIPT>
<META content="MSHTML 6.00.6000.16587" name=GENERATOR>
<meta name="keywords" content="<%=NClass%>,<%=Keywords%>">
<meta name="description" content="<%=NClass%>,<%=Keywords%>">
<link href="<%=favicon%>" rel="shortcut icon">
<meta name="generator" content="�����Ȩ��Ʒ��Ƽ� - ��վ����͹�����ר�� | PinLuo.Com"></HEAD>
<BODY><!-- Ʒ������ϵͳ ������ʼ-->
<DIV align=center></DIV><!-- Ʒ������ϵͳ ��������--><!-- ��Ҫ���в��ֿ�ʼ -->
<DIV id=all><!-- ��߲��ֿ�ʼ -->
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

<DIV><!--�¸����п�ʼ -->
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
    width="69%">�¸�����</TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle bgColor=#f1fdcb>
<table class="tableBorder" cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
		
		<!--��ȡ���¸����б�-->
<%call PL_Shownewsonglist(10)%>


        </TBODY></TABLE></TD></TR>
  <TR>
    <TD vAlign=top><IMG height=10 
      src="pinluo.com_style1/music07zjqie_66.gif" width=200></TD></TR>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE></DIV>

	
	<!--�¸����н��� -->
	
	
	
<DIV><!--�ȸ����п�ʼ -->
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
    width="69%">�ȸ�����</TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle bgColor=#f1fdcb>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
		
		<!--��ȡ���Ÿ����б�-->
	<%call PL_Showhotsonglist(10)%>

</TBODY></TABLE></TD></TR>
  <TR>
    <TD vAlign=top><IMG height=10 
      src="pinluo.com_style1/music07zjqie_66.gif" width=200></TD></TR>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE></DIV><!--�ȸ����н��� -->
<DIV><!--���Ÿ��ֿ�ʼ -->
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
    width="69%">���Ÿ���</TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle bgColor=#f1fdcb>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="96%" border=0>
        <TBODY>
		
		<!--��ȡ���Ÿ����б�-->
	<%call PL_ShowhotSinger()%>
        
		</TBODY></TABLE></TD></TR>
  <TR>
    <TD vAlign=top><IMG height=10 
      src="pinluo.com_style1/music07zjqie_66.gif" width=200></TD></TR>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE></DIV><!--���Ÿ��ֽ��� -->
<DIV><!--�����ϴ���ʼ -->
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
    width="69%">�Ƽ�����</TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=tbline vAlign=top align=middle bgColor=#f1fdcb>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="94%" border=0>
        <TBODY>
		
		<!--��ȡ�Ƽ������б�-->
	<%call PL_ShowIsgoodsonglist(10)%>
	  
        </TBODY></TABLE></TD></TR>
		

  <TR>
    <TD vAlign=top><IMG height=10 
      src="pinluo.com_style1/music07zjqie_66.gif" width=200></TD></TR>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE></DIV><!--�����ϴ����� --></DIV></DIV><!-- ��߲��ֽ��� --><!-- �ұ���Ҫ���ݿ�ʼ -->


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
             
			 			<%call PL_Shownewzhuanji(5) '��ȡ����ר���б�5��%>
			 
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

<% 
if NClass_pic<>"" then 
NClass_pic2=NClass_pic
else
'��ȡ��ǰ���ֵ�����ר����ʼ
set rs=server.createobject("adodb.recordset")
sql="SELECT * FROM Special where NClassID="&NClassID&" order by Specialid desc"
rs.open sql,conn,1,1
if rs.eof and rs.bof then 
	response.Write("����������������ȷ�Ĳ���������ID��")
    Response.End 
        else
NClass_pic2=rs("Pic")'��ȡ���ֵ�����ר����ͼƬ��
rs.close '��ȡ����
end if
	 %>
          <TD align=middle width="42%" rowSpan=3><A 
            href="#"><IMG 
            class=picline height=120 alt="�� �֣�<%=NClass%>" 
            src="<%=NClass_pic2%>" width=120 
            border=0></A></TD>
          <TD class=gray13tit align=left width="58%" height=20><STRONG>�� 
            �֣�</STRONG><A class=gray13tit 
            href="#PL_01"><%=NClass%></A></TD></TR>
        <TR>
          <TD class=gray13tit align=left height=20><STRONG>�� <strong>��</strong>��</STRONG></TD>
        </TR>
        <TR>
          <TD height=80 align=left valign="top" class=gray13tit><span 
            class=txt><marquee id=scrollArea onmouseover=scrollArea.stop() 
            onmouseout=scrollArea.start() scrollAmount=2 scrollDelay=160 
            direction=up width="100%" height=72 border="0"><%if da<>"" then%><%=da%><%else%>���޸ø��ֵļ�����ݡ�<%end if%></marquee></span></TD>
        </TR>
        </TBODY></TABLE></TD>
    <TD style="BORDER-TOP: #8dcf46 1px solid" vAlign=top align=middle width=403 
    bgColor=#effdd6>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="91%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=left width=12 bgColor=#8dcf46 height=22><IMG 
            height=22 src="pinluo.com_style1/music07zjqie_32.gif" 
width=11></TD>
          <TD class=wirth12b align=middle width=206 bgColor=#8dcf46 
            height=22><SPAN class=txt><%=NClass%></SPAN>��ר���б�</TD>
			
          <TD vAlign=top align=right width=10 bgColor=#8dcf46 height=22><IMG 
            height=22 src="pinluo.com_style1/music07zjqie_34.gif" 
width=10></TD>
          <TD class=g12t vAlign=bottom align=right width=140 height=22><A 
            class=g12t 
            href="PL_Speciallist.asp?nclassid=<%=NClassID%>">&lt;&lt;����</A></TD></TR></TBODY></TABLE>
					
			<%
			
			set rs=server.createobject("adodb.recordset")
sql="SELECT * FROM Special where NClassID = "&NClassID&" order by SpecialID desc, isgood desc"
rs.open sql,conn,1,1
PL_zj_i=0
PL_zj_max=4 '�����ʾ�ø��ֵ�4�����ר��
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
          <TD align=middle><A title="����ר����<%=rs("name")%>" 
            href="PL_ShowSpecial.asp?Specialid=<%=rs("Specialid")%>" 
            target=_parent><IMG class=picline height=80 
            alt="����ר����<%=rs("name")%>" 
            src="<%=weblanmu%><%=rs("pic")%>" width=80 
            border=0></A></TD></TR>
        <TR>
          <TD class=g13tit align=middle><A class=green12u 
            title="����ר����<%=rs("name")%>" 
            href="Pl_ShowSpecial.asp?Specialid=<%=rs("Specialid")%>" 
            target=_parent><%PL_name=rs("name")
                          if len(PL_name)>6 then PL_name=left(PL_name,6)&"��"
                          response.write PL_name
                            %></A></TD></TR></TBODY></TABLE></TD>
			
						<%
if PL_zj_i>=PL_zj_max then exit do
rs.movenext
loop
rs.close '��ȡ����
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
      
	  <%call PL_Showsingersong(NClassID,30)
	  '��ȡ���ֵ�ȫ������,ÿҳ��ʾ30����¼
	  %>
	  <%end if%>
	  
	  </TD></TR>
  <TR>
    <TD class=tbline align=middle bgColor=#f4ffea colSpan=2>&nbsp;</TD>
  </TR>
  <TR>
    <TD vAlign=bottom align=left 
    background=pinluo.com_style1/music07zjlin_116.gif bgColor=#f4ffea 
    height=11><IMG height=11 src="pinluo.com_style1/music07zjqie_111.gif" 
      width=9></TD>
    <TD vAlign=bottom align=right 
    background=pinluo.com_style1/music07zjlin_116.gif bgColor=#f4ffea 
    height=11><IMG height=11 src="pinluo.com_style1/music07zjqie_112.gif" 
      width=11></TD></TR></TBODY></TABLE></DIV><!-- �ұ���Ҫ���ݽ��� --></DIV>

	  <!-- ��Ҫ���в��ֽ��� -->
<!--#include file="PL_bottom.asp"-->