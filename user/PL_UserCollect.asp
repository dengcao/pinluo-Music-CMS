<!--#include file="../PL_config.asp"-->
<!--#include file="PL_user_check_safe.asp"-->
<%PL_username=Request.Cookies("Www_PinLuo_Com_user")("PL_username")
PL_userid=Request.Cookies("Www_PinLuo_Com_user")("PL_userid")


action=Request("action")
set rs=server.createobject("adodb.recordset")
if action="add" then
	sql="select * from Box where Userid='"&PL_userid&"' "
	rs.open sql,conn,1,1		
	if rs.recordcount+1>50 then '��ȡ��ǰ�û����ղ��˶��ٸ���
	response.Write("<SCRIPT language=JavaScript>alert(' �Բ���������ͨ��Ա�����ֻ��������ղ�50�׸����� \n\nҪ�ղظ���ĸ�������ɾ�����ղؼ��ﲻ��Ҫ�ĸ���������ΪVIP��Ա��\n\n');location.href='PL_UserCollect.asp?action=show';</SCRIPT>")
	response.end
	end if
	rs.close
	
	Musicid=Request("id")
	sql="select * from Box where Userid='"&PL_userid&"' and Musicid="&Musicid
	rs.open sql,conn,1,3
	if not rs.EOF then
		response.Redirect "PL_UserCollect.asp?action=show"
		response.end
	else

	
		set rs2=server.createobject("adodb.recordset")
		sql2="select * from MusicList where id="&Musicid
		rs2.open sql2,conn,1,1
		if (rs2.EOF and rs2.BOF) then
			response.Write("<SCRIPT language=JavaScript>alert(' ����ȷѡ�����! ');javascript:top.window.close();</SCRIPT>")
			response.end
		else
			
			MusicName=rs2("MusicName")
			Singer=rs2("Singer")
			NClassid=rs2("NClassid")
		end if
		rs2.close
	        set rs2=nothing
		rs.AddNew
		rs("UserName")=membername
		rs("Musicid")=Musicid
		rs("MusicName")=MusicName
		rs("Singer")=Singer
		rs("Userid")=PL_userid
		rs("NClassid")=NClassid
		rs.Update
	end if
	rs.Close
	Response.Redirect "PL_UserCollect.asp?action=show"
elseif action="del" then
	id=Request("id")
	set rs=conn.execute("delete FROM Box where Userid='"&PL_userid&"' and id="&id)
	Response.Redirect "PL_UserCollect.asp?action=show"
	
elseif action<>"del" and action<>"add" then  
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><title><%=PL_username%>�ĸ����ղؼ� - <%=WebName%></title><style type="text/css">
<!--
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
-->
</style><HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<SCRIPT src="../pinluo.com_style1/Js.js"></SCRIPT>
<LINK href="../pinluo.com_style1/newmusic.css" type=text/css rel=stylesheet>
<LINK href="../pinluo.com_style1/music07css.css" type=text/css rel=stylesheet>
<STYLE type=text/css>BODY {
	MARGIN: 0px
}
</STYLE>

<META content="MSHTML 6.00.6000.16587" name=GENERATOR></HEAD>
<BODY>
<CENTER>
<table class="tableBorder" width=778>
  <TBODY>
  <TR>
    <TD>
      <FORM name=form2 onSubmit="javascript:return lbsong(this);" action="../Play.asp" target=Listen>
	      <%
	sql="select * from Box where Userid='"&PL_userid&"' order by ID desc"
	rs.open sql,conn,1,1
	PL_collect_num=rs.recordcount '��ȡ�����ٸ���%>
	
  <TR>
    <TD class=txt align=middle bgColor=#96d10c colSpan=8 height=30><B 
      class=txt><%=PL_username%>�ĸ����ղؼ� (�� <font color="#FF0000"><%=PL_collect_num%></font> ��)</B></TD></TR>
  <TR>
    <TD class=txt align=middle width="7%" bgColor=#e4fcb0 height=29>ѡ��</TD>
    <TD class=txt align=middle width="25%" bgColor=#e4fcb0>��������</TD>
    <TD class=txt align=middle width="16%" bgColor=#e4fcb0>����</TD>
    <TD class=txt align=middle width="7%" bgColor=#e4fcb0>����</TD>
    <TD class=txt align=middle width="7%" bgColor=#e4fcb0>����</TD>
    <TD class=txt align=middle width="7%" bgColor=#e4fcb0>���</TD>
    <TD class=txt align=middle width="7%" bgColor=#e4fcb0>���</TD>
    <TD class=txt align=middle width="7%" bgColor=#e4fcb0>ɾ��</TD></TR>
<%
	if rs.EOF and rs.BOF then
