<!--#include file="function.asp"-->
<%CheckAdmin1%>
<!--#include file="6tingconn.asp"-->
<%
id=checksql(request("id"))
	id=bqtf(id)
set rs=server.CreateObject("ADODB.RecordSet")
	sql="select * from const where id="&id
	rs.open sql,conn1,3,2
	zdname=dyh(rs("zdname"))
	zdurl=dyh(rs("zdurl"))
	imglj=rs("imglj")
	wmalj=rs("wmalj")
	url=dyh(rs("url"))
	body=dyh(rs("body"))
	mp3img=dyh(rs("mp3img"))
	mp3imgurl=dyh(rs("mp3imgurl"))
	nomp3img=dyh(rs("nomp3img"))
	mp3zjname=dyh(rs("mp3zjname"))
	mp3about=dyh(rs("mp3about"))
	mp3singer=dyh(rs("mp3singer"))
	mp3yuyan=dyh(rs("mp3yuyan"))
	mp3gongsi=dyh(rs("mp3gongsi"))
	mp3time=dyh(rs("mp3time"))
	mp3type=rs("mp3type")
	mp3name=dyh(rs("mp3name"))
	musll=dyh(rs("musll"))
	musicnamelist=dyh(rs("musicnamelist"))
	musicid=dyh(rs("musicid"))
	mp3path=dyh(rs("mp3path"))
	cjmp3path=dyh(rs("cjmp3path"))
	wmapath=dyh(rs("wmapath"))
	xzmp3path=dyh(rs("xzmp3path"))
	Cookie=dyh(rs("Cookie"))
	songpath=dyh(rs("songpath"))
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>第六音乐厅音乐采集器-修改配置</title>
<style type="text/css">
<!--
.nr {
	font-size: 12px;
}
-->
</style>
</head>

<body>
<FORM action=6ting2-11.asp method=post name=id>
<table class="tableBorder" width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td background="../../admin/images/manage/admin_bg_1.gif"><table class="tableBorder" width="100%" border="0" cellspacing="1" cellpadding="0">
        <tr> 
          <td height="25" align="center" class="nr"><strong>添加站点第一步 设置站点属性</strong></td>
        </tr>
        <tr> 
          <td height="25" align="center" bgcolor="#FFFFFF"><span class="nr">采集站点名称：</span> 
            <input name="zdname" type="text" id="zdname" value="<%=zdname%>" size="30"> </td>
        </tr>
        <tr> 
          <td height="25" align="center" bgcolor="#FFFFFF"><span class="nr">采集站点地址：</span> 
            <input name="zdurl" type="text" id="zdurl" value="<%=zdurl%>" size="30"> </td>
        </tr>
		 <tr> 
            <td height="25" align="center" bgcolor="#FFFFFF"><span class="nr">图片保存路径：</span> 
              <input name="imglj" type="text" id="imglj" value="<%=imglj%>" size="30">&nbsp;<span class="nr">以"\"结束，目录必须存在，否则出错
              <br><font color=red>(建议图片路径存放在,网站根目录Photo文件下例如:<strong>d:\skymusic\phot\)</strong></font></span>
              
            </td>
          </tr>
          <tr> 
            <td height="25" align="center" bgcolor="#FFFFFF"><span class="nr">音乐保存路径：</span> 
              <input name="wmalj" type="text" id="wmalj" value="<%=wmalj%>" size="30">&nbsp;<span class="nr">以"\"结束，目录必须存在，否则出错</span>
            </td>
          </tr>
        <tr> 
          <td height="25" align="center" bgcolor="#FFFFFF"><input name="id" type="text" id="id" size="50" value="<%=id%>" style="display:none">  <input name="sxbc" type="submit" id="sxbc" value="保存"> 
          </td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
