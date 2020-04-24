<!-- #include File="Function.asp" -->
<%CheckAdmin1%>
<!--#include file="6tingconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>第六音乐厅通用音乐采集器-百度歌词采集</title>
<style type="text/css">
<!--
.nr {
	font-size: 12px;
}
body { background:url(../../admin/images/manage/admin_bg.gif); font-size: 12px; 
SCROLLBAR-FACE-COLOR: #009ace; SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; 
SCROLLBAR-SHADOW-COLOR: #ffffff; SCROLLBAR-DARKSHADOW-COLOR: #009ace; 
SCROLLBAR-3DLIGHT-COLOR: #009ace; SCROLLBAR-ARROW-COLOR: #def0fa;
SCROLLBAR-TRACK-COLOR: #def0fa;
}
-->
</style>
</head>

<body>
<FORM action=../baiducj.asp method=post name=id>
<table class="tableBorder" width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="../../admin/images/manage/admin_bg_1.gif"><table class="tableBorder" width="100%" border="0" cellspacing="1" cellpadding="0">
        <tr> 
            <td width="30%" align="center" bgcolor="#FFFFFF"><span class="nr">采集音乐起始ID：</span> 
            <input type="text" name="Eid">            </td>
            <td width="30%" align="center" bgcolor="#FFFFFF"><span class="nr">采集音乐结束ID：</span> 
            <input type="text" name="Sid">            </td>
            <td align="center" bgcolor="#FFFFFF"><span class="nr">是否开启二次采集</span>
              <label>
              <input name="accj" type="checkbox" id="accj" value="accj" checked>
            </label></td>
            <td align="center" bgcolor="#FFFFFF">
<INPUT class=buttonface name=change type=submit value=开始采集>            </td>
        </tr>
      </table></td>
  </tr>
</table><br>
  <table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td align="center" class="nr"><strong>百度歌词采集</strong></td>
    </tr>
  </table>
</form>
</body>
</html>
