<!--#include file="const.asp"-->
<%CheckAdmin2%>
<%PageName="Art_3"%>
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
dim i
set rs=server.createobject("adodb.recordset")
set rs2=server.createobject("adodb.recordset")

sql="select * from class order by classid"
rs.open sql,conn,1,1
i=request("id")
if i="" then i=rs("Classid")
do while not rs.eof
rs.movenext
loop
rs.close
sql="select * from class where classid="&i
rs.open sql,conn,1,1
if rs.eof then
else
%>

<table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
  <tr class="title"> 
    <td height="22" colspan="3" align="center" background="images/admin_bg_1.gif"><strong>�� �� �� �� �� ��</strong></td>
  </tr>
<%
	sql2="select * from SClass where Classid="&rs("Classid")&" order by Sclassid"
		rs2.open sql2,conn,1,1
		if rs2.eof then
%>
              <tr><td Class="title" align="center">���޸��ַ���</td></tr>
<%
			else
			j=0
			do while not rs2.eof
			j=j+1
%>

		<tr>
          <td width="100%" class="forumrow">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0"  align=center class="forumrow">
                  <form method="POST" action="Art_2.asp?act=rename&SClassid=<%=rs2("SClassid")%>" id=form<%=j%> name=form<%=j%>>
                    <tr>
                      <td class="forumrow" width="21%">&nbsp;&nbsp;<%=rs2("SClassid")%>.<%=rs2("SClass")%></td>
                      <td class="forumrow" width="27%"><input size=15 type="text" name="SClass" value="<%=rs2("SClass")%>">&nbsp;&nbsp;<input type="submit" value="�� ��" name="Submit"></td>
                      <td class="forumrow" width="52%"><!--<a title='����<%=rs2("SClass")%>���и���ҳ��' href='make_type.asp?263=<%=rs2("sclassid")%>'><font color=BLUE>1.���ɸ���ҳ��</font></a>&nbsp;&nbsp;<a title='����<%=rs2("SClass")%>����ר��ҳ��' href='make_specialall.asp?type=all&zzyy=<%=rs2("sclassid")%>'><font color=BLUE>2.����ר��ҳ��</font></a>&nbsp;&nbsp;<a title='����<%=rs2("SClass")%>���и���ҳ��' href='make_musiclistall.asp?type=all&zzyy=<%=rs2("sclassid")%>'><font color=BLUE>3.���ɸ���ҳ��</font></a>-->&nbsp;&nbsp;<a onclick="javascript:if (!window.confirm('��ȷ��Ҫɾ�������Ŀ�𣿴˲������ɻָ��������ز�����')){return false;};" title="������һ�벻Ҫʹ�ô˹���" href='Art_2.asp?act=del&SClassid=<%=rs2("SClassID")%>'><font color=red>ɾ��</font></a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    </tr>
                   </form>
                  </table>
		  </td>
        </tr>
<%
			rs2.movenext
			loop
		end if
		rs2.close

end if
rs.close
%>
      </table>
<% 
set rs=nothing
set rs2=nothing
conn.close
set conn=nothing

%>
</body>
</html>
