<!--#include file = "../PL_config.asp"-->
<!--#include file="function.asp"-->
<base target="contents">
<%CheckAdmin1%>
<%PageName="admin"%>

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
Response.Expires = 0  
Response.ExpiresAbsolute = Now() - 1  
Response.cachecontrol = "no-cache" 
Response.Write "<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.01 Transitional//EN"">"

select case request("action")
	case "admin_left"
		call admin_left()
	case "admin_main"
		call admin_main()
	case else
		call main()
	end select
sub main()
%>
<HTML><HEAD><TITLE>��̨�������� - Ʒ��Ƽ� | www.PinLuo.Com</TITLE>
<META http-equiv=Content-Type content=text/html;charset=gb2312>
<SCRIPT>
<!--//
function switchBar(){
if (switchPoint.innerText=='3'){
switchPoint.innerText='4'
document.all("leftFrame").style.display="none"
}else{
switchPoint.innerText='3'
document.all("leftFrame").style.display=""
}}
//-->
</SCRIPT>
<STYLE type=text/css>
.navPoint {
	FONT-SIZE: 12px; CURSOR: hand; COLOR: white; FONT-FAMILY: Webdings
}
</STYLE>

<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY style="MARGIN: 0px" scroll=no>
<table class="tableBorder" height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TR>
    <TD id=leftFrame vAlign=center noWrap align=middle name="leftFrame">
    <IFRAME id=carnoc style="Z-INDEX: 2; VISIBILITY: inherit; WIDTH: 185px; HEIGHT: 100%" name=carnoc src="admin.asp?action=admin_left" frameBorder=0 scrolling=yes>
    </IFRAME></TD>
    <TD bgcolor=#9395C0 style="WIDTH: 9pt">
      <table class="tableBorder" height="100%" cellSpacing=0 cellPadding=0 border=0>
        <TR>
          <TD title=��/�ر�ȫ�� style="HEIGHT: 100%" onclick=switchBar()><FONT style="FONT-SIZE: 9pt; CURSOR: default; COLOR: #ffffff">
           <SPAN class=navPoint id=switchPoint title=��/�ر�ȫ��>3</SPAN><BR><BR>�˵��л� 
        </FONT></TD></TR></TABLE></TD>
    <TD style="WIDTH: 100%">
      <IFRAME id=main style="Z-INDEX: 1; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 100%" name=main src="admin.asp?action=admin_main" frameBorder=0 scrolling=yes>
    </IFRAME></TD></TR></TABLE>
</BODY></HTML>
<%
end sub
sub admin_left()

REM ������Ŀ����
dim menu(6,35)
menu(0,0)="ϵͳ����"
menu(0,1)="<a target=main href=Admin_Setup.Asp>������Ϣ����</a>"
menu(0,2)="<a target=main href=Admin_news.Asp>��վ���Ź���</a>"
menu(0,3)="<a href=newpic.asp target=main>��������ͼƬ</a>"
menu(0,4)="<a href=Admin_User.Asp target=main>ע���Ա����</a>"
menu(0,5)="<a href=admin_data.asp?action=SpaceSize target=main>ϵͳ�ռ�ռ��</a>"
menu(0,6)="<a href=Picmanage.asp target=main>�ϴ�ͼƬ����</a>"
menu(0,7)="<a target=main href=Admin_path.Asp>������ַ����</a>"
menu(0,8)="<a href=admin_make_page.asp?ysc="&weburl&"index.asp&scmulu=../index.html target=main><font color=red>������վ��ҳ</font></a>"
menu(0,9)="<a href=admin_make_page.asp?ysc="&weburl&"playlist.asp&scmulu=../playlist.html target=main><font color=red>�����¸��б�</font></a>"
menu(0,10)="<a href=admin_serverinfo.asp target=main>��������Ϣ</a>"

