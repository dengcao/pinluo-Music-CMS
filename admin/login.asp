<!--#include file="../PL_config.asp"-->
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
Function GetCode()
	Dim TestObj
	On Error Resume Next
	Set TestObj = Server.CreateObject("Adodb.Stream")
	Set TestObj = Nothing
	If Err Then
		Dim TempNum
		Randomize timer
		TempNum = cint(8999*Rnd+1000)
		Session("GetCode") = TempNum
		GetCode = Session("GetCode")		
	Else
		GetCode = "<img src=""PL_inc/GetCode.asp"">"		
	End If
End Function
%>
<html>
<head>
<title>����Ա��½ - <%=webname%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="admin.css" type="text/css">
</head>
<body topmargin="0" leftmargin="0" rightmargin="0">
<div align="center">
  <p><BR>
    <%
'PL_chk=Request.ServerVariables("url")
'PL_chk=LCase(PL_chk)
'If InStr(PL_chk,"/admin/")>0 Then 
'response.write"<script>alert('�뽫Ĭ�Ϲ���Ŀ¼admin������');</script>"
'End If 	
%>
</p>
  <p>&nbsp;</p>
  <p>&nbsp;  </p>
  <form name="form" method="post" action="Chklogin.Asp" target="_top">
    <table class="tableBorder" border="0" align=center cellpadding="5" cellspacing="1" class=tableBorder width="60%">
     <tr> <th colspan=2>����Ա��½</th>
     </tr>
      <tr>
        <td align=center class="forumRowHighlight" width="30%" >�û�����</td><td class=forumRow width="70%"><input name="UserName" maxlength="10" size="25" class="tableBorder" value=""></td>
      </tr>
      <tr>
        <td align=center class="forumRowHighlight">��&nbsp;&nbsp;�룺</td><td class=forumRow><input type="password" name="PassWord" maxlength="30" size="25" class="tableBorder"></td>
      </tr>
      <tr>
        <td align=center class="forumRowHighlight">�����룺</td><td class=forumRow><input name="verifycode" size="4" maxlength="4">
               �����븽����:<B><font color=RED><% = GetCode() %></font></B>
</td>
      </tr>
      <td colspan=2 align=center class=forumRowHighlight>
    <input type="submit" name="Submit" value="�� ½..." class=button>&nbsp;&nbsp;<input onclick=window.location.reload() type=button value=ˢ�±�ҳ name=refresh class=button>&nbsp;
    <input type="button" name="Submit1" onClick="javascript:location.href='../'" value="������ҳ" class=button></td></tr>
    </table></form>
</div>
</body>
</html>