<!--#include file="const.asp"-->
<%PageName="search"%>
<%on error resume next%>
<%CheckAdmin1%>
<!--#include file="../PL_INC/PL_Path.Asp"-->
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
keyword=trim(request("keyword")) 
keyword=replace(keyword,"'","''") 
stype=request("stype")
if keyword="" then
errmsg=errmsg+"�����ַ�����Ϊ�գ�����������ҵ���Ϣ<a href=""javascript:history.go(-1)"">�����ز�</a>"
call error()
Response.End 
end if
%>
<!--#include file="Top.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
<div align="center">
  <center>
  <table class="tableBorder" border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td width="100%" valign="top">
        <table class="tableBorder" border="0" cellpadding="0" cellspacing="0" width="100%">
          <tr>
            <td width="100%" height="19" align=center valign="bottom">&nbsp; 
              <b>...::: �� �� �� �� :::...</b></td>
            <td width="0%" bgcolor="#FFB5D2"></td>
          </tr>
          <tr>
            <td width="100%" colspan="2">
<%
'---------------------------search----------------------
Set rs= Server.CreateObject("ADODB.Recordset")
'keywordsql = replace(keyword,"'","''")
select case stype
  case "Singer"
    sql="select * from Nclass where Nclass like '%"&keyword&"%'"
  case "Music"
    sql="select * from Musiclist where MusicName like '%"&keyword&"%'"
  case "Special"
    sql="select * from Special where Name like '%"&keyword&"%'"
  case "User"
    sql="select * from user where Username like '%"&keyword&"%'"
end select
rs.open sql,conn,1,1

'Set rs= Server.CreateObject("ADODB.Recordset")
'if stype="Singer" then
'sql="select * from Nclass"
'elseif stype="Music" then
'sql="select * from Musiclist" 
'elseif stype="Special" then
'sql="select * from Special"
'elseif stype="User" then
'sql="select * from user"
'else
'end if
'rs.open sql,conn,1,1
'if stype="Singer" then
' rs.filter = "Nclass Like '%"& keyword &"%'"
'end if
'if stype="Music" then
' rs.filter = "MusicName like '%"&keyword&"%'"
'end if
'if stype="Special" then
' rs.filter = "Name Like '%"& keyword &"%'"
'end if
'if stype="user" then
' rs.filter = "UserName like '%"& keyword &"%'"
'end if
'
'rs.open sql,conn,1,1

if not isempty(request.QueryString("page")) then
	currentPage=cint(request.QueryString("page"))
else
	currentPage=1
end if
if rs.eof and rs.bof then
	if stype="Singer" then
		response.write "<p align='center'><br><br>Sorry,  δ �� �� �� �� Ҫ �� �� ��<br><br><a href=""javascript:history.go(-1)"">�� �� �� ��</a><br><br></p>"
	elseif stype="Music" then 
		response.write "<p align='center'><br><br>Sorry,  δ �� �� �� �� Ҫ �� �� ��<br><br><a href=""javascript:history.go(-1)"">�� �� �� ��</a><br><br></p>"
    elseif stype="Special" then
		response.write "<p align='center'><br><br>Sorry,  δ �� �� �� �� Ҫ �� ר ��<br><br><a href=""javascript:history.go(-1)"">�� �� �� ��</a><br><br></p>"
	elseif stype="User" then
		response.write "<p align='center'><br><br>Sorry,  δ �� �� �� �� �� �� �� ��<br><br><a href=""javascript:history.go(-1)"">�� �� �� ��</a><br><br></p>"
	end if
else
	totalPut=rs.recordcount
	MaxPerPage=10
	PageUrl="Search.asp"
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
		search
	else
		if (currentPage-1)*MaxPerPage<totalPut then
			rs.move  (currentPage-1)*MaxPerPage
			dim bookmark
			bookmark=rs.bookmark
			showpage totalput,MaxPerPage,PageUrl
			showContent
			showpage totalput,MaxPerPage,PageUrl
			search
		else
			currentPage=1
			showpage totalput,MaxPerPage,PageUrl
			showContent
			showpage totalput,MaxPerPage,PageUrl
			search
		end if
	end if
	rs.close
end if

sub showContent 
i=0 
%>
            <table class="tableBorder" border="0" width="100%" cellspacing="0" cellpadding="0">
                <td><div align="center">
