<!--#include file="const.asp"-->
<%CheckAdmin3%>
<%PageName="SongSave"%>
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
page=trim(request.querystring("page"))
AskClassid=trim(request.querystring("AskClassid"))
AskSClassid=trim(request.querystring("AskSClassid"))
AskNClassid=trim(request.querystring("AskNClassid"))
song_path=Cint(request.form("song_path"))
Wma=trim(request.form("Wma"))
MusicName=trim(request.form("MusicName"))
classid=trim(request.form("classid"))
Sclassid=trim(request.form("Sclassid"))
Nclassid=trim(request.form("Nclassid"))
Specialid=trim(request.form("Specialid"))
MusicWord=trim(request.form("MusicWord"))
LastTime=trim(request.form("LastTime"))

founerr=false
act=request("act")
	if MusicName="" then
		errmsg=errmsg+"歌曲名称不能为空"
		founderr=true
	end if
		if trim(Request.Form("Wma"))="" then
			Wma=""
		else
			Wma=request.form("Wma")
		end if

if founderr=true then
	call error()
else
	set rs=server.createobject("adodb.recordset")
	if act<>"" then
		sql="select NClass from NClass where NClassid="&Nclassid
		rs.open sql,conn,1,1
		singer=rs("Nclass")
		rs.close
	end if
	if act="edit" and request("id")<>"" then
		sql="select * from MusicList where id="&request("id")
		rs.open sql,conn,1,3
		rs("song_path")=song_path
		rs("Wma")=trim(Wma)
		rs("MusicName")=MusicName
		rs("classid")=classid
		rs("Sclassid")=Sclassid
		rs("Nclassid")=Nclassid
		rs("Specialid")=Specialid
		rs("singer")=trim(singer)
		rs("Lasttime")=LastTime
		rs.update
		rs.close

		sql="select * from Box where Musicid="&request("id")
		rs.open sql,conn,1,3
		if not rs.eof then
			rs("MusicName")=MusicName
			rs.update
		end if
		rs.close

		call Success
		Response.End 
	elseif act="add" then
		'--------------------------------------
		sql="select * from MusicList where (id is null)" 
		rs.open sql,conn,1,3
		rs.addnew
		rs("Wma")=Wma
		rs("song_path")=song_path
		rs("MusicName")=MusicName
		rs("classid")=classid
		rs("Sclassid")=Sclassid
		rs("Nclassid")=Nclassid
		if Specialid<>"" then rs("Specialid")=Specialid
		rs("singer")=singer
		rs.update
		'---------------------------------------------
		'得到歌曲编号
		Newid=rs("Id")
		'得到管理员名称
		AdminId=Session("AdminID")
		set rs_admin=conn.execute("select Username from admin where ID="&AdminId&"")
		if rs_admin.bof and rs_admin.eof then
		AddUser="a306_music"
		else
		AddUser=rs_admin("Username")
		end if
		rs_admin.close
		set rs_admin=nothing
		'得到专辑名称
		set rs_spe=conn.execute("select name from Special where Specialid="&Specialid&"")
		if rs_spe.bof and rs_spe.eof then
		SpecialName=""
		else
		SpecialName=rs_spe("name")
		end if
		rs_spe.close
		set rs_spe=nothing
		'--------Lrcword表写入新的默认歌词------------
			dim rs_l,sql_l
			set rs_l=server.CreateObject("adodb.recordset")
			sql_l="select * from LrcWord"
			rs_l.open sql_l,conn,1,3
			rs_l.addnew
			rs_l("MusicID")=Newid
			rs_l("SinGer")=singer
			rs_l("MusicName")=MusicName
			rs_l("SpecialName")=SpecialName
			rs_l("Words")="暂无LRC歌词"
			rs_l("AddUser")=AddUser
			rs_l("AddTime")=Now()
			rs_l("Flag")=0
			rs_l.update
			rs_l.close
			set rs_l=nothing
		'--------文本歌词表写入新的默认歌词------------
			set rs_l=server.CreateObject("adodb.recordset")
			sql_l="select * from TextWord"
			rs_l.open sql_l,conn,1,3
			rs_l.addnew
			rs_l("MusicID")=Newid
			rs_l("SinGer")=singer
			rs_l("MusicName")=MusicName
			rs_l("SpecialName")=SpecialName
			rs_l("Words")="暂无歌词"
			rs_l("AddUser")=AddUser
			rs_l("AddTime")=Now()
			rs_l("Flag")=0
			rs_l.update
			rs_l.close
			set rs_l=nothing
		'-----------------------over------------------
		rs.close
		call Success
		Response.End 
		errmsg=errmsg+"<li>操作错误！请联系管理员</li>"
		call error()
		Response.End
	end if
	set rs=nothing
	conn.close
	set conn=nothing
	Response.Redirect "Admin_Allmusic.Asp?Classid="+AskClassid+"&SClassid="+AskSClassid+"&NClassid="+AskNClassid+"&Page="+Page
end if
sub Success
%>
<table class="tableBorder" border="0" width="100%" cellspacing="1" cellpadding="1">
  <tr>
    <td>　
      <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
         <tr class="title">
        <td width="100%" height="20" colspan=2 align=center><b>歌曲<%if act="add" then%>添加<%else%>修改<%end if%>成功</b></td>
        </tr>
        <tr>
          <td class="forumrow">
           <table class="tableBorder" border="0" width="100%" cellspacing="0" cellpadding="0" class="TableLine">
             <tr>
              <td width="25%" align="right">歌曲：</td>
              <td width="75%"><%=MusicName%>　</td>
            </tr>
            <tr>
              <td align="right">歌手：</td>
              <td><%=Singer%>　</td>
            </tr>
            <tr>
              <td align="right">地址：</td>
              <td><%=song_path%><%=Wma%>　</td>
            </tr>
            <tr>
              <td colspan="2" height="15" align=center><input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" type="button" name="button2" value=" 继续<%if act="add" then%>添加<%else%>修改<%end if%> " onClick="javascript:history.go(-1)">&nbsp;&nbsp;&nbsp;&nbsp;<input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" type="button" name="button1" value=" 返回 " onClick="javascript:history.go(-2)"></td>
            </tr>
          </table>
          </td>
        </tr>
      </table>
 　 </td>
  </tr>
</table>
</body>
</html>
<%
end sub
%>
