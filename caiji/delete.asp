<!--#include file="Const.Asp"-->
<%CheckAdmin3%>
<%
set rs=server.CreateObject("ADODB.RecordSet")
set rs=conn.execute("delete * from [user] where id="&request.QueryString("id")) 
set rs=nothing
conn.close
set conn=nothing
response.redirect "Admin_User.Asp"
%>