<!-----------------------��������----------------------------->
<%if stype="Singer" then%>
                  <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
                    <tr class="title">
                      <td width="40%" height=22 align=center background="images/manage/admin_bg_1.gif">����</td>
                      <td width="20%" height=22 align=center background="images/manage/admin_bg_1.gif">�޸�</td>
                      <td width="20%" height=22 align=center background="images/manage/admin_bg_1.gif">����HTM</td>
                      <td width="10%" height=22 align=center background="images/manage/admin_bg_1.gif">ɾ��</td>
					  <td width="10%" height=22 align=center background="images/manage/admin_bg_1.gif">�Ƽ�</td>
                    </tr>
<%
	Set Trs= Server.CreateObject("ADODB.Recordset")
	do while not rs.eof
		i=i+1
		Tsql="SELECT * FROM MusicList where Nclassid="+cstr(rs("Nclassid"))
		Trs.open Tsql,conn,1,1
		TotalMNum=Trs.recordcount
		Trs.close
		Tsql="SELECT * FROM Special where Nclassid="+cstr(rs("Nclassid"))
		Trs.open Tsql,conn,1,1
		TotalSNum=Trs.recordcount
		Trs.close
		Tsql="SELECT * FROM Nclass where Nclassid="+cstr(rs("Nclassid"))
		Trs.open Tsql,conn,1,1
		Trs.close
%>
                   <form method="POST" action="Admin_Nclass_Err.Asp?act=rename&NClassid=<%=rs("NClassid")%>" id=Nform<%=k%> name=Nform<%=k%>>
                    <tr>
                      <td class="forumrow">&nbsp;&nbsp;<%=i%>.&nbsp;<a href="Admin_Allspecial.Asp?Classid=<%=rs("Classid")%>&SClassid=<%=rs("SClassid")%>&NClassid=<%=rs("NClassid")%>"><%=rs("Nclass")%></a></td>
                      <td class="forumrow" align=center><a href="Admin_Nclass_Add.Asp?nclassid=<%=rs("NClassid")%>">�޸ĸ�������</a>
                      <td class="forumrow" align=center><a title="���� <%=rs("nclass")%> ר���б��ļ�" href="make_special.asp?263=<%=rs("nclassid")%>"><font color=blue>����HTM</font></a></td> 
                      <td class="forumrow" align=center><a title="����! ɾ������ǲ��ָܻ���Ŷ!" href='Admin_Nclass_Err.Asp?act=del&NClassid=<%=rs("NClassID")%>'>ɾ��</a></td>
					  <td class="forumrow" align=center><%if rs("isgood")=true then%>
                  	<a href="Admin_Nclass_Edit.asp?action=isbad&gequid=<%=rs("NClassid")%>"><font color=red>����</font></a> 
                  	<%else%> 
                  	<a href="Admin_Nclass_Edit.asp?action=isgood&gequid=<%=rs("NClassid")%>">�Ƽ�</a> 
                 	<%end if%><td>
                    </tr>
                   </form>
<%
		if i>=MaxPerPage then exit do
	rs.movenext
	loop
	set Trs=nothing
%>
                  </table>

<!-----------------------��������----------------------------->
<%elseif stype="Music" then%>
       <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
        <tr class="title">
          <td width="40%" height=22 align=cente background="images/manage/admin_bg_1.gif"r>��������</td>
          <td width="24%" height=22 align=center background="images/manage/admin_bg_1.gif">��������</td>
          <td width="12%" height=22 align=center background="images/manage/admin_bg_1.gif">���</td>
          <td width="7%" height=22 align=center background="images/manage/admin_bg_1.gif">�Ƽ�</td>
          <td width="7%" height=22 align=center background="images/manage/admin_bg_1.gif">�޸�</td>
          <td width="7%" height=22 align=center background="images/manage/admin_bg_1.gif">ɾ��</td>
        </tr>
