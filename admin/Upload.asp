<!--#include file="const.asp"-->
<%CheckAdmin3%>
<!--#include file="upload.inc"-->
<html>
<head>
<title>ר��ͼƬ�ϴ� - <%=webname%> - <%=weburl%></title>
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
'����������������������������������������������������
'��                                                                   ��
'��                     Ʒ�����ֳ���ϵͳ1.0                              ��
'��                                                                   ��
'��     �ռ�����: Ʒ��  www.pinluo.com                                  ��
'��                                                                   ��
'��     ��������: ����  www.caozha.com                                  ��
'��                                                                   ��
'��     Դ�����Apache-2.0��ѿ�Դ���뱣�����������ӣ�                      ��
'��                                                                   ��
'����������������������������������������������������
'
'
dim upload,file,formName,formPath,iCount
set upload=new upload_5xSoft ''�����ϴ�����

'response.write upload.Version&"<br><br>"  ''��ʾ�ϴ���İ汾

if upload.form("filepath")="" then   ''�õ��ϴ�Ŀ¼
 HtmEnd "������Ҫ�ϴ�����Ŀ¼!"
 set upload=nothing
 response.end
else
 formPath=upload.form("filepath")
 ''��Ŀ¼���(/)
 if right(formPath,1)<>"/" then formPath=formPath&"/" 
end if

iCount=0
for each formName in upload.file ''�г������ϴ��˵��ļ�
 set file=upload.file(formName)  ''����һ���ļ�����
 if file.FileSize>0 then         ''��� FileSize > 0 ˵�����ļ�����
  dim fname
  fname = now()
  fname = replace(fname,"-","")
  fname = replace(fname," ","") 
  fname = replace(fname,":","")
  fname = replace(fname,"PM","")
  fname = replace(fname,"AM","")
  fname = replace(fname,"����","")
  fname = replace(fname,"����","")
  fname = int(fname) + int((10-1+1)*Rnd + 1)
  'fname=""&fname&"."&GetExtendName(file.FileName)&""
  fname=""&fname&".jpg"
  file.SaveAs Server.mappath(formPath&fname)   ''�����ļ�
  tmp = "http://" & request.servervariables("SERVER_NAME") & _            
  left(request.servervariables("SCRIPT_NAME"),len(request.servervariables("SCRIPT_NAME"))-len("upload.asp"))
  picurl=fname
  picurl = replace(picurl,"..","")
 end if
 set file=nothing
next
set upload=nothing
'Htmend iCount&" ���ļ��ϴ�����!"
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
����ַ���Ƶ����:
<input type=text name=T1 size=32 value="<%=picurl%>"> [<a href="Javascript:history.go(-1)">����</a>]
<%else%>����ѡ����Ҫ�ϴ���ͼƬ [<a href="Javascript:history.go(-1)">�ش�</a>]<%end if%>
</body>
</html>
