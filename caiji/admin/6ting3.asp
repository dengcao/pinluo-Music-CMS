<!--#include file="function.asp"-->
<%CheckAdmin1%>
<!--#include file="6tingconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��������������ͨ�òɼ�--�ؼ����滻</title>
<style type="text/css">
<!--
.nr {
	font-size: 12px;
}
body { background:url(../../admin/images/manage/admin_bg.gif); font-size: 12px; 
SCROLLBAR-FACE-COLOR: #009ace; SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; 
SCROLLBAR-SHADOW-COLOR: #ffffff; SCROLLBAR-DARKSHADOW-COLOR: #009ace; 
SCROLLBAR-3DLIGHT-COLOR: #009ace; SCROLLBAR-ARROW-COLOR: #def0fa;
SCROLLBAR-TRACK-COLOR: #def0fa;
}
-->
</style>
</head>
<body>
<%
set rsedit=server.CreateObject("ADODB.RecordSet")
set rs=server.CreateObject("ADODB.RecordSet")
Sql="Select * From gjz order by id desc"
Rs.Open Sql,Conn1,3,3
i=0
%>
<table class="tableBorder" width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="nr">
  <tr> 
    <td background="../../admin/images/manage/admin_bg_1.gif"> 
      <table class="tableBorder" width="100%" border="0" cellspacing="1" cellpadding="0">
        <tr align="center" background="../../admin/images/manage/admin_bg_1.gif" class="nr"> 
          <td width="3%" height="21" background="../../admin/images/manage/admin_bg_1.gif"><strong>ID</strong></td>
          <td width="18%" background="../../admin/images/manage/admin_bg_1.gif"><strong>�ɼ�վ������</strong></td>
          <td width="14%" background="../../admin/images/manage/admin_bg_1.gif"><strong>Ҫ�滻���ֶ���</strong></td>
          <td background="../../admin/images/manage/admin_bg_1.gif"><strong>�ؼ����滻����</strong><strong></strong></td>
          <td width="5%" background="../../admin/images/manage/admin_bg_1.gif"><strong>�޸�</strong></td>
          <td width="5%" background="../../admin/images/manage/admin_bg_1.gif"><strong>ɾ��</strong></td>
        </tr>
        <% do while not rs.eof %>
<%
tfzdname=rs("tfzdname")
select case tfzdname
  case "mp3img"
      tfzdname="ר��ͼƬ"
  case "mp3singer"
      tfzdname="ר������"
  case "mp3zjname"
      tfzdname="ר������"
  case "mp3yuyan"
      tfzdname="ר������"
  case "mp3gongsi"
      tfzdname="���й�˾"
  case "mp3time"
      tfzdname="��������"
  case "mp3about"
      tfzdname="ר������"
  case "mp3type"
      tfzdname="���ַ���"
  case "mp3name"
      tfzdname="��������"
  case "musicID"
      tfzdname="����ID"
  case "mp3path"
      tfzdname="����·��"
end select
%>
<%
tfnr=replace(rs("tfnr"),"''","'") 
%>
		<%id=rs("claid")%>
        <% i=i+1%>
          <tr bgcolor="#FFFFFF"> 
            <td height="20" align="center" bgcolor="#FFFFFF" class="nr"><%=i%></td>
            <td align="center" bgcolor="#FFFFFF" class="nr"> 
              <%

Sql="select top 10 * from const where id=" &id
rsedit.Open Sql,Conn1,0,3
if   rsedit.eof then
     zdname="<font color=""#FF0000"">վ�㱻ɾ�� </font> "
   else
     zdname=rsedit("zdname")
end if
rsedit.close
%><%=zdname%></td>
            <td align="center" class="nr"><%=tfzdname%></td>
            
          <td align="center" bgcolor="#EBEBF5" class="nr"><%=tfnr%></td>
            <td align="center" bgcolor="#FFFFFF" class="nr"> <a href="6ting3-3.asp?id=<%=rs("id")%>">�޸�</a> 
            </td>
            <td align="center" bgcolor="#FFFFFF" class="nr"><a href="6ting3-2.asp?id=<%=rs("id")%>">ɾ��</a></td>
          </tr>
        <%
   rs.movenext
loop
%>
      </table>
    </td>
  </tr>
</table>
<%
rs.close
set rs=nothing
conn1.close
'rsedit.close
set rsedit=nothing
set conn1=nothing
%>
<br>
<table class="tableBorder" width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="../../admin/images/manage/admin_bg_1.gif">
<table class="tableBorder" width="100%" border="0" cellspacing="1" cellpadding="0">
        <tr>
          <td height="25" align="center" bgcolor="#FFFFFF" class="nr"><a href="6ting3-4.asp">����µ��滻����</a></td>
        </tr>
      </table></td>
  </tr>
</table><br>
<table class="tableBorder" width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td background="../../admin/images/manage/admin_bg_1.gif"> <table class="tableBorder" width="100%" border="0" cellspacing="1" cellpadding="0">
        <tr> 
          <td height="25" align="center" bgcolor="#FFFFFF" class="nr"><font color="#FF0000">ע�⣺�ؼ��ֹ��˻��滻���ִ�Сд</font></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
