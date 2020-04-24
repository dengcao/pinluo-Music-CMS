<%
    dim dsn,conn 
    dsn="driver={sql server};server=(local);uid=skymusicv5;pwd=skymusicv5;database=v5"
    set conn=server.createobject("adodb.connection")
    conn.open dsn

	If Err Then
		err.Clear
		Set Conn = Nothing
		Response.Write "Sorry! 数据库连接出错，请检查连接字串。"
		Response.End
	End If

%>