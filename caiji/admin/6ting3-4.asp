<!--#include file="function.asp"-->
<%CheckAdmin1%>
<!--#include file="6tingconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����������ͨ�������ɼ���--��ӹؼ��ֹ���</title>
<style type="text/css">
<!--
.nr {
	font-size: 12px;
}
-->
</style>
</head><body>

<FORM action=6ting3-41.asp method=post name=id>
<table class="tableBorder" width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="../../admin/images/manage/admin_bg_1.gif"><table class="tableBorder" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr> 
            <td height="25" colspan="2" align="center" class="nr"><strong>��ӹؼ��ֹ���</strong></td>
          </tr>
          <tr> 
            <td width="150" align="right" bgcolor="#FFFFFF"><span class="nr">ѡ��Ҫ�滻����վ��</span> 
            </td>
            <td align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td><font color="#FF0000"> 
<%
set rs=server.CreateObject("ADODB.RecordSet")
Sql="Select * From const order by id desc"
Rs.Open Sql,Conn1,3,3
%>
                    <select name="claid" id="claid">
					 <% do while not rs.eof %>
					<option value="<%=rs("id")%>"><%=rs("zdname")%></option>
					 <% 
					  rs.movenext
					  loop 
					  %>
                    </select>
<%
rs.close
set fs=nothing
conn1.close
set conn1=nothing
%>
                    <span class="nr"> * </span></font></td>
                </tr>
                <tr> 
                  <td class="nr"><span class="nr">���ѡ����Ҫ�滻�Ǹ���վ�Ķ�����</span></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td align="right" bgcolor="#FFFFFF"><span class="nr">ѡ���滻���ֶ�����</span> 
            </td>
            <td height="12" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td><select name="tfzdname" id="tfzdname">
                      <option value="mp3img">ר��ͼƬ</option>
                      <option value="mp3singer">ר������</option>
                      <option value="mp3zjname">ר������</option>
                      <option value="mp3yuyan">ר������</option>
                      <option value="mp3gongsi">���й�˾</option>
                      <option value="mp3time">��������</option>
                      <option value="mp3about">ר������</option>
                      <option value="mp3type">���ַ���</option>
                      <option value="mp3name">��������</option>
                      <option value="musicID">����ID</option>
                      <option value="mp3path">����·��</option>
                    </select> <font color="#FF0000"><span class="nr">*</span></font></td>
                </tr>
                <tr> 
                  <td class="nr"><span class="nr">���ѡ����Ҫ�滻���ֶ�����</span></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td align="right" bgcolor="#FFFFFF" class="nr">�滻����</td>
            <td height="12" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td><textarea name="tfnr" cols="50" rows="3"></textarea> 
                    <span class="nr"><font color="#FF0000">*</font></span></td>
                </tr>
                <tr> 
                  <td><span class="nr">�����ʽΪ��Ҫ�滻������|�滻�������</span></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="25" colspan="2" align="center" bgcolor="#FFFFFF"> <input name="sxbc" type="submit" id="sxbc" value="���"> 
            </td>
          </tr>
        </table></td>
  </tr>
</table>
</FORM>
</body></html>
