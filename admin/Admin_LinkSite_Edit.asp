<!--#include file="const.asp"-->
<%CheckAdmin3%>
<%PageName="Admin_LinkSite_Edit"%>
<!--#include file="Top.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
<%
'
'����������������������������������������������������
'��                                                                   ��
'��                     Ʒ�����ֳ���ϵͳ1.0                              ��
'��                                                                   ��
'��     �ռ�����: Ʒ��  www.pinluo.com                                  ��
'��                                                                   ��
'��     ��������: ����  www.caozha.com                                  ��
'��                                                                   ��
'��     Դ�����Apache-2.0��ѿ�Դ���뱣�����������ӣ�                      ��
'��                                                                   ��
'����������������������������������������������������
'
'
id=request.QueryString("id")
set rs=server.createobject("adodb.recordset")
sql="select * from FriendSite where id="&id
rs.open sql,conn,1,1
if rs.eof then
	errmsg=errmsg+"<br>"+"<li>������������ϵ����Ա"
	call error()
	Response.end
else
	SiteName=rs("SiteName")
	SiteUrl=rs("SiteUrl")
	SiteIntro=rs("SiteIntro")
	LogoUrl=rs("LogoUrl")
	SiteAdmin=rs("SiteAdmin")
end if
rs.close

%>

<table class="tableBorder" border="0" width="100%" cellspacing="1" cellpadding="1">
  <tr>
    <td align=center valign=top>
       <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
      <form method="POST" action="Admin_LinkSite_Err.asp?id=<%=id%>">
          <tr class="title">
            <td width="100%" height="22" colspan=2 align=center>�� �� �� �� վ ��</td>
          </tr>
          <tr>
            <td width="15%" class="forumrow" align="right">վ����</td>
            <td class="forumrow" width="85%"><input type="text" name="SiteName" value="<%=SiteName%>" size="20"></td>
          </tr>
          <tr>
            <td class="forumrow" align="right">��ַ��</td>
            <td class="forumrow" ><input type="text" name="SiteUrl" value="<%=SiteUrl%>" size="20"></td>
          </tr>
          
          <tr>
            <td class="forumrow" align="right">վ����</td>
            <td class="forumrow" ><input type="text" name="SiteAdmin" value="<%=SiteAdmin%>" size="20"></td>
          </tr>
          <tr>
            <td class="forumrow" align="right">Logo��ַ��</td>
            <td class="forumrow" ><input type="text" name="LogoUrl" value="<%=LogoUrl%>" size="40">&nbsp;&nbsp;<img src="<%=LogoUrl%>" width=88 height=31 border=0 alt="<%=LogoUrl%>"></td>
          </tr>
          <tr>
            <td class="forumrow" align="right">��飺</td>
            <td class="forumrow" ><TEXTAREA  name="SiteIntro" rows=5 cols="75"><%=SiteIntro%></TEXTAREA></td>
          </tr>
          <tr>
            <td class="forumrow" colspan=2 align=center>
              <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" type="hidden" value="edit" name="act">
              <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type="submit" value=" �� �� " name="cmdok">&nbsp; 
              <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type="reset" value=" �� �� "  name="cmdcancel">
            </td>
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
set conn=nothing%></body></html>

