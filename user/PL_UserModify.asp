<%
'
'☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
'★                                                                   ★
'☆                     品络音乐程序系统1.0                              ☆
'★                                                                   ★
'☆     空间域名: 品络  www.pinluo.com                                  ☆
'★                                                                   ★
'☆     程序制作: 草札  www.caozha.com                                  ☆
'★                                                                   ★
'★     源码基于Apache-2.0免费开源，请保留声明和链接！                      ★
'☆                                                                   ☆
'☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
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
xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>修改会员信息 - <%=WebName%></TITLE>
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
      class=black12>仙乐飘飘，让您一饱耳福……</SPAN></TD></TR>
  <TR>
    <TD vAlign=bottom align=left height=50>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
        <TR>
          <TD width=21 bgColor=#e8efd6><IMG height=47 
            src="../pinluo.com_style1/music07zjqie_116.gif" width=21></TD>
          <TD class=gnavt14line align=middle width=437 bgColor=#e8efd6>会 员 中 心</TD>
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
            height=22><STRONG class=wtit14line>修改会员信息</STRONG></TD>
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
                  height=25>用户名必须为3-20个字符,可以使用中文,字母或数字.一个中文字等于一个字符.</TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right width="30%" 
height=25>用户名：</TD>
                <TD align=left height=25 class=gray13tit><%=PL_username%></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25>旧密码：</TD>
                <TD align=left height=25><INPUT name=oldpassword type=password class=finput id="oldpassword" size=16 
                  maxLength=20>
                  <span class="gray13tit STYLE1">*</span><span class="org12">(密码最少6位数，最多20位数)</span> </TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25>新密码：</TD>
                <TD align=left height=25><INPUT name=newpassword type=password class=finput id="newpassword" size=16 
                  maxLength=20>
                  <span class="gray13tit STYLE1">*</span><span class="org12">(不修改密码请留空。)</span></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25>确认密码：</TD>
                <TD align=left height=25><INPUT name=newpassword2 type=password class=finput id="newpassword2" size=16 
                  maxLength=20>
                    <span class="gray13tit STYLE1">*</span><span class="org12">(不修改密码请留空。)</span></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25>Email地址：</TD>
                <TD align=left height=25><INPUT 
                  name=Email class=finput value="<%=PL_rs("email")%>" maxLength=150>
                  <span class="gray13tit STYLE1">*</span> </TD></TR>
              <TR>
                <TD class=gray13tit align=right height=25><span class="n2 L">密码提示问题</span>：</TD>
                <TD align=left height=25><INPUT 
                  name=wenti class=finput id="wenti" value="<%=PL_rs("wenti")%>" maxLength=100>
                  <span class="gray13tit STYLE1">*</span></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25><span class="n2 L">密码提示答案</span>：</TD>
                <TD align=left height=25><INPUT 
                  name=daan type="text" class=finput id="daan" maxLength=100>
                  <span class="gray13tit STYLE1">*<span class="org12">(不修改请留空。)</span></span></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25>验证码：</TD>
                <TD align=left height=25><INPUT name=code class=finput id="code" maxLength=4>
                    <span class="gray13tit STYLE1">*</span><img src="../PL_INC/PL_Code.asp?k=<%=codeKey%>&amp;" onClick="this.src+=parseInt(Math.random()*10)" alt="看不清楚？点击更换下一张。"><span class="org12">(如提示验证码不正确，请点击刷新。)</span></TD>
              </TR>
              <TR>
                <TD height=53 align=right valign="middle" class=gray13tit>以下为选填内容&nbsp;&nbsp;</TD>
                <TD height=53 align=center class=gray13tit>&nbsp;</TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25>性 别：</TD>
                <TD class=gray13tit align=left height=25><INPUT type=radio 
                  CHECKED value=先生 name=sex> 男孩 <INPUT type=radio value=女士 <%if PL_rs("sex")="女士" then%>CHECKED <%end if%>
                  name=sex> 女孩</TD></TR>
              <TR>
                <TD class=gray13tit align=right height=25>真实姓名：</TD>
                <TD class=gray13tit align=left height=25><INPUT 
                  name=Name class=finput id="Name" value="<%=PL_rs("Name")%>" maxLength=50></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25>身份证：</TD>
                <TD class=gray13tit align=left height=25><INPUT 
                  name=Shenfenzheng class=finput id="Shenfenzheng" value="<%=PL_rs("Shenfenzheng")%>" maxLength=50></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25>QQ号码：</TD>
                <TD align=left height=25><INPUT 
                  name=qq class=finput value="<%=PL_rs("qq")%>" maxLength=20> </TD></TR>
              <TR>
                <TD class=gray13tit align=right height=25>电 话：</TD>
                <TD align=left height=25><INPUT 
                  name=tel class=finput id="tel" value="<%=PL_rs("Tel")%>" maxLength=50></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25>地 址：</TD>
                <TD align=left height=25><INPUT 
                  name=Address class=finput id="Address" value="<%=PL_rs("Address")%>" maxLength=255></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25><span class="n2 L">邮政编码</span>：</TD>
                <TD align=left height=25><INPUT 
                  name=Youbian class=finput id="Youbian" value="<%=PL_rs("Youbian")%>" maxLength=20></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right height=25><span class="n2 L">会员类型</span>：</TD>
                <TD align=left height=25><span class="n3 L">
				<%PL_vipdate=PL_rs("vipdate")%>
                  <select name="vipdate" size="1">
                    <option value="-1">免费会员</option>
                    <option value="90"<%if PL_vipdate>0 and PL_vipdate<=90 then%> selected<%end if%>>三个月</option>
                    <option value="182"<%if PL_vipdate>90 and PL_vipdate<=182 then%> selected<%end if%>>半年期</option>
                    <option value="365"<%if PL_vipdate>182 and PL_vipdate<=366 then%> selected<%end if%>>一年期</option>
					<%if PL_vipdate>366 then%><option value="<%=PL_vipdate%>" selected>未知会员级别</option><%end if%>
                  </select>
                </span><%if PL_rs("lockuser")=true and PL_vipdate>0 then%>
                <span class="n2 L STYLE2">您的会员级别还未通过管理员的审核！</span>
                <%else%>
                <span class="STYLE3">&nbsp;&nbsp;已经通过审核！</span>
                <%end if%></TD>
              </TR>
              <TR>
                <TD class=gray13tit align=right>签 名：</TD>
                <TD align=left><TEXTAREA name=qianming cols=40 rows=5 wrap=physical id="qianming" style="BORDER-RIGHT: #99cc00 1px solid; BORDER-TOP: #99cc00 1px solid; BORDER-LEFT: #99cc00 1px solid; BORDER-BOTTOM: #99cc00 1px solid"><%=PL_rs("qianming")%></TEXTAREA>                </TD></TR>
              <TR align=middle>
                <TD align=middle colSpan=2 height=30><input type="hidden" name="codeKey" value="<%=codeKey%>">
                  <input name="act" type="hidden" id="act" value="xiugai">
                  <INPUT type=submit value="修 改" name=Submit> 
                  &nbsp;&nbsp;&nbsp;&nbsp; <INPUT type=reset value="重 写" name=Submit2>            </TD></TR></TBODY></TABLE>
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