<%
'Connstr1="DBQ="+server.mappath("1.mdb")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)}" 
'	Set conn=Server.CreateObject("ADODB.CONNECTION")
'	conn.Open Connstr1
%>
<%
    dim dsn,conn 
    dsn="driver={sql server};server=(local);uid=sa;pwd=sa;database=pinluomusicv5"
    set conn=server.createobject("adodb.connection")
    conn.open dsn

	If Err Then
		err.Clear
		Set Conn = Nothing
		Response.Write "Sorry! ���ݿ����ӳ������������ִ���"
		Response.End
	End If

%>
