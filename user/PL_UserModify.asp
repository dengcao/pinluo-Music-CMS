<%
'
'����������������������������������������������������
'��                                                                   ��
'��                     Ʒ�����ֳ���ϵͳ1.0                              ��
'��                                                                   ��
'��     �ռ�����: Ʒ��  www.pinluo.com                                  ��
'��                                                                   ��
'��     ��������: ����  www.caozha.com                                  ��
'��                                                                   ��
'��     Դ�����Apache-2.0��ѿ�Դ���뱣�����������ӣ�                      ��
'��                                                                   ��
'����������������������������������������������������
'
'%>
<!--#include file="../PL_config.asp"-->
<!--#include file="PL_user_check_safe.asp"-->
<%
PL_username=Request.Cookies("Www_PinLuo_Com_user")("PL_username")
PL_userid=Request.Cookies("Www_PinLuo_Com_user")("PL_userid")
set PL_rs=server.createobject("adodb.recordset")
PL_sql="SELECT * FROM [User] where(UserName='"&PL_username&"' and ID="&PL_userid&")"' order by id desc
'PL_sql="select * from [User] where(username='"&PL_username&"' and id='"&PL_userid&"')"
'order by ID desc, hits desc, isgood desc
PL_rs.open PL_sql,conn,1,1

Dim codeKey
codeKey = Int(Timer()*10)
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML 
xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>�޸Ļ�Ա��Ϣ - <%=WebName%></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="../pinluo.com_style1/music07css.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.6000.16587" name=GENERATOR>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {
	font-size: 12px;
	color: #FF0000;
	font-weight: bold;
}
.STYLE3 {
	color: #009900;
	font-weight: bold;
	font-size: 12px;
}
-->
</style>
</HEAD>
<BODY>
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=700 border=0>
  <TBODY>
  <TR>
    <TD width=200 height=147 rowSpan=3><IMG height=180 
      src="../pinluo.com_style1/music07zjqie_021.gif" width=220></TD>
    <TD vAlign=center align=left width=500 height=60><SPAN 
      class=black12>����ƮƮ������һ����������</SPAN></TD></TR>
  <TR>
    <TD vAlign=bottom align=left height=50>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
        <TR>
          <TD width=21 bgColor=#e8efd6><IMG height=47 
            src="../pinluo.com_style1/music07zjqie_116.gif" width=21></TD>
          <TD class=gnavt14line align=middle width=437 bgColor=#e8efd6>�� Ա �� ��</TD>
          <TD align=right width=22 bgColor=#e8efd6><IMG height=47 
            src="../pinluo.com_style1/music07zjqie_118.gif" 
      width=22></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD vAlign=top align=middle height=70>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="52%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=left width=19 bgColor=#8dcf46 height=22><IMG 
            height=22 src="../pinluo.com_style1/music07zjqie_32.gif" width=11></TD>
          <TD class=wirth12b align=middle width=337 bgColor=#8dcf46 
            height=22><STRONG class=wtit14line>�޸Ļ�Ա��Ϣ</STRONG></TD>
          <TD vAlign=top align=right width=10 bgColor=#8dcf46 height=22><IMG 
            height=22 src="../pinluo.com_style1/music07zjqie_34.gif" 
        width=10></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD vAlign=top align=middle colSpan=2 height=311>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=left width=9 
          background=../pinluo.com_style1/music07zjlin_37.gif><IMG height=11 
            src="../pinluo.com_style1/music07zjqie_26.gif" width=9></TD>
          <TD style="BORDER-TOP: #8dcf46 1px solid" vAlign=top align=middle 
          bgColor=#effdd6 height=11>&nbsp; </TD>
          <TD vAlign=top align=right width=11 
          background=../pinluo.com_style1/music07zjlin_38.gif><IMG height=11 
            src="../pinluo.com_style1/music07zjqie_29.gif" 
      width=11></TD></TR></TBODY></TABLE>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
        <TR>
          <TD class=tbline align=middle bgColor=#f4ffea colSpan=2 height=216>
            <FORM name="Reg" action="PL_Regpost.asp" method="post">
            <table class="tableBorder" cellSpacing=2 cellPadding=0 width="90%" border=0>
              <TBODY>
              <TR>
                <TD class=gray13tit align=middle colSpan=2 
                  height=25>�û�������Ϊ3-20���ַ�,����ʹ������,��ĸ������.һ�������ֵ���һ���ַ�.</TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right width="30%" 
