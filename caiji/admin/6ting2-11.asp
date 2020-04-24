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
	errmsg=errmsg+"<br>"+"<li>采集站点的名称和地址不能为空！"
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
<title>第六音乐厅通用音音采集器--修改采集站点完成</title>
</head>

<body>
<table class="tableBorder" width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td align="center"><strong>修改成功</strong></td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
  <tr> 
    <td align="center"> <form>
        <p>
          <input TYPE="button" value="返回上一步" onCLICK="history.back(-1)">
        </p>
      </form></td>
  </tr>
</table>
</body>
</html>
