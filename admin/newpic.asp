<!--#include file="const.asp"-->
<%CheckAdmin3%>
<%pagename="newpic"%>
<!--#include file="Top.Asp"-->
<html>
<head>
<title>����ϵͳ</title>
<meta name=generator content="Microsoft FrontPage 4.0" FrontPage 4.0"" charset="gb2312" Microsoft>
<link rel="stylesheet" href="inc/Admin_STYLE.css" type="text/css">
<meta name=generator content="Microsoft FrontPage 4.0" FrontPage 4.0"" charset="gb2312" Microsoft>
<style type="text/css">
<!--
.��ʽ2 {color: #FFFFFF}
.��ʽ2 {color: #000000}
.��ʽ3 {font-size: 9pt}
-->
</style>
</head>

<body bgcolor=eeeeee leftmargin="0" bottommargin="0" rightmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<br>
<table class="tableBorder"  border="0" width="69%" align="center" cellpadding="0" cellspacing="0" height="141">
  <%set rs=server.createobject("adodb.recordset")
  rs.open "select * from newpic",conn,1,3
  %>
  <form method="POST" action="editnewpic.asp">
<tr align="center">
<th height="22" colspan="2" align="center" class="title ��ʽ1 ��ʽ3">��ҳFLASH�Ƽ�(Ч�����·����һ��flash)</th>
</tr>

<tr>
<td height="190" align="center" class="tdbg">
  <img src=<%=rs("pic1")%> width=190 height=190 border="1" alt="ͼƬ1"><img src=<%=rs("pic2")%> width=190 height=190 border="1" alt="ͼƬ2"><img src=<%=rs("pic3")%> width=190 height=190 border="1" alt="ͼƬ3"><img src=<%=rs("pic4")%> width=190 height=190 border="1" alt="ͼƬ4">
<SCRIPT type=text/javascript>
	<!--
	
	imgUrl1="<%=rs("pic1")%>";
imgtext1=""
imgLink1=escape("<%=rs("movie1")%>");

imgUrl2="<%=rs("pic2")%>";
imgtext2=""
imgLink2=escape("<%=rs("movie2")%>");

imgUrl3="<%=rs("pic3")%>";
imgtext3=""
imgLink3=escape("<%=rs("movie3")%>");

imgUrl4="<%=rs("pic4")%>";
imgtext4=""
imgLink4=escape("<%=rs("movie4")%>");

imgUrl5="<%=rs("pic5")%>";
imgtext5=""
imgLink5=escape("<%=rs("movie5")%>");


var focus_width=298
var focus_height=200
var text_height=0
var swf_height = focus_height

var pics=imgUrl1+"|"+imgUrl2+"|"+imgUrl3+"|"+imgUrl4+"|"+imgUrl5
var links=imgLink1+"|"+imgLink2+"|"+imgLink3+"|"+imgLink4+"|"+imgLink5
var texts=imgtext1+"|"+imgtext2+"|"+imgtext3+"|"+imgtext4+"|"+imgtext5

document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
document.write('<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="../ads/in.swf"><param name="quality" value="high"><param name="bgcolor" value="#F0F0F0">');
document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
document.write('<embed src="../ads/in.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#F0F0F0" quality="high" width="'+ focus_width +'" height="'+ focus_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');  document.write('</object>');
	
	//-->
	</SCRIPT></td>
</tr>

<tr>
<td height="25" align="center" class="tdbg">�Ƽ�ͼƬ��ַ1��
  <input class="smallInput" name="pic1" size="40" value="<%=rs("pic1")%>"></td>
</tr>
<tr>
<td height="25" align="center" class="tdbg"><span class="��ʽ2">�Ƽ����ӵ�ַ1��
</span>
  <input class="smallInput" name="movie1" size="40" value="<%=rs("movie1")%>"></td>
</tr>
<tr>
<td height="25" align="center" class="tdbg"><span class="��ʽ2">�Ƽ�ͼƬ��ַ2��</span>
  <input class="smallInput" name="pic2" size="40" value="<%=rs("pic2")%>"></td>
</tr>
<tr>
<td height="25" align="center" class="tdbg">�Ƽ����ӵ�ַ2��
  <input class="smallInput" name="movie2" size="40" value="<%=rs("movie2")%>"></td>
</tr>
<tr>
<td height="25" align="center" class="tdbg"><span class="��ʽ2">�Ƽ�ͼƬ��ַ3��</span>
  <input class="smallInput" name="pic3" size="40" value="<%=rs("pic3")%>"></td>
</tr>
<tr>
<td height="25" align="center" class="tdbg"><span class="��ʽ2">�Ƽ����ӵ�ַ3��</span>
  <input class="smallInput" name="movie3" size="40" value="<%=rs("movie3")%>"></td>
</tr>
<tr>
<td height="25" align="center" class="tdbg"><span class="��ʽ2">�Ƽ�ͼƬ��ַ4��</span>
  <input class="smallInput" name="pic4" size="40" value="<%=rs("pic4")%>"></td>
</tr>
<tr>
<td height="25" align="center" class="tdbg"><span class="��ʽ2">�Ƽ����ӵ�ַ4��</span>
  <input class="smallInput" name="movie4" size="40" value="<%=rs("movie4")%>"></td>
</tr>
<tr>
<td height="25" align="center" class="tdbg"><span class="��ʽ2">�Ƽ�ͼƬ��ַ5��</span>
  <input class="smallInput" name="pic5" size="40" value="<%=rs("pic5")%>"></td>
</tr>
<tr>
<td height="25" align="center" class="tdbg"><span class="��ʽ2">�Ƽ����ӵ�ַ5��</span>
  <input class="smallInput" name="movie5" size="40" value="<%=rs("movie5")%>"></td>
</tr>
<tr> 
<td height="15" colspan="2" align="center" class="tdbg"> 
<input type="submit" value=" �� �� " name="cmdok" class="buttonface">
      <input type="reset" value=" �� д " name="cmdcancel" class="buttonface">(�ύ�޸ĺ󼴿��ڿ���Ч��)</td>
</tr>
</form>

<%
rs.close
set rs=nothing
conn.close
set conn=nothing
'
'����������������������������������������������������
'��                                                                   ��
'��                     Ʒ�����ֳ���ϵͳ1.0                              ��
'��                                                                   ��
'��     �ռ�����: Ʒ��  www.pinluo.com                                  ��
'��                                                                   ��
'��     ��������: ����  www.caozha.com                                  ��
'��                                                                   ��
'��     Դ�����Apache-2.0��ѿ�Դ���뱣�����������ӣ�                      ��
'��                                                                   ��
'����������������������������������������������������
'
'
%>
</table>


</body>
</html>
