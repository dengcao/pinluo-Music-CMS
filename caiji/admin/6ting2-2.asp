<!--#include file="function.asp"-->
<%CheckAdmin1%>
<!--#include file="6tingconn.asp"-->
<%
founderr=false
id=checksql(request.form("id"))
url=request.form("url")
body=request.form("body")
mp3img=request.form("mp3img")
mp3imgurl=request.form("mp3imgurl")
nomp3img=request.form("nomp3img")
mp3zjname=request.form("mp3zjname")
mp3about=request.form("mp3about")
mp3singer=request.form("mp3singer")
mp3yuyan=request.form("mp3yuyan")
mp3gongsi=request.form("mp3gongsi")
mp3time=request.form("mp3time")
mp3type=request.form("mp3type")

id=bqtf(id)
url=bqtf(url)
body=bqtf(body)
mp3img=bqtf(mp3img)
mp3imgurl=bqtf(mp3imgurl)
nomp3img=bqtf(nomp3img)
mp3zjname=bqtf(mp3zjname)
mp3about=bqtf(mp3about)
mp3singer=bqtf(mp3singer)
mp3yuyan=bqtf(mp3yuyan)
mp3gongsi=bqtf(mp3gongsi)
mp3time=bqtf(mp3time)
mp3type=bqtf(mp3type)

if id="" or url="" or mp3img="" or mp3imgurl="" or mp3zjname="" or mp3about="" or mp3singer="" or mp3yuyan="" or mp3gongsi="" or mp3time="" or mp3type="" then
	errmsg=errmsg+"<br>"+"<li>请你接要求填写好相关内容！"
	founderr=true
	call error()
	Response.End 
end if

set rs=server.CreateObject("ADODB.RecordSet")
	sql="select * from const where id="&id
	rs.open sql,conn1,3,2
		rs("url")=url
		rs("body")=body
		rs("mp3img")=mp3img
		rs("mp3imgurl")=mp3imgurl
		rs("nomp3img")=nomp3img
		rs("mp3zjname")=mp3zjname
		rs("mp3about")=mp3about
		rs("mp3singer")=mp3singer
		rs("mp3yuyan")=mp3yuyan
		rs("mp3gongsi")=mp3gongsi
		rs("mp3time")=mp3time
		rs("mp3type")=mp3type
		rs.update
	rs.close()
set rs=nothing
conn1.close
set conn1=nothing
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>第六音乐厅通用音音采集器--添加采集站点第二步</title>
<style type="text/css">
<!--
.nr {
	font-size: 12px;
}
-->
</style>
</head>
<body>
<FORM action=6ting2-3.asp method=post name=id>
<table class="tableBorder" width="96%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="../../admin/images/manage/admin_bg_1.gif">
<table class="tableBorder" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr> 
            <td height="25" colspan="2" align="center" class="nr"><strong>添加站点第三步 
              设置采集属性</strong></td>
          </tr>
          <tr> 
            <td width="150" align="right" bgcolor="#FFFFFF" class="nr">音乐列表区域：</td>
            <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td><textarea name="musll" cols="50" rows="3" id="musll"></textarea> 
                    <span class="nr"><font color="#FF0000">*</font></span></td>
                </tr>
                <tr> 
                  <td class="nr">必填，选择音乐列表的起始和终止内容，中间用|分开。</td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td width="150" align="right" bgcolor="#FFFFFF" class="nr">每首音乐起始和终止：</td>
            <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td><textarea name="musicnamelist" cols="50" rows="3" id="musicnamelist"></textarea> 
                    <span class="nr"><font color="#FF0000">*</font></span></td>
                </tr>
                <tr> 
                  <td><p class="nr">必填，找出每首页的开始和终止内容进一步缩小采集范围，中间用|分开。</p></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td width="150" align="right" bgcolor="#FFFFFF" class="nr">音乐名称：</td>
            <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td><textarea name="mp3name" cols="50" rows="3" id="mp3name"></textarea> 
                    <font color="#FF0000"><span class="nr"> *</span></font></td>
                </tr>
                <tr> 
                  <td class="nr">必填，上在我们查找出来了每首歌的起止来了，在这个里面我们在找这首歌的名称，所以上面我们写规则时采出来的结果一定要包含音乐名称和音乐ID。</td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td width="150" align="right" bgcolor="#FFFFFF" class="nr">音乐ID：</td>
            <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td><textarea name="musicid" cols="50" rows="3" id="musicid"></textarea> 
                    <font color="#FF0000"><span class="nr">*</span></font></td>
                </tr>
                <tr> 
                  <td class="nr">必填，在每首音乐起始和终止这面找每首歌的音乐ID，得出这个ID后我们就可以在他的播放页面里加上这个ID就打开了这首歌，从这里面我们才能找出音乐的路径。</td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td width="150" align="right" bgcolor="#FFFFFF" class="nr">采集音乐路径的地址：</td>
            <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td><input name="cjmp3path" type="text" id="cjmp3path" size="50"> 
                    <span class="nr"><font color="#FF0000">*</font></span></td>
                </tr>
                <tr> 
                  <td class="nr">必填，这里的地址可以是音乐播放的地址也可以是音乐下载的地址，只要加上音乐ID就可以在这个页面得出音乐路径来的就行了，音乐ID用[musicID]替换行了。</td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td width="150" align="right" bgcolor="#FFFFFF" class="nr">音乐路径：</td>
            <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td><textarea name="mp3path" cols="50" rows="3" id="mp3path"></textarea> 
                    <span class="nr"><font color="#FF0000">*</font></span></td>
                </tr>
                <tr> 
                  <td class="nr">必填，从上面采集内容里找出音乐路径，起始和终止内容中间用|分开。（一般来说这里只得出路径的后半部分可以了，不可能把别人的全部路径都入库吧，要是人家修改路径了你不死光光了。）</td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td width="150" align="right" bgcolor="#FFFFFF" class="nr">音乐路径前半部分：</td>
            <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td><input name="wmapath" type="text" id="wmapath" size="50">                  </td>
                </tr>
                <tr> 
                  <td class="nr">可选，如果你采集的站的前半部分地址全都一样你就在这里填上前半部分地址，这样就好下载音乐，如果你采的站前半部分地址不一样的，你把这里留空就行了。</td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td width="150" align="right" bgcolor="#FFFFFF" class="nr">音乐下载地址：</td>
            <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td><textarea name="xzmp3path" cols="50" rows="3" id="xzmp3path"></textarea></td>
                </tr>
                <tr> 
                  <td class="nr">可选的，如果你采的站前半部分地址不一样，你就把上面的留空，在这里把路径的全部地址给找出来，起始和终止中间用|分开。</td>
                </tr>
              </table></td>
          </tr>
		  <tr> 
          <td width="150" align="right" bgcolor="#FFFFFF" class="nr">Cookie验证页面：</td>
          <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><input name="Cookie" type="text" id="Cookie" value="当前采集页" size="50">                </td>
              </tr>
              <tr> 
                <td class="nr">可选，如果网站采集防盗连了，Cookie验证的是那个页面，如果是当前采集页请填写当前采集页，否则填上Cookie验证页的网址</td>
              </tr>
            </table></td>
        </tr>
          <tr align="center"> 
            <td height="30" colspan="2" bgcolor="#FFFFFF"> 
             <input name="id" type="text" id="id" size="50" value="<%=id%>" style="display:none"> <input name="sxbc" type="submit" id="sxbc" value="保存到下一步"></td>
          </tr>
        </table>
    </td>
  </tr>
</table>
</form>
</body>
</html>
