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
	errmsg=errmsg+"<br>"+"<li>�ɼ�վ������ƺ͵�ַ����Ϊ�գ�"
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
<title>����������ͨ�������ɼ���--��Ӳɼ�վ��ڶ���</title>
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
            <td height="25" colspan="2" align="center" class="nr"><strong>���վ��ڶ��� 
              ���òɼ�����</strong></td>
          </tr>
          <tr> 
            <td width="150" align="right" bgcolor="#FFFFFF"><span class="nr">ר��ҳ���ַ��</span> 
            </td>
            <td align="left" bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td><font color="#FF0000"> 
                    <textarea name="url" cols="50" rows="3" id="url"></textarea>
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
                  <td><textarea name="body" cols="50" rows="3" id="body"></textarea></td>
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
                  <td><textarea name="mp3img" cols="50" rows="3"></textarea> 
                    <span class="nr"><font color="#FF0000">*</font></span></td>
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
                  <td><input name="mp3imgurl" type="text" id="mp3imgurl" size="50"> 
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
                  <td><input name="nomp3img" type="text" id="nomp3img" size="50"></td>
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
                  <td><textarea name="mp3zjname" cols="50" rows="3" id="mp3zjname"></textarea> 
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
                  <td><textarea name="mp3about" cols="50" rows="3" id="mp3about"></textarea> 
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
                  <td><textarea name="mp3singer" cols="50" rows="3" id="mp3singer"></textarea> 
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
                  <td><textarea name="mp3yuyan" cols="50" rows="3" id="mp3yuyan"></textarea> 
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
                  <td><textarea name="mp3gongsi" cols="50" rows="3" id="mp3gongsi"></textarea> 
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
                  <td><textarea name="mp3time" cols="50" rows="3" id="mp3time"></textarea> 
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
                  <td><textarea name="mp3type" cols="50" rows="3" id="mp3type"></textarea> 
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
              <input name="sxbc" type="submit" id="sxbc" value="���浽��һ��"> </td>
          </tr>
        </table></td>
  </tr>
</table>
</FORM>
</body></html>
