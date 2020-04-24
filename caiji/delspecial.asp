<!--#include file="conn.Asp"-->
<%
set rs=server.CreateObject("ADODB.RecordSet")
set rs=conn.execute("delete from special") 
set rs=nothing
conn.close
set conn=nothing
response.write "删除数据成功"
%>