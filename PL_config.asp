<!--#include file="PL_Conn.asp"-->
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
set rs=server.createobject("adodb.recordset")
sql="select * from const" 
rs.open sql,conn,1,1
if not rs.eof then
	Application("WebName")=rs("WebName")			'��վ����
	Application("WebUrl")=rs("WebUrl")			'��վ��ַ
	Application("Webmulu")=rs("Webmulu")			'��վ��װĿ¼
	Application("Copyright")=rs("Copyright")		'��Ȩ��Ϣ
	Application("Ver")=rs("Ver")				'�汾��Ϣ
	Application("AdminEmail")=rs("AdminEmail")		'վ������
        APPlication("WebPost1")=rs("WebPost1")		        '��ҳ����
        APPlication("WebPost2")=rs("WebPost2")		        '
        APPlication("WebPost3")=rs("WebPost3")		        '
        APPlication("WebPost4")=rs("WebPost4")		        '
		APPlication("Weburl1")=rs("Weburl1")		        '��ҳ��������
        APPlication("Weburl2")=rs("Weburl2")		        '
        APPlication("Weburl3")=rs("Weburl3")		        '
        APPlication("Weburl4")=rs("Weburl4")	
        APPlication("Front")=rs("Front")		        '·��ǰ׺
        APPlication("Keywords")=rs("Keywords")		        '�ؼ���
        APPlication("count")=rs("count")		        'ͳ�ƴ���
        APPlication("beian")=rs("beian")		        '������Ϣ
        APPlication("bottominfo")=rs("bottominfo")		'ͳ�ƴ���

end if
rs.close
set rs=nothing
	WebName=Application("WebName")			        '��վ����
	WebUrl=Application("WebUrl")			        '��վ��ַ
	Webmulu=Application("Webmulu")			        '��վ����
	Copyright=Application("Copyright")		        '��Ȩ��Ϣ
	Ver=Application("Ver")				        '�汾��Ϣ
	AdminEmail=Application("AdminEmail")		        'վ������
        WebPost1=Application("WebPost1")			'��ҳ����
        WebPost2=Application("WebPost2")			'
        WebPost3=Application("WebPost3")			'
        WebPost4=Application("WebPost4")			'
		Weburl1=Application("Weburl1")		        '��ҳ��������
		Weburl2=Application("Weburl2")		        '
		Weburl3=Application("Weburl3")		        '
		Weburl4=Application("Weburl4")			
        Front=Application("Front")			'
        Keywords=Application("Keywords")			'
        count=Application("count")			'
        beian=Application("beian")			'
        bottominfo=Application("bottominfo")			'
%>
<%
if Application("MaxShangpinlist")="" then
 Application.Lock
	Application("MaxSpecialList")="15"
 Application.UnLock
end if
	MaxSpecialList=Application("MaxSpecialList")
%>
