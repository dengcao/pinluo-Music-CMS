<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<!--#include file="Const.Asp"-->
<%CheckAdmin3%>
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
set rs=server.CreateObject("ADODB.RecordSet")
set rs=conn.execute("delete from [Comment] where id="&request.QueryString("id")) 
set rs=nothing
conn.close
set conn=nothing
Response.Write("<script>alert(""��ϲ!ɾ�������ѳɹ�"");location.href=""Admin_Comment.asp"";</script>")
	Response.End
%>
