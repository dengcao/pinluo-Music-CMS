<!--#include file = "../PL_config.asp"-->
<!--#include file="function.asp"-->
<%CheckAdmin1%>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<title>生成网页 - <%=webname%></title>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name="Keywords" content="<%=keyword%>"></meta>
<meta name="Description" content="<%=keyword%>"></meta>
<link href="<%=favicon%>" rel="shortcut icon">
<meta name="generator" content="网站作者：品络科技 www.pinluo.com">
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
response.write "<script>alert('要生成的网址必须以“http://”开头！请重新输入！');history.back(); </script>" 
response.End()
end if
bianma=Trim(Request.Form("bianma"))
if wenjianming="../index.asp" then 
response.write "<script>alert('请不要生成../index.asp的文件名！该文件无需生成！');history.back(); </script>" 
response.End()
else 
end if

'常用函数 

'1、输入url目标网页地址，返回值getHTTPPage是目标网页的html代码 
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
'2、转换乱玛，直接用xmlhttp调用有中文字符的网页得到的将是乱玛，可以通过adodb.stream组件进行转换 
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

Set openFile=FileObject.OpenTextfile(server.mapPath(filename),2,true) 'true为不存在自行建立

openFile.writeline(sText) 

Set OpenFile=nothing 

response.write "<br /><br /><b><font color=red>页面已成功生成 ！<a href="&filename&" target=_blank>"&filename&"&nbsp;&nbsp;&nbsp;点击查看</a></font></b><br>"

%> </center>
<script> 
alert("页面生成成功！"); 

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
        
        <p>要生成的网页：
          <label>
          <input name="urldizhi" type="text" id="urldizhi" value="<%=yaoshengcheng%>" size="58" />
          </label>
绝对URL路径</p>
        <p>生成网页编码：
          <label>
          <input name="bianma" type="text" id="bianma" value="GB2312" size="46" />
          <select name="select" onclick="javascript:document.getElementById('bianma').value=document.getElementById('select').value">>
            <option value="GB2312">GB2312</option>
            <option value="UTF-8">UTF-8</option>
          </select>
          </label>
          默认GB2312        </p>
        <p>生成的文件名：
          <label>
          <input name="wenjianming" type="text" id="wenjianming" value="<%=shengchengmulu%>" size="58" />
          </label>
        用相对路径</p>
        <div align="center">
              <input name="act" type="hidden" id="act" value="yes" />
              <input type="submit" name="Submit" value=" 开始生成 " />
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
