<%
    dim dsn,conn 
    dsn="driver={sql server};server=(local);uid=skymusicv5;pwd=skymusicv5;database=v5"
    set conn=server.createobject("adodb.connection")
    conn.open dsn

	If Err Then
		err.Clear
		Set Conn = Nothing
		Response.Write "Sorry! ���ݿ����ӳ������������ִ���"
		Response.End
	End If

%>