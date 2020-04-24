<!--#include file="function.asp"-->
<%CheckAdmin1%>
<!--#include file="6tingconn.asp"-->
<%
founderr=false
id=checksql(request.form("id"))
url=request.form("url")
body=request.form("body")
mp3img=request.form("mp3img")
mp3imgurl=request.form("mp3imgurl")
nomp3img=request.form("nomp3img")
mp3zjname=request.form("mp3zjname")
mp3about=request.form("mp3about")
mp3singer=request.form("mp3singer")
mp3yuyan=request.form("mp3yuyan")
mp3gongsi=request.form("mp3gongsi")
mp3time=request.form("mp3time")
mp3type=request.form("mp3type")

id=bqtf(id)
url=bqtf(url)
body=bqtf(body)
mp3img=bqtf(mp3img)
mp3imgurl=bqtf(mp3imgurl)
nomp3img=bqtf(nomp3img)
mp3zjname=bqtf(mp3zjname)
mp3about=bqtf(mp3about)
mp3singer=bqtf(mp3singer)
mp3yuyan=bqtf(mp3yuyan)
mp3gongsi=bqtf(mp3gongsi)
mp3time=bqtf(mp3time)
mp3type=bqtf(mp3type)

if id="" or url="" or mp3img="" or mp3imgurl="" or mp3zjname="" or mp3about="" or mp3singer="" or mp3yuyan="" or mp3gongsi="" or mp3time="" or mp3type="" then
	errmsg=errmsg+"<br>"+"<li>请你接要求填写好相关内容！"
	founderr=true
	call error()
	Response.End 
end if

set rs=server.CreateObject("ADODB.RecordSet")
	sql="select * from const where id="&id
	rs.open sql,conn1,3,2
		rs("url")=url
		rs("body")=body
		rs("mp3img")=mp3img
		rs("mp3imgurl")=mp3imgurl
		rs("nomp3img")=nomp3img
		rs("mp3zjname")=mp3zjname
		rs("mp3about")=mp3about
		rs("mp3singer")=mp3singer
		rs("mp3yuyan")=mp3yuyan
		rs("mp3gongsi")=mp3gongsi
		rs("mp3time")=mp3time
		rs("mp3type")=mp3type
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
