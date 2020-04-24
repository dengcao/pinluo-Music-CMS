<!--#include file="const.asp"-->
<%CheckAdmin1%>
<%PageName="songlist"%>
<!--#include file="../PL_INC/PL_Path.Asp"-->
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
if request("page")<>"" then
	currentPage=cint(request("page"))
else
	currentPage=1
end if

if request("classid")<>"" then
	classid=request("classid")
else
	classid=""
end if
if request("Sclassid")<>"" then
	Sclassid=request("Sclassid")
else
	Sclassid=""
end if
if request("Nclassid")<>"" then
	Nclassid=request("Nclassid")
else
	Nclassid=""
end if
if request("Specialid")<>"" then
	Specialid=request("Specialid")
else
	Specialid=""
end if
%>
<!--#include file="Top.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
<div align="center">
<table class="tableBorder" width="100%" height="30" border="0" cellpadding="0" cellspacing="0"   align="center" style="margin-top:10px;">
  <tr>
    <td width="18%">&nbsp;</td>
    <td width="18%"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?">显示所有歌曲</a></td>
    <td width="18%" align="center"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?listtype=1">显示推荐歌曲</a></td>
    <td width="18%"align="center"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?listtype=2">显示未推荐歌曲</a></td>
	<td width="18%"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?listtype=3">最近更新歌曲</a></td>
    <td width="10%">&nbsp;</td>
  </tr>
</table>
<table class="tableBorder" border="0" width="100%" cellspacing="1" cellpadding="1">
 <tr>
<td align=center valign=top>
<%
set rs=server.createobject("adodb.recordset")
listtype=request.QueryString("listtype")
if classid<>"" then
	if Specialid<>"" then
		sql="select * from MusicList where Specialid="+cstr(Specialid)+" and Nclassid="+cstr(Nclassid)+" and sclassid="+cstr(sclassid)+" and classid="+cstr(classid)+"  order by id desc" 
	elseif Nclassid<>"" then
		sql="select * from MusicList where Nclassid="+cstr(Nclassid)+" and sclassid="+cstr(sclassid)+" and classid="+cstr(classid)+"  order by id desc" 
	elseif SClassid<>"" then
		sql="select * from MusicList where SClassID="+cstr(SClassID)+" and ClassID="+cstr(Classid)+" order by id desc" 
	else
		sql="select * from MusicList where classid="+cstr(classid)+" order by id desc" 
	end if
'------------------------------------------------
elseif listtype<>"" then
			if  listtype=1 then
			sql="select * from MusicList where isgood=1 order by id desc" 
			elseif listtype=2 then
			sql="select * from MusicList where isgood=0 order by id desc"
			elseif listtype=3 then
			sql="select * from MusicList order by LastTime desc"
			end if
'------------------------------------------------
else
	sql="select * from MusicList order by id desc"
end if
rs.open sql,conn,1,1
if rs.eof and rs.bof then 
	response.write "<p align='center'><b>暂时没有收集任何歌曲<br><br><a href='javascript:history.go(-1)'>...::: 点 此 返 回 :::...</a></b></p>" 
	showList
else 
	MaxPerPage=100
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
		showpage totalput,MaxPerPage,"Admin_Allmusic.Asp" 
		showContent 
		showpage totalput,MaxPerPage,"Admin_Allmusic.Asp" 
		showList
	else 
		if (currentPage-1)*MaxPerPage<totalPut then 
			rs.move  (currentPage-1)*MaxPerPage 
			dim bookmark 
			bookmark=rs.bookmark 
			showpage totalput,MaxPerPage,"Admin_Allmusic.Asp" 
			showContent 
			showpage totalput,MaxPerPage,"Admin_Allmusic.Asp" 
			showList
		else 
			currentPage=1 
			showpage totalput,MaxPerPage,"Admin_Allmusic.Asp" 
			showContent 
			showpage totalput,MaxPerPage,"Admin_Allmusic.Asp" 
			showList
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
          <td width="30%" background="images/manage/admin_bg_1.gif">歌曲名字</td>
          <td width="30%" background="images/manage/admin_bg_1.gif">所属歌手</td>
          <td width="9%" background="images/manage/admin_bg_1.gif">歌词</td>
          <td width="9%" background="images/manage/admin_bg_1.gif">推荐</td>
          <td width="9%" background="images/manage/admin_bg_1.gif">修改</td>
          <td width="9%" background="images/manage/admin_bg_1.gif">删除</td>
          <td width="9%" background="images/manage/admin_bg_1.gif">Shtml</td>
        </tr>
