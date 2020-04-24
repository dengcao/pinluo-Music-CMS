<!--#include file="function.asp"-->
<%CheckAdmin3%>
<!--#include file="../user/conn.asp"-->
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
	response.write "<p align='center'>暂时没有评价</p>" 
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
                <td width="13%" height=22 align=center background="zy11/bgleft.gif"><font color="GREEN">用户名称</font></td>
                <td width="10%" height=22 align=center background="zy11/bgleft.gif">
                <font color="#008000">歌曲名字</font></td>

                <td width="50%" height=22 align=center background="zy11/bgleft.gif">
                <font color="#008000">歌词内容</font></td>
                <td width="13%" height=22 align=center background="zy11/bgleft.gif"><font color="GREEN">删除</font></td>
              </tr>
<%
do while not rs.eof
	i=i+1
%>
              <tr>
                <td height="22" align=center><%=rs("r_id")%>　</td>
                <td align=center><%=rs("name")%> </td>
                <td align=center><%=rs("body")%>　</td>
                <td align=center><a href="?page=<%=CurrentPage%>&id=<%=rs("id")%>">删除</a></td>
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
  <center>共<font color="red"><b><%=totalnumber%></b></font>条信息
<%if CurrentPage<2 then%>
  &nbsp;首页 上一页&nbsp;
<%else%>
  &nbsp<a href="<%=filename%>?page=1&vip=<%=vip%>">首页</a>&nbsp;
  <a href="<%=filename%>?page=<%=CurrentPage-1%>&vip=<%=vip%>">上一页</a>&nbsp;
<%
end if
if n-currentpage<1 then
%>
  下一页 末页
<%else%>
  <a href="<%=filename%>?page=<%=CurrentPage+1%>&vip=<%=vip%>">下一页</a>
  <a href="<%=filename%>?page=<%=n%>&vip=<%=vip%>">末页</a>
<%end if%>
  &nbsp;页次:<strong><font color="red"><%=CurrentPage%>/<%=n%></font></strong>页
  转到:<select name="page" size="1" onchange="javascript:submit()">
<%for i = 1 to n%>           
  <option value="<%=i%>" <%if cint(CurrentPage)=cint(i) then%> selected <%end if%>>第<%=i%>页</option>   
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
