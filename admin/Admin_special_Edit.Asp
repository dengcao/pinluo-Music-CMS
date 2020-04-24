<!--#include file="const.asp"-->
<%CheckAdmin1%>
<%PageName="Admin_special_Edit"%>
<!--#include file="Top.asp"-->
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
Classid=cstr(trim(request.QueryString("classid")))

if Classid="" then
Classid=1
else
end if

SClassid=cstr(trim(request.QueryString("sclassid")))
NClassid=cstr(trim(request.QueryString("Nclassid")))

%>

<script>
function submitonce(theform){
	//if IE 4+ or NS 6+
	if (document.all||document.getElementById){
	//screen thru every element in the form, and hunt down "submit" and "reset"
	for (i=0;i<theform.length;i++){
		var tempobj=theform.elements[i]
		if(tempobj.type.toLowerCase()=="submit"||tempobj.type.toLowerCase()=="reset")
		//disable em
		tempobj.disabled=true
		}
	}
}
</script>
   <form method="POST" action="Admin_special_Err.Asp" id=form2 name=form2 onSubmit="submitonce(this);">
     <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
         <tr class="title">
          <td width="100%" height="20" align=center background="images/manage/admin_bg_1.gif"><b>添 加 专 辑</b></td>
       </tr></table>
        <table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
        <tr class="forumrow">
          <td width="100%" height="22"  align=center>
                <table class="tableBorder" border="0" cellpadding="0" cellspacing="0" width="100%" bordercolor="#3366CC" bordercolordark="#FFFFFF">
                    <tr>
                   
                      <td class="forumrow" width="100%">&nbsp;一级栏目：
              <select name="classid" size="1" onChange="window.open('Admin_special_Edit.Asp?classid='+this.options[this.selectedIndex].value,'_self')">
<%
set rs=server.createobject("adodb.recordset")
sql="select * from class"
rs.open sql,conn,1,1
Do while not rs.eof
%>
                <option<%if classid=cstr(rs("classid")) and classid<>"" then%> selected<%end if%> value="<%=Cstr(rs("classid"))%>"><%=rs("class")%></option>
<%
rs.MoveNext
Loop
rs.close
%>            </select>
              &nbsp;二级栏目：
<%if classid<>"" then%>
              <select name="Sclassid" size="1" onChange="window.open('Admin_special_Edit.Asp?classid=<%=request("classid")%>&sclassid='+this.options[this.selectedIndex].value,'_self')">
                <option value="" <%if request("Sclassid")="" then%> selected<%end if%>>选择栏目</option>
<%
	sql="select * from Sclass where classid="&classid
	rs.open sql,conn,1,1
	Do while not rs.eof
%>
                <option<%if Sclassid=cstr(rs("Sclassid")) and Sclassid<>"" then%> selected<%end if%> value="<%=CStr(rs("Sclassid"))%>" name=Sclassid><%=rs("Sclass")%></option>
<%
	rs.MoveNext
	Loop
	rs.close

else
%>
              <select name="Sclassid" size="1">
                <option value="" selected>选择栏目</option>
<%end if%>
              </select>
              &nbsp;三级栏目：
<%if sclassid<>"" then%>
              <select name="Nclassid" size="1" onChange="window.open('Admin_special_Edit.Asp?classid=<%=classid%>&sclassid=<%=sclassid%>&nclassid='+this.options[this.selectedIndex].value,'_self')">
                <option value="" <%if Nclassid="" then%> selected<%end if%>>选择栏目</option>
<%
	sql="select * from Nclass where Sclassid="&Sclassid
	rs.open sql,conn,1,1
	Do while not rs.eof
%>
                <option<%if cstr(request("Nclassid"))=cstr(rs("Nclassid")) and Nclassid<>"" then%> selected<%end if%> value="<%=CStr(rs("Nclassid"))%>" name=Nclassid><%=rs("Nclass")%></option>
<%
	rs.MoveNext
	Loop
	rs.close
%>
<%else%>
              <select name="Nclassid" size="1">
                <option value="" selected>选择栏目</option>
<%end if%>
              </select></td>
                    </tr>
                  </table>
           </td>
        </tr>
		<tr>
          <td width="100%" height="25" align=left>
                  <table class="tableBorder" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                      <td width="15%" class="forumrow" height="25" align="right">专辑名称：</td>
                      <td width="85%" class="forumrow" colspan="2"><input type="text" name="name" size="20"></td>
                    </tr>
                    <tr>
                      <td width="15%" class="forumrow" height="25" align="right">所属语言：</td>
                      <td width="85%" class="forumrow" colspan="2"><select name="Yuyan" size="1">
                <option value="国语" selected>国语</option>
                <option value="粤语">粤语</option>
                <option value="英文">英文</option>
                <option value="闵南语">闵南语</option>
                <option value="韩文">韩文</option>
                <option value="日语">日语</option>
                <option value="日韩">日韩</option>
                <option value="国/粤语">国/粤语</option>
                <option value="中/英文">中/英文</option>
                <option value="中/日文">中/日文</option>
                <option value="中/韩文">中/韩文</option>
                <option value="纯音乐">纯音乐</option>
                <option value="伴奏">伴奏</option>
                <option value="钢琴曲">钢琴曲</option>
                </select></td>
                    </tr>
                    <tr>
                      <td width="15%" class="forumrow" height="25" align="right">唱片公司：</td>
                      <td width="85%" class="forumrow" colspan="2"><input type="text" name="Gongsi" size="20"></td>
                    </tr>
                    <tr>
                      <td width="15%" class="forumrow" height="25" align="right">发行日期：</td>
                      <td class="forumrow" width="21%"><input type="text" name="Times" size="20"></td>
                      <td class="forumrow" width="64%">　</td>
                    </tr>
                    <tr>
                      <td width="15%" class="forumrow" height="20" align="right">专辑图片：</td>
                      <td width="21%" class="forumrow" height="20">
                      <input name="pic"  type="text" value="<%=WebUrl%>/Photo/" size="50"> </td>
                      <td width="64%" class="forumrow" height="20">
                      <iframe name="I1" width="369" height="20" src="upload.htm" scrolling="no" border="0" frameborder="0">
                      浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
                    </tr>
                    <tr>
                      <td width="15%" class="forumrow" height="25" align="right">专辑简介：</td>
                      <td width="85%" class="forumrow" colspan="2"><TEXTAREA name="intro" rows=30 cols="85"></TEXTAREA></td>
                    </tr>
                    <tr>
                      <td width="15%" align="right"></td>
                      <td width="85%" colspan="2"></td>
                    </tr>
                    <tr>
                      <td width="15%" align="right"></td>
                      <td width="85%" colspan="2"></td>
                    </tr>

                  </table>
		  </td>
        </tr>
        <tr>
          <td width="100%" height="22" class="forumrow" align=center>
              <input type="hidden" value="add" name="act"> 
<%if Classid="" then%>
              <input type="button" style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" value=" 确 定 " name="cmdok" onClick="window.alert('请先选择栏目！')">&nbsp; 
<%elseif NClassid="" then%>
              <input type="button" style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" value=" 确 定 " name="cmdok" onClick="window.alert('请先选择子栏目！')">&nbsp; 
<%else%>
              <input type="submit" style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" value=" 确 定 " name="cmdok">&nbsp; 
<%end if%>
              <input type="reset" style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" value=" 取 消 " name="cmdcancel"></td>
        </tr>
      </table> </form>
<%
set rs=nothing
conn.close
set conn=nothing

%></body></html>
