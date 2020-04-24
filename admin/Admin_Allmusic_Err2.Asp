<!--#include file="const.asp"-->
<%CheckAdmin2%>
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
page=trim(request.querystring("page"))
AskClassid=trim(request.querystring("AskClassid"))
AskSClassid=trim(request.querystring("AskSClassid"))
AskNClassid=trim(request.querystring("AskNClassid"))
Wma=trim(request.form("Wma"))
MusicName=trim(request.form("MusicName"))
classid=trim(request.form("classid"))
Sclassid=trim(request.form("Sclassid"))
Nclassid=trim(request.form("Nclassid"))
Specialid=trim(request.form("Specialid"))
set rs=server.createobject("adodb.recordset")
founerr=false
if act<>"SetIsGood" then
act=request("act")
end if

if act="SetIsGood" then
		sql="select IsGood from MusicList where id="&request("id") 
		rs.open sql,conn,1,3
		if not rs.EOF then
			if rs("IsGood")=true then
				rs("IsGood")=0
			else
				rs("IsGood")=1
			end if
			rs.update
		end if
		rs.close
	else
		conn.close
		set conn=nothing
		errmsg=errmsg+"<li>操作错误！请联系管理员</li>"
		call error()
		Response.End
	end if
	set rs=nothing
	conn.close
	set conn=nothing
	
%>
<!--#include file="style.asp"-->
<body topmargin="111" leftmargin="0">
  <table class="tableBorder" border="0" cellspacing="0" width="95%" align="center">
    <tr>
      <td width="100%" bgcolor="#3366CC">
        <div align="center">
          <table class="tableBorder" border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td width="100%" bgcolor="#FFFFFF" height="80" align="center">
                <b>操 作 完 成</b>
                <p><b><a href="javascript:history.go(-1)">返 回</a></b>
              </td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
  </table>
</body>               
<html></html>
