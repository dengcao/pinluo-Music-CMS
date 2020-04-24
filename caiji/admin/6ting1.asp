<!--#include file="function.asp"-->
<%CheckAdmin1%>
<!--#include file="6tingconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>音乐采集列表</title>
<style type="text/css">
<!--
.nr {
	font-size: 12px;
}
-->
body { background:url(../../admin/images/manage/admin_bg.gif); font-size: 12px; 
SCROLLBAR-FACE-COLOR: #009ace; SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; 
SCROLLBAR-SHADOW-COLOR: #ffffff; SCROLLBAR-DARKSHADOW-COLOR: #009ace; 
SCROLLBAR-3DLIGHT-COLOR: #009ace; SCROLLBAR-ARROW-COLOR: #def0fa;
SCROLLBAR-TRACK-COLOR: #def0fa;
}
</style>
</head>
<body>
<%
set rs=server.CreateObject("ADODB.RecordSet")
Sql="Select id,zdname,zdurl,caijitype From const order by id desc"
Rs.Open Sql,Conn1,3,3
i=0
%>
<table class="tableBorder" width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td background="../../admin/images/manage/admin_bg_1.gif"> 
      <table class="tableBorder" width="100%" border="0" cellspacing="1" cellpadding="0">
        <tr align="center" background="../../admin/images/manage/admin_bg_1.gif" class="nr"> 
          <td width="2%" height="21" background="../../admin/images/manage/admin_bg_1.gif"><strong>ID</strong></td>
          <td width="12%" background="../../admin/images/manage/admin_bg_1.gif"><strong>采集站点名称</strong></td>
          <td width="17%" background="../../admin/images/manage/admin_bg_1.gif"><strong>采集站点地址</strong></td>
          <td width="10%" background="../../admin/images/manage/admin_bg_1.gif"><strong>专辑起始ID</strong></td>
          <td width="10%" background="../../admin/images/manage/admin_bg_1.gif"><strong>专辑结束ID</strong></td>
          <td width="5%" background="../../admin/images/manage/admin_bg_1.gif"><strong>是否存图</strong></td>
          <td width="5%" background="../../admin/images/manage/admin_bg_1.gif"><strong>下载mp3</strong></td>
          <td width="5%" background="../../admin/images/manage/admin_bg_1.gif"><strong>编码方式</strong></td>
          <td width="5%" background="../../admin/images/manage/admin_bg_1.gif"><strong>修改</strong></td>
          <td width="5%" background="../../admin/images/manage/admin_bg_1.gif"><strong>删除</strong></td>
          <td width="6%" background="../../admin/images/manage/admin_bg_1.gif"><strong>采集</strong></td>
        </tr>
        <% do while not rs.eof %>
		<% i=i+1%>
        <FORM action=../6tingcj.asp?claid=<%=rs("id")%> method=post name=id>
          <tr bgcolor="#FFFFFF"> 
            <td height="28" align="center" bgcolor="#FFFFFF" class="nr"><%=i%></td>
            <td height="28" align="center" bgcolor="#FFFFFF" class="nr"><a href="<%=rs("zdurl")%>" target="_blank"><%=rs("zdname")%></a></td>
            <td align="center" class="nr"><%=rs("zdurl")%></td>
            <td align="center"> <INPUT name=EndPage size=8 value="1"> </td>
            <td align="center"> <INPUT name=StarPage size=8 value="5"> </td>
            <td align="center"> <input name="picsave" type="checkbox" value="picsave" checked>            </td>
            <td align="center"> <input name="mp3save" type="checkbox" value="mp3save" >            </td>
            <td align="center" bgcolor="#FFFFFF" class="nr"><select name="caijitype">
              <option value="0" <%if rs("caijitype")<>"1" then response.write("selected")%>>GB2312</option>
              <option value="1" <%if rs("caijitype")="1" then response.write("selected")%>>UTF-8</option>
            </select>
            </td>
            <td align="center" bgcolor="#FFFFFF" class="nr"> <a href="6ting1-3.asp?id=<%=rs("id")%>">修改</a>            </td>
            <td align="center" bgcolor="#FFFFFF" class="nr"><a href="6ting1-2.asp?id=<%=rs("id")%>">删除</a></td>
            <td align="center"> <INPUT class=buttonface name=change type=submit value=采集>            </td>
          </tr>
        </FORM>
        <%
   rs.movenext
loop
%>
      </table>
    </td>
  </tr>
</table>
<%
rs.close
set fs=nothing
%>
</body>
</html>
