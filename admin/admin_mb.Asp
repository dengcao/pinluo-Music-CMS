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
flag=request("flag")
style=request("style")
if flag="editmb" then

	set rs1=server.CreateObject("ADODB.RecordSet")
	sql1="UPDATE mb SET ison=0 "
	conn.execute(sql1)

	sql1="select * from mb where id="&style
	rs1.open sql1,conn,1,3
	rs1("ison")=1
	rs1.update
	rs1.close
	set rs1=nothing
	response.Write("<script language='javascript'>alert('模板修改成功!');parent.location.replace('admin.asp');</script>")
end if

set rs=server.CreateObject("ADODB.RecordSet")
sql="select * from mb"
rs.open sql,conn,1,1
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
<table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" > 
  <tr class="title">
    <td height="30">
      <table class="tableBorder" cellpadding=3 cellspacing=1 border=0 width=100%>      
        <tr class="title">
        <td height="22" colspan="3" align="center" background="images/manage/admin_bg_1.gif">模板选择页面</td>
        </tr>       
            <tr >              
          <td width="100%" valign=top class="forumrow">
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
%> 
<form method=post action="admin_mb.asp?flag=editmb" name="mbform">
            <table class="tableBorder" width="100%" border="0" cellspacing="1" cellpadding="2">
              <tr> 
                <td class="forumrow" width="100%" height="23">                      注意：<font color=red>如果修改模板需要重新生成页面</font></td>
              </tr>
           <tr> 
                <td class="forumrow" width="100%"><table class="tableBorder" width="100%%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
<%
do while not rs.eof
%>					
                      <td align="center"><%if not rs.eof then%><a href="../<%=rs("img")%>" target="_blank"><img src="../<%=rs("img")%>" alt="" width="200" height="150" border="0"></a><br>
                        <%=rs("mbname")%>
                        <input name="style" type="radio" value="<%=rs("id")%>" <%if rs("ison")="" or isnull(rs("ison")) or rs("ison") or rs("ison")=1 then%> checked<%end if%>><%rs.movenext%><%end if%></td>
						
                      <td align="center"><%if not rs.eof then%><a href="../<%=rs("img")%>" target="_blank"><img src="../<%=rs("img")%>" alt="" width="200" height="150" border="0"></a><br>
                        <%=rs("mbname")%>
                        <input name="style" type="radio" value="<%=rs("id")%>" <%if rs("ison")=1 then%> checked<%end if%>><%rs.movenext%><%end if%></td>
                      <td align="center"><%if not rs.eof then%><a href="../<%=rs("img")%>" target="_blank"><img src="../<%=rs("img")%>" alt="" width="200" height="150" border="0"></a><br>
                        <%=rs("mbname")%>
                        <input name="style" type="radio" value="<%=rs("id")%>" <%if rs("ison")=1 then%> checked<%end if%>><%rs.movenext%><%end if%></td>
                    </tr>
<%
loop
%>					
                    
                  </table></td>
              </tr>
              <tr> 
                <td class="forumrow" width="100%"><input type="submit" name="save" value="提交修改"></td>
              </tr>
            </table>
</form>
            <p> </p>
            </td>
            </tr>
        </table>
        </td>
    </tr>
      </table>
</body>    
</html>
<%
rs.close          
set rs=nothing            
conn.close          
set conn=nothing   
%>
