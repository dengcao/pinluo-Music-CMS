<!--#include file="const.asp"-->
<%CheckAdmin3%>
<!--#include file="upload.inc"-->
<html>
<head>
<title>专辑图片上传 - <%=webname%> - <%=weburl%></title>
<style>
td{font-size:9pt;line-height:140%} 
body{font-size:9pt;line-height:140%} 
a:link       { color: #0033CC; text-decoration: none }
a:visited    { color: #0033CC; text-decoration: none }
a:hover      { color: #000000; text-decoration: underline}
</style>
</head>
<body  topmargin="0" leftmargin="0">
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
dim upload,file,formName,formPath,iCount
set upload=new upload_5xSoft ''建立上传对象

'response.write upload.Version&"<br><br>"  ''显示上传类的版本

if upload.form("filepath")="" then   ''得到上传目录
 HtmEnd "请输入要上传至的目录!"
 set upload=nothing
 response.end
else
 formPath=upload.form("filepath")
 ''在目录后加(/)
 if right(formPath,1)<>"/" then formPath=formPath&"/" 
end if

iCount=0
for each formName in upload.file ''列出所有上传了的文件
 set file=upload.file(formName)  ''生成一个文件对象
 if file.FileSize>0 then         ''如果 FileSize > 0 说明有文件数据
  dim fname
  fname = now()
  fname = replace(fname,"-","")
  fname = replace(fname," ","") 
  fname = replace(fname,":","")
  fname = replace(fname,"PM","")
  fname = replace(fname,"AM","")
  fname = replace(fname,"上午","")
  fname = replace(fname,"下午","")
  fname = int(fname) + int((10-1+1)*Rnd + 1)
  'fname=""&fname&"."&GetExtendName(file.FileName)&""
  fname=""&fname&".jpg"
  file.SaveAs Server.mappath(formPath&fname)   ''保存文件
  tmp = "http://" & request.servervariables("SERVER_NAME") & _            
  left(request.servervariables("SCRIPT_NAME"),len(request.servervariables("SCRIPT_NAME"))-len("upload.asp"))
  picurl=fname
  picurl = replace(picurl,"..","")
 end if
 set file=nothing
next
set upload=nothing
'Htmend iCount&" 个文件上传结束!"
sub HtmEnd(Msg)
 set upload=nothing
end sub

function GetExtendName(FileName)
dim ExtName
ExtName = LCase(FileName)
ExtName = right(ExtName,3)
ExtName = right(ExtName,3-Instr(ExtName,"."))
GetExtendName = ExtName
end function
if picurl<>"" then%>
将地址复制到左边:
<input type=text name=T1 size=32 value="<%=picurl%>"> [<a href="Javascript:history.go(-1)">继续</a>]
<%else%>请先选择你要上传的图片 [<a href="Javascript:history.go(-1)">重传</a>]<%end if%>
</body>
</html>