<%do while not rs.eof%>
        <tr>
          <td width="30%" class="forumrow"> <%=(i+1)%>.<a href="<%=SelectPath(rs("Song_path"))&rs("Wma")%>"><%=rs("MusicName")%></a></td>
          <td width="30%" class="forumrow" align=center><%=rs("singer")%>  <a href="Admin_Allspecial_Edit.Asp?Classid=<%=rs("Classid")%>&SClassid=<%=rs("SClassid")%>&NClassid=<%=rs("NClassid")%>&specialid=<%=rs("specialid")%>">[进入添歌]</a></td>
          <td width="9%" class="forumrow" align=center>
		  <%
		  '------------取得文本歌词ID---------------
		  dim rs_tid, TextId,LrcId
		  set rs_tid=conn.execute("select ID from TextWord where MusicID="&rs("id")&"")
		  if rs_tid.bof and rs_tid.eof then
		  TextId=""
		  else
		  TextId=rs_tid("ID")
		  end if
		  rs_tid.close
		  set rs_tid=nothing
		   '------------取得LRC歌词ID---------------
		  set rs_tid=conn.execute("select ID from LrcWord where MusicID="&rs("id")&"")
		  if rs_tid.bof and rs_tid.eof then
		  LrcId=""
		  else
		  LrcId=rs_tid("ID")
		  end if
		  rs_tid.close
		  set rs_tid=nothing
		  %>
		  <a href="Admin_Word_Edit.Asp?id=<%=rs("id")%>">文本</a>&nbsp;<a href="Admin_LRCWord_Edit.Asp?id=<%=rs("id")%>">LRC</a></td> 
          <td width="9%" class="forumrow" align=center><a href="Admin_Allmusic_Edit.Asp?act=SetIsGood&id=<%=rs("id")%>&classid=<%=classid%>&SClassid=<%=SClassid%>&Nclassid=<%=Nclassid%>&page=<%=CurrentPage%>"><%if rs("IsGood")=true then%><font color=red>撤销</font><%else%>推荐<%end if%></a></td> 
          <td width="9%" class="forumrow" align=center><a href="Admin_Allmusic_Ok.Asp?id=<%=rs("id")%>&AskClassid=<%=rs("classid")%>&AskNClassid=<%=rs("Nclassid")%>&page=<%=CurrentPage%>">修改</a></td> 
          <td width="9%" class="forumrow" align=center><a href="Admin_Allmusic_Data.Asp?id=<%=rs("id")%>&classid=<%=classid%>&SClassid=<%=SClassid%>&Nclassid=<%=Nclassid%>&page=<%=CurrentPage%>">删除</a></td> 
          <td width="9%" class="forumrow" align=center><!--<a href="make_musicplay.asp?263=<%=rs("id")%>">生成</a>--></td> 
        </tr>
<%
	i=i+1
	if i>=MaxPerPage then exit do
	rs.movenext
	loop
%>
      </table>
<%
end sub 

Function SelectPath(Pathid)
	Select Case Pathid
		Case 1
			SelectPath=song_path1
		Case 2
			SelectPath=song_path2
		Case 3
			SelectPath=song_path3
		Case 4
			SelectPath=song_path4
		Case 5
			SelectPath=song_path5
		Case else
			SelectPath=song_path1
		End Select
End Function

function showpage(totalnumber,maxperpage,filename)
dim n
if totalnumber mod maxperpage=0 then
	n= totalnumber \ maxperpage
else
	n= totalnumber \ maxperpage+1
end if
%>
<form method=Post action="<%=filename%>?classid=<%=classid%>&Sclassid=<%=Sclassid%>&Nclassid=<%=Nclassid%>&listtype=<%=listtype%>">
  <center>共<font color="#ff0000"><b><%=totalnumber%></b></font>首歌曲