menu(1,0)="���ֹ���"
menu(1,1)="<a href=Class.Asp target=main>��ӱ༭����</a>"
menu(1,2)="<a href=Art.Asp target=main>��Ӹ��ַ���</a>"
menu(1,3)="<a href=Art_3.asp target=main>���ַ������</a>"
menu(1,4)="<a target=main href=Admin_SClass.Asp?id=1>��ӱ༭����</a>"
menu(1,5)="<a href=Admin_special_Index.Asp?id=1 target=main>��ӱ༭ר��</a>"
menu(1,6)="<a href=Admin_Allspecial.Asp target=main>��ʾ����ר��</a>"
menu(1,7)="<a href=Admin_Allmusic.Asp target=main>��ʾ���и���</a>"
menu(1,8)="<a href=Admin_Word.Asp target=main>�ı���ʹ���</a>"
menu(1,9)="<a href=Admin_LrcWord.Asp target=main>LRC��ʹ���</a>"

	set rs1=server.CreateObject("ADODB.RecordSet")
	sql1="select * from mb where ison=1"
	rs1.open sql1,conn,1,1
	if not rs1.eof then
		mbid=rs1("id")
	else
		mbid=1
	end if
	rs1.close
	set rs1=nothing






menu(2,0)="������"
menu(2,1)="<a target=main href=Admin_Ads.asp?id=1&type=a&chi=960X60>��ҳ���һ(960X60)</a>"
menu(2,2)="<a target=main href=Admin_Ads.asp?id=2&type=a&chi=960X60>��ҳ����(960X60)</a>"
menu(2,3)="<a target=main href=Admin_Ads.asp?id=3&type=a&chi=960X60>��ҳ�����(960X60)</a>"
menu(2,4)="<a target=main href=Admin_Ads.asp?id=&type=a&chi=468X60>��ҳ���һ(468X60)</a>"
menu(2,5)="<a target=main href=Admin_Ads.asp?id=&type=a&chi=720X60>��ҳ����(720X60)</a>"
menu(2,6)="<a target=main href=Admin_Ads.asp?id=&type=a&chi=235X60>��ҳ�����(235X60)</a>"
menu(2,7)="��������������������"
menu(2,8)="<a target=main href=Admin_Ads.asp?id=1&type=b&chi=770x60>���ֹ��һ(770X60)</a>"
menu(2,9)="<a target=main href=Admin_Ads.asp?id=2&type=b&chi=770x60>���ֹ���(770X60)</a>"
menu(2,10)="<a target=main href=Admin_Ads.asp?id=1&type=b&chi=960X60>���ֹ����(960X60)</a>"
menu(2,11)="<a target=main href=Admin_Ads.asp?id=2&type=b&chi=960X60>���ֹ����(960X60)</a>"
menu(2,12)="��������������������"
menu(2,13)="<a target=main href=Admin_Ads.asp?id=1&type=c&chi=770X60>ר�����һ(770X60)</a>"
menu(2,14)="<a target=main href=Admin_Ads.asp?id=2&type=c&chi=770X60>ר������(770X60)</a>"
menu(2,15)="<a target=main href=Admin_Ads.asp?id=3&type=c&chi=770X60>ר�������(770X60)</a>"
menu(2,16)="��������������������"
menu(2,17)="<a target=main href=Admin_Ads.asp?id=1&type=d&chi=770X60>�������һ(770X60)</a>"
menu(2,18)="<a target=main href=Admin_Ads.asp?id=2&type=d&chi=770X60>��������(770X60)</a>"
menu(2,19)="<a target=main href=Admin_Ads.asp?id=3&type=d&chi=770X60>���������(770X60)</a>"
menu(2,20)="��������������������"
menu(2,21)="<a target=main href=Admin_Ads.asp?id=&type=p&chi=970X90>���Ź��һ(970x90)</a>"
menu(2,22)="<a target=main href=Admin_Ads.asp?id=2&type=p&chi=970X90>���Ź���(970x90)</a>"
menu(2,23)="<a target=main href=Admin_Ads.asp?id=&type=p&chi=660x90>���Ź����(660x90)</a>"
menu(2,24)="<a target=main href=Admin_Ads.asp?id=&type=p&chi=300x90>���Ź����(300x90)</a>"
menu(2,25)="<a target=main href=Admin_Ads.asp?id=2&type=p&chi=300x90>���Ź����(300x90)</a>"
menu(2,26)="<a target=main href=Admin_Ads.asp?id=&type=p&chi=667X60>���Ź����(667X60)</a>"
menu(2,27)="<a target=main href=Admin_Ads.asp?id=&type=p&chi=338X30>���Ź����(338X30)</a>"
menu(2,28)="<a target=main href=Admin_flashAds.asp>flash�������(338X30)</a>"
menu(2,29)="��������������������"
menu(2,30)="<a target=main href=Admin_Ads.asp?id=1&type=s>�������һ(667X60)</a>"
menu(2,31)="<a target=main href=Admin_Ads.asp?id=2&type=s>��������(187X300)</a>"
menu(2,32)="<a target=main href=Admin_Ads.asp?id=3&type=s>���������(187X300)</a>"
menu(2,33)="��������������������"
menu(2,34)="<a target=main href=Admin_Ads.asp?id=1&type=l>�������һ(140X367)</a>"

