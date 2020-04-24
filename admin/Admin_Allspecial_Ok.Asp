<!--#include file="Const.Asp"-->
<%CheckAdmin2%>
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
set rs=server.createobject("adodb.recordset")
sql="select * from MusicList"
rs.open sql,conn,1,3
Num=100
for i=1 to Num
	Classic=request.form("Classic"&i)
	ConClassic=split(Classic,",")
	MusicName=trim(request.form("MusicName"&i))
	Wma=trim(request.form("Wma"&i))
	url=request.form("url")
	song_path=request.form("song_path")

	if MusicName="" or isnull(MusicName) or Wma="" or isnull(Wma) then
		Num=i-1
		exit for
	end if
	
	set NRs=server.createobject("adodb.recordset")
	Nsql="select NClass from NClass where NClassid="&ConClassic(2)
	NRs.open Nsql,conn,1,1
	if not NRs.eof then
		NClass=NRs("NClass")
	end if
	NRs.close
	
	rs.addnew
	rs("MusicName")=MusicName
	rs("Singer")=NClass
	rs("Classid")=ConClassic(0)
	rs("SClassid")=ConClassic(1)
	rs("NClassid")=ConClassic(2)
	rs("Specialid")=ConClassic(3)
	rs("Wma")=url&Wma
	rs("song_path")=song_path
	rs.update
next
rs.close
call Success

sub Success
%>
<BR><BR>
<table class="tableBorder" border="0" width="100%" cellspacing="1" cellpadding="1">
  <tr>
    <td>　
      <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
        <tr class="title">
         <td width="100%" height="20" colspan=2 align=center><font color="white"><b>歌曲批量添加成功，共添加了<%=Num%>首歌曲</b> </td>
        </tr>
        <tr>
          <td align=center><input type="button" name="button1" value="返回" onClick="javascript:history.go(-2)">&nbsp;&nbsp;<input type="button" name="button2" value="继续添加" onClick="javascript:history.go(-1)"></td>
        </tr>
      </table>
 　 </td>
  </tr>
</table>
<%
end sub
set rs=nothing
conn.close
set conn=nothing
%>
