<!--#include file="const.asp"-->
<%CheckAdmin3%>
<%pagename="admin_Smusicmana"%>
<!--#include file="Top.Asp"-->
<link rel="stylesheet" href="Images/Admin_Style.Css">
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
<table class="tableBorder" border="0" width="100%" cellspacing="1" cellpadding="1">
<tr>
<td align=center valign=top>
<%
set rs=server.createobject("adodb.recordset")
sql="select * from Basic order by id desc"
rs.open sql,conn,1,1
if rs.eof and rs.bof then
response.write "<p align='center'>��ʱû�е��</p>"
else
MaxPerPage=15
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
showpage totalput,MaxPerPage,"admin_SMusicMana.asp"
showContent
showpage totalput,MaxPerPage,"admin_SMusicMana.asp"
else
if (currentPage-1)*MaxPerPage<totalPut then
rs.move  (currentPage-1)*MaxPerPage
dim bookmark
bookmark=rs.bookmark
showpage totalput,MaxPerPage,"admin_SMusicMana.asp"
showContent
showpage totalput,MaxPerPage,"admin_SMusicMana.asp"
else
currentPage=1
showpage totalput,MaxPerPage,"admin_SMusicMana.asp"
showContent
showpage totalput,MaxPerPage,"admin_SMusicMana.asp"
end if
end if
rs.close
end if

sub showContent
dim i
i=0
%>
<table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
<tr class="title">
<td height=24 colspan="8" align="center"><font color="#FFFFFF">�� �� �� ��</font></td>
</tr>
<tr>
<td width="5%" class="forumrow" align=center>���</td>
<td width="10%" class="forumrow" align=center>�����</td>
<td width="10%" class="forumrow" align=center>����</td>
<td width="20%" class="forumrow" align=center>����</td>
<td width="26%" class="forumrow" align=center>ף��</td>
<td width="13%" class="forumrow" align=center>ʱ��</td>
<td width="8%" class="forumrow" align=center>ɾ��</td>
</tr>
<%do while not rs.eof
i=i+1
%>
<tr height="22">
<td width="5%" class="forumrow" align=center><%=rs("id")%>��</td>
<td width="10%" class="forumrow" align=center><%=rs("myname")%>��</td>
<td width="10%" class="forumrow" align=center><%=rs("yourname")%>��</td>
<td width="20%" class="forumrow" align=center><%=rs("title")%>��</td>
<td width="26%" class="forumrow" align=center><%=rs("content")%>��</td>
<td width="13%" class="forumrow" align=center><%=rs("jtime")%>��</td>
<td width="8%" class="forumrow" align=center><a href="Admin_SMusicDel.asp?id=<%=rs("id")%>&page=<%=CurrentPage%>">ɾ��</a></td>
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
dim n
if totalnumber mod maxperpage=0 then
n= totalnumber \ maxperpage
else
n= totalnumber \ maxperpage+1
end if
%>
<form method=Post action="<%=filename%>?classid=<%=classid%>&Nclassid=<%=Nclassid%>">
<center>��<font color="<%=AlertFColor%>"><b><%=totalnumber%></b></font>����
<%if CurrentPage<2 then%>
&nbsp;��ҳ ��һҳ&nbsp;
<%else%>
&nbsp<a href="<%=filename%>?page=1&classid=<%=classid%>&Nclassid=<%=Nclassid%>">��ҳ</a>&nbsp;
<a href="<%=filename%>?page=<%=CurrentPage-1%>&classid=<%=classid%>&Nclassid=<%=Nclassid%>">��һҳ</a>&nbsp;
<%
end if
if n-currentpage<1 then
%>
��һҳ ĩҳ
<%else%>
<a href="<%=filename%>?page=<%=CurrentPage+1%>&classid=<%=classid%>&Nclassid=<%=Nclassid%>">��һҳ</a>
<a href="<%=filename%>?page=<%=n%>&classid=<%=classid%>&Nclassid=<%=Nclassid%>">ĩҳ</a>
<%end if%>
&nbsp;ҳ��:<strong><font color="<%=AlertFColor%>"><%=CurrentPage%>/<%=n%></font></strong>ҳ
ת��:<select name="page" size="1" onchange="javascript:submit()">
<%for i = 1 to n%>
<option value="<%=i%>" <%if cint(CurrentPage)=cint(i) then%> selected <%end if%>>��<%=i%>ҳ</option>
<%next%>
</select>
</form>

<%
end function
%>
</td>
</tr>
</table>
</div>
<%
set rs=nothing
conn.close
set conn=nothing
%></body></html>
