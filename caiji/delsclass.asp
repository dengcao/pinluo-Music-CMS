<!--#include file="conn.Asp"-->
<%
set rs=server.CreateObject("ADODB.RecordSet")
set rs=conn.execute("delete from sclass") 
set rs=nothing
conn.close
set conn=nothing
response.write "ɾ�����ݳɹ�"
%>