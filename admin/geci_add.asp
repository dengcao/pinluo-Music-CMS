<!--#include file="function.asp"-->
<%CheckAdmin3%>
<!--#include file="../user/conn.asp"-->
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
if not isempty(request("page")) then
	currentPage=cint(request("page"))
else
	currentPage=1
end if
%>
<link href="style.css" rel="stylesheet" type="text/css">
<div align="center">
<center>
<table class="tableBorder" border="0" width="86%" cellspacing="1" cellpadding="1">
 <tr>
<td align=center valign=top>
<%
if request("id")<>"" then
set rs=server.createobject("adodb.recordset")
sql="select * from content where id="&request("id")
rs.open sql,conn,1,3
rs.delete
rs.update
rs.close
end if
set rs=server.createobject("adodb.recordset")
sql="select * from content order by id desc" 
rs.open sql,conn,1,1
if rs.eof and rs.bof then 
	response.write "<p align='center'>��ʱû������</p>" 
else 
	MaxPerPage=20
	PageUrl="pinglun.asp"
	totalPut=rs.recordcount 
	if currentpage<1 then currentpage=1
	if (currentpage-1)*MaxPerPage>totalput then 
		if (totalPut mod MaxPerPage)=0 then 
			currentpage= totalPut \ MaxPerPage 
		else 
			currentpage= totalPut \ MaxPerPage + 1 
		end if 
	end if 
	if currentPage=1 then 
		showpage totalput,MaxPerPage,PageUrl
		showContent 
		showpage totalput,MaxPerPage,PageUrl
	else 
		if (currentPage-1)*MaxPerPage<totalPut then 
			rs.move  (currentPage-1)*MaxPerPage 
			dim bookmark 
			bookmark=rs.bookmark 
			showpage totalput,MaxPerPage,PageUrl
			showContent 
			showpage totalput,MaxPerPage,PageUrl
		else 
			currentPage=1 
			showpage totalput,MaxPerPage,PageUrl
			showContent 
			showpage totalput,MaxPerPage,PageUrl
		end if 
	end if 
end if 
rs.close 
			
sub showContent 
i=0 
%>
            <table class="tableBorder" border="1" width="100%" cellspacing="0" cellpadding="0" class="TableLine" bordercolor="GREEN" bordercolordark="#FFFFFF">
                  <tr>
                <td width="13%" height=22 align=center background="zy11/bgleft.gif"><font color="GREEN">�û�����</font></td>
                <td width="10%" height=22 align=center background="zy11/bgleft.gif">
                <font color="#008000">��������</font></td>

                <td width="50%" height=22 align=center background="zy11/bgleft.gif">
                <font color="#008000">�������</font></td>
                <td width="13%" height=22 align=center background="zy11/bgleft.gif"><font color="GREEN">ɾ��</font></td>
              </tr>
<%
do while not rs.eof
	i=i+1
%>
              <tr>
                <td height="22" align=center><%=rs("r_id")%>��</td>
                <td align=center><%=rs("name")%> </td>
                <td align=center><%=rs("body")%>��</td>
                <td align=center><a href="?page=<%=CurrentPage%>&id=<%=rs("id")%>">ɾ��</a></td>
              </tr>
<%
	if i>=MaxPerPage then exit do
rs.movenext
loop
%>
            </table>
<%
end sub 

function showpage(totalnumber,maxperpage,filename)
if totalnumber mod maxperpage=0 then
	n= totalnumber \ maxperpage
else
	n= totalnumber \ maxperpage+1
end if
%>
<form method=Post action="<%=filename%>?classid=<%=classid%>&Nclassid=<%=Nclassid%>">
  <center>��<font color="red"><b><%=totalnumber%></b></font>����Ϣ
<%if CurrentPage<2 then%>
  &nbsp;��ҳ ��һҳ&nbsp;
<%else%>
  &nbsp<a href="<%=filename%>?page=1&vip=<%=vip%>">��ҳ</a>&nbsp;
  <a href="<%=filename%>?page=<%=CurrentPage-1%>&vip=<%=vip%>">��һҳ</a>&nbsp;
<%
end if
if n-currentpage<1 then
%>
  ��һҳ ĩҳ
<%else%>
  <a href="<%=filename%>?page=<%=CurrentPage+1%>&vip=<%=vip%>">��һҳ</a>
  <a href="<%=filename%>?page=<%=n%>&vip=<%=vip%>">ĩҳ</a>
<%end if%>
  &nbsp;ҳ��:<strong><font color="red"><%=CurrentPage%>/<%=n%></font></strong>ҳ
  ת��:<select name="page" size="1" onchange="javascript:submit()">
<%for i = 1 to n%>           
  <option value="<%=i%>" <%if cint(CurrentPage)=cint(i) then%> selected <%end if%>>��<%=i%>ҳ</option>   
<%next%>   
  </select>        
</form>        
<%end function%>
    </td>
  </tr>
  </table>
</div>
<%
set rs=nothing
conn.close
set conn=nothing%></body></html>
