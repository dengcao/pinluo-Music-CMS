<!--#include file="function.asp"-->
<%CheckAdmin1%>
<!--#include file="6tingconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>第六音乐厅通用音音采集器--添加采集站点</title>
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
<FORM action=6ting2-1.asp method=post name=id>
<%
lz=Server.MapPath("/")&"\"
%>
<table class="tableBorder" width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="../../admin/images/manage/admin_bg_1.gif"><table class="tableBorder" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr> 
            <td height="25" align="center" class="nr"><strong>添加站点第一步 设置站点属性</strong></td>
          </tr>
          <tr> 
            <td height="25" align="center" bgcolor="#FFFFFF"><span class="nr">采集站点名称：</span> 
              <input name="zdname" type="text" id="zdname" value="" size="30">
            </td>
          </tr>
          <tr> 
            <td height="25" align="center" bgcolor="#FFFFFF"><span class="nr">采集站点地址：</span> 
              <input name="zdurl" type="text" id="zdurl" size="30">
            </td>
          </tr>
          <tr> 
            <td height="25" align="center" bgcolor="#FFFFFF"><span class="nr">图片保存路径：</span> 
              <input name="imglj" type="text" id="imglj" value="<%=lz%>" size="30">&nbsp;<span class="nr">以"\"结束，目录必须存在，否则出错</span>
            </td>
          </tr>
          <tr> 
            <td height="25" align="center" bgcolor="#FFFFFF"><span class="nr">音乐保存路径：</span> 
              <input name="wmalj" type="text" id="wmalj" value="<%=lz%>" size="30">&nbsp;<span class="nr">以"\"结束，目录必须存在，否则出错</span>
            </td>
          </tr>
          <tr>
            <td height="25" align="center" bgcolor="#FFFFFF">
<input name="sxbc" type="submit" id="sxbc" value="保存到下一步">
            </td>
          </tr>
        </table></td>
  </tr>
</table>
</FORM>
</body>
</html>