<%do while not rs.eof%>
        <tr>
          <td class="forumrow" width="40%"> <%=(i+1)%>.<%=rs("MusicName")%></td>
          <td class="forumrow" width="24%" align=center><%=rs("singer")%>  <a href="Admin_Allspecial_Edit.Asp?Classid=<%=rs("Classid")%>&SClassid=<%=rs("SClassid")%>&NClassid=<%=rs("NClassid")%>&specialid=<%=rs("specialid")%>">[�������]</a></td>
          <td class="forumrow" width="12%" align=center><a href="Admin_Word_Edit.Asp?id=<%=rs("id")%>">�ı�</a>&nbsp;&nbsp;<a href="Admin_LrcWord_Edit.Asp?id=<%=rs("id")%>">lrc</a></td>
          <td class="forumrow" width="7%" align=center><a href="Admin_Allmusic_Err2.Asp?act=SetIsGood&id=<%=rs("id")%>&classid=<%=classid%>&SClassid=<%=SClassid%>&Nclassid=<%=Nclassid%>&page=<%=CurrentPage%>"><%if rs("IsGood")=true then%><font color=red>����</font><%else%>�Ƽ�<%end if%></a></td> 
          <td class="forumrow" width="7%" align=center><a href="Admin_Allmusic_Ok.Asp?id=<%=rs("id")%>&AskClassid=<%=classid%>&AskNClassid=<%=Nclassid%>&page=<%=CurrentPage%>">�޸�</a></td> 
          <td class="forumrow" width="7%" align=center><a href="Admin_Allmusic_Data.Asp?id=<%=rs("id")%>&classid=<%=classid%>&SClassid=<%=SClassid%>&Nclassid=<%=Nclassid%>&page=<%=CurrentPage%>">ɾ��</a></td> 
        </tr>
<%
	i=i+1
	if i>=MaxPerPage then exit do
rs.movenext
loop
%>
                  </table>
<!-----------------------����ר��----------------------------->
<%elseif stype="Special" then%>
                   <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
              <tr class="title">
                <td width="37%" height=22 align=center background="images/manage/admin_bg_1.gif">ר������</td>
                <td width="12%" height=22 align=center background="images/manage/admin_bg_1.gif">��������</td>
                <td width="11%" height=22 align=center background="images/manage/admin_bg_1.gif">�������</td>
                <td width="11%" height=22 align=center background="images/manage/admin_bg_1.gif">�Ƽ�</td>
                <td width="7%" height=22 align=center background="images/manage/admin_bg_1.gif">�޸�</td>
                <td width="15%" height=22 align=center background="images/manage/admin_bg_1.gif">����HTM</td>
                <td width="7%" height=22 align=center background="images/manage/admin_bg_1.gif">ɾ��</td>
              </tr>
<%
Set Trs= Server.CreateObject("ADODB.Recordset")
do while not rs.eof
	i=i+1
	Tsql="SELECT * FROM Special where Specialid="+cstr(rs("Specialid"))
	Trs.open Tsql,conn,1,1
	TotalMNum=Trs.recordcount
	Trs.close
%>
              <tr>
                <td class="forumrow" width="37%"><a href="Admin_Allmusic.Asp?Classid=<%=rs("Classid")%>&SClassid=<%=rs("SClassid")%>&NClassid=<%=rs("NClassid")%>&specialid=<%=rs("specialid")%>"><font color=black><%=rs("name")%></font></a>&nbsp; <a href="Admin_Allspecial_Edit.Asp?Classid=<%=rs("Classid")%>&SClassid=<%=rs("SClassid")%>&NClassid=<%=rs("NClassid")%>&specialid=<%=rs("specialid")%>">[���]</a></td>
                <td class="forumrow" width="12%" align=center><%=rs("Nclass")%>��</td>
                <td class="forumrow" width="11%" align=center><a href="Admin_Allspecial_Err.Asp?specialid=<%=rs("specialid")%>">�������</a></td>
                <td class="forumrow" width="11%" align=center><a href="Admin_Allspecial_Ok2.Asp?act=SetIsGood&Specialid=<%=rs("Specialid")%>&Askclassid=<%=classid%>&AskSClassid=<%=SClassid%>&AskNclassid=<%=Nclassid%>&page=<%=CurrentPage%>"><%if rs("IsGood")=true then%><font color=red>����</font><%else%>�Ƽ�<%end if%></a></td>
                <td class="forumrow" width="7%" align=center><a href="Admin_Allspecial_Add.Asp?Specialid=<%=rs("Specialid")%>&AskClassid=<%=rs("Classid")%>&AskSClassid=<%=rs("SClassid")%>&AskNClassid=<%=rs("NClassid")%>&page=<%=CurrentPage%>">�޸�</a></td> 
                <td class="forumrow" width="15%" align=center><a href="make_musiclist.asp?263=<%=rs("specialid")%>"><font color=blue>����HTM</font></a></td> 
                
                <td class="forumrow" width="7%" align=center><a href="Admin_special.Asp?Specialid=<%=rs("Specialid")%>&classid=<%=rs("Classid")%>&AskSClassid=<%=rs("SClassid")%>&Nclassid=<%=rs("NClassid")%>&page=<%=CurrentPage%>">ɾ��</a></td> 
              </tr>