height=25>�û�����</TD>
                <TD align=left height=25 class=gray13tit><%=PL_username%></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25>�����룺</TD>
                <TD align=left height=25><INPUT name=oldpassword type=password class=finput id="oldpassword" size=16 
                  maxLength=20>
                  <span class="gray13tit STYLE1">*</span><span class="org12">(��������6λ�������20λ��)</span> </TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25>�����룺</TD>
                <TD align=left height=25><INPUT name=newpassword type=password class=finput id="newpassword" size=16 
                  maxLength=20>
                  <span class="gray13tit STYLE1">*</span><span class="org12">(���޸����������ա�)</span></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25>ȷ�����룺</TD>
                <TD align=left height=25><INPUT name=newpassword2 type=password class=finput id="newpassword2" size=16 
                  maxLength=20>
                    <span class="gray13tit STYLE1">*</span><span class="org12">(���޸����������ա�)</span></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25>Email��ַ��</TD>
                <TD align=left height=25><INPUT 
                  name=Email class=finput value="<%=PL_rs("email")%>" maxLength=150>
                  <span class="gray13tit STYLE1">*</span> </TD></TR>
              <TR>
                <TD class=gray13tit align=right height=25><span class="n2 L">������ʾ����</span>��</TD>
                <TD align=left height=25><INPUT 
                  name=wenti class=finput id="wenti" value="<%=PL_rs("wenti")%>" maxLength=100>
                  <span class="gray13tit STYLE1">*</span></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25><span class="n2 L">������ʾ��</span>��</TD>
                <TD align=left height=25><INPUT 
                  name=daan type="text" class=finput id="daan" maxLength=100>
                  <span class="gray13tit STYLE1">*<span class="org12">(���޸������ա�)</span></span></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25>��֤�룺</TD>
                <TD align=left height=25><INPUT name=code class=finput id="code" maxLength=4>
                    <span class="gray13tit STYLE1">*</span><img src="../PL_INC/PL_Code.asp?k=<%=codeKey%>&amp;" onClick="this.src+=parseInt(Math.random()*10)" alt="������������������һ�š�"><span class="org12">(����ʾ��֤�벻��ȷ������ˢ�¡�)</span></TD>
              </TR>
              <TR>
                <TD height=53 align=right valign="middle" class=gray13tit>����Ϊѡ������&nbsp;&nbsp;</TD>
                <TD height=53 align=center class=gray13tit>&nbsp;</TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25>�� ��</TD>
                <TD class=gray13tit align=left height=25><INPUT type=radio 
                  CHECKED value=���� name=sex> �к� <INPUT type=radio value=Ůʿ <%if PL_rs("sex")="Ůʿ" then%>CHECKED <%end if%>
                  name=sex> Ů��</TD></TR>
              <TR>
                <TD class=gray13tit align=right height=25>��ʵ������</TD>
                <TD class=gray13tit align=left height=25><INPUT 
                  name=Name class=finput id="Name" value="<%=PL_rs("Name")%>" maxLength=50></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25>���֤��</TD>
                <TD class=gray13tit align=left height=25><INPUT 
                  name=Shenfenzheng class=finput id="Shenfenzheng" value="<%=PL_rs("Shenfenzheng")%>" maxLength=50></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25>QQ���룺</TD>
                <TD align=left height=25><INPUT 
                  name=qq class=finput value="<%=PL_rs("qq")%>" maxLength=20> </TD></TR>
              <TR>
                <TD class=gray13tit align=right height=25>�� ����</TD>
                <TD align=left height=25><INPUT 
                  name=tel class=finput id="tel" value="<%=PL_rs("Tel")%>" maxLength=50></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25>�� ַ��</TD>
                <TD align=left height=25><INPUT 
                  name=Address class=finput id="Address" value="<%=PL_rs("Address")%>" maxLength=255></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25><span class="n2 L">��������</span>��</TD>
                <TD align=left height=25><INPUT 
                  name=Youbian class=finput id="Youbian" value="<%=PL_rs("Youbian")%>" maxLength=20></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25><span class="n2 L">��Ա����</span>��</TD>
                <TD align=left height=25><span class="n3 L">
				<%PL_vipdate=PL_rs("vipdate")%>
                  <select name="vipdate" size="1">
                    <option value="-1">��ѻ�Ա</option>
                    <option value="90"<%if PL_vipdate>0 and PL_vipdate<=90 then%> selected<%end if%>>������</option>
                    <option value="182"<%if PL_vipdate>90 and PL_vipdate<=182 then%> selected<%end if%>>������</option>
                    <option value="365"<%if PL_vipdate>182 and PL_vipdate<=366 then%> selected<%end if%>>һ����</option>
					<%if PL_vipdate>366 then%><option value="<%=PL_vipdate%>" selected>δ֪��Ա����</option><%end if%>
                  </select>
                </span><%if PL_rs("lockuser")=true and PL_vipdate>0 then%>
                <span class="n2 L STYLE2">���Ļ�Ա����δͨ������Ա����ˣ�</span>
                <%else%>
                <span class="STYLE3">&nbsp;&nbsp;�Ѿ�ͨ����ˣ�</span>
                <%end if%></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right>ǩ ����</TD>
                <TD align=left><TEXTAREA name=qianming cols=40 rows=5 wrap=physical id="qianming" style="BORDER-RIGHT: #99cc00 1px solid; BORDER-TOP: #99cc00 1px solid; BORDER-LEFT: #99cc00 1px solid; BORDER-BOTTOM: #99cc00 1px solid"><%=PL_rs("qianming")%></TEXTAREA>                </TD></TR>
              <TR align=middle>
                <TD align=middle colSpan=2 height=30><input type="hidden" name="codeKey" value="<%=codeKey%>">
                  <input name="act" type="hidden" id="act" value="xiugai">
                  <INPUT type=submit value="�� ��" name=Submit> 
                  &nbsp;&nbsp;&nbsp;&nbsp; <INPUT type=reset value="�� д" name=Submit2>            </TD></TR></TBODY></TABLE>
            </FORM></TD></TR>
        <TR>
          <TD vAlign=bottom align=left 
          background=../pinluo.com_style1/music07zjlin_116.gif bgColor=#f4ffea 
          height=11><IMG height=11 src="../pinluo.com_style1/music07zjqie_111.gif" 
            width=9></TD>
          <TD vAlign=bottom align=right 
          background=../pinluo.com_style1/music07zjlin_116.gif bgColor=#f4ffea 
          height=11><IMG height=11 src="../pinluo.com_style1/music07zjqie_112.gif" 
            width=11></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<!--#include file="../PL_bottom.asp"-->