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


dim SystemDatabaseType

SystemDatabaseType = "ACCESS"     '请修改系统数据库类型，"SQL"为MS SQL2000数据库，"ACCESS"为MS ACCESS 2000数据库，免费版只能使用ACCESS数据库                                               


if SystemDatabaseType = "ACCESS" then
dim db

'如果是ACCESS数据库，请认真修改好下面的数据库连接地址,默认为 db = "pinluo.mdb" 


db = "#pinluo.mdb"


Connstr="DBQ="+server.mappath("" & db & "")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)}"
Set conn=Server.CreateObject("ADODB.CONNECTION")
conn.Open Connstr

ElseIf SystemDatabaseType = "SQL" then


'如果是SQL数据库，请认真修改好以下数据库选项。

dim connstr
Dim strSQLServerName
Dim strSQLDBUserName
Dim strSQLDBPassword
Dim strSQLDBName
strSQLServerName = "(local)"               	'服务器名称或地址
strSQLDBUserName = "pinluo"                 '数据库帐号
strSQLDBPassword = "123456"               	'数据库密码
strSQLDBName = "pinluomusic222"                '数据库名称
'on error resume next
Set conn = Server.CreateObject("ADODB.Connection")
connstr = "Provider=SQLOLEDB.1;Persist Security Info=False;Server=" & strSQLServerName & ";User ID=" & strSQLDBUserName & ";Password=" & strSQLDBPassword & ";Database=" & strSQLDBName & ";"
conn.open connstr

else
response.write("<center><font color=red size=3><b><br /><br /><br /><br /><br />数据库连接类型没有配置好，请联系管理员！<br /><br /><br />&nbsp;</b></font></center>")
response.end()
%>
<%End if%>

<%
'
'***********************************************
'过程名：checksql
'作  用：过滤恶意字符以及html语法
'参  数：str  ----待处理的字符串
'       strtype ----过滤方式,1为数字,2为html过滤,3为不过滤html
'返回值:过滤了的字符
'***********************************************
Function checksql(str,strtype)
str=""&str
str=Trim(str)
str=replace(str,"'","''")
str = Replace(str, CHR(32), "&nbsp;")
str = Replace(str, CHR(9), "&nbsp;")
str=Replace(str, CHR(10) & CHR(10), "</P><P> ")
str=Replace(str, CHR(10), "<BR> ")			
str=Replace(str, CHR(13), "")
if strtype=1 then
   if isNumeric(str) then
     str=clng(str)
   else
     str=1
   end if
elseif strtype=2 then
  str=replace(str,"<","&lt;")
  str=replace(str,">","&gt;") 
  str=replace(str,CHR(34),"&quot;") 
  str=replace(str," ","&nbsp;")
  str=Replace(str, CHR(39), "&#39;")
elseif strtype=4 then
  str=replace(str,"&","&amp;")
else   
  str=str
end if
  checksql=str
end function
'# ---------------------------------------------
'# 函数：LeftStr(text,length)
'# 描述：代替left函数按照中文两个字符,字母一个字符的方式截长
'# 参数： text-字符串,length-要截取的长度
'#----------------------------------------------
Function LeftStr(text,length)  
	Dim l_t
	l_t=""
	Dim l_mt
	Dim l_l
	l_l=0
	Dim l_c
	For l_i= 1 To Len(text)
		l_mt=mid(text,l_i,1)
		l_c=Asc(l_mt)
		If l_c<0 Then l_c=l_c+65536
		If l_c > 255 Then
			l_l=l_l+2
		Else 
			l_l=l_l+1
		End If
		If l_l<=CLng(length) Then
			l_t=l_t&l_mt
		else
			exit for
		End If
	Next
	LeftStr=l_t
End Function
%>