menu(3,0)="��Ա����"
menu(3,1)="<a target=main href=Admin_Admin.Asp><font color=#FF0000>����Ա����</font></a>"
menu(3,2)="<a target=main href=Admin_User.Asp>VIP��Ա����</a>"
menu(3,3)="<a target=main href=Admin_LinkSite.Asp>�������ӹ���</a>"

menu(4,0)="���ݿ����"
menu(4,1)="<a href=Admin_Sql.Asp target=main>SQL���ݿⱸ�ݻ�ԭ</a>"
menu(4,2)="<a href=Admin_Data_Sql.Asp target=main>ֱ��ִ��SQL���</a>"
menu(4,3)="<a target=main href=sql.asp>SQLע����־</a>"

menu(5,0)="�ɼ�����"
menu(5,1)="<a href=../caiji/admin/6ting1.asp target=main>���ֲɼ��б�</a>"
menu(5,2)="<a href=../caiji/admin/6ting2.asp target=main>��Ӳɼ�վ��</a>"
menu(5,3)="<a target=main href=../caiji/admin/6ting3.asp>�ؼ��ֹ���</a>"
menu(5,4)="<a target=main href=../caiji/admin/baidu.asp>�ٶȸ�ʲɼ�</a>"
menu(5,5)="<a target=main href=../caiji/admin/TOM.asp>TOM��ʲɼ�</a>"
menu(5,6)="<a target=main href=../caiji/6ting.txt>�ϴ����ֲɼ�����ID</a>"
menu(5,7)="<a target=main href=../caiji/baidu.txt>�ϰٶȸ�ʲɼ�����ID</a>"
menu(5,8)="<a target=main href=../caiji/tom.txt>TOM��ʲɼ�����ID</a>"
menu(5,9)="<a target=main href=../caiji/ʹ��˵��.txt><font color=red>�ɼ�����˵��</font></a>"

menu(6,0)="���۹���"
menu(6,1)="<a href=Admin_Comment.Asp target=main>��������</a>"
menu(6,2)="<a href=Admin_Comment.Asp?listtype=1 target=main>��������</a>"
menu(6,3)="<a target=main href=Admin_Comment.Asp?listtype=2>ר������</a>"
menu(6,4)="<a target=main href=Admin_Comment.Asp?listtype=3>��������</a>"
%>

<!--

menu(2,0)="ģ�����"
menu(2,1)="<a href=admin_mb.asp target=main>ģ��ѡ��</a><B><font color=red>(��ǰģ��"&mbid&")</font></b>"
menu(2,2)="<a href=admin_index_mb.asp target=main>��ҳģ�����</a>"
menu(2,3)="<a href=Mold.Asp?type=geshou target=main>����ģ�����</a>"
menu(2,4)="<a href=Mold.Asp?type=zhuanji target=main>ר��ģ�����</a>"
menu(2,5)="<a href=Mold.Asp?type=gequ target=main>����ģ�����</a>"
menu(2,6)="<a href=Mold.Asp?type=play target=main>����ҳģ�����</a>"


