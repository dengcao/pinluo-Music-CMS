<!--#include file = "../PL_config.asp"-->
<!--#include file="function.asp"-->
<%CheckAdmin1%>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<title>������ҳ - <%=webname%></title>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name="Keywords" content="<%=keyword%>"></meta>
<meta name="Description" content="<%=keyword%>"></meta>
<link href="<%=favicon%>" rel="shortcut icon">
<meta name="generator" content="��վ���ߣ�Ʒ��Ƽ� www.pinluo.com">
<LINK href="admin.css" type=text/css rel=stylesheet>
<center>
<%yaoshengcheng=Trim(Request.QueryString("ysc"))
shengchengmulu=Trim(Request.QueryString("scmulu"))
act=Trim(Request.Form("act"))
if act="yes" then
dim wenjianming,urldizhi,bianma
wenjianming=Trim(Request.Form("wenjianming"))
urldizhi=Trim(Request.Form("urldizhi"))
if instr(urldizhi,"http://")>0 then 
else 
response.write "<script>alert('Ҫ���ɵ���ַ�����ԡ�http://����ͷ�����������룡');history.back(); </script>" 
response.End()
end if
bianma=Trim(Request.Form("bianma"))
if wenjianming="../index.asp" then 
response.write "<script>alert('�벻Ҫ����../index.asp���ļ��������ļ��������ɣ�');history.back(); </script>" 
response.End()
else 
end if

'���ú��� 

'1������urlĿ����ҳ��ַ������ֵgetHTTPPage��Ŀ����ҳ��html���� 
function getHTTPPage(url) 
dim Http 
set Http=server.createobject("MSXML2.XMLHTTP") 
Http.open "GET",url,false 
Http.send() 
if Http.readystate<>4 then 
exit function 
end if 
getHTTPPage=bytesToBSTR(Http.responseBody,bianma) 
set http=nothing 
if err.number<>0 then err.Clear 
end function 
'2��ת�����ֱ꣬����xmlhttp�����������ַ�����ҳ�õ��Ľ������꣬����ͨ��adodb.stream�������ת�� 
Function BytesToBstr(body,Cset) 

dim objstream 

set objstream = Server.CreateObject("adodb.stream") 

objstream.Type = 1 

objstream.Mode =3 

objstream.Open 

objstream.Write body 

objstream.Position = 0 

objstream.Type = 2 

objstream.Charset = Cset 

BytesToBstr = objstream.ReadText 

objstream.Close 

set objstream = nothing 
End Function


txtURL=urldizhi

'txtURL=server.MapPath("../index.asp")

sText = getHTTPPage(txtURL) 

Set FileObject=Server.CreateObject("Scripting.FileSystemObject") 

filename=wenjianming
'response.Write filename
'response.End()

Set openFile=FileObject.OpenTextfile(server.mapPath(filename),2,true) 'trueΪ���������н���

openFile.writeline(sText) 

Set OpenFile=nothing 

response.write "<br /><br /><b><font color=red>ҳ���ѳɹ����� ��<a href="&filename&" target=_blank>"&filename&"&nbsp;&nbsp;&nbsp;����鿴</a></font></b><br>"

%> </center>
<script> 
alert("ҳ�����ɳɹ���"); 

//history.back(); 

</script>
<%else
end if%>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="646" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="646"><form id="form1" name="form1" method="post" action="">
        
        <p>Ҫ���ɵ���ҳ��
          <label>
          <input name="urldizhi" type="text" id="urldizhi" value="<%=yaoshengcheng%>" size="58" />
          </label>
����URL·��</p>
        <p>������ҳ���룺
          <label>
          <input name="bianma" type="text" id="bianma" value="GB2312" size="46" />
          <select name="select" onclick="javascript:document.getElementById('bianma').value=document.getElementById('select').value">>
            <option value="GB2312">GB2312</option>
            <option value="UTF-8">UTF-8</option>
          </select>
          </label>
          Ĭ��GB2312        </p>
        <p>���ɵ��ļ�����
          <label>
          <input name="wenjianming" type="text" id="wenjianming" value="<%=shengchengmulu%>" size="58" />
          </label>
        �����·��</p>
        <div align="center">
              <input name="act" type="hidden" id="act" value="yes" />
              <input type="submit" name="Submit" value=" ��ʼ���� " />
        </div>
        </label>
        <p align="center">&nbsp;</p>
      </form>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
