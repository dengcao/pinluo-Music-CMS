<!--#include file="function.asp"-->
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<LINK href="../css/css.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<base target="main">
</head>
<body bgcolor="#006699" style="background-color: #009ACE" topmargin="0">

<table class="tableBorder" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="135" height="135">
  <tr>
    <td width="100%" valign="top">
    <table class="tableBorder" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
      <tr>
        <td width="100%">
        <table class="tableBorder" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="158">
          <tr>
            <td width="100%"><img border="0" src="../images/ADMIN_title.gif"></td>
          </tr>
          <tr>
            <td width="100%">
            <table class="tableBorder" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="158" height="25">
              <tr>
                <td width="100%" background="../images/ADMIN_bg_quit.gif">
                <table class="tableBorder" border="0" cellpadding="5" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
                      <tr> 
                        <td width="42%" align="center">&nbsp;</td>
                        <td width="43%" align="center"> <b><a target="frmright" href="6ting9.asp"><font color="#FF0000">站长管理</font></a></b></td>
                        <td width="15%">　</td>
                      </tr>
                    </table>
                </td>
              </tr>
            </table>
            </td>
          </tr>
          <tr>
            <td width="100%">　</td>
          </tr>
        </table>
        </td>
      </tr>
      <tr>
        <td width="100%">
        <table class="tableBorder" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="158" height="25">
          <tr>
            <td width="100%" background="../images/admin_left_8.gif">
            <table class="tableBorder" border="0" cellpadding="2" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
              <tr>
                <td width="80%" align="center">
                <p align="left">&nbsp;<font color="#000000"> 音乐采集操作</font></td>
                <td width="20%">　</td>
              </tr>
            </table>
            </td>
          </tr>
        </table>
        </td>
      </tr>
      <tr>
        <td width="100%" valign="top">
        <table class="tableBorder" border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#EEEEEE" width="158">
          <tr>
            <td width="100%" bgcolor="#C5CBE7">
            <table class="tableBorder" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="100%">
              <tr>
                <td width="26%" align="center" bgcolor="#DEE7FF">
                <img border="0" src="../images/bullet.gif"></td>
                  <td width="74%" bgcolor="#DEE7FF"><a href="6ting1.asp" target="frmright">音乐采集列表</a></td>
              </tr>
              <tr>
                <td width="26%" align="center" bgcolor="#DEE7FF">
                <img border="0" src="../images/bullet.gif"></td>
                  <td width="74%" bgcolor="#DEE7FF"><a href="6ting2.asp" target="frmright">添加采集站点</a></td>
              </tr>
              <tr>
                <td width="26%" align="center" bgcolor="#DEE7FF">
                <img border="0" src="../images/bullet.gif"></td>
                <td width="74%" bgcolor="#DEE7FF">
                <a target="frmright" href="6ting3.asp">关键字过滤</a></td>
              </tr>
              <tr>
                <td width="26%" align="center" bgcolor="#DEE7FF">
                <img border="0" src="../images/bullet.gif"></td>
                  <td width="74%" bgcolor="#DEE7FF"><a href="baidu.asp" target="frmright">百度歌词采集</a></td>
              </tr>
              <tr>
                  <td width="26%" align="center" bgcolor="#DEE7FF"><img border="0" src="../images/bullet.gif"></td>
                  <td width="74%" bgcolor="#DEE7FF"><a href="tom.asp" target="frmright">TOM歌词采集</a></td>
              </tr>
              <tr>
                <td width="26%" align="center" bgcolor="#DEE7FF">
                <img border="0" src="../images/bullet.gif"></td>
                  <td width="74%" bgcolor="#DEE7FF"><a href="../6ting.txt" target="frmright">上次音乐采集结束ID</a></td>
              </tr>
              <tr>
                <td width="26%" align="center" bgcolor="#DEE7FF">
                <img border="0" src="../images/bullet.gif"></td>
                  <td width="74%" bgcolor="#DEE7FF"><a href="../baidu.txt" target="frmright">百度歌词采集结束ID</a></td>
              </tr>
              <tr>
                <td width="26%" align="center" bgcolor="#DEE7FF">
                <img border="0" src="../images/bullet.gif"></td>
                  <td width="74%" bgcolor="#DEE7FF"><a href="../tom.txt" target="frmright">TOM歌词采集结束ID</a></td>
              </tr>
<tr>
                <td width="26%" align="center" bgcolor="#DEE7FF">
                <img border="0" src="../images/bullet.gif"></td>
                  <td width="74%" bgcolor="#DEE7FF"><a href="../dellist.asp" target="frmright">清除MusicList表</a></td>
              </tr>
              </tr>
<tr>
                <td width="26%" align="center" bgcolor="#DEE7FF">
                <img border="0" src="../images/bullet.gif"></td>
                  <td width="74%" bgcolor="#DEE7FF"><a href="../delnclass.asp" target="frmright">清除Nclass表</a></td>
              </tr>
              </tr>
<tr>
                <td width="26%" align="center" bgcolor="#DEE7FF">
                <img border="0" src="../images/bullet.gif"></td>
                  <td width="74%" bgcolor="#DEE7FF"><a href="../delspecial.asp" target="frmright">清除special表</a></td>
              </tr>
              </tr>
<tr>
                <td width="26%" align="center" bgcolor="#DEE7FF">
                <img border="0" src="../images/bullet.gif"></td>
                  <td width="74%" bgcolor="#DEE7FF"><a href="../delsclass.asp" target="frmright">清除slcass表</a></td>
              </tr>
            </table>
            </td>
          </tr>
        </table>
        </td>
      </tr>
      <tr>
        <td width="100%">　</td>
      </tr>
      <tr>
        <td width="100%">
        <table class="tableBorder" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="158" height="11">
          <tr> 
            <td width="100%" valign="top"> <table class="tableBorder" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="158" height="25">
                <tr> 
                  <td width="100%" background="../images/admin_left_1.gif">&nbsp; 
                    <font color="#000000">网站属性管理</font></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td width="100%" valign="top"> <table class="tableBorder" border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="100%" bordercolor="#EEEEEE">
                <tr> 
                  <td width="100%" bgcolor="#DEE7FF"> <table class="tableBorder" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="100%">
                      <tr> 
                        <td width="24%" align="center"> <img border="0" src="../images/bullet.gif"></td>
                        <td width="76%"><a href="logout.asp" target="_parent"> 
                          <font color="#FF3300">退出管理中心</font></a></td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td width="100%" valign="top">　</td>
          </tr>
          <tr> 
            <td width="100%" valign="top"> <table class="tableBorder" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="158" height="25">
                <tr> 
                  <td width="100%" background="../images/admin_left_9.gif"> <font color="#000000">&nbsp; 
                    程序版权信息</font></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td width="100%" valign="top"> <table class="tableBorder" border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="100%" bordercolor="#EEEEEE">
                <tr> 
                  <td width="100%" bgcolor="#DEE7FF"> <table class="tableBorder" border="0" cellpadding="2" cellspacing="0" style="border-collapse: collapse" width="100%">
                      <tr> 
                        <td width="100%">&nbsp;版权所有:<a href="http://www.pinluo.com">品络科技通用采集</a></td>
                      </tr>
                      <tr> 
                        <td width="100%">&nbsp;<a target="_blank" href="http://www.pinluo.com">( 
                          www.pinluo.com )</a></td>
                      </tr>
                      <tr> 
                        <td width="100%">&nbsp;客户服务:QQ:497533769</td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
        </table>
</body>

</html>
