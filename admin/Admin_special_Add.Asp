<!--#include file="const.asp"-->
<%CheckAdmin1%>
<%PageName="Admin_special_Add"%>
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
Classid=Request.QueryString ("Classid")
SClassid=Request.QueryString ("SClassid")
if Classid="" and SClassid="" then
	AskClassid=Request.QueryString ("AskClassid")
	AskSClassid=Request.QueryString ("AskSClassid")
	Page=Request.QueryString ("")
end if
set rs=server.createobject("adodb.recordset")
set rs2=server.createobject("adodb.recordset")
set rs3=server.createobject("adodb.recordset")
%>
       <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
        <tr class="title">
          <td width="100%" height="25" align=center background="images/manage/admin_bg_1.gif"><a href="Admin_special_Edit.Asp?classid=1&sclassid=<%=sclassid%>" title="点击这里可以直接添加专辑"><font color="#FFFFFF"><b>添 加 编 辑 专 辑 (第二步)</b></font></a></td>
        </tr></table>
        <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
        <tr class="forumrow">
        <td class="forumrow" height="20" colspan=4 align="center"><a href="#a"><B>A</B></a>  
            <a href="#b"><B>B</B></a>  <a href="#c"><B>C</B></a> 
             <a href="#d"><B>D</B></a>  <a href="#e"><B>E</B></a> 
             <a href="#f"><B>F</B></a>  <a href="#g"><B>G</B></a> 
             <a href="#h"><B>H</B></a>  <a href="#i"><B>I</B></a> 
             <a href="#j"><B>J</B></a>  <a href="#k"><B>K</B></a> 
             <a href="#l"><B>L</B></a>  <a href="#m"><B>M</B></a> 
             <a href="#n"><B>N</B></a>  <a href="#o"><B>O</B></a> 
             <a href="#p"><B>P</B></a>  <a href="#q"><B>Q</B></a> 
             <a href="#r"><B>R</B></a>  <a href="#s"><B>S</B></a> 
             <a href="#t"><B>T</B></a>  <a href="#u"><B>U</B></a> 
             <a href="#v"><B>V</B></a>  <a href="#w"><B>W</B></a> 
             <a href="#x"><B>X</B></a>  <a href="#y"><B>Y</B></a> 
             <a href="#z"><B>Z</B></a></td>
         </tr>
<%
sql="select * from class order by classid"
rs.open sql,conn,1,1
if rs.eof then
else
	do while not rs.eof
	rs.movenext
	loop
end if
rs.close
		sql3="select * from Nclass where SClassid="&SClassid&" order by Abcd"
		rs3.open sql3,conn,1,1
		MaxPerPage=10000

	sql="select * from class where Classid="&Classid
	rs.open sql,conn,1,1
	if not rs.eof then
	end if
	if rs3.eof then

              Response.Write " <tr><td colspan=4 background=images/manage/admin_bg.gif>尚无任何分类</td></tr>"

	else
		k=0
		do while not rs3.eof
			k=k+1
							if thischar<>rs3("Abcd") then
								thischar=rs3("Abcd")
								if i=0 then
								 Response.Write "<tr><td background=images/manage/admin_bg.gif width=50% class=title colspan=4>&nbsp;&nbsp;<a name="&thischar&"><b><font color=#FFFFFF face=Verdana, Arial, Helvetica, sans-serif size=4>"&thischar&"</font></b></a></td></tr>"
								 else
								 Response.Write "<tr><td background=images/manage/admin_bg.gif width=50% class=title colspan=4>&nbsp;&nbsp;<a name="&thischar&"><b><font color=#FFFFFF face=Verdana, Arial, Helvetica, sans-serif size=4>"&thischar&"</font></b></a></td></tr>"
								 end if
end if
%>
		
                   <tr>
                       <td class="forumrow" width="30%" height=22 align=left>&nbsp;&nbsp;<%=rs3("NClassID")%>.<a href='Admin_special_Edit.Asp?Classid=<%=rs3("Classid")%>&SClassid=<%=rs3("SClassid")%>&NClassid=<%=rs3("NClassID")%>'><%=rs3("NClass")%></a></td>
                      <td class="forumrow" width="20%" height=22 align=center><a href='Admin_special_Edit.Asp?Classid=<%=rs3("Classid")%>&SClassid=<%=rs3("SClassid")%>&NClassid=<%=rs3("NClassID")%>'>添加专辑</a></td>
                      <td class="forumrow" width="25%" height=22 align=center>&nbsp;&nbsp;<!--<a title="生成 <%=rs3("nclass")%> 的专辑列表" href="make_special.asp?263=<%=rs3("nclassid")%>"><font color=blue>生成专辑HTM</font></a>--></td>
                      
                      <td class="forumrow" width="25%" height=22 align=center><a href=Admin_Allspecial.Asp?Classid=<%=rs3("Classid")%>&SClassid=<%=rs3("SClassid")%>&NClassid=<%=rs3("NClassid")%>>浏览该歌手的所有专辑</a></td>
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
</body></html>
