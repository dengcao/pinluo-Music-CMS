<!--#include file="const.asp"-->
<%CheckAdmin3%>

<LINK href="admin.css" type=text/css rel=stylesheet>
<!--#include file="Top.Asp"-->
<table class="tableHeaderText" border="0" width="100%" cellspacing="1" cellpadding="1">
<tr>
<td align=center class="tableBorder">
<form method="POST" action="Admin_Setup_Err.Asp" id=form2 name=form2>
        <table  class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1">
          <tr class="title"> 
            <th colspan="3" width="27%" height=25 class="tableHeaderText">修 改 网 站 基 本 配 置</th>
          </tr>
          <tr> 
            <td width="30%" align="right" class="forumrow"  height="24" >网站名称：</td>
            <td width="70%" class="forumrow"  height="24"> <input type="text" name="WebName" value="<%=WebName%>" size="50">(你的网站的名称，如：品络,变量名:WebName)</td>
          </tr>
          <tr> 
            <td width="30%" align="right" class="forumrow"  height="24" >网站地址：</td>
            <td width="70%" class="forumrow"  height="24"> <input type="text" name="WebUrl" value="<%=WebUrl%>" size="50">
            (你的网站的地址，如：http://www.pinluo.com,变量名:WebUrl)</td>
          </tr>
          <tr>
            <td align="right" class="forumrow"  height="24" >安装目录：</td>
            <td class="forumrow"  height="24"><input name="webmulu" type="text" id="webmulu" value="<%=webmulu%>" size="50">
            (你的网站的安装目录，后面必须带/，根目录为“/”,变量名:webmulu)</td>
          </tr>
          <tr>
            <td width="30%" align="right" class="forumrow"  height="24" >首页公告1</td>
            <td width="50%" class="forumrow"  height="24"> <input type="text" name="WebPost1" value="<%=WebPost1%>" size="50">(公告1链接地址，变量名:WebPost1)</td>
          </tr>
          <tr>
            <td align="right" class="forumrow"  height="24" >首页公告1链接</td>
            <td class="forumrow"  height="24"><input type="text" name="Weburl1" value="<%=Weburl1%>" size="50">(网站首页的公告1，变量名:Weburl1)</td>
          </tr>
          <tr>
            <td width="30%" align="right" class="forumrow"  height="24" >首页公告2</td>
            <td width="50%" class="forumrow"  height="24"> <input type="text" name="WebPost2" value="<%=WebPost2%>" size="50">(网站首页的公告2，变量名:WebPost2)</td>
          </tr>
          <tr>
            <td align="right" class="forumrow"  height="24" >首页公告2链接</td>
            <td class="forumrow"  height="24"><input type="text" name="Weburl2" value="<%=Weburl2%>" size="50">(网站首页的公告1，变量名:Weburl2)</td>
          </tr>
          <tr>
            <td width="30%" align="right" class="forumrow"  height="24" >首页公告3</td>
            <td width="50%" class="forumrow"  height="24"> <input type="text" name="WebPost3" value="<%=WebPost3%>" size="50">(网站首页的公告3，变量名:WebPost3)</td>
          </tr>
          <tr>
            <td align="right" class="forumrow"  height="24" >首页公告3链接</td>
            <td class="forumrow"  height="24"><input type="text" name="Weburl3" value="<%=Weburl3%>" size="50">(网站首页的公告1，变量名:Weburl3)</td>
          </tr>
          <tr>
            <td width="30%" align="right" class="forumrow"  height="24" >首页公告4</td>
            <td width="50%" class="forumrow"  height="24"> <input type="text" name="WebPost4" value="<%=WebPost4%>" size="50">(网站首页的公告4，变量名:WebPost4)</td>
          </tr>
          <tr>
            <td align="right" class="forumrow"  height="24" >首页公告4链接</td>
            <td class="forumrow"  height="24"><input type="text" name="Weburl4" value="<%=Weburl4%>" size="50">(网站首页的公告1，变量名:Weburl4)</td>
          </tr>
          <tr> 
            <td width="30%" align="right" class="forumrow"  height="24">版权信息：</td>
            <td width="70%" class="forumrow"  height="24"> <input type="text" name="Copyright" value="<%=Copyright%>" size="50">(网站的版权，变量名:Copyright)</td>
          </tr>
          <tr> 
            <td width="30%" align="right" class="forumrow"  height="24">版本信息：</td>
            <td width="70%" class="forumrow"  height="24"> <input type="text" name="Ver" value="<%=Ver%>" size="50">(网站的版本，变量名:Ver)</td>
          </tr>
          <tr> 
            <td width="30%" align="right" class="forumrow"  height="24">站长QQ：</td>
            <td width="70%" class="forumrow"  height="24"> <input type="text" name="AdminEmail" value="<%=AdminEmail%>" size="50">(站长的QQ，变量名:AdminEmail)</td>
          </tr>
          <tr> 
            <td width="30%" align="right" class="forumrow"  height="24">HTML前缀：</td>
            <td width="70%" class="forumrow"  height="24"> <input type="text" name="Front" value="<%=Front%>" size="50">(路径前缀，变量名:Front)</td>
          </tr>
          <tr> 
            <td width="30%" align="right" class="forumrow"  height="24">关键词SEO：</td>
            <td width="70%" class="forumrow"  height="24"> <input type="text" name="keywords" value="<%=keywords%>" size="50">(关键词SEO，变量名:keywords)</td>
          </tr>
          <tr> 
            <td width="30%" align="right" class="forumrow"  height="24">统计代码：</td>
            <td width="70%" class="forumrow"  height="24"> <textarea name="count" cols="50" rows="3" id="count"><%=count%></textarea>(统计代码，变量名:count)</td>
          </tr>
          <tr> 
            <td width="30%" align="right" class="forumrow"  height="24">备案信息：</td>
            <td width="70%" class="forumrow"  height="24"> <input type="text" name="beian" value="<%=beian%>" size="50">(备案信息，变量名:beian)</td>
          </tr>
          <tr> 
            <td width="30%" align="right" class="forumrow"  height="24">页脚信息：</td>
            <td width="70%" class="forumrow"  height="24"> <input type="text" name="bottominfo" value="<%=bottominfo%>" size="50">(页脚信息，变量名:bottominfo)</td>
          </tr>
		  <tr> 
            <td width="30%" align="right" class="forumrow"  height="24">周排行重置时间：</td>
            <td width="70%" class="forumrow"  height="24"> <select name="Weekpai" style="width: 108; height: 20; font-size:9pt">
			<option value="2">星期一</option>
			<option value="3">星期二</option>
			<option value="4">星期三</option>
			<option value="5">星期四</option>
			<option value="6">星期五</option>
			<option value="7">星期六</option>
			<option value="1">星期天</option>
		</select>(周排行重置时间)</td>
          </tr>
          <tr> 
            <td height="24" align="center" class="forumrow"  colspan="2"><input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" type="submit" value=" 确 定 " name="cmdok2">
              &nbsp; <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" type="reset" value=" 取 消 " name="cmdcance2l">(修改信息后一定要重新生成首页)</td>
          </tr>
        </table>
<table class="tableBorder" width="100%" cellspacing="0" cellpadding="0">
          <tr> </tr>
</table>
</form>
</td>
</tr>
</table>
<%
conn.close
set conn=nothing
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
</body>
</html>