menu(3,0)="���ɹ���"
menu(3,1)="<B><font color=red>(ģ��"&mbid&"���ɹ���)</font></b>"
menu(3,2)="<a href=Make_index.Asp target=main>������վ��ҳ</a>"
menu(3,3)="<a href=Make_lb.Asp target=main>��������ҳ��</a>"
menu(3,4)="<a href=make_typeall"&mbid&".asp?type=all&zzyy=1 target=main>���ɸ��ַ���</a>"
menu(3,5)="<a href=make_specialall_all"&mbid&".asp target=main>��ID��������ר��</a>"
menu(3,6)="<a href=make_musiclistall_all"&mbid&".asp target=main>��ID�������ɸ���</a>"
menu(3,7)="<a href=make_musicplayall_all"&mbid&".asp target=main>��ID�������ɲ���</a>"
menu(3,8)="��������������������"
menu(3,9)="<a href=Make_TopMusic.asp target=main>�������»������</a>"
menu(3,10)="<a href=Make_TopMusic1.asp target=main>�������Ȼ������</a>"
menu(3,11)="<a href=Make_TopMusic2.asp target=main>�����и������а�</a>"
menu(3,12)="<a href=Make_TopMusic3.asp target=main>����Ů�������а�</a>"
menu(3,13)="<a href=Make_TopMusic4.asp target=main>�ֶ�������а�</a>"
menu(3,14)="<a href=Make_TopMusic5.asp target=main>ŷ���������а�</a>"
menu(3,15)="<a href=Make_TopMusic6.asp target=main>�պ��������а�</a>"
menu(3,16)="��������������������"
menu(3,17)="<a href=Make_Topcd.asp target=main>���¸���ר��</a>"
menu(3,18)="<a href=Make_Topcd1.asp target=main>��������ר��</a>"
menu(3,19)="<a href=Make_Topcd2.asp target=main>���»�����ר��</a>"
menu(3,20)="<a href=Make_Topcd3.asp target=main>���»���Ůר��</a>"
menu(3,21)="<a href=Make_Topcd4.asp target=main>�����ֶ�ר��</a>"
menu(3,22)="<a href=Make_Topcd5.asp target=main>����ŷ��ר��</a>"
menu(3,23)="<a href=Make_Topcd6.asp target=main>�����պ�ר��</a>"
menu(3,24)="<a href=Make_Topcd7.asp target=main>��������ר��</a>"

