<!--#include file="Const.Asp"-->
<%CheckAdmin3%>
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
dim i
i=0 
MaxList=80
set rs=server.createobject("adodb.recordset")

sql="select * from class order by classid"
rs.open sql,conn,1,1
i=request("id")
if i="" then i=rs("Classid")
%>
<!--#include file="Top.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
<table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" > 
  <tr class="title">
  
<td height="30">

<table class="tableBorder" cellpadding=3 cellspacing=1 border=0 width=100%>
  <tr class="title">
    <td height="22" colspan="3" align="center">V5�������������ӵ�ַ����ҳ��</td>
  </tr>
  <tr >
  
  <td width="100%" valign=top class="forumrow">
  
  <%
dim objFSO
dim fdata
dim objCountFile
Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
if request("save")="" then
  Set objCountFile = objFSO.OpenTextFile(Server.MapPath("../ads/ad_play.xml"),1,True)
  If Not objCountFile.AtEndOfStream Then fdata = objCountFile.ReadAll
 else
	wz=request.Form("wz")
	wzold=request.Form("wzold")
	tp=request.Form("tp")
	tpold=request.Form("tpold")
	str=request.Form("fdata")
	str=replace(str,wzold,wz)
	str=replace(str,tpold,tp)
'	str="abcd"
	fdata=str	
'  fdata=request("fdata")
  
  Set objCountFile=objFSO.CreateTextFile(Server.MapPath("../ads/ad_play.xml"),True)
  objCountFile.Write fdata
 end if
 objCountFile.Close
 Set objCountFile=Nothing
 Set objFSO = Nothing
%>
  <form method=post action="">
    <table class="tableBorder" width="100%" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td class="forumrow" width="3%" height="23"></td>
        <td class="forumrow" width="97%" height="23"> ע�⣺������Ŀռ䲻֧��<font color=red>FSO</font>�����޷��༭��</td>
      </tr>
      <tr>
      
      <td class="forumrow" width="3%"></td>
      <td class="forumrow" width="97%">
	<%
	AstrId1=Instr(2,fdata,"text=")
	AstrId2=Instr(2,fdata,"addr=")
	wz=Mid(fdata,AstrId1+6,AstrId2-AstrId1-8)
	%><font color="red">�����µĹ�����ӵ�ַ:
	<input name="wz" id="wz" value="<%=wz%>" size="50">
	<input value="<%=wz%>" type="hidden" name="wzold" id="wzold"><br>

	�����µĹ��ͼƬ��ַ:</font>
	<%
	AstrId1=Instr(2,fdata,"addr=")
	AstrId2=Instr(2,fdata,"/>")
	tp=Mid(fdata,AstrId1+6,AstrId2-AstrId1-7)
	%>
	<input name="tp" id="tp" value="<%=tp%>" size="50">
	<input value="<%=tp%>" type="hidden" name="tpold" id="tpold">	
	<br>
	<a href="<%=wz%>" target="_blank"><img src="<%=tp%>" width="600" height="300" border="0"></a>
      <textarea name="fdata" style="display:none" cols="110" rows="20"><%=fdata%></textarea>
      </td>
      
      </tr>
      
      <tr>
      
      <td width="3%">
      
      </td>
      
      <td class="forumrow" width="97%"><input type="submit" name="save" value="�ύ�޸�">
      </b>
      </td>
      
      </tr>
      
    </table>
  </form>
  <p> </p>
  </td>
  
  </tr>
  
</table>
</td>

</tr>

      </table>
<% 
set rs=nothing
conn.close
set conn=Nothing
%>
