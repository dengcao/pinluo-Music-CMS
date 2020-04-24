<!--#include file="Const.Asp"-->
<%CheckAdmin3%>
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
if request.Form("flag")="edit" then
	set rs1=server.createobject("adodb.recordset")
	stype=request.Form("stype")
	sql1="select * from News where id="&request("id")
	rs1.open sql1,conn,1,3
	rs1("title")=request.Form("title")
	rs1("content")=request.Form("content")
	rs1("pubtime")=now()
	rs1.update
	rs1.close
	set rs1=nothing
	response.Write("<script language='javascript'>alert('修改成功');location.replace('admin_news.asp');</script>")
	response.end
end if
%>

<!--#include file="Top.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
<table class="tableBorder" border="0" width="100%" cellspacing="1" cellpadding="1">
 <tr>
<td align=center valign=top>
<%
	set rs=server.createobject("adodb.recordset")
	sql="select * from News where id="&request("id")
	rs.open sql,conn,1,1
%>
            <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
                  <form name="form2" method="post" action="?"><tr>
                <td height=37 colspan="2" align=center background="images/manage/admin_bg_1.gif" class="title">修改信息</td>
                </tr>
                  <tr>
                    <td width="20%" align=center class="tdbg">标题:</td>
                    <td width="80%" class="tdbg"><input name="title" type="text" id="title" value="<%=rs("title")%>" size="60" >
                      <span class="tdbg"></span></td>
                    </tr>
                  <tr>
                    <td height=37 align=center class="tdbg">详细信息:</td>
                    <td class="tdbg"><textarea name="content" cols="80" rows="15" id="content"><%=rs("content")%></textarea></td>
                    </tr>
              <tr>
                <td height="22" class="forumrow" align=center>　</td>
                <td class="forumrow" align=center><input type="submit" name="Submit" value="确认修改"><input type="hidden" name="flag" value="edit"><input type="hidden" name="id" value="<%=request("id")%>"></td>
                </tr>
</form>
        </table>
    </td>
  </tr>
</table>
<%
set rs=nothing
conn.close
set conn=nothing%>
</body>
</html>
