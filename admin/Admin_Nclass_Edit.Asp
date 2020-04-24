<!--#include file="Const.Asp"-->
<%CheckAdmin1%>
<%PageName="Admin_Nclass_Edit"%>
<!--#include file="Top.Asp"-->
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
'取消推荐 推荐歌手
dim action,gequid
gequid=cint(request.QueryString("gequid"))
action=request.QueryString("action")
select case action
	case "isgood"
	conn.execute("update NClass set isgood=1 where NClassID="&gequid&"")
	response.Write("<script>history.back(-1);</script>")
	response.End()
	case "isbad"
	conn.execute("update NClass set isgood=0 where NClassID="&gequid&"")
	response.Write("<script>history.back(-1);</script>")
	response.End()
end select
'--------------------
Classid=Request.QueryString ("Classid")
SClassid=Request.QueryString ("SClassid")
if Classid="" and SClassid="" then
	AskClassid=Request.QueryString ("AskClassid")
	AskSClassid=Request.QueryString ("AskSClassid")
	Page=Request.QueryString ("")
end if
set rrrs=server.createobject("adodb.recordset")
sqll="select * from sclass where SClassid="&SClassid&" order by sclassid"
rrrs.open sqll,conn,1,1
kkk=rrrs("sclass")
rrrs.close

set rs=server.createobject("adodb.recordset")
set rs2=server.createobject("adodb.recordset")
set rs3=server.createobject("adodb.recordset")
%>
     <table class="tableBorder" width="101%" border="0" align="center" cellpadding="2" cellspacing="1" >
               <tr class="title">
          <td width="100%" height="25" align=center background="images/manage/admin_bg_1.gif"><%=kkk%>歌手管理</td>
        </tr></table>
         <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
    
        <tr>
        <td height="20" align="center" background="images/manage/admin_bg.gif" class="forumrow"><a class="forumrow" href="#a"><B>A</B></a>  
             <a class="forumrow" href="#b"><B>B</B></a>  <a CLASS=3D2 href="#c"><B>C</B></a> 
             <a class="forumrow" href="#d"><B>D</B></a>  <a CLASS=3D2 href="#e"><B>E</B></a> 
             <a class="forumrow" href="#f"><B>F</B></a>  <a CLASS=3D2 href="#g"><B>G</B></a> 
             <a class="forumrow" href="#h"><B>H</B></a>  <a CLASS=3D2  href="#i"><B>I</B></a> 
             <a class="forumrow" href="#j"><B>J</B></a>  <a CLASS=3D2  href="#k"><B>K</B></a> 
             <a class="forumrow" href="#l"><B>L</B></a>  <a CLASS=3D2  href="#m"><B>M</B></a> 
             <a class="forumrow" href="#n"><B>N</B></a>  <a CLASS=3D2  href="#o"><B>O</B></a> 
             <a class="forumrow" href="#p"><B>P</B></a>  <a CLASS=3D2  href="#q"><B>Q</B></a> 
             <a class="forumrow" href="#r"><B>R</B></a>  <a CLASS=3D2  href="#s"><B>S</B></a> 
             <a class="forumrow" href="#t"><B>T</B></a>  <a CLASS=3D2  href="#u"><B>U</B></a> 
             <a class="forumrow" href="#v"><B>V</B></a>  <a CLASS=3D2  href="#w"><B>W</B></a> 
             <a class="forumrow" href="#x"><B>X</B></a>  <a CLASS=3D2  href="#y"><B>Y</B></a> 
             <a class="forumrow" href="#z"><B>Z</B></a></td>
         </tr>
<%
sql="select * from class order by classid"
rs.open sql,conn,1,1
if rs.eof then
%>
<%
else
	do while not rs.eof
%>
<%	rs.movenext
	loop
end if
rs.close
%>
<%
		sql3="select * from Nclass where SClassid="&SClassid&" order by Abcd"
		rs3.open sql3,conn,1,1
		MaxPerPage=10000

	sql="select * from class where Classid="&Classid
	rs.open sql,conn,1,1
%>
<%	if not rs.eof then%>
<%	end if%>
<%
	if rs3.eof then
%>
              <tr><td align="center" background="images/manage/admin_bg.gif" Class="title">尚无歌手分类</td>
              </tr>
<%
	else
		k=0
		do while not rs3.eof
			k=k+1
							if thischar<>rs3("Abcd") then
								thischar=rs3("Abcd")
								if i=0 then
								 Response.Write "<tr><td background=images/manage/admin_bg.gif width=50% Class=title >&nbsp;&nbsp;<a name="&thischar&"><b><font color=#FFFFFF face=Verdana, Arial, Helvetica, sans-serif size=4>"&thischar&"</font></b></a></td></tr>"
								 else
								 Response.Write "<tr><td background=images/manage/admin_bg.gif width=50% Class=title >&nbsp;&nbsp;<a name="&thischar&"><b><font color=#FFFFFF face=Verdana, Arial, Helvetica, sans-serif size=4>"&thischar&"</font></b></a></td></tr>"
								 end if
							end if
%>
		<tr>
          <td width="100%" class="forumrow">
                  <table class="tableBorder" width="100%" border="0" cellspacing="0" cellpadding="0"  align=center>
                     <tr>
                      <td class="forumrow" width="30%">&nbsp;&nbsp;<%=rs3("NClassid")%>.<a href="Admin_Nclass_Add.Asp?nclassid=<%=rs3("NClassid")%>"><%=rs3("NClass")%></a></td>
					  <td class="forumrow" width="10%">
					 <%if rs3("isgood")=true then%>
                  	<a href="?action=isbad&gequid=<%=rs3("NClassid")%>"><font color=red>撤销</font></a> 
                  	<%else%> 
                  	<a href="?action=isgood&gequid=<%=rs3("NClassid")%>">推荐</a> 
                 	<%end if%>
					<td>
                      <td class="forumrow" width="15%">&nbsp;<a href="Admin_Nclass_Add.Asp?nclassid=<%=rs3("NClassid")%>">修改歌手资料</a></td>
                      <td class="forumrow" width="30%">&nbsp;<!--<a title="生成 <%=rs3("nclass")%> 的歌手资料" href="make_mxda.asp?263=<%=rs3("nclassid")%>"><font color=blue>生成歌手资料</font></a>--></td>
                      <td class="forumrow" width="15%" align="right">&nbsp;&nbsp;<a onClick="javascript:if (!window.confirm('您确认要删除吗？此操作不可恢复，请慎重操作！')){return false;};" title="不到万一不要用此功能! 删除后可不能恢复的!" href='Admin_Nclass_Err.Asp?act=del&NClassid=<%=rs3("NClassID")%>'><font color=red>删除</font></a>&nbsp;</td>
                    </tr>
                  
                  </table>
		  </td>
        </tr>
<%
			if k>=MaxPerPage then exit do
		rs3.movenext
		loop
	end if
	rs3.close
%>
      </table>
<% 
set rs=nothing
set rs3=nothing
conn.close
set conn=nothing
%>
</body>
</html>
<html>
</html>
