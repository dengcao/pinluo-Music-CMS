<!--#include file="const.asp"-->
<%CheckAdmin3%>
<%pagename="admin_Smusicdel"%>
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
'dim sql 
'dim rs
'set rs=server.createobject("adodb.recordset")
'sql="delete from [Basic] where id="&request.QueryString("ID")
'rs.open sql,conn,1,1
conn.execute("delete from [Basic] where id="&request.QueryString("ID"))
conn.close
set conn=nothing
id=request("id")
page=request("page")
Response.Write("<script>alert(""��ϲ!ɾ����������ѳɹ�"");location.href=""Admin_SMusicMana.asp"";</script>")
	Response.End
%>
