<!--#include file="Const.Asp"-->
<!--#include file="Top.Asp"-->
<%CheckAdmin1%>
<%PageName="Make_Word"%>
<LINK href="admin.css" type=text/css rel=stylesheet>
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
server.ScriptTimeout=9999
if request("gx")=1 then
min=request("min")
max=request("max")
if min="" and max="" then mysql=" order by MusicID"
if min<>"" and max="" then mysql=" where MusicID>="&min&" order by MusicID"
if min="" and max<>"" then mysql=" where MusicID<="&max&" order by MusicID"
if min<>"" and max<>"" then mysql=" where MusicID>="&min&" and MusicID<="&max&" order by MusicID"
SqlNum = (Max - Min) + 1
   On Error Resume Next
  '################ ���ɸ��Shtmlҳ�� #Ʒ��Ƽ�###############
    Set Fso = Server.CreateObject("Scripting.FileSystemObject")
    sql="SELECT Top " & SqlNum & " id,MusicID,MusicName,Words,AddUser FROM TextWord "&mysql
    Set Rs = Conn.Execute(Sql) 
    i=0
    while not rs.eof
	if rs("Words")<>"" then 
		words=rs("Words")
	else 
		words="<div align='center'><b>��Ǹ��û���ҵ���֮��صĸ��</b><br><br>"
	end if
	set fw = fso.CreateTextFile(Server.MapPath("/Word/"&rs("MusicID")&".html"),TRUE)  '�����򸲸�
  '################ ���ɸ�ʿ�ʼ #Ʒ��Ƽ�###############
fw.writeline"<html><head>"&vbcrlf
fw.writeline"<title>�鿴��"&rs("MusicName")&"����� - �������"&WebName&"�������ռ����� - "&WebUrl&"</title>"&vbcrlf
fw.writeline"<LINK href='../../Images/Css3.Css' rel=stylesheet type=text/css>"&vbcrlf
fw.writeline"</head>"&vbcrlf
fw.writeline"<body bgcolor='#ECFBFF' leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"&vbcrlf
fw.writeline"<table class="tableBorder" width='300' HEIGHT='100%' border='0' align='center' cellpadding='0' cellspacing='1' bgcolor='#ECFBFF'>"&vbcrlf
fw.writeline"<tr>"&vbcrlf
fw.writeline"<td valign='top'><div align='center'><img src='../Images/ccc.gif' width='300' height='8'><br><b><font color='#003366'>�鿴����"&rs("MusicName")&"�����</font></b><br><img src='../Images/ccc.gif' width='300' height='5'></div>"&vbcrlf
fw.writeline"<div name=Mtext style='width:300px;height:400px;font-face:Arial;padding:3;overflow=auto;border:inset 1px;'>"&vbcrlf
fw.writeline"<input type='button' class='lrcbutton' value=' ��ʱ��� ' onClick=window.open('../User/WordErr.Asp?Type=TextWord&id="&rs("MusicID")&"','','width=500,height=210,top=190,left=320,resizable=no')>&nbsp;"&vbcrlf
fw.writeline"<input type='button' class='lrcbutton' value=' �ύ��� ' onClick=window.open('../User/Word.Asp?id="&rs("MusicID")&"','','width=500,height=339,top=190,left=320,resizable=no')><br><br>"&vbcrlf
fw.writeline Words&"<br>"&vbcrlf
fw.writeline"<div id='adduser' align='right'>��л{<b>" & Rs("AddUser") & "</b>}�ṩ���</div><br>"&vbcrlf
fw.writeline"</div></td></tr></table>"&vbcrlf
fw.writeline"<script language='javascript' src='/user/SongHot.asp?SongType=3&KeyName="&rs("MusicName")&"'></script>"&vbcrlf
fw.writeline"</body></html>"
  '################ ���ɸ�ʽ��� #Ʒ��Ƽ�###############
    fw.close
	response.Write("&nbsp;&nbsp;&nbsp;"&rs("MusicID")&"���������ϣ�<br>")
	response.Flush()
    rs.movenext
	wend
    rs.close
    set rs=nothing
    conn.close
    set conn=nothing
%>
<script>alert('��ϲ�����ɸ��ҳ�ɹ���');history.back();</Script>
<%
Else
	Dim MusicCount
	MusicCount = Conn.Execute("Select Count(ID) From LrcWord")(0)
%>
  <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
  <tr class="title"> 
    <td height="22" colspan="3" align="center"><strong>�� �� �� �� �� �� �� �� ҳ</strong></td>
  </tr>
              <tr><td height="18" align="center" class="forumrow">��ע��˴��������ֵ��һ������5000��ҳ�����ڣ����ID��1����ID��5000��</td>
              </tr>
		<tr>
          <td width="100%" class="forumrow"><FORM name=form1 action=Make_Word.asp?gx=1 method=post>
          <p align="center">��ID:<input type="text" name="min" size="20" value="1">&nbsp;��ID:<input type="text" name="max" size="20" value="<%=MusicCount%>">&nbsp;&nbsp;<input type="submit" value="�� ��" name="B1"></p>
        </form></td>
        </tr>
      </table>
<%
conn.close
set conn=nothing
end if%>
