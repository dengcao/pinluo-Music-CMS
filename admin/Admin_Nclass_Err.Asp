<!--#include file="const.asp"-->
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
act=request("act")
ClassID=request.form("Classid")
founderr=false
if act="rename" then
	FunRename
elseif act="del" then
	FunDel
elseif act="edit" then
	FunEdit
elseif act="add" then
	FunAdd
else
	errmsg=errmsg+"操作错误！请联系管理员"
	founderr=true
end if

if founderr=true then
	call error()
else

end if

function FunRename
	if trim(request.form("NClass"))="" then
		errmsg=errmsg+"<br>"+"<li>歌手名称不能为空！"
		call error()
		Response.End 
	end if
'修改栏目中的栏目名
	set rs=server.createobject("adodb.recordset")
	sql = "SELECT * FROM Nclass where Nclassid=" & request.QueryString("NClassid")
	rs.Open sql,conn, 1, 3
	if err.Number<>0 then
		err.clear
		errmsg=errmsg+"操作错误！请联系管理员"
		founderr=true
	else
		rs("Nclass") = trim(request.form("Nclass"))
		rs("Abcd") = trim(request.form("Abcd"))
		rs("pic") = trim(request.form("pic"))
		rs("da") = trim(request.form("da"))
		rs("SClassID") = trim(request.form("SClassID"))
		rs.Update
	end if
	rs.Close
'修改歌曲中的栏目名
	sql= "SELECT * FROM MusicList where Nclassid=" & request.QueryString("NClassid")
	rs.Open sql, conn, 1, 3
	if err.Number<>0 then
		err.clear
		errmsg=errmsg+"操作错误！请联系管理员"
		founderr=true
	else
		do while not rs.eof
			rs("singer") = trim(request.form("NClass"))
			rs("SClassID") = trim(request.form("SClassID"))
			rs.Update
		rs.movenext
		loop
	end if
	rs.Close
'修改专辑中的栏目名
	sql = "SELECT * FROM special where Nclassid=" & request.QueryString("NClassid")
	rs.Open sql,conn, 1, 3
	if err.Number<>0 then
		err.clear
		errmsg=errmsg+"操作错误！请联系管理员"
		founderr=true
	else
		do while not rs.eof
			rs("Nclass") = trim(request.form("NClass"))
			rs("SClassID") = trim(request.form("SClassID"))
			rs.Update
		rs.movenext
		loop
	end if
	rs.Close
'修改收藏中的栏目名
	sql = "SELECT * FROM Box where Musicid=" & request.QueryString("NClassid")
	rs.Open sql,conn, 1, 3
	if err.Number<>0 then
		err.clear
		errmsg=errmsg+"操作错误！请联系管理员"
		founderr=true
	else
		do while not rs.eof
			rs("MusicName") = trim(request.form("NClass"))
			rs("SClassID") = trim(request.form("SClassID"))
			rs.Update
		rs.movenext
		loop
	end if
	rs.Close
'结束修改
	set rs=nothing
	conn.close
	set conn=nothing
end function

function FunDel
	Rem 删除子栏目
	sql="delete from Nclass where Nclassid=" & request.QueryString("NClassid")
	conn.execute sql
	Rem 删除相关专辑
	sql="delete from Special where Nclassid=" & request.QueryString("NClassid")
	conn.execute sql
	if err.Number<>0 then
		err.clear
		errmsg=errmsg+"操作错误！请联系管理员"
		founderr=true
	end if
end function
	
function FunAdd
	NClass=trim(request.form("NClass"))
	if NClass="" then
		errmsg=errmsg+"类别名称不能为空！"
		call error()
		Response.End 
	end if
	set rs=server.createobject("adodb.recordset")
	sql = "SELECT * FROM Nclass where (Nclassid IS NULL)"
	rs.Open sql,conn, 1, 3
	if err.Number<>0 then
		err.clear
		errmsg=errmsg+"操作错误！请联系管理员"
		founderr=true
	else
		rs.AddNew
		rs("Nclass") = NClass
		rs("Classid") = request.QueryString("Classid")
		rs("SClassid") = request.QueryString("SClassid")
        if trim(request("Abcd"))<>"" then rs("Abcd") = request.form("Abcd")
		rs.Update
	end if
	rs.Close
	set rs=nothing
	conn.close
	set conn=nothing
end function

function FunEdit
	if trim(request("NClass"))="" then
		errmsg=errmsg+"类分名称不能为空！"
		call error()
		Response.End 
	end if
	set rs=server.createobject("adodb.recordset")
	sql = "SELECT * FROM Nclass where NClassid="&request.QueryString("NClassid")
	rs.Open sql,conn, 1, 3
	if err.Number<>0 then
		err.clear
		errmsg=errmsg+"操作错误！请联系管理员"
		founderr=true
	else

'修改栏目中的资料
		rs("Nclass") = trim(request.form("NClass"))
		rs("Classid") = request.form("Classid")
		rs("SClassid") = request.form("SClassid")
		rs.Update
	end if
	rs.Close
	set rs=nothing
	conn.close
	set conn=nothing
