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
<title>�������������ֲɼ���-�޸�����</title>
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
          <td height="25" align="center" class="nr"><strong>���վ���һ�� ����վ������</strong></td>
        </tr>
        <tr> 
          <td height="25" align="center" bgcolor="#FFFFFF"><span class="nr">�ɼ�վ�����ƣ�</span> 
            <input name="zdname" type="text" id="zdname" value="<%=zdname%>" size="30"> </td>
        </tr>
        <tr> 
          <td height="25" align="center" bgcolor="#FFFFFF"><span class="nr">�ɼ�վ���ַ��</span> 
            <input name="zdurl" type="text" id="zdurl" value="<%=zdurl%>" size="30"> </td>
        </tr>
		 <tr> 
            <td height="25" align="center" bgcolor="#FFFFFF"><span class="nr">ͼƬ����·����</span> 
              <input name="imglj" type="text" id="imglj" value="<%=imglj%>" size="30">&nbsp;<span class="nr">��"\"������Ŀ¼������ڣ��������
              <br><font color=red>(����ͼƬ·�������,��վ��Ŀ¼Photo�ļ�������:<strong>d:\skymusic\phot\)</strong></font></span>
              
            </td>
          </tr>
          <tr> 
            <td height="25" align="center" bgcolor="#FFFFFF"><span class="nr">���ֱ���·����</span> 
              <input name="wmalj" type="text" id="wmalj" value="<%=wmalj%>" size="30">&nbsp;<span class="nr">��"\"������Ŀ¼������ڣ��������</span>
            </td>
          </tr>
        <tr> 
          <td height="25" align="center" bgcolor="#FFFFFF"><input name="id" type="text" id="id" size="50" value="<%=id%>" style="display:none">  <input name="sxbc" type="submit" id="sxbc" value="����"> 
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
          <td height="25" colspan="2" align="center" class="nr"><strong>���վ��ڶ��� 
            ���òɼ�����</strong></td>
        </tr>
        <tr> 
          <td width="150" align="right" bgcolor="#FFFFFF"><span class="nr">ר��ҳ���ַ��</span> 
          </td>
          <td align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><font color="#FF0000"> 
                    <textarea name="url" cols="50" rows="3" id="url"><%=url%></textarea>
                  <span class="nr"> * </span></font></td>
              </tr>
              <tr> 
                <td class="nr">���ר����ַ�����ר��ID��[id]�滻ע���Сд������˵Ҫ�ɼ�http://www.n168.com/���վ���������ר��ҳ���ַΪhttp://music.n168.com/musiclist/1.htm�������1����ר����ID����������������Ҫ��http://music.n168.com/musiclist/[id].htm</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF"><span class="nr">ר��ҳ������</span> 
          </td>
          <td height="12" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="body" cols="50" rows="3" id="body"><%=body%></textarea></td>
              </tr>
              <tr> 
                <td class="nr">��ѡ��Ĭ�ϲ���Ļ�ֻ�ɼ�&lt;body&gt;��&lt;/body&gt;�м������,��Ҳ����ָ��һ����Ҫ�ɼ�����ʼ����ֹ�����м���|�ֿ������ˣ�������ָ����������������Ҫ�����ɼ��������Ϣ�ģ�����ר������ѽ��ר��ͼƬ�ȵġ�</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">ר��ͼƬ��ַ��</td>
          <td height="12" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="mp3img" cols="50" rows="3"><%=mp3img%></textarea> <span class="nr"><font color="#FF0000">*</font></span></td>
              </tr>
              <tr> 
                <td><span class="nr">���Ҫ�ɼ�ר��ͼƬ����ʼ����ֹ�����м���|�ֿ����ˡ�</span></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">ר��ͼƬ��ַǰ�벿�֣�</td>
          <td height="12" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><input name="mp3imgurl" type="text" id="mp3imgurl" value="<%=mp3imgurl%>" size="50"> 
                  <span class="nr"><font color="#FF0000">*</font></span></td>
              </tr>
              <tr> 
                <td class="nr">�����������Ҫ��http://www.n168.com/���վ��ǰ�����ɼ�������ר��ͼƬ��ַΪ/SpecialPic/N168_Com_974362.jpg������ⲻ��һ��������URL��ַ����ͼƬʱ�����ģ���������Ҫ����ǰ�벿�֣�http://pic.qq320.com�����õ�http://pic.qq320.com/SpecialPic/N168_Com_974362.jpg����һ�������ĵ�ַ�������ſ��԰�ͼƬ����������</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">ͼƬ��ַ�ų����������ݣ�</td>
          <td height="12" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><input name="nomp3img" type="text" id="nomp3img" value="<%=nomp3img%>" size="50"></td>
              </tr>
              <tr> 
                <td class="nr">��ѡ�����ͼƬ��ַ�а�����������д���ݽ����ᱻ���ص����أ��������nophoto.gif����������ר��û��ͼƬ���������ͼƬ�������ر��ء�</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">ר�����ƣ�</td>
          <td height="25" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="mp3zjname" cols="50" rows="3" id="mp3zjname"><%=mp3zjname%></textarea> 
                  <font color="#FF0000"><span class="nr">*</span></font></td>
              </tr>
              <tr> 
                <td class="nr">����ɼ�ר�����Ƶ���ʼ����ֹ���ݣ��м���|�ֿ���</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">ר����飺</td>
          <td height="25" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="mp3about" cols="50" rows="3" id="mp3about"><%=mp3about%></textarea> 
                  <span class="nr"><font color="#FF0000">*</font></span></td>
              </tr>
              <tr> 
                <td class="nr">����ɼ�ר��������ʼ����ֹ���ݣ��м���|�ֿ���</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">ר�����֣�</td>
          <td height="25" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="mp3singer" cols="50" rows="3" id="mp3singer"><%=mp3singer%></textarea> 
                  <font color="#FF0000"><span class="nr">*</span></font></td>
              </tr>
              <tr> 
                <td class="nr">����ɼ�ר�����ֵ���ʼ����ֹ���ݣ��м���|�ֿ���</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">ר�����ԣ�</td>
          <td height="25" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="mp3yuyan" cols="50" rows="3" id="mp3yuyan"><%=mp3yuyan%></textarea> 
                  <span class="nr"><font color="#FF0000">*</font></span></td>
              </tr>
              <tr> 
                <td class="nr">����ɼ�ר�����Ե���ʼ����ֹ���ݣ��м���|�ֿ���</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">ר�����й�˾��</td>
          <td height="25" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="mp3gongsi" cols="50" rows="3" id="mp3gongsi"><%=mp3gongsi%></textarea> 
                  <span class="nr"><font color="#FF0000">*</font></span></td>
              </tr>
              <tr> 
                <td class="nr">����ɼ�ר�����й�˾����ʼ����ֹ���ݣ��м���|�ֿ���</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">ר������ʱ�䣺</td>
          <td height="25" align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="mp3time" cols="50" rows="3" id="mp3time"><%=mp3time%></textarea> 
                  <font color="#FF0000"><span class="nr">*</span></font></td>
              </tr>
              <tr> 
                <td class="nr">����ɼ�ר������ʱ�����ʼ����ֹ���ݣ��м���|�ֿ���</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="right" bgcolor="#FFFFFF" class="nr">�������</td>
          <td align="left" bgcolor="#FFFFFF"> <table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="mp3type" cols="50" rows="3" id="mp3type"><%=mp3type%></textarea> 
                  <font color="#FF0000"> *</font></td>
              </tr>
              <tr> 
                <td class="nr">����ɼ�ר������������ʼ����ֹ���ݣ���˼��˵���ר���ĸ����������Ǹ����ģ�����˵�ǻ����и軹�ǻ���Ů���ֵȣ��м���|�ֿ���</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td colspan="2" align="right" bgcolor="#FFFFFF">&nbsp;</td>
        </tr>
        <tr> 
          <td height="25" colspan="2" align="center" bgcolor="#FFFFFF"><input name="id" type="text" id="id" size="50" value="<%=id%>" style="display:none"> 
            <input name="sxbc2" type="submit" id="sxbc2" value="����"> </td>
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
          <td height="25" colspan="2" align="center" class="nr"><strong>���վ������� 
            ���òɼ�����</strong></td>
        </tr>
        <tr> 
          <td width="150" align="right" bgcolor="#FFFFFF" class="nr">�����б�����</td>
          <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="musll" cols="50" rows="3" id="musll"><%=musll%></textarea> 
                  <span class="nr"><font color="#FF0000">*</font></span></td>
              </tr>
              <tr> 
                <td class="nr">���ѡ�������б����ʼ����ֹ���ݣ��м���|�ֿ���</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td width="150" align="right" bgcolor="#FFFFFF" class="nr">ÿ��������ʼ����ֹ��</td>
          <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="musicnamelist" cols="50" rows="3" id="musicnamelist"><%=musicnamelist%></textarea> 
                  <span class="nr"><font color="#FF0000">*</font></span></td>
              </tr>
              <tr> 
                <td><p class="nr">����ҳ�ÿ��ҳ�Ŀ�ʼ����ֹ���ݽ�һ����С�ɼ���Χ���м���|�ֿ�</p></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td width="150" align="right" bgcolor="#FFFFFF" class="nr">�������ƣ�</td>
          <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="mp3name" cols="50" rows="3" id="mp3name"><%=mp3name%></textarea> 
                  <font color="#FF0000"><span class="nr"> *</span></font></td>
              </tr>
              <tr> 
                <td class="nr">����������ǲ��ҳ�����ÿ�׸����ֹ���ˣ���������������������׸�����ƣ�������������д����ʱ�ɳ����Ľ��һ��Ҫ�����������ƺ�����ID��</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td width="150" align="right" bgcolor="#FFFFFF" class="nr">����ID��</td>
          <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="musicid" cols="50" rows="3" id="musicid"><%=musicid%></textarea> 
                  <font color="#FF0000"><span class="nr">*</span></font></td>
              </tr>
              <tr> 
                <td class="nr">�����ÿ��������ʼ����ֹ������ÿ�׸������ID���ó����ID�����ǾͿ��������Ĳ���ҳ����������ID�ʹ������׸裬�����������ǲ����ҳ����ֵ�·����</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td width="150" align="right" bgcolor="#FFFFFF" class="nr">�ɼ�����·���ĵ�ַ��</td>
          <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><input name="cjmp3path" type="text" id="cjmp3path" value="<%=cjmp3path%>" size="50"> 
                  <span class="nr"><font color="#FF0000">*</font></span></td>
              </tr>
              <tr> 
                <td class="nr">�������ĵ�ַ���������ֲ��ŵĵ�ַҲ�������������صĵ�ַ��ֻҪ��������ID�Ϳ��������ҳ��ó�����·�����ľ����ˣ�����ID��[musicID]�滻���ˡ�</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td width="150" align="right" bgcolor="#FFFFFF" class="nr">����·����</td>
          <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="mp3path" cols="50" rows="3" id="mp3path"><%=mp3path%></textarea> 
                  <span class="nr"><font color="#FF0000">*</font></span></td>
              </tr>
              <tr> 
                <td class="nr">���������ɼ��������ҳ�����·������ʼ����ֹ�����м���|�ֿ�����һ����˵����ֻ�ó�·���ĺ�벿�ֿ����ˣ������ܰѱ��˵�ȫ��·�������ɣ�Ҫ���˼��޸�·�����㲻������ˡ���</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td width="150" align="right" bgcolor="#FFFFFF" class="nr">����·��ǰ�벿�֣�</td>
          <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><input name="wmapath" type="text" id="wmapath" value="<%=wmapath%>" size="50">                </td>
              </tr>
              <tr> 
                <td class="nr">��ѡ�������ɼ���վ��ǰ�벿�ֵ�ַȫ��һ���������������ǰ�벿�ֵ�ַ�������ͺ��������֣������ɵ�վǰ�벿�ֵ�ַ��һ���ģ�����������վ����ˡ�</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td width="150" align="right" bgcolor="#FFFFFF" class="nr">�������ص�ַ��</td>
          <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><textarea name="xzmp3path" cols="50" rows="3" id="xzmp3path"><%=xzmp3path%></textarea></td>
              </tr>
              <tr> 
                <td class="nr">��ѡ�ģ������ɵ�վǰ�벿�ֵ�ַ��һ������Ͱ���������գ��������·����ȫ����ַ���ҳ�������ʼ����ֹ�м���|�ֿ���</td>
              </tr>
            </table></td>
        </tr>
		 <tr>
		   <td align="right" bgcolor="#FFFFFF" class="nr">�ɼ�·����ţ�</td>
		   <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
               <tr>
                 <td><input name="songpath" type="text" id="songpath" value="<%=songpath%>" size="50">
                 </td>
               </tr>
               <tr>
                 <td class="nr">��ѡ���˴�д���"<a href="../../admin/Admin_path.Asp">������ַ����</a>"һ��,����,�ɼ�7T7T,song_path2 = "http://s2.7t7t.com:81",��ô�˴���д2,</td>
               </tr>
           </table></td>
		 </tr>
		 <tr> 
          <td width="150" align="right" bgcolor="#FFFFFF" class="nr">Cookie��֤ҳ�棺</td>
          <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><input name="Cookie" type="text" id="Cookie" value="<%=Cookie%>" size="50">                </td>
              </tr>
              <tr> 
                <td class="nr">��ѡ�������վ�ɼ��������ˣ�Cookie��֤�����Ǹ�ҳ�棬����ǵ�ǰ�ɼ�ҳ����д��ǰ�ɼ�ҳ����������Cookie��֤ҳ����ַ</td>
              </tr>
            </table></td>
        </tr>
        <tr align="center"> 
          <td height="30" colspan="2" bgcolor="#FFFFFF"> <input name="id" type="text" id="id" size="50" value="<%=id%>" style="display:none"> 
            <input name="sxbc3" type="submit" id="sxbc3" value="����"></td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>
</html>
