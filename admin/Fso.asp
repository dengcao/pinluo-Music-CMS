<!--#include file="const.asp"-->
<!--#include file="../PL_INC/Cls_AspHttp.asp"-->
<!--#include file="../PL_INC/Function.asp"-->
<!--
HttpGet(10000,10000,20000,20000,RunHod,GetUrl,"",sData,"","zh-cn","application/x-www-form-urlencoded","Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)","gzip, deflate","*/*","gb2312")
-->
<%CheckAdmin3%>
<%
'
'☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
'★                                                                   ★
'☆                     品络音乐程序系统1.0                              ☆
'★                                                                   ★
'☆     空间域名: 品络  www.pinluo.com                                  ☆
'★                                                                   ★
'☆     程序制作: 草札  www.caozha.com                                  ☆
'★                                                                   ★
'★     源码基于Apache-2.0免费开源，请保留声明和链接！                      ★
'☆                                                                   ☆
'☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
'
'
addr0 = request.servervariables("server_name")
addr1 = request.servervariables("url")
addr1 = replace(addr1,"Fso.Asp","index_mb.asp")
addport = request.ServerVariables("SERVER_PORT")
GetUrl = "http://"&addr0&":"&addport&""&addr1&""
indexcode=HttpGet(10000,10000,20000,20000,"GET",GetUrl,"",sData,"","","","Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)","","*/*","gb2312")
filename="../Index.html"
Set fso = Server.CreateObject("Scripting.FileSystemObject")
Set fout = fso.CreateTextFile(server.mappath(""&filename&""))
fout.Write indexcode
fout.close
set fout=nothing
set fso=nothing
mskrindex="ok"
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="admin.css" type=text/css rel=stylesheet>
</head>
<body topmargin="1" leftmargin="1">
<%if mskrindex="ok" then%>
<table class="tableBorder" border="0" cellspacing="0" style="border-collapse: collapse" width="100%" cellpadding="0">
  <tr>
    <td width="100%"><font color="#FF0000">·</font>首页模板地址:<%=GetUrl%><br><font color="#FF0000">·</font>操作成功,生成时间在<%=Now()%><br><font color="#FF0000">·</font>点击浏览<a target="_blank" href="<%=filename%>"><%=filename%></a></td>
  </tr>
</table>
<%
end if
%>   
</body>    
</html>
