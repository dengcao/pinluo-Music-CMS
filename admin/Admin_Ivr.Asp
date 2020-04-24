<!--#include file="Const.Asp"-->
<%CheckAdmin3%>
<!--#include file="Top.Asp"-->
<link href='Admin.css' rel='stylesheet' type='text/css'>
<table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" > 
  <tr class="title">
    <td height="30">
      <table class="tableBorder" cellpadding=2 cellspacing=1 border=0 width=100%>
        <tr class="title">
        <td height="22" colspan="3" align="center">广告管理页面</td>
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
dim objFSO
dim fdata
dim objCountFile
Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
if request("save")="" then
  Set objCountFile = objFSO.OpenTextFile(Server.MapPath("../ads/ivr.asp"),1,True)
  If Not objCountFile.AtEndOfStream Then fdata = objCountFile.ReadAll
 else
  fdata=request("fdata")
  Set objCountFile=objFSO.CreateTextFile(Server.MapPath("../ads/ivr.asp"),True)
  objCountFile.Write fdata
 end if
 objCountFile.Close
 Set objCountFile=Nothing
 Set objFSO = Nothing
%> 
<form method=post>
            <table class="tableBorder" width="100%" border="0" cellspacing="1" cellpadding="2">
              <tr> 
                <td class="forumrow" width="3%" height="23"> </td>
                <td class="forumrow" width="97%" height="23">                      注意：文件将被保存在你安装目录下的<font color=red>../ads/ivr.asp</font>文件里，如果您的空间不支持<font color=red>FSO</font>，请直接编辑该文件！<br>
                　　　如果您对html和js代码不了解,不要随意编辑。<font color=red>此处生成的是ASP广告文件</font></td>
              </tr>
              <tr> 
                <td class="forumrow" width="3%"></td>
                <td class="forumrow" width="97%"> 
                  <textarea name="fdata" cols="110" rows="20"><%=fdata%></textarea>
                </td>
              </tr>
              <tr> 
                <td width="3%"> </td>
                <td class="forumrow" width="97%">
                  <input type="reset" name="Reset" value="重新修改">
                  <input type="submit" name="save" value="提交修改"> 当前文件路径：<b><%=Server.MapPath("../ads/ivr.asp")%></b>
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
set conn=nothing
%>