<%if CurrentPage<2 then%>
  &nbsp;首页 上一页&nbsp;
<%else%>
  &nbsp;<a href="<%=filename%>?page=1&classid=<%=classid%>&Sclassid=<%=Sclassid%>&Nclassid=<%=Nclassid%>&listtype=<%=listtype%>">首页</a>&nbsp;
  <a href="<%=filename%>?page=<%=CurrentPage-1%>&classid=<%=classid%>&Sclassid=<%=Sclassid%>&Nclassid=<%=Nclassid%>&listtype=<%=listtype%>">上一页</a>&nbsp;
<%
end if
if n-currentpage<1 then
%>
  下一页 末页
<%else%>
  <a href="<%=filename%>?page=<%=CurrentPage+1%>&classid=<%=classid%>&Sclassid=<%=Sclassid%>&Nclassid=<%=Nclassid%>&listtype=<%=listtype%>">下一页</a>
  <a href="<%=filename%>?page=<%=n%>&classid=<%=classid%>&Sclassid=<%=Sclassid%>&Nclassid=<%=Nclassid%>&listtype=<%=listtype%>">末页</a>
<%end if%>
  &nbsp;页次:<strong><font color="#ff0000"><%=CurrentPage%>/<%=n%></font></strong>页
  转到:<select name="page" size="1" onChange="javascript:submit()">
<%for i = 1 to n%>           
  <option value="<%=i%>" <%if cint(CurrentPage)=cint(i) then%> selected <%end if%>>第<%=i%>页</option>   
<%next%>   
  </select>        
</form>        

<% 
end function
%>
<%
sub showList
%>
<table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
  <tr class="title"> 
    <td height="22" colspan="3" align="center" background="images/manage/admin_bg_1.gif"><strong>栏 目 列 表</strong></td>
  </tr>
<%
'-----------------一级目录列表-----------------------
set Trs=server.createobject("adodb.recordset")
Tsql="select Classid,Class from Class"
Trs.open Tsql,conn,1,1
if not Trs.eof then
%>
        <tr class="tdbg">
          <td width=12% class="forumrow">一级栏目:</td>
          <td>
<%	do while not Trs.eof%>
            <a href="Admin_Allmusic.Asp?Classid=<%=Trs("Classid")%>"><%=Trs("Class")%></a>
<%
	Trs.movenext
	loop
%> 　</td>
        </tr>
<%
end if
Trs.close
'-----------------二级目录列表-----------------------
if classid<>"" then
	Tsql="select Classid,SClassid,SClass from SClass where classid="+cstr(classid) 
	Trs.open Tsql,conn,1,1
	if not Trs.eof then
%>
        <tr class="tdbg">
          <td width=12% class="forumrow">二级栏目:</td>
          <td>
<%		do while not Trs.eof%>
            <a href="Admin_Allmusic.Asp?Classid=<%=Trs("Classid")%>&SClassid=<%=Trs("SClassid")%>"><%=Trs("SClass")%></a>
<%
		Trs.movenext
		loop
%> 　</td>
        </tr>
<%
	end if
	Trs.close
end if
'-----------------三级目录列表-----------------------
if Sclassid<>"" then
	Tsql="select Classid,SClassid,NClassid,NClass from NClass where sclassid="+cstr(sclassid)
	Trs.open Tsql,conn,1,1
	if not Trs.eof then
%>
        <tr class="tdbg">
          <td width=12% class="forumrow">三级栏目:</td>
          <td>
<%		do while not Trs.eof%>
            <a href="Admin_Allmusic.Asp?Classid=<%=Trs("Classid")%>&SClassid=<%=Trs("SClassid")%>&NClassid=<%=Trs("NClassid")%>"><%=Trs("NClass")%>
<%
		Trs.movenext
		loop
%>
          　</td>
        </tr>
<%
	end if
	Trs.close
end if
%>
      </td>
    </table>
<%
end sub
%>
    </td>
  </tr>
</table>
</div>
<%
set Trs=nothing
set rs=nothing
conn.close
set conn=nothing
%>
</body>
</html>
