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
	Password=rs("Password")
	Sex=rs("Sex")
	Email=rs("Email")
	Tel=rs("Tel")
	Name=rs("Name")
	Address=rs("Address")
	Youbian=rs("Youbian")
	Shenfenzheng=rs("Shenfenzheng")
	loginip=rs("loginip")
	qq=rs("qq")
	adddate=rs("adddate")
	logindate=rs("logindate")
	vipdate=rs("vipdate")
rs.close
end if
%>
<!--#include file="Top.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
<div align="center">
<table class="tableBorder" border="0" width="100%" cellspacing="1" cellpadding="1">
  <tr>
    <td align=center valign=top>
      <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
        <form method="POST" action="Admin_User_Err.asp?id=<%=id%>" id=form2 name=form2>
          <tr class="title">
            <td width="100%" height="20" colspan=2 align=center background="images/manage/admin_bg_1.gif">修 改 用 户 资 料</td>
          </tr>
          <tr>
            <td class="forumrow" width="30%" height="20" align="right">用户ID：</td>
            <td class="forumrow" width="70%"><input type="text" name="username" value="<%=Username%>" size="20"></td>
          </tr>
          <tr>
            <td class="forumrow" width="30%" height="20" align="right" valign="top">密码：</td>
            <td class="forumrow" width="70%"><input type="password" name="password" value="<%=Password%>" size="20"></td>
          </tr>
          <tr>
            <td class="forumrow" width="30%" height="20" align="right">性别：</td>
            <td class="forumrow" width="70%"><input type="text" name="Sex" value="<%=Sex%>" size="20"></td>
            </td>
          </tr>
          <tr>
            <td class="forumrow" width="30%" height="20" align="right">E-mail：</td>
            <td class="forumrow" width="70%"><input type="text" name="Email" value="<%=Email%>" size="20"></td>
          </tr>
          <tr>
            <td class="forumrow" width="30%" height="20" align="right">真实姓名：</td>
            <td class="forumrow" width="70%"><input type="text" name="Name" value="<%=Name%>" size="20"></td>
          </tr>

          <tr>
            <td class="forumrow" width="30%" height="20" align="right">身份证号：</td>
            <td class="forumrow" width="70%"><input type="text" name="Shenfenzheng" value="<%=Shenfenzheng%>" size="20"></td>
          </tr>
          <tr>
            <td class="forumrow" width="30%" height="20" align="right">联系电话：</td>
            <td class="forumrow" width="70%"><input type="text" name="Tel" value="<%=Tel%>" size="20"></td>
          </tr>
          <tr>
            <td class="forumrow" width="30%" height="20" align="right">详细地址：</td>
            <td class="forumrow" width="70%"><input type="text" name="Address" value="<%=Address%>" size="20"></td>
          </tr>
          <tr>
            <td class="forumrow" width="30%" height="20" align="right">邮政编码：</td>
            <td class="forumrow" width="70%"><input type="text" name="Youbian" value="<%=Youbian%>" size="20"></td>
          </tr>
          <tr>
            <td class="forumrow" width="30%" height="20" align="right">QQ号码：</td>
            <td class="forumrow" width="70%"><input type="text" name="qq" value="<%=qq%>" size="20"></td>
          </tr>
           <tr>
            <td class="forumrow" width="30%" height="20" align="right">冲值日期：</td>
            <td class="forumrow" width="70%"><%=adddate%></td>
          </tr>
           <tr>
            <td class="forumrow" width="30%" height="20" align="right">最后登陆：</td>
            <td class="forumrow" width="70%"><%=logindate%></td>
          </tr>
          <tr>
            <td class="forumrow" width="30%" height="20" align="right">最后 I P：</td>
            <td class="forumrow" width="70%"><%=loginip%></td>
          </tr>
           <tr>
            <td class="forumrow" width="30%" height="20" align="right">VIP期限：</td>
            <td class="forumrow" width="70%"><input type="text" name="vipdate" value="<%=vipdate%>" size="20">&nbsp;天</td>
          </tr>
          <tr align="center">
            <td class="forumrow" colspan=2>
              <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type="hidden" value="edit" name="act"> 
              <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type="submit" value=" 修 改 " name="cmdok2">&nbsp; 
              <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type="reset" value=" 清 除 " name="cmdcance2l">
            </td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
</table>
</div>
<%
set rs=nothing
conn.close
set conn=nothing
%></body></html>
