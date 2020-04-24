<!--#include file="Const.Asp"-->
<!--#include file="Top.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
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
Askclassid=request.QueryString("Askclassid")
Asksclassid=request.QueryString("Asksclassid")
AskNclassid=request.QueryString("AskNclassid")
Specialid=request.QueryString("Specialid")
Page=request.QueryString("Page")
act=request("act")
set rs=server.createobject("adodb.recordset")

founerr=false
if act<>"" then
	if trim(Request.Form ("name"))="" then
		founderr=true
		errmsg="<li>专辑名称不能为空</li>"
	else
		Name=trim(Request.Form ("Name"))
	end if
	if trim(request.form("classid"))="" then
		founderr=true
		errmsg=errmsg+"<li>请选择一级分类</li>"
	else
		Classid=Request.Form("Classid")
	end if
	if trim(request.form("sclassid"))="" then
		founderr=true
		errmsg=errmsg+"<li>请选择二级分类</li>"
	else
		SClassid=trim(Request.Form ("SClassid"))
	end if
	if trim(request.form("Nclassid"))="" then
		founderr=true
		errmsg=errmsg+"<li>请选择三级分类</li>"
	else
		NClassid=trim(Request.Form ("NClassid"))
	end if

	sql="select Sclass from Sclass where Sclassid="&SClassid
	rs.open sql,conn,1,1
	if not rs.EOF then
		Sclass=rs("Sclass")
	else
		founderr=true
		errmsg=errmsg+"<li>二级栏目选择错误</li>"
	end if
	rs.close

	sql="select Nclass from Nclass where Nclassid="&NClassid
	rs.open sql,conn,1,1
	if not rs.EOF then
		Nclass=rs("Nclass")
	else
		founderr=true
		errmsg=errmsg+"<li>三级栏目选择错误</li>"
	end if
	rs.close
end if

if founderr=true then
	call error()
else
	if act<>"" then
		Name=request("name")
		if trim(Request.Form("Yuyan"))="" then	
			Yuyan="未知"
		else
			Yuyan=request.form("Yuyan")	
		end if

		if trim(Request.Form("Gongsi"))="" then
			Gongsi="未知"
		else
			Gongsi=request.form("Gongsi")
		end if

		if trim(Request.Form("Times"))="" then
			Times="2002年"
		else
			Times=request.form("Times")
		end if

		if trim(Request.Form("pic"))="" then
			pic="../images/Nophoto.gif"
		else
			pic=request.form("pic")		
		end if

		if trim(Request.Form("intro"))="" then
			intro="暂无"
		else
			intro=htmlencode2(request.form("intro"))
		end if
	end if

	if act="edit" and Specialid<>"" then
'修改商品资料
		sql="select * from Special where Specialid="&Specialid 
		rs.open sql,conn,1,3
		rs("name")=trim(name)
		rs("Yuyan")=trim(Yuyan)
		rs("Gongsi")=trim(Gongsi)
		rs("Times")=trim(Times)
		rs("pic")=trim(pic)
		rs("Classid")=Classid
		rs("SClassid")=SClassid
		rs("SClass")=SClass
		rs("Nclassid")=Nclassid
		rs("Nclass")=Nclass
		rs("intro")=htmlencode2(trim(intro))
		rs("Date")=trim(request.Form("date"))
		rs.update
		rs.close
'结束修改

	elseif act="add" then
		sql="select * from Special where (Specialid is null)" 
		rs.open sql,conn,1,3
		rs.addnew
		rs("name")=trim(name)
		rs("Yuyan")=trim(Yuyan)
		rs("Gongsi")=trim(Gongsi)
		rs("Times")=trim(Times)
		rs("pic")=trim(pic)
		rs("classid")=classid
		rs("SClass")=SClass
		rs("Sclassid")=Sclassid
		rs("Nclassid")=Nclassid
		rs("Nclass")=Nclass
		rs("intro")=htmlencode2(trim(intro))
		rs.update
		rs.close

		conn.close
		set conn=nothing
		response.write"<SCRIPT language=JavaScript>alert('操作成功！');"
		response.write"javascript:history.go(-2);</SCRIPT>"
		Response.End 
	end if
	set rs=nothing
end if
conn.close
set conn=nothing
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="RSHOP" content="品络科技---a306.com">
<meta Author="Recall Star" content="品络科技---V800.Cn">
<title>品络科技---V800.Cn</title>
<!--#include file="style.asp"-->
</head>
<body topmargin="111" leftmargin="0">
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=100% align=center border=0>
  <TBODY>
    <TR>
      <TD height=50></TD>
    </TR>
  </TBODY>
</TABLE>
  <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
    <tr class="title">
      <td width="100%" Class="title">
          <table class="tableBorder" border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td width="100%" class="forumrow" height="80" align="center">
                <b><img src="Images/OK.gif" width="150" height="47"></b></a>
              </td>
            </tr>
          </table>
      </td>
    </tr>
  </table>
</body>                    
</html>
