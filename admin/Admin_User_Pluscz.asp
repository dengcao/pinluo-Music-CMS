<!--#include file="Const.Asp"-->
<%CheckAdmin3%>
<%PageName="admin_UserModify"%>
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
sql="select * from [user] where id="&id
rs.open sql,conn,1,1
if rs.eof then
	errmsg="<br>������������ϵ����Ա"
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
            <td width="100%" height="20" colspan=2 align=center background="images/manage/admin_bg_1.gif">�� �� �� ֵ</td>
          </tr>
          <tr>
            <td width="15%" height="20" class="forumrow" align="right">�û�ID��</td>
            <td class="forumrow" width="90%"><%=Username%></td>
          </tr><tr>
            <td width="15%" height="20" class="forumrow" align="right">VIP���ޣ�</td>
            <td class="forumrow" width="90%"><input type="text" name="vipdate" value="<%=vipdate%>" size="20"><font color=red>  ʱ������Ϊ��λ��ֻҪ�������־�OK</font></td>
          </tr>
            <tr>
            <td width="15%" height="20" class="forumrow" align="right"><font color=red>���㿪ʼ���ڣ�</font></td>
            <td class="forumrow" width="90%"><input type="text" name="adddate" value="<%=now()%>" size="20"><font color=green>  Ĭ��Ϊ����ʱ�䣬��������ԭ���Ļ����ϼ�ʱ�䣬����</font><a href=Admin_User_Action.Asp?id=<%=id%>><font color=red>�޸�����</font></a><font color=green>��ֵ</font></td>
          </tr>
            
          <tr align="center">
            <td class="forumrow" colspan=2>
              <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type="hidden" value="cz" name="act"> 
              <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type="submit" value=" �� �� " name="cmdok2">&nbsp; 
              <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type="reset" value=" �� �� " name="cmdcance2l">
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
