<!--#include file="Const.Asp"-->
<%CheckAdmin1%>
<%PageName="Admin_Allspecial"%>
<!--#include file="Top.asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
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
if not isempty(request.QueryString("page")) and request.QueryString("page")<>"" then
	currentPage=cint(request.QueryString("page"))
else
	currentPage=1
end if
if request.QueryString("classid")<>"" then
	classid=request.QueryString("classid")
else
	classid=""
end if
if request.QueryString("Nclassid")<>"" then
	Nclassid=request.QueryString("Nclassid")
else
	Nclassid=""
end if

set rs=conn.execute("SELECT * FROM class order by classid") 
if not Rs.eof then
	if Left(PageName,5)="admin" and PageName<>"index" then

			do while not rs.eof

			rs.movenext
			loop
		elseif PageName="AddFileList" or PageName="AddFileModify" or PageName="AddFileList" then

			do while not rs.eof

			rs.movenext
			loop
		else

			do while not rs.eof

			rs.movenext
			loop
		end if
	else

		do while not rs.eof

		rs.movenext
		loop
	end if
rs.close
%>
<table class="tableBorder" width="100%" height="30" border="0" cellpadding="0" cellspacing="0"   align="center" style="margin-top:10px;">
  <tr>
    <td width="18%">&nbsp;</td>
    <td width="18%"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?">显示所有专辑</a></td>
    <td width="18%" align="center"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?listtype=1">显示推荐专辑</a></td>
    <td width="18%"align="center"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?listtype=2">显示未推荐专辑</a></td>
	<td width="18%"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?listtype=3">最近更新专辑</a></td>
    <td width="10%">&nbsp;</td>
  </tr>
</table>

<table class="tableBorder" border="0" width="100%" cellspacing="1" cellpadding="1">
  <tr>
    <td align=center width="100%" valign=top>
<%
listtype=request.QueryString("listtype")
if request.QueryString("Nclassid")<>"" then
	sql="select * from Special where Nclassid="+cstr(Nclassid)+" order by Specialid desc" 
elseif request.QueryString("classid")<>"" then
	sql="select * from Special where classid="+cstr(classid)+" order by Specialid desc"
'------------------------------------------------
elseif listtype<>"" then
			if  listtype=1 then
			sql="select * from Special where isgood=1 order by Specialid desc" 
			elseif listtype=2 then
			sql="select * from Special where isgood=0 order by Specialid desc"
			elseif listtype=3then
			sql="select * from Special order by Date desc"
			end if
'------------------------------------------------
else
	sql="select * from Special order by Specialid desc" 
end if

rs.open sql,conn,1,1
if rs.eof and rs.bof then 
	response.write "<p align='center'>暂时没有任何专辑</p>" 
else 
	MaxPerPage=50
	PageUrl="Admin_Allspecial.Asp"
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
i=0 %>
<table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
  <tr class="title">
          <td width="27%" background="images/manage/admin_bg_1.gif"><div align="center">专辑名称</div></td>
                <td width="22%" background="images/manage/admin_bg_1.gif"><div align="center">所属歌手</div></td>
                <td width="10%" background="images/manage/admin_bg_1.gif"><div align="center">批量添歌</div></td>
                <td width="9%" background="images/manage/admin_bg_1.gif"><div align="center">首页推荐</div></td>
                <td width="6%" background="images/manage/admin_bg_1.gif"><div align="center">修改</div></td>
                <td width="20%" background="images/manage/admin_bg_1.gif"><!--<div align="center">生成</div>--></td>
                <td width="6%" background="images/manage/admin_bg_1.gif"><div align="center">删除</div></td>
        </tr>
<%
do while not rs.eof
	i=i+1
