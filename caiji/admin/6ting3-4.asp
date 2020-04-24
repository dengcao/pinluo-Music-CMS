<!--#include file="function.asp"-->
<%CheckAdmin1%>
<!--#include file="6tingconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>第六音乐厅通用音音采集器--添加关键字过滤</title>
<style type="text/css">
<!--
.nr {
	font-size: 12px;
}
-->
</style>
</head><body>

<FORM action=6ting3-41.asp method=post name=id>
<table class="tableBorder" width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="../../admin/images/manage/admin_bg_1.gif"><table class="tableBorder" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr> 
            <td height="25" colspan="2" align="center" class="nr"><strong>添加关键字过滤</strong></td>
          </tr>
          <tr> 
            <td width="150" align="right" bgcolor="#FFFFFF"><span class="nr">选择要替换的网站：</span> 
            </td>
            <td align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td><font color="#FF0000"> 
<%
set rs=server.CreateObject("ADODB.RecordSet")
Sql="Select * From const order by id desc"
Rs.Open Sql,Conn1,3,3
%>
                    <select name="claid" id="claid">
					 <% do while not rs.eof %>
					<option value="<%=rs("id")%>"><%=rs("zdname")%></option>
					 <% 
					  rs.movenext
					  loop 
					  %>
                    </select>
<%
rs.close
set fs=nothing
conn1.close
set conn1=nothing
%>
                    <span class="nr"> * </span></font></td>
                </tr>
                <tr> 
                  <td class="nr"><span class="nr">必填，选择你要替换那个网站的东西。</span></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td align="right" bgcolor="#FFFFFF"><span class="nr">选择替换的字段名：</span> 
            </td>
            <td height="12" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td><select name="tfzdname" id="tfzdname">
                      <option value="mp3img">专辑图片</option>
                      <option value="mp3singer">专辑歌手</option>
                      <option value="mp3zjname">专辑名称</option>
                      <option value="mp3yuyan">专辑语言</option>
                      <option value="mp3gongsi">发行公司</option>
                      <option value="mp3time">发行日期</option>
                      <option value="mp3about">专辑介绍</option>
                      <option value="mp3type">歌手分类</option>
                      <option value="mp3name">歌曲名称</option>
                      <option value="musicID">音乐ID</option>
                      <option value="mp3path">音乐路径</option>
                    </select> <font color="#FF0000"><span class="nr">*</span></font></td>
                </tr>
                <tr> 
                  <td class="nr"><span class="nr">必填，选择你要替换的字段名称</span></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td align="right" bgcolor="#FFFFFF" class="nr">替换规则：</td>
            <td height="12" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td><textarea name="tfnr" cols="50" rows="3"></textarea> 
                    <span class="nr"><font color="#FF0000">*</font></span></td>
                </tr>
                <tr> 
                  <td><span class="nr">必填，格式为：要替换的内容|替换后的内容</span></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="25" colspan="2" align="center" bgcolor="#FFFFFF"> <input name="sxbc" type="submit" id="sxbc" value="添加"> 
            </td>
          </tr>
        </table></td>
  </tr>
</table>
</FORM>
</body></html>
