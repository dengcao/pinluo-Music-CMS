<!--#include file="../user/Conn.Asp"-->
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
	Application("Copyright")=rs("Copyright")		'��Ȩ��Ϣ
	Application("Ver")=rs("Ver")				'�汾��Ϣ
	Application("AdminEmail")=rs("AdminEmail")		'վ������
        APPlication("SMS")=rs("SMS")				'����ID
        APPlication("WebPost1")=rs("WebPost1")		        '��ҳ����
        APPlication("WebPost2")=rs("WebPost2")		        '
        APPlication("WebPost3")=rs("WebPost3")		        '
        APPlication("WebPost4")=rs("WebPost4")		        '
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
	Copyright=Application("Copyright")		        '��Ȩ��Ϣ
	Ver=Application("Ver")				        '�汾��Ϣ
	AdminEmail=Application("AdminEmail")		        'վ������
        SMS=Application("SMS")					'����ID
        WebPost1=Application("WebPost1")			'��ҳ����
        WebPost2=Application("WebPost2")			'
        WebPost3=Application("WebPost3")			'
        WebPost4=Application("WebPost4")			'
        Front=Application("Front")			        '
        Keywords=Application("Keywords")			'
        count=Application("count")			        '
        beian=Application("beian")			        '
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
