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
MusicName   = Request("MusicName")
SinGer      = Request("SinGer")
Flag        = Request("Flag")
AddUser     = Request("AddUser")

Set Rs = Server.Createobject("adodb.recordset")
	sql="Select * From LrcWord Where ID=" & id
	Rs.open sql,conn,1,3
        If Rs.BOF Or Rs.EOF Then
        Rs.AddNew
    End If

		Rs("Words")       = Words
		If Flag = 1 And Words<>"" Then
			Rs("Flag") = True
		Else
			Rs("Flag") = False
		End If
		Rs("AddUser")     = AddUser
		Rs("MusicID")     = ID
		Rs("AddTime")     = Now()
                Rs("SinGer")	  = SinGer 		 
		Rs("MusicName")   = MusicName
		Rs("Words")	  = Words
		Rs("AddUser") 	  = AddUser
		Rs("AddTime")	  = AddTime
		Rs.update
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
	Rs.close
Set Rs = Nothing
Conn.Close
Set Conn = Nothing
%>
