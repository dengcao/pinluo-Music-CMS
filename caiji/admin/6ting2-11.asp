<!--#include file="function.asp"-->
<%CheckAdmin1%>
<!--#include file="6tingconn.asp"-->
<%
founderr=false
zdname=request.form("zdname")
zdurl=request.form("zdurl")
id=checksql(request.form("id"))
imglj=request.form("imglj")
wmalj=request.form("wmalj")

zdname=bqtf(zdname)
zdurl=bqtf(zdurl)
id=bqtf(id)
imglj=bqtf(imglj)
wmalj=bqtf(wmalj)

if zdname="" or zdurl="" then
	errmsg=errmsg+"<br>"+"<li>�ɼ�վ������ƺ͵�ַ����Ϊ�գ�"
	founderr=true
	call error()
	Response.End 
end if

set rs=server.CreateObject("ADODB.RecordSet")
	sql="select * from const where id="&id
	rs.open sql,conn1,3,2
		rs("zdname")=zdname
		rs("zdurl")=zdurl
		rs("imglj")=imglj
		rs("wmalj")=wmalj
		rs.update
	rs.close()
set rs=nothing
conn1.close
set conn1=nothing
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����������ͨ�������ɼ���--�޸Ĳɼ�վ�����</title>
</head>

<body>
<table class="tableBorder" width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td align="center"><strong>�޸ĳɹ�</strong></td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
  <tr> 
    <td align="center"> <form>
        <p>
          <input TYPE="button" value="������һ��" onCLICK="history.back(-1)">
        </p>
      </form></td>
  </tr>
</table>
</body>
</html>