%>
              <tr>
                <td width="27%" class="forumrow">&nbsp;<%=i%>.<a href="Admin_Allmusic.Asp?Classid=<%=rs("Classid")%>&SClassid=<%=rs("SClassid")%>&NClassid=<%=rs("NClassid")%>&specialid=<%=rs("specialid")%>"><font color=black><%=rs("name")%></font></a>&nbsp; <a href="Admin_Allspecial_Edit.Asp?Classid=<%=rs("Classid")%>&SClassid=<%=rs("SClassid")%>&NClassid=<%=rs("NClassid")%>&specialid=<%=rs("specialid")%>">[添歌]</a></td>
                <td width="22%" class="forumrow"><div align="center"><%=rs("Nclass")%></div></td>
                <td width="10%" class="forumrow"><div align="center"><a href="Admin_Allspecial_Err.Asp?specialid=<%=rs("specialid")%>"><FONT color="maroon">Wma</FONT></a></div></td>
                <td width="9%" class="forumrow"><div align="center"><a href="Admin_Allspecial_Err2.Asp?act=SetIsGood&Specialid=<%=rs("Specialid")%>&Askclassid=<%=classid%>&AskSClassid=<%=SClassid%>&AskNclassid=<%=Nclassid%>&page=<%=CurrentPage%>">
                  <%if rs("IsGood")=true then%>
                  <font color=red>撤销</font> 
                  <%else%> 
                  推荐 
                  <%end if%>
                </a></div></td>
                <td width="6%" class="forumrow"><div align="center"><a href="Admin_Allspecial_Add.Asp?Specialid=<%=rs("Specialid")%>&AskClassid=<%=rs("Classid")%>&AskSClassid=<%=rs("SClassid")%>&AskNClassid=<%=rs("NClassid")%>&page=<%=CurrentPage%>">修改</a></div></td> 
                <td width="20%" class="forumrow"><!--<div align="center"><a title="生成 <%=rs("nclass")%> → <%=rs("name")%> 歌曲列表" href="make_musiclist.asp?263=<%=rs("Specialid")%>"><font color=blue>生成歌曲列表</font></a></div>--></td>
                <td width="6%" class="forumrow"><div align="center"><a onClick="javascript:if (!window.confirm('您确认要删除吗？此操作不可恢复，请慎重操作！')){return false;};" title="不到万一请不要使用此功能" href="Admin_special.Asp?Specialid=<%=rs("Specialid")%>&classid=<%=rs("Classid")%>&AskSClassid=<%=rs("SClassid")%>&Nclassid=<%=rs("NClassid")%>&page=<%=CurrentPage%>"><font color=red>删除</font></a></div></td> 
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
  <center>共有<b><%=totalnumber%></b>张专辑
<%if CurrentPage<2 then%>
  &nbsp;首页 上一页&nbsp;
<%else%>
  &nbsp;<a href="<%=filename%>?page=1&classid=<%=classid%>&Nclassid=<%=Nclassid%>&listtype=<%=listtype%>">首页</a>&nbsp;
  <a href="<%=filename%>?page=<%=CurrentPage-1%>&classid=<%=classid%>&Nclassid=<%=Nclassid%>&listtype=<%=listtype%>">上一页</a>&nbsp;
<%
end if
if n-currentpage<1 then
%>
  下一页 末页
<%else%>
  <a href="<%=filename%>?page=<%=CurrentPage+1%>&classid=<%=classid%>&Nclassid=<%=Nclassid%>&listtype=<%=listtype%>">下一页</a>
  <a href="<%=filename%>?page=<%=n%>&classid=<%=classid%>&Nclassid=<%=Nclassid%>&listtype=<%=listtype%>">末页</a>
<%end if%>
  &nbsp;页次:<strong><%=CurrentPage%>/<%=n%></strong>页
  转到:<select name='jumpMenu' onChange='location.href=jumpMenu.value;'>
<%for i = 1 to n%>           
  <option value="<%=filename%>?classid=<%=classid%>&Nclassid=<%=Nclassid%>&page=<%=i%>&listtype=<%=listtype%>" <%if cint(CurrentPage)=cint(i) then%> selected <%end if%>>第<%=i%>页</option>   
<%next%>   
  </select>        
</form>        
<%end function%>
    </td>
  </tr>
</table>
<%
set rs=nothing
conn.close
set conn=nothing
%>
</body>
</html>
