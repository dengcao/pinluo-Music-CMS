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


dim SystemDatabaseType

SystemDatabaseType = "ACCESS"     '���޸�ϵͳ���ݿ����ͣ�"SQL"ΪMS SQL2000���ݿ⣬"ACCESS"ΪMS ACCESS 2000���ݿ⣬��Ѱ�ֻ��ʹ��ACCESS���ݿ�                                               


if SystemDatabaseType = "ACCESS" then
dim db

'�����ACCESS���ݿ⣬�������޸ĺ���������ݿ����ӵ�ַ,Ĭ��Ϊ db = "pinluo.mdb" 


db = "#pinluo.mdb"


Connstr="DBQ="+server.mappath("" & db & "")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)}"
Set conn=Server.CreateObject("ADODB.CONNECTION")
conn.Open Connstr

ElseIf SystemDatabaseType = "SQL" then


'�����SQL���ݿ⣬�������޸ĺ��������ݿ�ѡ�

dim connstr
Dim strSQLServerName
Dim strSQLDBUserName
Dim strSQLDBPassword
Dim strSQLDBName
strSQLServerName = "(local)"               	'���������ƻ��ַ
strSQLDBUserName = "pinluo"                 '���ݿ��ʺ�
strSQLDBPassword = "123456"               	'���ݿ�����
strSQLDBName = "pinluomusic222"                '���ݿ�����
'on error resume next
Set conn = Server.CreateObject("ADODB.Connection")
connstr = "Provider=SQLOLEDB.1;Persist Security Info=False;Server=" & strSQLServerName & ";User ID=" & strSQLDBUserName & ";Password=" & strSQLDBPassword & ";Database=" & strSQLDBName & ";"
conn.open connstr

else
response.write("<center><font color=red size=3><b><br /><br /><br /><br /><br />���ݿ���������û�����úã�����ϵ����Ա��<br /><br /><br />&nbsp;</b></font></center>")
response.end()
%>
<%End if%>

<%
'
'***********************************************
'��������checksql
'��  �ã����˶����ַ��Լ�html�﷨
'��  ����str  ----��������ַ���
'       strtype ----���˷�ʽ,1Ϊ����,2Ϊhtml����,3Ϊ������html
'����ֵ:�����˵��ַ�
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
'# ������LeftStr(text,length)
'# ����������left�����������������ַ�,��ĸһ���ַ��ķ�ʽ�س�
'# ������ text-�ַ���,length-Ҫ��ȡ�ĳ���
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