%>
  <tr bgColor=#e8eeff width="100%">
    <td height="22" colspan=6 align=center bgColor=#f3fede width="100%"><br>����δ�ղ��κθ�����<br>&nbsp;</td>
  </tr>
  <%
	else
    do while not rs.EOF 
	i=i+1
	%>
  <TR bgColor=#e8eeff>
    <TD class=txt align=middle width="7%" bgColor=#f3fede><INPUT 
      style="BORDER-RIGHT: 0px solid; BORDER-TOP: 0px solid; BORDER-LEFT: 0px solid; COLOR: #99ff66; BORDER-BOTTOM: 0px solid" 
      type=checkbox value="<%=rs("Musicid")%>" name=id> </TD>
    <TD class=txt width="25%" bgColor=#f3fede><A title=�������� 
      href="javascript:open_window('../Play.asp?id=<%=rs("Musicid")%>','Listen','width=275,height=116')"><SPAN 
      class=txt><%=rs("MusicName")%></SPAN></A></TD>
    <TD class=txt align=middle width="16%" bgColor=#f3fede><A 
      href="../PL_Singer.asp?NClassid=<%=rs("NClassID")%>" 
      target=_blank><SPAN class=txt><%=rs("Singer")%></SPAN></A></TD>
    <TD class=txt align=middle width="7%" bgColor=#f3fede><A 
      href="javascript:open_window('../Play.asp?id=<%=rs("Musicid")%>','Listen','width=275,height=116')"><IMG 
      height=12 alt=���� src="../pinluo.com_style1/music07homeqie_17.gif" width=13 
      border=0></A></TD>
    <TD class=txt align=middle width="7%" bgColor=#f3fede><A 
      href="javascript:open_window('../PL_download.asp?id=<%=rs("Musicid")%>','_blank','width=500,height=160')"><IMG 
      height=12 alt=���� src="../pinluo.com_style1/music07homeqie_19.gif" width=13 
      border=0></A> </TD>
    <TD class=txt align=middle width="7%" bgColor=#f3fede><A 
      href="javascript:open_window('../PL_showword.asp?id=<%=rs("Musicid")%>','_blank','width=420,height=250')"><IMG 
      height=16 alt=��� src="../pinluo.com_style1/music07zjqie_81.gif" width=16 
      border=0></A></TD>
    <TD class=txt align=middle width="7%" bgColor=#f3fede><A 
      href="javascript:open_window('PL_WriteSMusic.asp?id=<%=rs("Musicid")%>','WriteSMusic','width=397,height=322,scrollbars=no')"><IMG 
      height=13 alt=��� src="../pinluo.com_style1/music07zjqie_84.gif" width=14 
      border=0></A></TD>
    <TD class=txt align=middle width="7%" bgColor=#f3fede><A class=txt 
      href="PL_UserCollect.asp?action=del&id=<%=rs("id")%>" onClick="return confirm('��ȷ��Ҫɾ�����׸�����')">ɾ��</A></TD></TR>
        <%
	rs.MoveNext
    loop
end if
%>
  <TR>
    <TD class=txt align=middle bgColor=#96d10c colSpan=9><INPUT title=ѡ����ʾ�����и��� style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; COLOR: #000000; BORDER-BOTTOM: #000000 1px solid; BACKGROUND-COLOR: #e8eeff" onclick=CheckAll(this.form) type=button value="ȫ ѡ" name=chkall> 
<INPUT title=����ѡ����� style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; COLOR: #000000; BORDER-BOTTOM: #000000 1px solid; BACKGROUND-COLOR: #e8eeff" onclick=CheckOthers(this.form) type=button value="�� ѡ" name=chkOthers> 
<INPUT title=����ѡ���������ĸ������ٵ������ style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; COLOR: #000000; BORDER-BOTTOM: #000000 1px solid; BACKGROUND-COLOR: #e8eeff" type=submit value="�� ��" name=B1> 
    </TD></TR></FORM></TBODY></TABLE>
<table class="tableBorder">
  <TBODY>
  <TR>
    <TD vAlign=center align=middle width=700 bgColor=#ffffff height=41><FONT 
      face="Arial, Helvetica, sans-serif"><SPAN class=txt>Copyright&copy;2008 
      <a href="<%=Weburl%>" target="_blank"><%=WebName%></a> All Rights Reserved</SPAN></FONT><SPAN 
    class=txt><BR></SPAN></TD></TR></TBODY></TABLE></CENTER></BODY></HTML>
<%
	rs.Close
else
	response.Write("<SCRIPT language=JavaScript>alert(' ��������! ����ϵ����Ա. ');javascript:top.window.close();</SCRIPT>")
end if
set rs=nothing
conn.close
set conn=nothing
%>
