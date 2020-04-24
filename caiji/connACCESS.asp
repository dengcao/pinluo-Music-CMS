<%
Connstr1="DBQ="+server.mappath("1.mdb")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)}" 
	Set conn=Server.CreateObject("ADODB.CONNECTION")
	conn.Open Connstr1
%>