end function
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="RSHOP" content="<%=webname%> - <%=weburl%>">
<meta Author="Recall Star" content="<%=webname%> - <%=weburl%>">
<title><%=webname%> - <%=weburl%></title>
</head>
<body topmargin="20" leftmargin="0">
<!--#include file="Top.asp"-->
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=100% align=center border=0>
  <TBODY>
    <TR>
      <TD height=50></TD>
    </TR>
  </TBODY>
</TABLE>
  <table class="tableBorder" border="0" cellspacing="0" align=center width="60%">
    <tr>
      <td width="100%" bgcolor="#3366CC">
        <div align="center">
          <table class="tableBorder" border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td width="100%" bgcolor="#FFFFFF" height="80"  align="center">
                <br>
                <img src="Images/OK.gif" width="150" height="47">
                <table class="tableBorder" border="1" cellpadding="4" cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" width="100%" class="forumrow" height="171">
                  <tr>
                    <td width="15%" align="center" height="16">
                    <span style="font-size: 9pt">
                    <a title="管理 华人男歌手 所属的歌手" href="Admin_Nclass_Edit.Asp?Classid=1&SClassid=1" style="color: #000000; text-decoration: NONE">
                    华人男歌手</a></span></td>
                    <td width="16%" align="center" height="16">
                    <a title="管理 华人女歌手 所属的歌手" href="Admin_Nclass_Edit.Asp?Classid=1&SClassid=2" style="color: #000000; text-decoration: NONE">
                    <span style="font-size: 9pt">华人女歌手</span></a></td>
                  </tr>
                  <tr>
                    <td width="15%" align="center" height="16">
                    <a title="管理 华人组合 所属的歌手" href="Admin_Nclass_Edit.Asp?Classid=1&SClassid=3" style="color: #000000; text-decoration: NONE">
                    <span style="font-size: 9pt">华人组合</span></a></td>
                    <td width="16%" align="center" height="16">
                    <a title="管理 影视合辑 所属的歌手" href="Admin_Nclass_Edit.Asp?Classid=1&SClassid=8" style="color: #000000; text-decoration: NONE">
                    <span style="font-size: 9pt">影视合辑</span></a></td>
                  </tr>
                  <tr>
                    <td width="15%" align="center" height="16">
                    <a title="管理 日韩男歌手 所属的歌手" href="Admin_Nclass_Edit.Asp?Classid=1&SClassid=4" style="color: #000000; text-decoration: NONE">
                    <span style="font-size: 9pt">日韩男歌手</span></a></td>
                    <td width="16%" align="center" height="16">
                    <a title="管理 日韩女歌手 所属的歌手" href="Admin_Nclass_Edit.Asp?Classid=1&SClassid=5" style="color: #000000; text-decoration: NONE">
                    <span style="font-size: 9pt">日韩女歌手</span></a></td>
                  </tr>
                  <tr>
                    <td width="15%" align="center" height="16">
                    <a title="管理 日韩组合 所属的歌手" href="Admin_Nclass_Edit.Asp?Classid=1&SClassid=6" style="color: #000000; text-decoration: NONE">
                    <span style="font-size: 9pt">日韩组合</span></a></td>
                    <td width="16%" align="center" height="16">
                    <a title="管理 欧美歌手 所属的歌手" href="Admin_Nclass_Edit.Asp?Classid=1&SClassid=7" style="color: #000000; text-decoration: NONE">
                    <span style="font-size: 9pt">欧美歌手</span></a></td>
                  </tr>
                  <tr>
                    <td width="15%" align="center" height="13">
                    <a title="管理 闽南台语 所属的歌手" href="Admin_Nclass_Edit.Asp?Classid=1&SClassid=9" style="color: #000000; text-decoration: NONE">
                    <span style="font-size: 9pt">闽南台语</span></a></td>
                    <td width="16%" align="center" height="13">
                    <a title="管理 合辑其它 所属的歌手" href="Admin_Nclass_Edit.Asp?Classid=1&SClassid=11" style="color: #000000; text-decoration: NONE">
                    <span style="font-size: 9pt">音乐欣赏</span></a></td>
                  </tr>
                  <tr>
                    <td width="15%" align="center" height="16">
                    <a title="管理 音乐欣赏 所属的歌手" href="Admin_Nclass_Edit.Asp?Classid=1&SClassid=10" style="color: #000000; text-decoration: NONE">
                    <span style="font-size: 9pt">儿童歌曲</span></a></td>
                    <td width="16%" align="center" height="16">
                    <a title="管理 DJ摇滚 所属的歌手" href="Admin_Nclass_Edit.Asp?Classid=1&SClassid=12" style="color: #000000; text-decoration: NONE">
                    <span style="font-size: 9pt">ＤＪ摇滚</span></a></td>
                  </tr>
                  <tr>
                    <td width="15%" align="center" height="16">
                    <a title="管理 保留频道 所属的歌手" href="#" style="color: #000000; text-decoration: NONE">
                    <span style="font-size: 9pt">保留频道</span></a></td>
                    <td width="16%" align="center" height="16">
					<a title="管理 保留频道 所属的歌手" href="#" style="color: #000000; text-decoration: NONE">
                    <span style="font-size: 9pt">保留频道</span></a></td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
  </table>
</body>                    
</html>           
<html></html>
