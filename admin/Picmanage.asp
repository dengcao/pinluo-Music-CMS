<!--#include file="const.asp"-->
<%CheckAdmin3%>
<%pagename="picmanage"%>
<!--#include file="Top.Asp"-->
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

  Domain=Request.ServerVariables("SERVER_NAME")
  soFilePath=Request.ServerVariables("PATH_INFO")
  soFilePath=lcase(left(soFilePath,instrRev(soFilePath,"/")))
  sowinpath=Domain&soFilePath

  Set MyFile=Server.CreateObject("Scripting.FileSystemObject")
  if request.form("result")="del" then
    Num=request.form("FileName").count
    for x=1 to Num
      if MyFile.FileExists(Server.Mappath("..")&"\photo\"&request.form("FileName")(x)&"") then
        MyFile.DeleteFile(Server.Mappath("..")&"\photo\"&request.form("FileName")(x)&"")
      end if
    next
  end if
  Page=request.querystring("page")
  if Page<=1 or Page="" then Page=1
  PageSize=15
  Domain=Request.ServerVariables("SERVER_NAME")
  soFilePath=Request.ServerVariables("PATH_INFO")
  soFilePath=lcase(left(soFilePath,instrRev(soFilePath,"/")))
  socount=len(soFilePath)
  soFilePath=lcase(left(soFilePath,socount-1))
  soFilePath=lcase(left(soFilePath,instrRev(soFilePath,"/")))
  sowinpath="http://"&Domain&soFilePath
  FileCount=0
  Set FileFolder=MyFile.GetFolder(Server.MapPath("..")&"\photo")
  for each TheFile in FileFolder.Files
    FileCount=FileCount+1
    AFileSize=TheFile.size+AFileSize
  next
%>
<LINK href="admin.css" type=text/css rel=stylesheet>
<body bgcolor="#FFFFFF">
<script language="JavaScript">
function Del()
{
if(confirm("您确定要删除?\n\n DreamCtiy Theater System")
)
{return true;}
return false;}
function CheckAll(form)
{
for (var i=0;i<form.elements.length;i++)
{
var e = form.elements[i];
if (e.name != 'chkall')
e.checked = form.chkall.checked;
}
}
</script>
<form method=post action="">
  <table class="tableBorder" width="100%" border="0" cellspacing="1" cellpadding="0" align="center">
    <tr bgcolor="#FFFFFF" valign="middle" align="center"> 
      <td width="300%" height="2" colspan="3" > <table class="tableBorder" width="100%" border="0" cellspacing="1" cellpadding="2" bgcolor="#39867B">
          <tr bgcolor="#E1F4EE"> 
            <td width="34%" height=20 align=center background="images/manage/admin_bg_1.gif" bgcolor="#E1F4EE">文件名</td>
            <td width="35%" height=20 align=center background="images/manage/admin_bg_1.gif" bgcolor="#E1F4EE">上传时间</td>
            <td width="20%" height=20 align=center background="images/manage/admin_bg_1.gif" bgcolor="#E1F4EE">文件大小</td>
            <td width="11%" height=20 align=center background="images/manage/admin_bg_1.gif">删除</td>
          </tr>
          <%
  i=0
  for each thing in FileFolder.Files
  i=i+1
  if CCount>=PageSize then
    exit for
  elseif i>PageSize*(Page-1) then
  CCount=CCount+1

%>
          <tr bgcolor="#E1F4EE"> 
            <td width="34%" height=24 bgcolor="#FFFFFF" class="small1"> 
              <div align="left"> 
                <table class="tableBorder" width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr> 
                    <td width="18%"><table class="tableBorder" width="30" height="30" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
                        <tr> 
                          <td bgcolor="#FFFFFF"><a href="../photo/<%=thing.name%>" target="_blank"><img src="../photo/<%=thing.name%>" width="30" height="30" border="0"></a></td>
                        </tr>
                      </table></td>
                    <td width="82%" bgcolor="#FFFFFF"><a href=../photo/<%=thing.name%> target=_blank> 
                      <%=thing.name%></a></td>
                  </tr>
                </table>
            </div></td>
            <td width="35%" height=24 align=center bgcolor="#FFFFFF"><%=thing.DateLastModified%></td>
            <td width="20%" height=24 align=center bgcolor="#FFFFFF"><%=thing.Size&"(bt)"%></td>
            <td width="11%" height=24 align=center bgcolor="#FFFFFF"> 
              <input type="checkbox" name=FileName value=<%=thing.Name%>></td>
          </tr>
          <%
  end if
  next
%>
          <tr bgcolor="#FFFFFF"> 
            <td height=20 colspan=5 align=right> 
              <div align="center">共有<font color=red><b><%=FileCount%></b></font>个文件; 
                占用<font color=red><b><%=AFileSize/1024%></b></font><font color=#FF0000><b>K</b></font>空间&nbsp;&nbsp;&nbsp;&nbsp; 
                <input type=hidden value=del Name=result>
                <input type="checkbox" name="chkall" onClick="CheckAll(this.form)">
                选中所有 
                <input type=submit value=删除 onClick="return Del()" class=Anbut1>
            </div></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height=20 colspan=5> 
              <%
  PageCount=int(FileCount/PageSize)+1
  for i=1 to PageCount
    response.write "<a href=?Page="&i&"><b>第"&i&"页</b></a>　"
  next
%>
            </td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>
