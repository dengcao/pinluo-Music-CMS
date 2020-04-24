<%
dim db,conn1,myconn
db="../data/6ting.com.asp"
Set Conn1 = Server.CreateObject("ADODB.Connection")
myconn="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(""&db&"")
Conn1.Open MyConn
%>