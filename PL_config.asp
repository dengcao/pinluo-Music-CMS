<!--#include file="PL_Conn.asp"-->
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
set rs=server.createobject("adodb.recordset")
sql="select * from const" 
rs.open sql,conn,1,1
if not rs.eof then
	Application("WebName")=rs("WebName")			'网站名称
	Application("WebUrl")=rs("WebUrl")			'网站地址
	Application("Webmulu")=rs("Webmulu")			'网站安装目录
	Application("Copyright")=rs("Copyright")		'版权信息
	Application("Ver")=rs("Ver")				'版本信息
	Application("AdminEmail")=rs("AdminEmail")		'站长信箱
        APPlication("WebPost1")=rs("WebPost1")		        '首页公告
        APPlication("WebPost2")=rs("WebPost2")		        '
        APPlication("WebPost3")=rs("WebPost3")		        '
        APPlication("WebPost4")=rs("WebPost4")		        '
		APPlication("Weburl1")=rs("Weburl1")		        '首页公告链接
        APPlication("Weburl2")=rs("Weburl2")		        '
        APPlication("Weburl3")=rs("Weburl3")		        '
        APPlication("Weburl4")=rs("Weburl4")	
        APPlication("Front")=rs("Front")		        '路径前缀
        APPlication("Keywords")=rs("Keywords")		        '关键字
        APPlication("count")=rs("count")		        '统计代码
        APPlication("beian")=rs("beian")		        '备案信息
        APPlication("bottominfo")=rs("bottominfo")		'统计代码

end if
rs.close
set rs=nothing
	WebName=Application("WebName")			        '网站名称
	WebUrl=Application("WebUrl")			        '网站地址
	Webmulu=Application("Webmulu")			        '网站名称
	Copyright=Application("Copyright")		        '版权信息
	Ver=Application("Ver")				        '版本信息
	AdminEmail=Application("AdminEmail")		        '站长信箱
        WebPost1=Application("WebPost1")			'首页公告
        WebPost2=Application("WebPost2")			'
        WebPost3=Application("WebPost3")			'
        WebPost4=Application("WebPost4")			'
		Weburl1=Application("Weburl1")		        '首页公告链接
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
