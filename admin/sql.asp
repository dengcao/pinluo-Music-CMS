<!--#include file="Function.Asp"-->
<!--#include file="Top.asp"-->
<%CheckAdmin3%>
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
Server.ScriptTimeout	=500						

URL						= Request.ServerVariables("URL")
Action					= Request("Action")
db						="../user/#musicsqlin.asp"		'记录数据库路径修改为你的数据库路径

dim conn,connstr 
'On Error Resume Next
Set conn = Server.CreateObject("ADODB.Connection")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)
conn.Open connstr
If Err Then
	err.Clear
	Set conn = Nothing
	Response.Write "数据库连接出错，请检查连接字串。"
	Response.End
End If

	If Action="del" Then
		Call Delip()
	ElseIf Action="lock" Then
		Call lockIP()
	ElseIf Action="unlock" Then
		Call UnLockip()
	ElseIf Action="Logout" Then
		Call Logout()
	Else
		Call Main()
	End If



	%>





	<%


Sub Delip()
dim id 
id = clng(request("id"))
conn.execute("delete from PinLuo_sql where id="&id)
Call Main()
End sub

Sub Lockip()
id = clng(request("id"))
conn.execute("update PinLuo_sql set Kill_ip=true where id="&id)
Call Main()
End sub

Sub UnLockip()
id = clng(request("id"))
conn.execute("update PinLuo_sql set Kill_ip=False where id="&id)
Call Main()
End sub

Sub Logout()
	Session("AdminPassWord")="NUll"
	Response.Redirect URL
End Sub

Sub Main()
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>日志管理</title>
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<link rel="stylesheet" type="text/css" href="Images/sql.css">

<style type="text/css">
<!--
.样式6 {color: #FFFFFF; font-weight: bold; }
.样式7 {
	font-size: 9pt;
	font-weight: bold;
}
body,td,th {
	font-size: 12px;
}
-->
</style>
</head>


<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<tr><td width="100%" align="center">   

        <table class="tableBorder" border="0" cellspacing="1" width="100%" bordercolorlight="#000000" bordercolordark="#FFFFFF" cellpadding="2" >
          <tr class="topbg"> 
            <%
sql="select * from PinLuo_sql order by id desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	response.write "暂无内容"
else
'分页的实现 
listnum=10
Rs.pagesize=listnum
page=Request("page")
if (page-Rs.pagecount) > 0 then
page=rs.pagecount
elseif page = "" or page < 1 then
page = 1
end if
rs.absolutepage=page
'编号的实现
j=rs.recordcount
j=j-(page-1)*listnum
i=0
nn=request("page")
if nn="" then
n=0
else
nn=nn-1
n=listnum*nn
end if%>
            <td width="32" height="22" align="center" background="images/manage/admin_bg_1.gif"><STRONG><span class="样式6">编号</span></STRONG></td>
      
            <td width="76" height="22" align="center" background="images/manage/admin_bg_1.gif"><span class="样式6">攻击者IP</span></td>
            <td width="61" height="22" align="center" background="images/manage/admin_bg_1.gif"><span class="样式6">是否锁定</span></td>
            <td width="129" height="22" align="center" background="images/manage/admin_bg_1.gif"><span class="样式6">提交页面</span></td>
            <td width="176" height="22" align="center" background="images/manage/admin_bg_1.gif"><span class="样式6">提交时间</span></td>
            <td width="63" height="22" align="center" background="images/manage/admin_bg_1.gif"><span class="样式6">提交方式</span></td>
            <td width="63" height="22" align="center" background="images/manage/admin_bg_1.gif"><strong><span class="样式6">提交参数</span></strong></td> 
            <td width="73" height="22" align="center" background="images/manage/admin_bg_1.gif" widht=46><span class="样式6">提交数据</span></td>
            <td width="82" height="22" align="center" background="images/manage/admin_bg_1.gif" widht=46><div align="center" class="样式6">操作 </div></td>
          </tr> 
    <%do while not rs.eof and i<listnum
n=n+1%>
         
          <tr>
            <td height="11" class="tdbg"><div align="center"><%=n%></div></td>
            <td class="tdbg"><div align="center"><a href="http://www.ikaka.com/ip/index.asp?ip=<%=rs("SqlIn_IP")%>" target="_blank"><%=rs("SqlIn_IP")%></a></div></td>
            <td class="tdbg"><div align="center"><%	if rs("Kill_ip")=true then 
			response.write "<font color='red'>已锁定</font>"
		else
			response.write "<font color='green'>已解锁</font>"
		end if
	%></div></td>
            <td class="tdbg"><div align="center"><%=rs("SqlIn_WEB")%></div></td>
            <td class="tdbg"><div align="center"><%=rs("SqlIn_TIME")%></div></td>
            <td class="tdbg"><div align="center"><%=rs("SqlIn_FS")%></div></td>
            <td class="tdbg"><div align="center"><%=rs("SqlIn_CS")%></div></td>
            <td class="tdbg"><div align="center"><%=rs("SqlIn_SJ")%></div></td>
            <td class="tdbg"><div align="center"><a href=<%=URL%>?action=del&id=<%=rs("id")%>>删除</a>&nbsp;
 <%	if rs("Kill_ip")=true then 
			response.write "<a href="&URL&"?action=unlock&id="&rs("id")&">解锁IP</a>"
		else
			response.write "<a href="&URL&"?action=lock&id="&rs("id")&">锁定IP</a>"
		end if
	%></div></td>
          </tr>
		  <%rs.movenext 
i=i+1 
j=j-1
loop%>
          <tr>
		  <%filename=URL%>
            <td height="20" colspan="9" class="tdbg"><div align="center"></div>              <div align="center"><%=Rs.recordcount%> 条记录&nbsp;&nbsp;<%=listnum%> 条记录/页&nbsp;&nbsp;共 <%=rs.pagecount%> 页 
      <% if page=1 then %>
      <%else%>
      <a href=<%=filename%>?page=<%=page-1%>><b>[<%=page-1%>]</b></a>
      <%end if%><% if rs.pagecount=1 then%><%else%><b>[<%=page%>]</b><%end if%>
	  <% if rs.pagecount-page <> 0 then %>
      <a href=<%=filename%>?page=<%=page+1%>><b>[<%=page+1%>]</b></a>
      <%end if%></div>              <div align="center"></div>              <div align="center"></div>              <div align="center"></div>              <div align="center"></div>              <div align="center"></div>              <div align="center"></div>              <div align="center"></div>              
            <div align="right"></div></td>
          <%end if%></tr>
      </table> 
     </td> 
</tr> 
</table> 
</body> 

</html>
<%
end sub
%>	
