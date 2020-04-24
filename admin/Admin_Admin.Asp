<!--#include file="Const.Asp"-->
<%CheckAdmin3%>
<!--#include file="Top.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
<table class="tableBorder" border="0" width="100%" cellspacing="0" cellpadding="5">
  <tr>
    <td align=center valign=top>
      <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
          <tr class="title">
            <td width="100%" height="22" colspan=7 align=center background="images/manage/admin_bg_1.gif">管 理 员 列 表</td>
        </tr>
        <tr>
          <td width="25%" class="forumrow" align="center" height="22">管理员名</td>
          <td width="20%" class="forumrow" align="center">权限</td>
          <td width="10%" class="forumrow" align="center">修改</td>
          <td width="10%" class="forumrow" align="center">删除</td>
        </tr>
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
dim action,sqltxt,delid
action=request.QueryString("action")
delid=request.QueryString("id")
if action="del" and delid<>"" then
sqltxt="delete from admin where id="&delid
conn.execute(sqltxt)
response.Redirect("Admin_Admin.Asp")
end if
set rs=server.CreateObject("ADODB.RecordSet")  
sql="select * from admin"
rs.open sql,conn,1
%> 
<%
if rs.EOF then
%>
        <tr><td colspan=5 align=center>没有用户：（</td></tr>
<%
else
	do while NOT rs.EOF
if rs("oskey")="super" then oskey="高级管理员"
if rs("oskey")="check" then oskey="中级管理员"
if rs("oskey")="input" then oskey="初级管理员"
%> 
        <tr> 
          <td width="25%" class="forumrow" align="center" height="19"><%=rs("Username")%></td>
          <td width="20%" class="forumrow" align="center"><%=oskey%>　</td>
          <td width="10%" class="forumrow" align="center"><a href="Admin_Admin_Edit.Asp?id=<%=rs("id")%>">修改</a></td>
          <td width="10%" class="forumrow" align="center"><a href="?action=del&id=<%=rs("id")%>">删除</a></td>
        </tr>
<%
	rs.MoveNext
	loop
end if
rs.close
%> 
      </table>
      <FORM METHOD=POST ACTION="Admin_Admin_Err.asp" id=form1 name=form1>
        <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
          <tr class="title"> 
            <td height="22" colspan="3" align="center" background="images/manage/admin_bg_1.gif">添 加 管 理 员</td>
          </tr>
          <tr>
            <td class="forumrow" align="right">管 理 员 名：</td>
            <td class="forumrow"><input type=text name=UserName size="15"  value="" onfocus=this.select() onmouseover=this.focus() maxlength="30"></td>
          </tr>
          <tr> 
            <td class="forumrow" align="right">管 理 权 限：</td>
            <td class="forumrow">
              <select name="oskey">
                <option value=super selected>高级管理员</option>
                <option value=check>中级管理员</option>
                <option value=input>初级管理员</option>
              </select>
            </td>
          </tr>
          <tr> 
            <td class="forumrow" align="right">管 理 密 码：</td>
            <td class="forumrow"><input type=text name=Password size="15"  value="" onfocus=this.select() onmouseover=this.focus() maxlength="30"></td>
          </tr>
          <tr> 
            <td class="forumrow" align="center" colspan=2> 
             <input type=hidden value="add" name="act">
             <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type=submit value=增加 name="submit">
             <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type=reset name="Submit" value="取消">
            </td>
          </tr>
        </table>
      </FORM>
    </td>
  </tr>
</table>
</div>
<%
set rs=nothing
conn.close
set conn=nothing
%></body></html>
<html></html>
