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
dim conn,PL_db
dim connstr

'�����ACCESS���ݿ⣬�������޸ĺ���������ݿ����ӵ�ַ,Ĭ��Ϊ db = "#pinluo.mdb" 

PL_db="/#pinluo.mdb" '���ݿ��ļ�λ��

'on error resume next
connstr="DBQ="+server.mappath("" &PL_db& "")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
set conn=server.createobject("ADODB.CONNECTION")
conn.open connstr

%>
<%
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