-->
<title>����ҳ��</title>
<META content="MSHTML 5.00.3315.2870" name=GENERATOR>
<style type=text/css>
<!--
BODY{
	margin:0px;
	FONT-SIZE: 12px;
	FONT-FAMILY:  "����", "Verdana", "Arial", "Helvetica", "sans-serif";
	background-color: #BEBFD9;
	scrollbar-face-color: #EAEAF2;
        scrollbar-highlight-color: #FFFFFF;
        scrollbar-shadow-color: #9395C0;
        scrollbar-3dlight-color: #F3F3F8;
        scrollbar-arrow-color: #9395C0;
        scrollbar-track-color: #F3F3F8;
        scrollbar-darkshadow-color: #F3F3F8;
}
table  { border:0px; }
td  { font:normal 12px ����; }
img  { vertical-align:bottom; border:0px; }
a  { font:normal 12px ����; color:#111111; text-decoration:none; }
a:hover  { color:#6C70AA;text-decoration:underline; }
.sec_menu  { border-left:1px solid white; border-right:1px solid white; border-bottom:1px solid white; overflow:hidden; background:#FBFBFC; }
.menu_title  { }
.menu_title span  { position:relative; top:2px; left:8px; color:#4A4F80; font-weight:bold; }
.menu_title2  { }
.menu_title2 span  { position:relative; top:2px; left:8px; color:#596099; font-weight:bold; }
input,select,Textarea{
font-family:����,Verdana, Arial, Helvetica, sans-serif; font-size: 12px;}
}
-->
</style>
<SCRIPT language=javascript1.2>
function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
}
}
</SCRIPT>
<BODY leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<table class="tableBorder" width=100% cellpadding=0 cellspacing=0 border=0 align=left> 
<tr>
  <td valign=top> <table class="tableBorder" cellpadding=0 cellspacing=0 width=158 align=center>
      <tr> 
        <td height=42 valign=bottom> <img src="images/manage/admin_title.gif" width=158 height=38> 
        </td>
      </tr>
    </table>
    <table class="tableBorder" cellpadding=0 cellspacing=0 width=158 align=center>
      <tr> 
        <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="images/manage/title_bg_quit.gif"> 
          <span><a href="admin.asp" target=_top><b>������ҳ</b></a> | <a href="logout.asp" target=_top><b>�˳�</b></a></span> 
        </td>
      </tr>
      <tr> 
        <td style="display:"> <div class=sec_menu style="width:158"> 
            
            <table class="tableBorder" cellpadding=0 cellspacing=0 align=center width=135>
              <tr> 
                <td height=20>�û�����<font color=red><%=Session("PL_Adminname")%></font></td>
              </tr>
              <tr> 
                <td height=20>��&nbsp;&nbsp;�ݣ�<font color=red>ϵͳ����Ա</font></td>
              </tr>
</table></td>
    </table>
    <div  style="width:158"> 
            <table class="tableBorder" cellpadding=0 cellspacing=0 align=center width=135>
              <tr>
                
            <td height=10></td>
              </tr>
            </table>
          </div>
<%
	dim j,i
	dim tmpmenu
	dim menuname
	dim menurl
for i=0 to ubound(menu,1)
%>
<table class="tableBorder" cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
    <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="images/manage/title_bg_show.gif" id=menuTitle1 onClick="showsubmenu(<%=i%>)">
	  <span><%=menu(i,0)%></span>
	</td>
  </tr>
  <tr>
    <td 
<%if i=0 or i=1 then%>
style="display:"
<%else%>
style="display:none"
<%end if%>
 id='submenu<%=i%>'><!--or i=2 or i=3 or i=4 -->
    <!--<td style="display:none" id='submenu<%=i%>'>-->
<div class=sec_menu style="width:158">
<table class="tableBorder" cellpadding=0 cellspacing=0 align=center width=135>
	<%
	for j=1 to ubound(menu,2)
	if isempty(menu(i,j)) then exit for
	%>
<tr><td height=20><img src="images/manage/bullet.gif" border=0><%=menu(i,j)%></td></tr>
<%
	next
%>
</table>
	  </div>
<div  style="width:158">
<table class="tableBorder" cellpadding=0 cellspacing=0 align=center width=135>
<tr><td height=10></td></tr>
</table>
	  </div>
	</td>
  </tr>
</table>
<%next%>
<table class="tableBorder" cellpadding=0 cellspacing=0 width=158 align=center>
<tr><td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="images/manage/admin_left_2.gif" id=menuTitle1><span>ϵͳ��Ϣ</span> </td></tr><tr> 
<td><div class=sec_menu style="width:158"><table class="tableBorder" cellpadding=0 cellspacing=0 align=center width=135>
<tr><td height=20><br>�汾��<a target="_blank" href="http://www.pinluo.com/">Ʒ������ϵͳV1.0</a></td></tr>
<tr><td height=20>����֧�֣�QQ812153636</td></tr>
<tr><td height=20>��ϵ���ǣ�<a target="_blank" href="http://www.pinluo.com/ContactUs.asp">����ͷ�</a></td></tr>
<tr><td height=20></td></tr>
</table>
</div></td>
</tr>
</table>
<BR>
<%
end sub
sub admin_main()
Dim theInstalledObjects(4)
theInstalledObjects(1) = "Scripting.FileSystemObject"
theInstalledObjects(2) = "adodb.connection"
'theInstalledObjects(3) = "JMail.SMTPMail"
'theInstalledObjects(4) = "CDONTS.NewMail"
%>
<title>����ҳ��</title>
<link rel="stylesheet" href="admin.css" type="text/css">
<BODY leftmargin="0" bottommargin="0" rightmargin="0" topmargin="0" marginheight="0" marginwidth="0" bgcolor="#DDEEFF">

<!--#include file="Top.Asp"-->

<table class="tableBorder" cellpadding="3" cellspacing="1" border="0" width="95%" align=center>
  <tr>
    <td class="title2" height=23 colspan=2>����վ��Ȩ��<%=Copyright%>ʹ�ã���ǰʹ�ð汾Ϊ:<!--#include file="ver.Asp"--></td>
  </tr>
<tr> 
<th class="tableHeaderText" colspan=2 height=25>��ϵͳע���˵��</th>
</tr> 
<tr> 
<td class="forumRow" style="LINE-HEIGHT: 150%">
<li>��̬���ɣ����ڹ��ڿռ���������ļ۸�Ϊ�˷�ֹ�˷�������ķ������ռ���Դ����վ�ݲ�����html���ɹ��ܣ�ȫվ���ö�̬��ʽ������Ժ�ȷʵ����ҵ�û���������html�ģ����ǻῼ�ǿ�����</li>
<li>������Դ��ϵͳ�Դ����������ݾ����Ի������������ܱ�֤������Ч��</li>
<li>���ڷ���ɾ��������Ҫע�⣬ɾ�����ཫɾ�������������ݣ��������༰����HTML��</li>
<li>����������ó�����Ʒ��Ƽ�������ɣ��ѹ��������û�����������������޸�ʹ�ã�����ת��������ȡ��ȫ������������׷���������Σ���̨�뱣���İ�Ȩ��Ϣ�������к�������Ҳ������ߵ���ϵ��ʽ��</li>
</td></tr>
</table>
<BR>

<table class="tableBorder" cellpadding="2" cellspacing="1" border="0" width="95%" align=center>
<tr><th class="tableHeaderText" colspan=2 height=25>ϵͳ��Ϣͳ��</th></tr>
<tr>
<td width="50%"  class="forumRowHighlight" height=23>���������ͣ�<%=Request.ServerVariables("OS")%>(IP:<%=Request.ServerVariables("LOCAL_ADDR")%>)</td>
<td width="50%" class="forumRow">�ű��������棺<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
</tr>
<tr>
<td width="50%" class="forumRowHighlight" height=23>վ������·����<%=request.ServerVariables("APPL_PHYSICAL_PATH")%></td>
<td width="50%" class="forumRow">����������<%=Request.ServerVariables("SERVER_NAME")%></td>
</tr>
<tr>
<td width="50%" class="forumRowHighlight" height=23>FSO�ı���д��<%If Not IsObjInstalled(theInstalledObjects(1)) Then%><font color="#FF0066"><b>��</b></font><%else%><b>��</b><%end if%></td>
<td width="50%" class="forumRow">���ݿ�ʹ�ã�<%If Not IsObjInstalled(theInstalledObjects(2)) Then%><font color="#FF0066"><b>��</b></font><%else%><b>��</b><%end if%></td>
</tr>
</table>
<br />
<table class="tableBorder" cellpadding="3" cellspacing="1" border="0" width="95%" align=center>
<tr><th class="tableHeaderText" colspan=2 height=25>�ٷ�����(�ٷ���Ϣ���£�������һʱ��õ����£�����ɾ����)</th></tr> 
<tr><td class="forumRow" style="LINE-HEIGHT: 150%"><IFRAME src="http://www.pinluo.com/user/Services_show.asp?PL_type=no&b=PL_0003&bg=EFEFF5&key=PinLuo.Com_DGWVUCNNMRJZVFCDMQ2L381EIMBNZT2FQGMOMDFUPND1AMF65DELWC5RQ7N7GZX1JHI5NXV7FVFMBACOSYAAV5HJTI2UZ8P34A9B&l=shengji" frameBorder=0 width=100% scrolling=yes height=160></IFRAME></td></tr></table>
<table align=center ><tr align=center><td width="100%" style="LINE-HEIGHT: 150%">Copyright &copy; 2008  All rights reserved.<BR><a target=_blank href=http://www.pinluo.com/>Ʒ�����ֹ���ϵͳV1.0</a><BR></td></tr></table>
<%
'call admin_footer()
end sub 

Function IsObjInstalled(strClassString)
On Error Resume Next
IsObjInstalled = False
Err = 0
Dim xTestObj
Set xTestObj = Server.CreateObject(strClassString)
If 0 = Err Then IsObjInstalled = True
Set xTestObj = Nothing
Err = 0
End Function
%>
