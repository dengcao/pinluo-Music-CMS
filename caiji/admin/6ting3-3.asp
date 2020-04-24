<!--#include file="function.asp"-->
<%CheckAdmin1%>
<!--#include file="6tingconn.asp"-->
<%
id=checksql(request.QueryString("id"))
set rs=server.CreateObject("ADODB.RecordSet")
	sql="select * from gjz where id="&id
	rs.open sql,conn1,3,2
	claid=dyh(rs("claid")) 
    tfzdname=dyh(rs("tfzdname")) 
    tfnr=dyh(rs("tfnr")) 
rs.close
set fs=nothing
%>
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

<FORM action=6ting3-42.asp method=post name=id>
<table class="tableBorder" width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="../../admin/images/manage/admin_bg_1.gif"><table class="tableBorder" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr> 
            <td height="25" colspan="2" align="center" class="nr"><strong>添加关键字过滤<%=claid%></strong></td>
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
					 <%if claid=cstr(rs("id")) then %>
          					<option value="<%=rs("id")%>" selected><%=rs("zdname")%></option>
					<%	else   %>
          					<option value="<%=rs("id")%>"><%=rs("zdname")%></option>						   
					 <% 
					  end if
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
				       <%a=""%>
                      <option value="mp3img" <%if tfzdname="mp3img" then a="selected"%> <%=a%>>专辑图片</option>
					  <%a=""%>
                      <option value="mp3singer" <%if tfzdname="mp3singer" then a="selected"%> <%=a%>>专辑歌手</option>
					  <%a=""%>
                      <option value="mp3zjname" <%if tfzdname="mp3zjname" then a="selected"%> <%=a%>>专辑名称</option>
					  <%a=""%>
                      <option value="mp3yuyan" <%if tfzdname="mp3yuyan" then a="selected"%> <%=a%>>专辑语言</option>
					  <%a=""%>
                      <option value="mp3gongsi" <%if tfzdname="mp3gongsi" then a="selected"%> <%=a%>>发行公司</option>
					  <%a=""%>
                      <option value="mp3time" <%if tfzdname="mp3time" then a="selected"%> <%=a%>>发行日期</option>
					  <%a=""%>
                      <option value="mp3about" <%if tfzdname="mp3about" then a="selected"%> <%=a%>>专辑介绍</option>
					  <%a=""%>
                      <option value="mp3type" <%if tfzdname="mp3type" then a="selected"%> <%=a%>>歌手分类</option>
					  <%a=""%>
                      <option value="mp3name" <%if tfzdname="mp3name" then a="selected"%> <%=a%>>歌曲名称</option>
					  <%a=""%>
                      <option value="musicID" <%if tfzdname="musicID" then a="selected"%> <%=a%>>音乐ID</option>
					  <%a=""%>
                      <option value="mp3path" <%if tfzdname="mp3path" then a="selected"%> <%=a%>>音乐路径</option>
					  <%a=""%>
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
                  <td><textarea name="tfnr" cols="50" rows="3"><%=tfnr%></textarea> 
                    <span class="nr"><font color="#FF0000">*</font></span></td>
                </tr>
                <tr> 
                  <td><span class="nr">必填，格式为：要替换的内容|替换后的内容</span></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="25" colspan="2" align="center" bgcolor="#FFFFFF"> <input name="id" type="text" id="id" size="50" value="<%=id%>" style="display:none"><input name="sxbc" type="submit" id="sxbc" value="修改"> 
            </td>
          </tr>
        </table></td>
  </tr>
</table>
</FORM>
</body></html>
