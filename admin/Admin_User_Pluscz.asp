<!--#include file="Const.Asp"-->
<%CheckAdmin3%>
<%PageName="admin_UserModify"%>
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
id=request.QueryString("id")
set rs=server.createobject("adodb.recordset")
sql="select * from [user] where id="&id
rs.open sql,conn,1,1
if rs.eof then
	errmsg="<br>操作错误！请联系管理员"
	call error()
	Response.end
else
	Username=rs("Username")
	vipdate=rs("vipdate")
rs.close
end if
%>
<!--#include file="Top.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
<table class="tableBorder" border="0" width="100%" cellspacing="1" cellpadding="1">
  <tr>
    <td align=center valign=top>
      <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
        <form method="POST" action="Admin_User_Err.asp?id=<%=id%>" id=form2 name=form2>
          <tr class="title">
            <td width="100%" height="20" colspan=2 align=center background="images/manage/admin_bg_1.gif">用 户 充 值</td>
          </tr>
          <tr>
            <td width="15%" height="20" class="forumrow" align="right">用户ID：</td>
            <td class="forumrow" width="90%"><%=Username%></td>
          </tr><tr>
            <td width="15%" height="20" class="forumrow" align="right">VIP期限：</td>
            <td class="forumrow" width="90%"><input type="text" name="vipdate" value="<%=vipdate%>" size="20"><font color=red>  时间以天为单位，只要输入数字就OK</font></td>
          </tr>
            <tr>
            <td width="15%" height="20" class="forumrow" align="right"><font color=red>计算开始日期：</font></td>
            <td class="forumrow" width="90%"><input type="text" name="adddate" value="<%=now()%>" size="20"><font color=green>  默认为现在时间，假如是在原来的基础上加时间，请用</font><a href=Admin_User_Action.Asp?id=<%=id%>><font color=red>修改资料</font></a><font color=green>充值</font></td>
          </tr>
            
          <tr align="center">
            <td class="forumrow" colspan=2>
              <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type="hidden" value="cz" name="act"> 
              <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type="submit" value=" 修 改 " name="cmdok2">&nbsp; 
              <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type="reset" value=" 清 除 " name="cmdcance2l">
            </td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
</table>
<%
set rs=nothing
conn.close
set conn=nothing
%></body></html>
