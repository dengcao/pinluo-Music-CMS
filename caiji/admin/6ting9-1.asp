<!--#include file="function.asp"-->
<%CheckAdmin1%>
<!--#include file="6tingconn.asp"-->
<%
founderr=false

id=checksql(request.QueryString("id"))
set rs=server.createobject("adodb.recordset")
sql="select Username,Password from admin where id="&id
rs.open sql,conn1,1,1
if rs.eof then
	errmsg=errmsg+"<br>"+"<li>服务器出错！请联系管理员"
	founderr=true
else
	Username=rs("Username")
	Password=rs("Password")
rs.close()
end if
set rs = nothing
conn1.close()
set conn1 = nothing
if founderr=true then
	call error()
else
%>
<div align="center">
<center>
<table class="tableBorder" border="0" width="80%" cellspacing="0" cellpadding="5">
  <tr>
    <td align=center valign=top>
      <table class="tableBorder" border="1" width="100%" cellspacing="0" cellpadding="0" class="TableLine" bordercolor="GREEN" bordercolordark="#FFFFFF">
        <form method="POST" action="6ting9-3.asp?id=<%=id%>" id=form2 name=form2>
          <tr>
            <td width="100%" height="20" colspan=2 bgcolor="GREEN" align=center><font color="white"><b>修 改 管 理 员 资 料</b></td>
          </tr>
          <tr>
            <td width="30%" align="right" height="30">用户名：</td>
            <td width="70%">
           <input type="text" name="username" value="<%=Username%>" size="20"></td>
          </tr>
          <tr>
            <td width="30%" align="right" valign="top" height="20">密码：</td>
            <td width="70%">
           <input type="password" name="password" value="<%=Password%>" size="20"></td>
          </tr>
          </tr>
          <tr align="center">
            <td colspan=2>
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
</body>
</html>
<%end if%>

