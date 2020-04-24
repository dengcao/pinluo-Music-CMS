<!--#include file="const.asp"-->
<!--#include file="../PL_INC/Cls_ShowoPage.asp"-->
<%CheckAdmin1%>
<%PageName="songwordsadmin"%>
<!--#include file="Top.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
<table class="tableBorder" width="100%" height="30" border="0" cellpadding="0" cellspacing="0"   align="center" style="margin-top:10px;">
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="20%"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?">显示所有歌词</a></td>
    <td width="20%" align="center"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?listtype=1">显示审核过的歌词</a></td>
    <td width="20%"align="center"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?listtype=2">显示未审核歌词</a></td>
    <td width="20%"align="center"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?listtype=3">显示报错的歌词</a></td>
  </tr>
</table>

<table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
	<tr class="title">
          <td width="20%" height="22" align="center" background="images/manage/admin_bg_1.gif"><strong>所属歌手</strong></td>
          <td width="25%" height="22" align="center" background="images/manage/admin_bg_1.gif"><strong>歌曲名字</strong></td>
          <td width="25%" height="22" align="center" background="images/manage/admin_bg_1.gif"><strong>歌曲专辑</strong></td>
          <td width="5%" height="22" align="center" background="images/manage/admin_bg_1.gif"><strong>报错</strong></td>
          <td width="10%" height="22" align="center" background="images/manage/admin_bg_1.gif"><strong>添加人</strong></td>
          <td width="5%" height="22" align="center" background="images/manage/admin_bg_1.gif"><strong>点击</strong></td>
          <td width="10%" height="22" align="center" background="images/manage/admin_bg_1.gif"><strong>歌词编辑</strong></td>
	</tr>
<%
	Dim listtype,WhereStr
	listtype = Request.QueryString("listtype")
	If listtype<>""then
		If listtype=1 then
			WhereStr = "Flag=1" 
		Elseif listtype=2 then
			WhereStr = "Flag=0" 
		Elseif listtype=3 then
			WhereStr = "Flag=1 And ErrNum>=1" 
		End if
	Else
		WhereStr = "" 
	End if

	Dim ors
	Set ors = New Cls_ShowoPage	'创建对象
	With ors
		.Conn 		= Conn			'得到数据库连接对象
		.DbType		= "AC"
		'数据库类型,AC为access,MSSQL为sqlserver2000,MSSQL_SP为存储过程版,MYSQL为mysql,PGSQL为PostGreSql	
		.RecType	= 0
		'取记录总数方法(0执行count,1自写sql语句取,2固定值)
		.RecSql		= 0
		'如果RecType＝1则=取记录sql语句，如果是2=数值，等于0=""
		.RecTerm	= 2	
		'取从记录条件是否有变化(0无变化,1有变化,2不设置cookies也就是及时统计，适用于搜索时候)
		.CookieName	= "a306"	'如果RecTerm＝2,cookiesname="",否则写cookiesname
		.Order		= 0			'排序(0顺序1降序),注意要和下面sql里面主键ID的排序对应
		.PageSize	= 20		'每页记录条数
		.JsUrl		= "../PL_INC/"			'showo_page.js的路径
		.Sql		= "*$TextWord$"&WhereStr&"$AddTime$ID" '字段,表,条件(不需要where),排序(不需要需要ORDER BY),主键ID
	End With

	iRecCount = Ors.RecCount()'记录总数
	iRs = Ors.ResultSet()		'返回ResultSet
	If  iRecCount<1 Then

%>
	<tr>
	  <td colspan=3 align=center>没有找到任何记录!</td>
   	</tr>
<%
	Else
		For i=0 To Ubound(iRs,2)
%>
        <tr>
          <td class="forumrow" height=22 align=center><%=iRs(2,i)%></td>
          <td class="forumrow" height=22 align=center><font color=blue><%=iRs(3,i)%></font></td>
          <td class="forumrow" height=22 align=center><%=iRs(4,i)%></td>
          <td class="forumrow" height=22 align=center><%=iRs(7,i)%></td>
          <td class="forumrow" height=22 align=center><%=iRs(8,i)%></td>
          <td class="forumrow" height=22 align=center><%=iRs(10,i)%></td>
          <td class="forumrow" height=22 align=center><a href="Admin_Word_Edit.Asp?id=<%=iRs(0,i)%>">进入编辑</a></td> 
   	</tr>


<%
		Next	
	End If
%>
	</table>
	<table class="tableBorder" width="100%" border="0" cellspacing="2" cellpadding="2" align="center">
  		<tr> 
    			<td><%Ors.ShowPage()%></td>
  		</tr>  
	</table> 

<%
	iRs=NULL
	ors=NULL
	Set ors=Nothing
	Conn.Close
	Set Conn = Nothing
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
%>
</table>
</body></html>
