<!--#include file="const.asp"-->
<!--#include file="../PL_INC/Cls_ShowoPage.asp"-->
<!--#include file="../PL_INC/Function.asp"-->
<%CheckAdmin1%>
<%PageName="songwordsadmin"%>
<!--#include file="Top.Asp"-->
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
Dim Act,ID,listtype

Act 	 = Request("Act")
ID 	 = CheckRequest("ID")
listtype = CheckRequest("listtype")

Select Case Act
	Case "Delete"
	Call SetArticle("Delete",ID,1)
	Case "SetCheckedYes"
	Call SetArticle("SetCheckedYes",ID,1)
	Case "SetCheckedNo"
	Call SetArticle("SetCheckedNo",ID,1)
	Case Else
	Call Main()
End Select

Conn.Close
Set Conn = Nothing


'歌词置顶操作
Sub SetArticle(MyAct,MyID,MsgShow)
	If IsSelfRefer = False Then
		Msg_TempStr = Msg_TempStr & "<li>禁止从本站外部提交数据!</li><br>"
		Call Message("错误提示信息!",Msg_TempStr,0,"")
		Exit Sub
	End If
	Dim strAct ,strWhere
	'如果只有一个ID
	If InStr(MyID,",") > 0 Then
		strAct = "批量"
	End If
	Set Rs = Server.Createobject("adodb.recordset")
	Sql = "Select * From TempWord Where ID In ("&MyID&")"
	Rs.Open Sql,Conn,1,3
	If Rs.Bof Or Rs.Eof Then
		Msg_TempStr = Msg_TempStr & "<li>没有找到相关歌词!</li><br>"
		Call Message("错误提示信息!",Msg_TempStr,0,"")
	Else
		Select Case MyAct
			Case "Delete"
			strAct = strAct & "歌词删除成功!"
			Do While Not Rs.Eof
				Rs.Delete
				Rs.MoveNext
			Loop
			Msg_TempStr = Msg_TempStr & strAct & "<br>" & VbCrLf
			Case "SetCheckedYes"
			strAct = strAct & "歌词审核成功!"
			Do While Not Rs.Eof
				Rs("Checked") = True
				Rs.Update
				AddExp Rs("AddUser")
				Rs.MoveNext
			Loop
			Msg_TempStr = Msg_TempStr & strAct & "<br>" & VbCrLf
			Case "SetCheckedNo"
			strAct = strAct & "取消审核成功!"
			Do While Not Rs.Eof
				Rs("Checked") = False
				Rs.Update
				Rs.MoveNext
			Loop
			Msg_TempStr = Msg_TempStr & strAct & "<br>" & VbCrLf
		End Select

		If MsgShow = 1 Then
			Call Message(strAct,Msg_TempStr,3000,CacheUrl("TempWordUrl",1))
		Else
			Response.Redirect CacheUrl("TempWordUrl",1)
		End If
	End If
	Rs.Close
	Set Rs = Nothing
End Sub

Sub AddExp(UserName)
	Conn.Execute("Update [User] Set ExpWord=ExpWord+5 Where UserName='"&UserName&"'") '通过审核过给拥护加5分
End Sub

Sub Main()
Call CacheUrl("TempWordUrl",0)
%>
<LINK href="admin.css" type=text/css rel=stylesheet>

<table class="tableBorder" width="100%" height="30" border="0" cellpadding="0" cellspacing="0"   align="center" style="margin-top:10px;">
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="20%"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?">显示所有歌词</a></td>
    <td width="20%" align="center"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?listtype=1">显示审核过的歌词</a></td>
    <td width="20%"align="center"><img src="../Images/Dont06.gif" width="8" height="8"> <a href="?listtype=2">显示未审核歌词</a></td>
	<td width="20%"</td>
  </tr>
</table>
<script language='javascript'>
function unselectall()
{
	try {
    		if(document.myform.chkAll.checked)
		{
 			document.myform.chkAll.checked = document.myform.chkAll.checked&0;
    		}
	}
	catch(e){
		//alert(e.description);
		alert("没有任何操作对像!");
		return false;
	}
}

function SelectAll() 
{
	try {
		for (var i=0;i<document.myform.ID.length;i++) 
		{
			var e=document.myform.ID[i];
			e.checked=!e.checked;
		}
	}
	catch(e){
		//alert(e.description);
		alert("没有任何操作对像!");
		return false;
	}
}

//取选中数量
function CheckedNum()
{
	var sNum = 0;
	if(isNaN(document.myform.ID.length)&&document.myform.ID.checked)
	{
		sNum++;
	}else{
		for (var i=0;i<document.myform.ID.length;i++) 
		{
			if (document.myform.ID[i].checked)
			{
				sNum++;
			}
		}
	}
	return sNum;
}


