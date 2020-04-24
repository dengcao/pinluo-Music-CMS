<!--#include file="Const.Asp"-->
<%CheckAdmin3%>
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
if not isempty(request("page")) then
	currentPage=cint(request("page"))
else
	currentPage=1
end if
%>
<!--#include file="Top.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
<table class="tableBorder" width="100%" height="30" border="0" align="center" cellpadding="0" cellspacing="0"  style="margin-top:10px;">
<form name="Search" method="post" action="">
  <tr>
    <td align="center" width="13%"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?">显示所有会员</a></td>
    <td align="center" width="10%"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?listtype=1">按推广排列</a></td>
    <td align="center" width="11%"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?listtype=2">按添词排列</a></td>
    <td align="center" width="11%"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?listtype=3">按在线排列</a></td>
    <td align="center" width="10%"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?listtype=4">按消费排列</a></td>
    <td align="center" width="10%">&nbsp;</td>
    <td align="center" width="7%">用户搜索</td>
    <td align="center" width="7%">
<select name="Stype" id="Stype">
        <option value="1" selected>用户名</option>
        <option value="2">用户ID</option>
      </select></td>
    <td align="center" width="15%"><input name="key" type="text" id="key" size="20" maxlength="50" style="border:1px #123456 solod;"></td>
	<td align="center" width="6%"> <input type="submit" name="Submit" value="搜索"></td>
  </tr>
  </form>
</table>
<table class="tableBorder" border="0" width="100%" cellspacing="1" cellpadding="1">
 <tr>
<td align=center valign=top>
<%
set rs=server.createobject("adodb.recordset")
	dim stype
	stype=request.Form("stype")
	key=trim(request.Form("key"))
	listtype=request.QueryString("listtype")
	if stype<>"" then
		select case stype
			case 1
				sql="select * from [user]  where UserName like '%"&key&"%' order by id desc"
			case 2
				sql="select * from [user]  where ID ="&cint(key)&" order by id desc"
		end select
	elseif listtype<>"" then
		select case listtype
			case 1
				sql="select * from [user] order by Exp desc"
			case 2
				sql="select * from [user] order by ExpWord desc"
			case 3
				sql="select * from [user] order by ExpOnLine desc"
			case 4
				sql="select * from [user] order by ExpUse desc"
		end select
	else
	sql="select * from [user] order by id desc"
	end if
rs.open sql,conn,1,1
if rs.eof and rs.bof then 
	response.write "<p align='center'>暂时没有用户注册</p>" 
else 
	MaxPerPage=20
	PageUrl="Admin_User.asp"
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
            <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
                  <tr>
                <td width="7%" height=37 align=center background="images/manage/admin_bg_1.gif" class="title">ID</td>
                <td width="43%" align=center background="images/manage/admin_bg_1.gif" class="title">用户名</td>
                <td width="4%" align=center background="images/manage/admin_bg_1.gif" class="title">推广</td>
                <td width="4%" align=center background="images/manage/admin_bg_1.gif" class="title">添加</td>
                <td width="4%" align=center background="images/manage/admin_bg_1.gif" class="title">在线</td>
                <td width="4%" align=center background="images/manage/admin_bg_1.gif" class="title">消费</td>
                <td width="4%" align=center background="images/manage/admin_bg_1.gif" class="title">一共</td>
                <td width="4%" height=37 align=center background="images/manage/admin_bg_1.gif" class="title">余额</td>
                <td width="7%" height=37 align=center background="images/manage/admin_bg_1.gif" class="title">修改资料</td>
                 <td width="7%" height=37 align=center background="images/manage/admin_bg_1.gif" class="title">VIP冲值</td>
                <td width="7%" height=37 align=center background="images/manage/admin_bg_1.gif" class="title">是否锁定</td>
                <td width="5%" height=37 align=center background="images/manage/admin_bg_1.gif" class="title">删除</td>
              </tr>
<%
do while not rs.eof
	i=i+1
%>
              <tr>
                <td height="22" class="forumrow" align=center><%=rs("id")%>　</td>
                <td class="forumrow" align=center><a href="Admin_User_Action.Asp?id=<%=rs("id")%>"><%=rs("UserName")%></a></td>
                <td class="forumrow" align=center><%=rs("Exp")%></td>
                <td class="forumrow" align=center><%=rs("ExpWord")%></td>
                <td class="forumrow" align=center><%=rs("ExpOnLine")%></td>
                <td class="forumrow" align=center><%=rs("ExpUse")%></td>
                <td class="forumrow" align=center><%=rs("Exp")+rs("ExpWord")+rs("ExpOnLine")%></td>
                <td class="forumrow" align=center><%=rs("Exp")+rs("ExpWord")+rs("ExpOnLine")-rs("ExpUse")%></td>
                <td class="forumrow" align=center><input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type=button name=edit value=修改 onClick="javascript:window.open('Admin_User_Action.Asp?id=<%=rs("id")%>','_self','')"></td>
                <td class="forumrow" align=center><input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type=button name=edit value=充值 onClick="javascript:window.open('Admin_User_Pluscz.asp?id=<%=rs("id")%>','_self','')"></td>
               
                <td class="forumrow" align=center><a href="Admin_User_Err.asp?id=<%=rs("id")%>&act=lock"><%if rs("lockuser")=false then%><font color=red>点击锁定</font><%else%><font color=BLUE>点击解锁</font><%end if%> </a></td>
                <td class="forumrow" align=center><input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type=button name=del value=删除 onClick="javascript:window.open('Admin_User_Data.Asp?id=<%=rs("id")%>','_self','')"></td>
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
<form method=Post action="<%=filename%>?classid=<%=classid%>&Nclassid=<%=Nclassid%>&listtype=<%=listtype%>">
  <center>共<font color="red"><b><%=totalnumber%></b></font>个用户
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
  &nbsp;页次:<strong><font color="red"><%=CurrentPage%>/<%=n%></font></strong>页
  转到:<select name="page" size="1" onChange="javascript:submit()">
<%for i = 1 to n%>           
  <option value="<%=i%>" <%if cint(CurrentPage)=cint(i) then%> selected <%end if%>>第<%=i%>页</option>   
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
set conn=nothing%>
</body>
</html>