<FORM action=6ting2-22.asp method=post name=id>
<table class="tableBorder" width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td background="../../admin/images/manage/admin_bg_1.gif"><table class="tableBorder" width="100%" border="0" cellspacing="1" cellpadding="0">
        <tr> 
          <td height="25" colspan="2" align="center" class="nr"><strong>添加站点第二步 
            设置采集属性</strong></td>
        </tr>
        <tr> 
          <td width="150" align="right" bgcolor="#FFFFFF"><span class="nr">专辑页面地址：</span> 
          </td>
          <td align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><font color="#FF0000"> 
                    <textarea name="url" cols="50" rows="3" id="url"><%=url%></textarea>
                  <span class="nr"> * </span></font></td>
              </tr>
              <tr> 
                <td class="nr">必填，专辑地址里面的专辑ID用[id]替换注意大小写，比如说要采集http://www.n168.com/这个站，它里面的专辑页面地址为http://music.n168.com/musiclist/1.htm，这里的1就是专辑的ID所以我们上面这里要填http://music.n168.com/musiclist/[id].htm</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF"><span class="nr">专辑页面区域：</span> 
          </td>
          <td height="12" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="body" cols="50" rows="3" id="body"><%=body%></textarea></td>
              </tr>
              <tr> 
                <td class="nr">可选，默认不填的话只采集&lt;body&gt;到&lt;/body&gt;中间的内容,你也可以指定一个你要采集的起始和终止内容中间用|分开就行了，不过你指定的这个区域的内容要包括采集的相关信息的，比如专辑名称呀，专辑图片等的。</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">专辑图片地址：</td>
          <td height="12" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="mp3img" cols="50" rows="3"><%=mp3img%></textarea> <span class="nr"><font color="#FF0000">*</font></span></td>
              </tr>
              <tr> 
                <td><span class="nr">必填，要采集专辑图片的起始和终止内容中间用|分开行了。</span></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">专辑图片地址前半部分：</td>
          <td height="12" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><input name="mp3imgurl" type="text" id="mp3imgurl" value="<%=mp3imgurl%>" size="50"> 
                  <span class="nr"><font color="#FF0000">*</font></span></td>
              </tr>
              <tr> 
                <td class="nr">必填，比如我们要采http://www.n168.com/这个站，前面所采集出来的专辑图片地址为/SpecialPic/N168_Com_974362.jpg这个，这不是一个完整的URL地址下载图片时会出错的，所以我们要加上前半部分，http://pic.qq320.com这样得到http://pic.qq320.com/SpecialPic/N168_Com_974362.jpg才是一个完整的地址，这样才可以把图片下载下来。</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">图片地址排除不下载内容：</td>
          <td height="12" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><input name="nomp3img" type="text" id="nomp3img" value="<%=nomp3img%>" size="50"></td>
              </tr>
              <tr> 
                <td class="nr">可选，如果图片地址中包含上面所填写内容将不会被下载到本地，比如包含nophoto.gif这个代表这个专辑没有图片，所以这个图片不用下载本地。</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">专辑名称：</td>
          <td height="25" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="mp3zjname" cols="50" rows="3" id="mp3zjname"><%=mp3zjname%></textarea> 
                  <font color="#FF0000"><span class="nr">*</span></font></td>
              </tr>
              <tr> 
                <td class="nr">必填，采集专辑名称的起始和终止内容，中间用|分开。</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">专辑简介：</td>
          <td height="25" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="mp3about" cols="50" rows="3" id="mp3about"><%=mp3about%></textarea> 
                  <span class="nr"><font color="#FF0000">*</font></span></td>
              </tr>
              <tr> 
                <td class="nr">必填，采集专辑简介的起始和终止内容，中间用|分开。</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">专辑歌手：</td>
          <td height="25" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="mp3singer" cols="50" rows="3" id="mp3singer"><%=mp3singer%></textarea> 
                  <font color="#FF0000"><span class="nr">*</span></font></td>
              </tr>
              <tr> 
                <td class="nr">必填，采集专辑歌手的起始和终止内容，中间用|分开。</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">专辑语言：</td>
          <td height="25" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="mp3yuyan" cols="50" rows="3" id="mp3yuyan"><%=mp3yuyan%></textarea> 
                  <span class="nr"><font color="#FF0000">*</font></span></td>
              </tr>
              <tr> 
                <td class="nr">必填，采集专辑语言的起始和终止内容，中间用|分开。</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">专辑发行公司：</td>
          <td height="25" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="mp3gongsi" cols="50" rows="3" id="mp3gongsi"><%=mp3gongsi%></textarea> 
                  <span class="nr"><font color="#FF0000">*</font></span></td>
              </tr>
              <tr> 
                <td class="nr">必填，采集专辑发行公司的起始和终止内容，中间用|分开。</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">专辑发行时间：</td>
          <td height="25" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="mp3time" cols="50" rows="3" id="mp3time"><%=mp3time%></textarea> 
                  <font color="#FF0000"><span class="nr">*</span></font></td>
              </tr>
              <tr> 
                <td class="nr">必填，采集专辑发行时间的起始和终止内容，中间用|分开。</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">歌手类别：</td>
          <td align="left" bgcolor="#FFFFFF"> <table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="mp3type" cols="50" rows="3" id="mp3type"><%=mp3type%></textarea> 
                  <font color="#FF0000"> *</font></td>
              </tr>
              <tr> 
                <td class="nr">必填，采集专辑歌手类别的起始和终止内容，意思是说这个专辑的歌手是属于那个类别的，比如说是华人男歌还是华人女歌手等，中间用|分开。</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td colspan="2" align="right" bgcolor="#FFFFFF">&nbsp;</td>
        </tr>
        <tr> 
          <td height="25" colspan="2" align="center" bgcolor="#FFFFFF"><input name="id" type="text" id="id" size="50" value="<%=id%>" style="display:none"> 
            <input name="sxbc2" type="submit" id="sxbc2" value="保存"> </td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
