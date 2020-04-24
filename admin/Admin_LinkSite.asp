<!--#include file="Const.Asp"-->
<%CheckAdmin3%>
<%PageName="Admin_LinkSite"%>
<!--#include file="Top.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
<table class="tableBorder" border="0" width="100%" cellspacing="1" cellpadding="1">
  <tr>
    <td align=center valign=top>
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
set rs=server.createobject("adodb.recordset")
sql="select * from FriendSite order by id desc"
rs.open sql,conn,1,1
if rs.eof and rs.bof then 
	response.write "<p align='center'>暂时没有友情站点</p>" 
else 
%>
      <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
             <form method="POST" action="Admin_LinkSite_Err.asp?act=set">
          <tr class="title">
            <td width="100%" height="22" colspan=10 align=center>管 理 友 情 站 点</td>
          </tr>
          <tr>
            <td width="5%" class="forumrow" align="center">选择</td>
            <td width="5%" class="forumrow" align="center">ID</td>
            <td width="10%" class="forumrow" align="center">站名</td>
            <td width="10%" class="forumrow" align="center">地址</td>
            <td width="10%" class="forumrow" align="center">简介</td>
            <td width="20%" class="forumrow" align="center">网站Logo</td>
            <td width="10%" class="forumrow" align="center">站长</td>
            <td width="5%" class="forumrow" align="center">推荐</td>
            <td width="5%" class="forumrow" align="center">修改</td>
            <td width="5%" class="forumrow" align="center">删除</td>
          </tr>
<%
do while not rs.eof
%>
          <tr>
            <td class="forumrow" width="5%"><input type="checkbox" name="checked" value="<%=rs("ID")%>"<%if rs("IsOK")=true then%> checked<%end if%>></td>
            <td class="forumrow" width="5%" align="center"><%=rs("ID")%></td>
            <td class="forumrow" width="10%" align="center"><%=rs("SiteName")%></td>
            <td class="forumrow" width="10%" align=center><a href="<%=rs("SiteUrl")%>" target="_blank" title="<%=rs("SiteUrl")%>">网站地址</a></td>
            <td class="forumrow" width="10%" align=center><a style="cursor:hand" title="<%if rs("SiteIntro")="" or isnull(rs("SiteIntro")) then%>无<%else%><%=rs("SiteIntro")%><%end if%>">网站简介</td>
            <td class="forumrow" width="20%" align=center><%if not isNull(rs("LogoUrl")) then%><img src="<%=rs("LogoUrl")%>" width=88 height=31 border=0 alt="<%=rs("LogoUrl")%>"><%end if%></td>
            <td class="forumrow" width="10%" align="center"><%=rs("SiteAdmin")%></td>
            <td class="forumrow" width="5%" align="center"><input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" onClick="javascript:window.open('Admin_LinkSite_Err.asp?act=SetIsGood&id=<%=rs("ID")%>','_self','')" type="button" value="<%if rs("IsGood")=true then%>撤消<%else%>推荐<%end if%>" name="button1"></td>
            <td class="forumrow" width="5%" align="center"><input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" onClick="javascript:window.open('Admin_LinkSite_Edit.asp?id=<%=rs("ID")%>','_self','')" type="button" value="修改" name="button2"></td>
            <td class="forumrow" width="5%" align="center"><input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" onClick="javascript:window.open('Admin_LinkSite_Err.asp?act=del&id=<%=rs("ID")%>','_self','')" type="button" value="删除" name="button3"></td>
          </tr>
<%
rs.movenext
loop
end if
rs.Close
%>
          <tr>
            <td colspan=10 class="forumrow" height=25 align=center><input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" type="submit" value="选定并生成友情连接" name="submit">   <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" onClick="javascript:window.open('Admin_LinkSite_Action_Add.asp','_self','')" type="button" value="添加新网站" name="button"></td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
</table>
<br>
<%
set rs=nothing
conn.close
set conn=nothing%>
</body>
</html>
