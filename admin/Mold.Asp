<!--#include file="const.asp"-->
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

'检查模板选择
	set rs1=server.CreateObject("ADODB.RecordSet")
	sql1="select * from mb where ison=1"
	rs1.open sql1,conn,1,1
	if not rs1.eof then
		mbid=rs1("id")
	else
		mbid=1
	end if
	rs1.close
	set rs1=nothing

set rs=server.CreateObject("ADODB.RecordSet")
if request("id")="save" then
if request.form("V800")<>"" then
rs.open "select * from mb where id="&mbid,conn,1,2
if request("type")="geshou" then
rs("geshou")=request.form("V800")
elseif request("type")="gequ" then
rs("gequ")=request.form("V800")
elseif request("type")="zhuanji" then
rs("zhuanji")=request.form("V800")
elseif request("type")="mxda" then
rs("mxda")=request.form("V800")
elseif request("type")="play" then
rs("play")=request.form("V800")
elseif request("type")="toplist" then
rs("toplist")=request.form("V800")
end if
rs.Update
rs.close 
zymsg="成功:修改网页模板完成"
else
zymsg="错误:模版内容不能为空"
end if
end if
sql="select * from mb where id="&mbid
rs.open sql,conn,1
if request("type")="geshou" then
title="歌手列表"
mb=rs("geshou")
elseif request("type")="zhuanji" then
title="专辑列表"
mb=rs("zhuanji")
elseif request("type")="gequ" then
title="歌曲列表"
mb=rs("gequ")
elseif request("type")="mxda" then
title="歌手资料列表"
mb=rs("mxda")
elseif request("type")="play" then
title="歌曲播放页面"
mb=rs("play")
elseif request("type")="toplist" then
title="歌曲排行页面"
mb=rs("toplist")
end if
rs.close          
set rs=nothing            
conn.close          
set conn=nothing   
%> 
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style>
td{font-size:9pt;line-height:140%} 
body{font-size:9pt;line-height:140%} 
a:link       { color: #0033CC; text-decoration: none }
a:visited    { color: #0033CC; text-decoration: none }
a:active     { color: #FF0000; text-decoration: none }
a:hover      { color: #000000; text-decoration: underline}
</style>
<SCRIPT LANGUAGE="JavaScript">
helpstat = false;
stprompt = true;
basic = false;
function thelp(swtch){
	if (swtch == 1){
		basic = false;
		stprompt = false;
		helpstat = true;
	} else if (swtch == 0) {
		helpstat = false;
		stprompt = false;
		basic = true;
	} else if (swtch == 2) {
		helpstat = false;
		basic = false;
		stprompt = true;
	}
}

function AddText(NewCode) {
document.frmAnnounce.body.value+=NewCode
}


function runEx(){
//alert('请注意，按下确定将生成页面，按下后请稍后....');
var winEx = window.open("", "winEx", "width=300,height=200,status=yes,menubar=yes,scrollbars=yes,resizable=yes"); winEx.document.open("text/html", "replace"); 
winEx.document.write(unescape(event.srcElement.parentElement.children[2].value)); 
winEx.document.close(); 
}
</SCRIPT>
<script language="Javascript">
<!-- hide

function insertsmilie(smilieface){

	document.frmAnnounce.body.value+=smilieface;
}
// -->
</script>
</head>
<body topmargin="1" leftmargin="1">
<table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" height="100%">
<form name="frmAnnounce" method="post" action="Mold.Asp?id=save&type=<%=request("type")%>">
  <tr class="title">
    <td height="22" colspan="3" align="center"><strong>修改<%=title%>模板-当前选择(<font color=red>模板<%=mbid%></font>)</strong></td>
  </tr>
 <%if zymsg<>"" then%>
         <tr>
            <td bgcolor="#FFFFFF"><font color="#FF0000">·</font><%=zymsg%>,时间<%=Now()%></td>    
          </tr>
       <%
       end if 
       %>

  <tr>
    <td width="100%" bgcolor="#FFFFFF" height="100%"><textarea style="width:100%; height:100%;" rows="19" name="V800" cols="102"><%=mb%></textarea></td>
  </tr>
  <tr>
    <td width="100%" class="forumrow">
    <p align="center">        
    <input name="change" value="确定修改<%=title%>模板" type='submit'> </td>
  </tr>
</form>
</table>
</body>    
</html>
