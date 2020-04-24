<DIV>
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=200 border=0>
  <TBODY>
  <TR>
    <TD vAlign=top background=pinluo.com_style1/music07zjqie_13.gif 
height=87>
      <%if len(Request.Cookies("Www_PinLuo_Com_user")("PL_usercheck"))<>32 then%>
	  <table class="tableBorder" cellSpacing=0 cellPadding=0 width=200 border=0>
        <FORM name="userlogin" action="user/UserChkLogin.asp" method="post" target="_parent">
        <TBODY>
        <TR>
          <TD vAlign=top width=13><IMG height=32 
            src="pinluo.com_style1/music07zjqie_11.gif" width=13></TD>
          <TD class=wirth12b align=right width=46>帐号：</TD>
          <TD width=141><INPUT class="finput" id="UserName" name="UserName"> </TD></TR>
        <TR>
          <TD width=13>&nbsp;</TD>
          <TD class=wirth12b align=right height=30>密码：</TD>
          <TD height=30><INPUT class="finput" id="password" type="password" 
            name="password"></TD></TR>
        <TR>
          <TD colSpan=3 height=30>
            <table class="tableBorder" cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD align=middle width="21%" bgColor=#a9e148 height=29>
                  <DIV align=center><A href="Reg.asp" 
                  target=_blank><IMG height=20 
                  src="pinluo.com_style1/but1_17.gif" width=42 
                  border=0></A></DIV></TD>
                <TD align=middle width="23%" bgColor=#a9e148><INPUT type=image 
                  height=20 width=42 src="pinluo.com_style1/but_17.gif" 
                  align=middle target="('Reg.asp','_blank','')"> </TD>
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
    <TD align=middle bgColor=#baeb51 height=20>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="96%" border=0>
        <TBODY>
        <TR>
          <TD class=black12 align=left>&nbsp;</TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD><IMG height=13 src="pinluo.com_style1/music07zjqie_40.gif" 
      width=200></TD></TR>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE></DIV>