<!--#include file="Const.Asp"-->
<!--#include file="../PL_INC/Cls_ShowoPage.asp"-->
<%CheckAdmin1%>
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
	Dim MusicID,SinGer,MusicName,SpecialName,Words,Flag,AddUser
	Set Rs = Server.Createobject("adodb.recordset")
	Sql="Select * from TextWord Where id="&request("id") 
	Rs.Open Sql,Conn,1,1
	If Not Rs.EOF Then
		MusicID 	= Rs("MusicID")
		SinGer 		= Rs("SinGer")
		MusicName	= Rs("MusicName")
		SpecialName	= Rs("SpecialName")
		Words		= Rs("Words")
		Flag		= Rs("Flag")
		AddUser		= Rs("AddUser")
	Else
		errmsg=errmsg+"<li>此功能暂时不开放</li>"
		call error()
		Response.End	
	End if
	Rs.Close
	Set Rs = Nothing
%>
<body topmargin="111" leftmargin="0">
<div align=center>
<form name="WordsForm" action="Admin_Word_Err.Asp?id=<%=Request("id")%>"  method="POST">
 <input type="hidden" name="TempID" value="0">
 <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
	<tr class="title">
          <td height=20 align=center Class="title" colspan=2><strong>文本歌词编辑</strong></td>
          </tr>
	<tr>
	  <td width="10%" height=22 class="forumrow" align=center><strong>所属歌手</strong></td>
	  <td height=22 class="forumrow"><b><%=SinGer%></b></td>
	</tr>
	<tr>
	  <td width="10%" height=22 class="forumrow" align=center><strong>歌曲名字</strong></td>
	  <td height=22 class="forumrow"><b><%=MusicName%></b></td>
	</tr>
	<tr>
	  <td width="10%" height=22 class="forumrow" align=center><strong>所属专辑</strong></td>
	  <td height=22 class="forumrow"><b><%=SpecialName%></b></td>
	</tr>
	<tr>
	  <td width="10%" height=22 class="forumrow" align=center><strong>歌词内容</strong></td>
	  <td height=22 class="forumrow">
		<TEXTAREA name="Words" rows=10 cols=60"><%=htmlencode1(Words)%></TEXTAREA>
	  </td>
	</tr>
	<tr>
	  <td width="10%" height=22 class="forumrow" align=center><strong>歌词锁定</strong></td>
	  <td height=22 class="forumrow"><input type="checkbox" name="Flag" value="1" <%If Flag=True Then:Response.Write "Checked":End If%>></td>
	</tr>
	<tr>
	  <td width="10%" height=22 class="forumrow" align=center><strong>歌词添加人</strong></td>
	  <td height=22 class="forumrow"><input type="text" name="AddUser" value="<%=AddUser%>"></td>
	</tr>
	<tr>
          <td height=20 align=center class="forumrow" colspan=2>
		<input type=submit name=submit value="修 改"> <input type=reset name=reset value="清 除">
	  </td>
          </tr>
	<tr>

  </table>
</form>

<script language="javascript">
	function DisWords(TempID,Words,AddUser)
	{
		WordsForm.TempID.value  = TempID;
		WordsForm.Words.value 	= Words;
		WordsForm.AddUser.value = AddUser;
	}
</script>

<table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
	<tr class="title">
          <td width="20%" height="22" align="center"><strong>所属歌手</strong></td>
          <td width="25%" height="22" align="center"><strong>歌曲名字</strong></td>
          <td width="25%" height="22" align="center"><strong>歌曲专辑</strong></td>
          <td width="10%" height="22" align="center"><strong>添加人</strong></td>
          <td width="5%" height="22" align="center"><strong>点击</strong></td>
          <td width="5%" height="22" align="center"><strong>得票</strong></td>
          <td width="10%" height="22" align="center">选择</td>
	</tr>
<%
	Dim WhereStr
	WhereStr = "WordType='TextWord' And MusicID=" & MusicID
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
		.CookieName	= "a306_TempWords"	'如果RecTerm＝2,cookiesname="",否则写cookiesname
		.Order		= 0			'排序(0顺序1降序),注意要和下面sql里面主键ID的排序对应
		.PageSize	= 20		'每页记录条数
		.JsUrl		= "../PL_INC/"			'showo_page.js的路径
		.Sql		= "*$TempWord$"&WhereStr&"$Poll$ID" '字段,表,条件(不需要where),排序(不需要需要ORDER BY),主键ID
	End With

	iRecCount = Ors.RecCount()'记录总数
	iRs = Ors.ResultSet()		'返回ResultSet
	If  iRecCount<1 Then

%>
	<tr>
	  <td colspan=7 align=center>没有找到任何记录!</td>
   	</tr>
<%
	Else
		For i=0 To Ubound(iRs,2)
			tWords   = iRs(6,i)
			tWords   = Replace(tWords,Chr(34),"")
			tWords   = Replace(tWords,vbCrLf,"<br>\n")
			tWords   = Replace(tWords,"(","")
			tWords   = Replace(tWords,")","")
			tWords   = Replace(tWords,"'","\'")

			tAddUser = iRs(7,i)
			tAddUser = Replace(tAddUser,Chr(34),"")
			tAddUser = Replace(tAddUser,vbCrLf,"<br>\n")
			tAddUser = Replace(tAddUser,"'","\'")

%>
        <tr title="<%=Replace(iRs(6,i),Chr(34),"")%>">
          <td class="forumrow" height=22 align=center><%=iRs(3,i)%></td>
          <td class="forumrow" height=22 align=center><font color=blue><%=iRs(4,i)%></font></td>
          <td class="forumrow" height=22 align=center><%=iRs(5,i)%></td>
          <td class="forumrow" height=22 align=center><%=iRs(7,i)%></td>
          <td class="forumrow" height=22 align=center><%=iRs(10,i)%></td>
          <td class="forumrow" height=22 align=center><%=iRs(11,i)%></td>
          <td class="forumrow" height=22 align=center><input type="radio" name="distext" value="<%=iRs(0,i)%>" onClick="DisWords('<%=iRs(0,i)%>','<%=tWords%>','<%=tAddUser%>')"></td> 
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
%>
</table>
