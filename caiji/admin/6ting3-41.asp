<!--#include file="function.asp"-->
<%CheckAdmin1%>
<!--#include file="6tingconn.asp"-->
<%
founderr=false
claid=checksql(request.form("claid"))
tfzdname=request.form("tfzdname")
tfnr=request.form("tfnr")

claid=bqtf(claid)
tfzdname=bqtf(tfzdname)
tfnr=bqtf(tfnr)

if claid="" or tfzdname="" or tfnr=""then
	errmsg=errmsg+"<br>"+"<li>采集站点的名称和地址不能为空！"
	founderr=true
	call error()
	Response.End 
end if

set rs=server.CreateObject("ADODB.RecordSet")
	sql="select * from gjz where tfnr='"&tfnr&"'"
	rs.open sql,conn1,3,2
		rs.addnew
		rs("claid")=claid
		rs("tfzdname")=tfzdname
		rs("tfnr")=tfnr
		rs.update
	rs.close()
set rs=nothing
conn1.close
set conn1=nothing
response.redirect "6ting3.asp"
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>添加成功</title>
</head>

<body>

</body>
</html>