//检测表单
function CheckForm()
{
	var Act = document.myform.Act.value;
	try {
		var ChkNum = CheckedNum();
	}
	catch(e){
		//alert(e.description);
		alert("没有任何操作对像!");
		return false;
	}
	switch(Act)
	{
		case "Delete":
		if (ChkNum<=0)
		{
			alert("至少选定一个歌词!");
			return false;
		}
		else
		{
			if (confirm("你确定删除歌词吗？"))
			{
				return true;
			}else
			{
				return false;
			}
		}
		break;
		//审核歌词
		case "SetCheckedYes":
		if (ChkNum<=0)
		{
			alert("至少选定一个歌词!");
			return false;
		}
		else
		{
			return true;
		}
		break;
		case "SetCheckedNo":
		if (ChkNum<=0)
		{
			alert("至少选定一个歌词!");
			return false;
		}
		else
		{
			return true;
		}
		break;
		default:
		alert("请选择操作选项!");
		return false;
	}
}
</script>
<form name='myform' onsubmit='return CheckForm()' method="POST" action='Admin_TempWord.Asp?listtype=<%=listtype%>'>
<input type='hidden' name='Act' id='Act'>

<table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
	<tr class="title">
	  <td width="5%" height="22" align="center"><strong>选择</strong></td>
          <td width="5%" height="22" align="center"><strong>类型</strong></td>
          <td width="20%" height="22" align="center"><strong>所属歌手</strong></td>
          <td width="20%" height="22" align="center"><strong>歌曲名字</strong></td>
          <td width="20%" height="22" align="center"><strong>歌曲专辑</strong></td>
          <td width="10%" height="22" align="center"><strong>添加人</strong></td>
          <td width="5%" height="22" align="center"><strong>点击</strong></td>
          <td width="5%" height="22" align="center"><strong>得票</strong></td>
          <td width="10%" height="22" align="center"><strong>歌词编辑</strong></td>
	</tr>
<%
	Dim WhereStr

	If listtype<>""then
		If listtype=1 then
			WhereStr = "Checked=1" 
		Elseif listtype=2 then
			WhereStr = "Checked=0" 
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
		.Sql		= "*$TempWord$"&WhereStr&"$AddTime$ID" '字段,表,条件(不需要where),排序(不需要需要ORDER BY),主键ID
	End With

	iRecCount = Ors.RecCount()'记录总数
	iRs = Ors.ResultSet()		'返回ResultSet
	If  iRecCount<1 Then

%>
	<tr>
	  <td colspan=9 align=center>没有找到任何记录!</td>
   	</tr>
<%
	Else
		For i=0 To Ubound(iRs,2)
			If iRs(1,i) = "TextWord" Then
				sType = "文本"
			Else
				sType = "LRC"
			End If
%>
        <tr>
	  <td class="forumrow" height=22 align=center><input type="checkbox" name="ID" value="<%=iRs(0,i)%>"></td>
          <td class="forumrow" height=22 align=center><%=sType%></td>
          <td class="forumrow" height=22 align=center><%=iRs(3,i)%></td>
          <td class="forumrow" height=22 align=center><font color=blue><%=iRs(4,i)%></font></td>
          <td class="forumrow" height=22 align=center><%=iRs(5,i)%></td>
          <td class="forumrow" height=22 align=center><%=iRs(7,i)%></td>
          <td class="forumrow" height=22 align=center><%=iRs(10,i)%></td>
          <td class="forumrow" height=22 align=center><%=iRs(11,i)%></td>
          <td class="forumrow" height=22 align=center><a href="<%If iRs(1,i) = "TextWord" Then:Response.Write "Admin_Word_Edit.Asp":Else:Response.Write "Admin_LrcWord_Edit.Asp":End If%>?id=<%=iRs(2,i)%>">歌词编辑</a></td> 
   	</tr>


<%
		Next	
	End If
%>
	</table>
	<table class="tableBorder" width="100%" border="0" cellspacing="2" cellpadding="2" align="center">
		<tr>
			<col align='center' width='60'></col>
			<col align='Right'></col>
		</tr>
  		<tr> 
    			<td>
				<input name='chkAll' id='chkAll' type='checkbox' onclick='SelectAll()' value='checkbox'>&nbsp;全选
			</td>
			<td>
		
				<input type='submit' class='button' onClick="document.myform.Act.value='Delete'" value='删到选定歌词'>
				<input type='submit' class='button' onClick="document.myform.Act.value='SetCheckedYes'" value='批量审核'>
				<input type='submit' class='button' onClick="document.myform.Act.value='SetCheckedNo'" value='取消审核'>
			
			</td>
  		</tr> 
	</table> 
	</form>
	<table class="tableBorder" width="100%" border="0" cellspacing="2" cellpadding="2" align="center">
  		<tr> 
    			<td><%Ors.ShowPage()%></td>
  		</tr>  
	</table> 

<%
	iRs=NULL
	ors=NULL
	Set ors=Nothing
%>
</table>
<%
End Sub
%>
</body></html>
