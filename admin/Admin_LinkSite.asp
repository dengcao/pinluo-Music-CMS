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
set rs=server.createobject("adodb.recordset")
sql="select * from FriendSite order by id desc"
rs.open sql,conn,1,1
if rs.eof and rs.bof then 
	response.write "<p align='center'>��ʱû������վ��</p>" 
else 
%>
      <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
             <form method="POST" action="Admin_LinkSite_Err.asp?act=set">
          <tr class="title">
            <td width="100%" height="22" colspan=10 align=center>�� �� �� �� վ ��</td>
          </tr>
          <tr>
            <td width="5%" class="forumrow" align="center">ѡ��</td>
            <td width="5%" class="forumrow" align="center">ID</td>
            <td width="10%" class="forumrow" align="center">վ��</td>
            <td width="10%" class="forumrow" align="center">��ַ</td>
            <td width="10%" class="forumrow" align="center">���</td>
            <td width="20%" class="forumrow" align="center">��վLogo</td>
            <td width="10%" class="forumrow" align="center">վ��</td>
            <td width="5%" class="forumrow" align="center">�Ƽ�</td>
            <td width="5%" class="forumrow" align="center">�޸�</td>
            <td width="5%" class="forumrow" align="center">ɾ��</td>
          </tr>
<%
do while not rs.eof
%>
          <tr>
            <td class="forumrow" width="5%"><input type="checkbox" name="checked" value="<%=rs("ID")%>"<%if rs("IsOK")=true then%> checked<%end if%>></td>
            <td class="forumrow" width="5%" align="center"><%=rs("ID")%></td>
            <td class="forumrow" width="10%" align="center"><%=rs("SiteName")%></td>
            <td class="forumrow" width="10%" align=center><a href="<%=rs("SiteUrl")%>" target="_blank" title="<%=rs("SiteUrl")%>">��վ��ַ</a></td>
            <td class="forumrow" width="10%" align=center><a style="cursor:hand" title="<%if rs("SiteIntro")="" or isnull(rs("SiteIntro")) then%>��<%else%><%=rs("SiteIntro")%><%end if%>">��վ���</td>
            <td class="forumrow" width="20%" align=center><%if not isNull(rs("LogoUrl")) then%><img src="<%=rs("LogoUrl")%>" width=88 height=31 border=0 alt="<%=rs("LogoUrl")%>"><%end if%></td>
            <td class="forumrow" width="10%" align="center"><%=rs("SiteAdmin")%></td>
            <td class="forumrow" width="5%" align="center"><input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" onClick="javascript:window.open('Admin_LinkSite_Err.asp?act=SetIsGood&id=<%=rs("ID")%>','_self','')" type="button" value="<%if rs("IsGood")=true then%>����<%else%>�Ƽ�<%end if%>" name="button1"></td>
            <td class="forumrow" width="5%" align="center"><input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" onClick="javascript:window.open('Admin_LinkSite_Edit.asp?id=<%=rs("ID")%>','_self','')" type="button" value="�޸�" name="button2"></td>
            <td class="forumrow" width="5%" align="center"><input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" onClick="javascript:window.open('Admin_LinkSite_Err.asp?act=del&id=<%=rs("ID")%>','_self','')" type="button" value="ɾ��" name="button3"></td>
          </tr>
<%
rs.movenext
loop
end if
rs.Close
%>
          <tr>
            <td colspan=10 class="forumrow" height=25 align=center><input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" type="submit" value="ѡ����������������" name="submit">   <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" onClick="javascript:window.open('Admin_LinkSite_Action_Add.asp','_self','')" type="button" value="�������վ" name="button"></td>
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
