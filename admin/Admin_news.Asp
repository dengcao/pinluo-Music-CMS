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
if request("flag")="del" then
	sql1="delete from News where id="&request("id")
	conn.execute(sql1)
	response.Write("<script language='javascript'>alert('删除成功');location.replace('admin_news.asp');</script>")
	response.end
end if

if not isempty(request("page")) then
	currentPage=cint(request("page"))
else
	currentPage=1
end if
%>
<!--#include file="Top.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
<table class="tableBorder" border="0" width="100%" cellspacing="1" cellpadding="1">
 <tr>
<td align=center valign=top>
<%
set rs=server.createobject("adodb.recordset")
	dim stype
	stype=request.Form("stype")
	key=trim(request.Form("key"))
	listtype=request.QueryString("listtype")

	sql="select * from News order by pubtime desc"
rs.open sql,conn,1,1
if rs.eof and rs.bof then 
	response.write "<p align='center'>暂时没有信息</p>" 
else 
	MaxPerPage=20
	PageUrl="Admin_News.asp"
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
                <td width="2%" height=37 align=center background="images/manage/admin_bg.gif" class="title">ID</td>
                <td width="48%" align=center background="images/manage/admin_bg.gif" class="title">标题</td>
                <td width="17%" height=37 align=center background="images/manage/admin_bg.gif" class="title">发布时间</td>
                <td width="10%" height=37 align=center background="images/manage/admin_bg.gif" class="title">删除</td>
              </tr>
<%
do while not rs.eof
	i=i+1
%>
              <tr>
                <td height="22" class="forumrow" align=center><%=rs("id")%>　</td>
                <td class="forumrow" align=center><a href="Admin_News_edit.Asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
                <td class="forumrow" align=center><%=rs("pubtime")%></td>
               
                <td class="forumrow" align=center> <a href="Admin_News_edit.Asp?id=<%=rs("id")%>">修改</a>&nbsp;
                  <a href="Admin_News.Asp?id=<%=rs("id")%>&flag=del">删除</a></td>
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
<a href="admin_news_add.asp"><strong style="color:red">添加信息</strong></a>
<form method=Post action="<%=filename%>?classid=<%=classid%>&Nclassid=<%=Nclassid%>&listtype=<%=listtype%>">
  <center>共<font color="red"><b><%=totalnumber%></b></font>条信息
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
