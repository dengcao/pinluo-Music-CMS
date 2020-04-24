<!--#include file="function.asp"-->
<%CheckAdmin1%>
<!--#include file="6tingconn.asp"-->
<table class="tableBorder" border="0" width="100%" cellspacing="0" cellpadding="5">
  <tr>
    <td align=center valign=top>
      <table class="tableBorder" border="1" width="88%" cellspacing="0" cellpadding="0" class="TableLine" bordercolor="GREEN" bordercolordark="#FFFFFF">
        <tr> 
          <td width="100%" height="20" colspan=6 bgcolor="GREEN" align=center><font color="white"><b>管 
            理 员 列 表</b></font></td>
        </tr>
        <tr> 
          <td width="25%" align="center" background="tt90/bgleft.gif" height="22">管理员名</td>
          <td width="10%" align="center" background="tt90/bgleft.gif">修改</td>
          <td width="10%" align="center" background="tt90/bgleft.gif">删除</td>
        </tr>
        <%
set rs=server.CreateObject("ADODB.RecordSet")	  
sql="select id,Username from admin"
set rs = conn1.execute(sql)
if rs.EOF then
%>
        <tr>
          <td colspan=4 align=center>没有用户：（</td>
        </tr>
        <%
else
	do while NOT rs.EOF
%>
        <tr> 
          <td width="25%" align="center" height="19"><%=rs("Username")%></td>
          <td width="10%" align="center"><a href="6ting9-1.asp?id=<%=rs("id")%>">修改</a></td>
          <td width="10%" align="center"><a href="6ting9-2.asp?id=<%=rs("id")%>">删除</a></td>
        </tr>
        <%
	rs.MoveNext
	loop
end if
rs.close()
set rs=nothing
conn1.close()
set conn1=nothing
%>
      </table>
      <FORM METHOD=POST ACTION="6ting9-3.asp" id=form1 name=form1>
        <table class="tableBorder" border="1" width="40%" cellspacing="0" cellpadding="0" class="TableLine" bordercolor="GREEN" bordercolordark="#FFFFFF">
          <tr> 
            <td align="center" bgcolor="GREEN" height=20 colspan=2><font color="white"><b>添 加 管 理 员</b></font></td>
          </tr>
          <tr>
            <td align="right">管 理 员 名：</td>
            <td><input type=text name=UserName size="15"  value="" onfocus=this.select() onmouseover=this.focus() name=keyword size=14 maxlength="30"></td>
          </tr>
          <tr> 
            <td align="right">管 理 密 码：</td>
            <td><input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type=Password name=Password size="15"  value="" onfocus=this.select() onmouseover=this.focus() name=keyword size=14 maxlength="30"></td>
          </tr>
          <tr> 
            <td align="center" colspan=2> 
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
</body></html>


<html></html>