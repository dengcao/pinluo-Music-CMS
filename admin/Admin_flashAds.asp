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
dim i
i=0 
MaxList=80
set rs=server.createobject("adodb.recordset")

sql="select * from class order by classid"
rs.open sql,conn,1,1
i=request("id")
if i="" then i=rs("Classid")
%>
<!--#include file="Top.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
<table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" > 
  <tr class="title">
  
<td height="30">

<table class="tableBorder" cellpadding=3 cellspacing=1 border=0 width=100%>
  <tr class="title">
    <td height="22" colspan="3" align="center">V5播放器背景链接地址管理页面</td>
  </tr>
  <tr >
  
  <td width="100%" valign=top class="forumrow">
  
  <%
dim objFSO
dim fdata
dim objCountFile
Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
if request("save")="" then
  Set objCountFile = objFSO.OpenTextFile(Server.MapPath("../ads/ad_play.xml"),1,True)
  If Not objCountFile.AtEndOfStream Then fdata = objCountFile.ReadAll
 else
	wz=request.Form("wz")
	wzold=request.Form("wzold")
	tp=request.Form("tp")
	tpold=request.Form("tpold")
	str=request.Form("fdata")
	str=replace(str,wzold,wz)
	str=replace(str,tpold,tp)
'	str="abcd"
	fdata=str	
'  fdata=request("fdata")
  
  Set objCountFile=objFSO.CreateTextFile(Server.MapPath("../ads/ad_play.xml"),True)
  objCountFile.Write fdata
 end if
 objCountFile.Close
 Set objCountFile=Nothing
 Set objFSO = Nothing
%>
  <form method=post action="">
    <table class="tableBorder" width="100%" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td class="forumrow" width="3%" height="23"></td>
        <td class="forumrow" width="97%" height="23"> 注意：如果您的空间不支持<font color=red>FSO</font>，将无法编辑！</td>
      </tr>
      <tr>
      
      <td class="forumrow" width="3%"></td>
      <td class="forumrow" width="97%">
	<%
	AstrId1=Instr(2,fdata,"text=")
	AstrId2=Instr(2,fdata,"addr=")
	wz=Mid(fdata,AstrId1+6,AstrId2-AstrId1-8)
	%><font color="red">输入新的广告连接地址:
	<input name="wz" id="wz" value="<%=wz%>" size="50">
	<input value="<%=wz%>" type="hidden" name="wzold" id="wzold"><br>

	输入新的广告图片地址:</font>
	<%
	AstrId1=Instr(2,fdata,"addr=")
	AstrId2=Instr(2,fdata,"/>")
	tp=Mid(fdata,AstrId1+6,AstrId2-AstrId1-7)
	%>
	<input name="tp" id="tp" value="<%=tp%>" size="50">
	<input value="<%=tp%>" type="hidden" name="tpold" id="tpold">	
	<br>
	<a href="<%=wz%>" target="_blank"><img src="<%=tp%>" width="600" height="300" border="0"></a>
      <textarea name="fdata" style="display:none" cols="110" rows="20"><%=fdata%></textarea>
      </td>
      
      </tr>
      
      <tr>
      
      <td width="3%">
      
      </td>
      
      <td class="forumrow" width="97%"><input type="submit" name="save" value="提交修改">
      </b>
      </td>
      
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
<% 
set rs=nothing
conn.close
set conn=Nothing
%>