<%
	if i>=MaxPerPage then exit do
rs.movenext
loop
Set Trs=nothing
%>
                  </table>
<!-----------------------������Ա----------------------------->
<%elseif stype="User" then%>
<div align="center">
<center>
<table class="tableBorder" border="0" width="96%" cellspacing="1" cellpadding="1">
 <tr>
<td align=center valign=top>
            <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
            
              <tr>
                <td width="13%" height=25 class="forumrow" align=center background="images/manage/admin_bg_1.gif">ID</td>
                <td width="50%" height=25 class="forumrow" align=center background="images/manage/admin_bg_1.gif">�û���</td>
                <td width="13%" height=25 class="forumrow" align=center background="images/manage/admin_bg_1.gif">�޸�</td>
                <td width="13%" height=25 class="forumrow" align=center background="images/manage/admin_bg_1.gif">����</td>
                <td width="13%" height=25 class="forumrow" align=center background="images/manage/admin_bg_1.gif">ɾ��</td>
              </tr>
<%
Set Trs= Server.CreateObject("ADODB.Recordset")
do while not rs.eof
	i=i+1
	Tsql="SELECT * FROM User where id="+cstr(rs("id"))
	Trs.open Tsql,conn,1,1
	Trs.close
%>
              <tr>
                <td height="22" class="forumrow" align=center><%=rs("id")%>��</td>
                <td class="forumrow" align=center><a href="Admin_User_Action.Asp?id=<%=rs("id")%>"><%=rs("UserName")%></a>��</td>
                <td class="forumrow" align=center><input type=button name=edit value=�޸� onClick="javascript:window.open('Admin_User_Action.Asp?id=<%=rs("id")%>','_self','')"></td>
                <td class="forumrow" align=center><input type=button name=lock value=<%if rs("lockuser")=false then%>"����"<%else%>"����"<%end if%> onClick="javascript:window.open('Admin_User_Err.asp?id=<%=rs("id")%>&act=lock','_self','')"></td>
                <td class="forumrow" align=center><input type=button name=del value=ɾ�� onClick="javascript:window.open('Admin_User_Data.Asp?id=<%=rs("id")%>','_self','')"></td>
              </tr>
<%
	if i>=MaxPerPage then exit do
rs.movenext
loop
%>
                  </table></div>

<%
else
end if
%>
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
      <div align="center">
        <center>
        <table class="tableBorder" border="0" width="90%" cellpadding="2" cellspacing="0">
          <tr><form method=Post action="<%=filename%>?classid=<%=classid%>&Nclassid=<%=Nclassid%>">
            <td align="center"><%=Nclass%>&nbsp; ���ҵ�<font color="#ff0000"><b><%=totalnumber%></b></font>�����
  &nbsp;��<font color="#ff0000"><%=n%></font>ҳ��ʾ
  &nbsp;��ǰ��<font color="#ff0000"><%=CurrentPage%></font>ҳ
&nbsp;<%if CurrentPage<2 then%>��һҳ&nbsp;
<%else%>
  <a href="<%=filename%>?page=<%=CurrentPage-1%>&keyword=<%=keyword%>&stype=<%=stype%>">��һҳ</a>&nbsp;
<%
end if
if n-currentpage<1 then
%>
  ��һҳ
<%else%>
  <a href="<%=filename%>?page=<%=CurrentPage+1%>&keyword=<%=keyword%>&stype=<%=stype%>">��һҳ</a>
<%end if%> &nbsp;</td></form>
</tr>
</table>
</center>
</div>       
<%        
end function

function Search
%></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </center>
</div>
<%end function%><%
set rs=nothing
conn.close
set conn=nothing
%>
</body>
</html>
