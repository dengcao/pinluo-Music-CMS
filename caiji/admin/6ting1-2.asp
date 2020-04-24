<!--#include file="function.asp"-->
<%CheckAdmin1%>
<!--#include file="6tingconn.asp"-->
<%
conn1.execute("delete from const where id="&checksql(request.QueryString("id")))
conn1.close()
set conn1 = nothing
response.redirect "6ting1.asp"
%>
