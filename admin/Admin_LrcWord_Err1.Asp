<!--#include file="const.asp"-->
<!--#include file="Top.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
<%CheckAdmin1%>
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
founderr=false

Dim ID,MusicID,SinGer,MusicName,SpecialName,Words,AddUser

ID	    = Request("id")
Words       = Request("Words")
Flag        = Request("Flag")
AddUser     = Request("AddUser")

Set Rs = Server.Createobject("adodb.recordset")
If id = "" Then
	errmsg=errmsg+"<br><li>请先选择歌曲！</li>"
	founderr=true
Else
	sql="Select * From LrcWord Where MusicID=" & id
	Rs.open sql,conn,1,3
	If not rs.EOF Then
		Rs("Words")       = Words
		If Flag = 1 And Words<>"" Then
			Rs("Flag") = True
		Else
			Rs("Flag") = False
		End If
		Rs("AddUser")     = AddUser
		Rs("AddTime")     = Now()
		Rs.update

		MusicID 	= Rs("MusicID")
	      	SinGer 		= Rs("SinGer")
		MusicName 	= Rs("MusicName")
		SpecialName 	= Rs("SpecialName") 
		Words 		= Rs("Words")
		AddUser 	= Rs("AddUser")
		AddTime 	= Rs("AddTime")
%>
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
                <b><img src="Images/OK.gif" width="150" height="47"></b>
                <p><a href="Admin_LrcWord.Asp"><b>返 回</b> </a>
              </td>
            </tr>
          </table>
      </td>
    </tr>
  </table>
<%
	Else
		errmsg=errmsg+"<br><li>选择歌曲错误！</li>"
		call error()
	End if
	Rs.close
End If
Set Rs = Nothing
Conn.Close
Set Conn = Nothing
%>
