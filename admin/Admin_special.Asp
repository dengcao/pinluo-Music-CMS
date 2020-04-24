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
Specialid=request.QueryString("Specialid")
set rs=conn.execute("delete from Special where Specialid="&Specialid)
Rem '删除对应专辑的所有歌曲
sql="delete from MusicList where Specialid=" & Specialid
conn.execute sql
conn.close
set conn=nothing
classid=request.QueryString("classid")
Nclassid=request.QueryString("Nclassid")
page=request.QueryString("page")
 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="RSHOP" content="<%=webname%>---<%=weburl%>">
<meta Author="Recall Star" content="<%=webname%>---<%=weburl%>">
<title><%=webname%>---<%=weburl%></title>
<!--#include file="style.asp"-->
</head>
<body topmargin="111" leftmargin="0">
<div align="center">
  <center>
  <table class="tableBorder" border="0" cellspacing="0" width="95%">
    <tr>
      <td width="100%" bgcolor="#3366CC">
        <div align="center">
          <table class="tableBorder" border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td width="100%" height="80" align="center" background="images/manage/admin_bg.gif" bgcolor="#FFFFFF">
                <b><img src="images/OK.gif" width="150" height="47"></b>
                <p><b><a href="javascript:history.go(-1)">点 此 返 回</a></b>
              </td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
  </table>
  </center>
</div>
</body>                    
</html>           
<html></html>
