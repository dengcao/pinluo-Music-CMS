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
	errmsg=errmsg+"<br>"+"<li>�����Ҫ����д��������ݣ�"
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
<title>����������ͨ�������ɼ���--��Ӳɼ�վ��ڶ���</title>
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
            <td height="25" colspan="2" align="center" class="nr"><strong>���վ������� 
              ���òɼ�����</strong></td>
          </tr>
          <tr> 
            <td width="150" align="right" bgcolor="#FFFFFF" class="nr">�����б�����</td>
            <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td><textarea name="musll" cols="50" rows="3" id="musll"></textarea> 
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
                  <td><textarea name="musicnamelist" cols="50" rows="3" id="musicnamelist"></textarea> 
                    <span class="nr"><font color="#FF0000">*</font></span></td>
                </tr>
                <tr> 
                  <td><p class="nr">����ҳ�ÿ��ҳ�Ŀ�ʼ����ֹ���ݽ�һ����С�ɼ���Χ���м���|�ֿ���</p></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td width="150" align="right" bgcolor="#FFFFFF" class="nr">�������ƣ�</td>
            <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td><textarea name="mp3name" cols="50" rows="3" id="mp3name"></textarea> 
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
                  <td><textarea name="musicid" cols="50" rows="3" id="musicid"></textarea> 
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
                  <td><input name="cjmp3path" type="text" id="cjmp3path" size="50"> 
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
                  <td><textarea name="mp3path" cols="50" rows="3" id="mp3path"></textarea> 
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
                  <td><input name="wmapath" type="text" id="wmapath" size="50">                  </td>
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
                  <td><textarea name="xzmp3path" cols="50" rows="3" id="xzmp3path"></textarea></td>
                </tr>
                <tr> 
                  <td class="nr">��ѡ�ģ������ɵ�վǰ�벿�ֵ�ַ��һ������Ͱ���������գ��������·����ȫ����ַ���ҳ�������ʼ����ֹ�м���|�ֿ���</td>
                </tr>
              </table></td>
          </tr>
		  <tr> 
          <td width="150" align="right" bgcolor="#FFFFFF" class="nr">Cookie��֤ҳ�棺</td>
          <td bgcolor="#FFFFFF"><table class="tableBorder" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><input name="Cookie" type="text" id="Cookie" value="��ǰ�ɼ�ҳ" size="50">                </td>
              </tr>
              <tr> 
                <td class="nr">��ѡ�������վ�ɼ��������ˣ�Cookie��֤�����Ǹ�ҳ�棬����ǵ�ǰ�ɼ�ҳ����д��ǰ�ɼ�ҳ����������Cookie��֤ҳ����ַ</td>
              </tr>
            </table></td>
        </tr>
          <tr align="center"> 
            <td height="30" colspan="2" bgcolor="#FFFFFF"> 
             <input name="id" type="text" id="id" size="50" value="<%=id%>" style="display:none"> <input name="sxbc" type="submit" id="sxbc" value="���浽��һ��"></td>
          </tr>
        </table>
    </td>
  </tr>
</table>
</form>
</body>
</html>
