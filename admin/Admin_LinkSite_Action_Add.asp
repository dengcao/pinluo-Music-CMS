<!--#include file="Const.Asp"-->
<%CheckAdmin3%>
<%PageName="Admin_LinkSite_Action_Add"%>
<!--#include file="Top.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
<table class="tableBorder" border="0" width="100%" cellspacing="1" cellpadding="1">
  <tr>
    <td align=center valign=top>
     <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" height="100%">
      <form method="POST" action="Admin_LinkSite_Err.asp?id=<%=id%>">
          <tr class="title">
            <td height="22" colspan="3" align="center"><strong>添 加 友 情 站 点</strong></td>
          </tr>
          <tr>
            <td width="15%" class="forumrow" align="right">站名：</td>
            <td class="forumrow" width="85%"><input type="text" name="SiteName" size="20"></td>
          </tr>
          <tr>
            <td class="forumrow" align="right">网址：</td>
            <td class="forumrow"><input type="text" name="SiteUrl" size="20"></td>
          </tr>
          <tr>
            <td class="forumrow" align="right">Logo地址：</td>
            <td class="forumrow"><input type="text" name="LogoUrl" size="20">  注意：为了提高速度，logo一律放在images/logo目录下，这里只要写文件名！</td>
          </tr>
          <tr>
            <td class="forumrow" align="right">站长：</td>
            <td class="forumrow"><input type="text" name="SiteAdmin" size="20"></td>
          </tr>
          <tr>
            <td class="forumrow" align="right">简介：</td>
            <td class="forumrow"><TEXTAREA  name="SiteIntro" rows=5 cols="75"></TEXTAREA></td>
          </tr>
          <tr>
            <td class="forumrow" colspan=2 align=center>
              <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type="hidden" value="add" name="act">
              <input  style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" type="submit" value=" 添 加 " name="cmdok">&nbsp; 
              <input  style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" type="reset" value=" 取 消 "  name="cmdcancel">
            </td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
</table>
<br>
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
'
set rs=nothing
conn.close
set conn=nothing%>
</body>
</html>
