<!--#include file="function.asp"-->
<%CheckAdmin1%>
<!--#include file="6tingconn.asp"-->
<%
founderr=false
zdname=checksql(request.form("zdname"))
zdurl=request.form("zdurl")
imglj=request.form("imglj")
wmalj=request.form("wmalj")

zdname=bqtf(zdname)
zdurl=bqtf(zdurl)
imglj=bqtf(imglj)
wmalj=bqtf(wmalj)

if zdname="" or zdurl="" then
	errmsg=errmsg+"<br>"+"<li>采集站点的名称和地址不能为空！"
	founderr=true
	call error()
	Response.End 
end if

set rs=server.CreateObject("ADODB.RecordSet")
	sql="select * from const"
	rs.open sql,conn1,3,2
		rs.addnew
		rs("zdname")=zdname
		rs("zdurl")=zdurl
		rs("imglj")=imglj
		rs("wmalj")=wmalj
		rs.update
	rs.close()
set rs=nothing

set rsedit=server.CreateObject("ADODB.RecordSet")
Set rsedit = Conn1.Execute("select top 1 * from const where zdname='"&zdname&"'")
ID=rsedit("ID")
rsedit.close
set rsedit=nothing
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
</head><body>

<FORM action=6ting2-2.asp method=post name=id>
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
                    <textarea name="url" cols="50" rows="3" id="url"></textarea>
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
                  <td><textarea name="body" cols="50" rows="3" id="body"></textarea></td>
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
                  <td><textarea name="mp3img" cols="50" rows="3"></textarea> 
                    <span class="nr"><font color="#FF0000">*</font></span></td>
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
                  <td><input name="mp3imgurl" type="text" id="mp3imgurl" size="50"> 
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
                  <td><input name="nomp3img" type="text" id="nomp3img" size="50"></td>
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
                  <td><textarea name="mp3zjname" cols="50" rows="3" id="mp3zjname"></textarea> 
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
                  <td><textarea name="mp3about" cols="50" rows="3" id="mp3about"></textarea> 
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
                  <td><textarea name="mp3singer" cols="50" rows="3" id="mp3singer"></textarea> 
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
                  <td><textarea name="mp3yuyan" cols="50" rows="3" id="mp3yuyan"></textarea> 
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
                  <td><textarea name="mp3gongsi" cols="50" rows="3" id="mp3gongsi"></textarea> 
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
                  <td><textarea name="mp3time" cols="50" rows="3" id="mp3time"></textarea> 
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
                  <td><textarea name="mp3type" cols="50" rows="3" id="mp3type"></textarea> 
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
              <input name="sxbc" type="submit" id="sxbc" value="保存到下一步"> </td>
          </tr>
        </table></td>
  </tr>
</table>
</FORM>
</body></html>