<FORM action=6ting2-33.asp method=post name=id>
<table class="tableBorder" width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td background="../../admin/images/manage/admin_bg_1.gif"> <table class="tableBorder" width="100%" border="0" cellspacing="1" cellpadding="0">
        <tr> 
          <td height="25" colspan="2" align="center" class="nr"><strong>添加站点第三步 
            设置采集属性</strong></td>
        </tr>
        <tr> 
          <td width="150" align="right" bgcolor="#FFFFFF" class="nr">音乐列表区域：</td>
          <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="musll" cols="50" rows="3" id="musll"><%=musll%></textarea> 
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
                <td><textarea name="musicnamelist" cols="50" rows="3" id="musicnamelist"><%=musicnamelist%></textarea> 
                  <span class="nr"><font color="#FF0000">*</font></span></td>
              </tr>
              <tr> 
                <td><p class="nr">必填，找出每首页的开始和终止内容进一步缩小采集范围，中间用|分开</p></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td width="150" align="right" bgcolor="#FFFFFF" class="nr">音乐名称：</td>
          <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="mp3name" cols="50" rows="3" id="mp3name"><%=mp3name%></textarea> 
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
                <td><textarea name="musicid" cols="50" rows="3" id="musicid"><%=musicid%></textarea> 
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
                <td><input name="cjmp3path" type="text" id="cjmp3path" value="<%=cjmp3path%>" size="50"> 
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
                <td><textarea name="mp3path" cols="50" rows="3" id="mp3path"><%=mp3path%></textarea> 
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
                <td><input name="wmapath" type="text" id="wmapath" value="<%=wmapath%>" size="50">                </td>
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
                <td><textarea name="xzmp3path" cols="50" rows="3" id="xzmp3path"><%=xzmp3path%></textarea></td>
              </tr>
              <tr> 
                <td class="nr">可选的，如果你采的站前半部分地址不一样，你就把上面的留空，在这里把路径的全部地址给找出来，起始和终止中间用|分开。</td>
              </tr>
            </table></td>
        </tr>
		 <tr>
		   <td align="right" bgcolor="#FFFFFF" class="nr">采集路径序号：</td>
		   <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
               <tr>
                 <td><input name="songpath" type="text" id="songpath" value="<%=songpath%>" size="50">
                 </td>
               </tr>
               <tr>
                 <td class="nr">必选，此处写你的"<a href="../../admin/Admin_path.Asp">歌曲地址管理</a>"一致,例如,采集7T7T,song_path2 = "http://s2.7t7t.com:81",那么此处填写2,</td>
               </tr>
           </table></td>
		 </tr>
		 <tr> 
          <td width="150" align="right" bgcolor="#FFFFFF" class="nr">Cookie验证页面：</td>
          <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><input name="Cookie" type="text" id="Cookie" value="<%=Cookie%>" size="50">                </td>
              </tr>
              <tr> 
                <td class="nr">可选，如果网站采集防盗连了，Cookie验证的是那个页面，如果是当前采集页请填写当前采集页，否则填上Cookie验证页的网址</td>
              </tr>
            </table></td>
        </tr>
        <tr align="center"> 
          <td height="30" colspan="2" bgcolor="#FFFFFF"> <input name="id" type="text" id="id" size="50" value="<%=id%>" style="display:none"> 
            <input name="sxbc3" type="submit" id="sxbc3" value="保存"></td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>
</html>
