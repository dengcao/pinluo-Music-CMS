<!--#include file="const.asp"-->
<%CheckAdmin3%>
<%pagename="eoff"%>
<!--#include file="Top.Asp"-->
<html>
<%
'
'����������������������������������������������������
'��                                                                   ��
'��                     Ʒ�����ֳ���ϵͳ1.0                              ��
'��                                                                   ��
'��     �ռ�����: Ʒ��  www.pinluo.com                                  ��
'��                                                                   ��
'��     ��������: ����  www.caozha.com                                  ��
'��                                                                   ��
'��     Դ�����Apache-2.0��ѿ�Դ���뱣�����������ӣ�                      ��
'��                                                                   ��
'����������������������������������������������������
'
'
if session("flag")>1 then
    response.write "<script>alert('���Ĳ���Ȩ�޲�����');history.back();</script>"
    response.end
end if
%><html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="Images/Admin_Style.Css" type="text/css">
<title></title>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%
   MaxPerPage=20
   dim totalPut   
   dim CurrentPage
   dim TotalPages
   dim i,j

   dim typename
   
   typename=""
   if not isempty(request("page")) then
      currentPage=cint(request("page"))
   else
      currentPage=1
   end if
   dim sql
   dim rs
   dim rstype

   dim typesql
   dim typeid,typename1
   if not isEmpty(Replace(request("typeid"), "'", "''")) then
	typeid=Replace(request("typeid"), "'", "''")
   else
	typeid=""
   end if
   if request("page")="" then
   page=0
   end if
%> <center>
<%
sql="select * from tot order by id desc"
Set rs= Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,1
  if rs.eof and rs.bof then
       response.write "<p align='center'> �� û �� �� �� �� ��</p>"
   else
	  totalPut=rs.recordcount
      totalPut=rs.recordcount
      if currentpage<1 then
          currentpage=1
      end if
      if (currentpage-1)*MaxPerPage>totalput then
	   if (totalPut mod MaxPerPage)=0 then
	     currentpage= totalPut \ MaxPerPage
	   else
	      currentpage= totalPut \ MaxPerPage + 1
	   end if

      end if
       if currentPage=1 then
           showpage totalput,MaxPerPage,"eoff.asp"
            showContent
            showpage totalput,MaxPerPage,"eoff.asp"
       else
          if (currentPage-1)*MaxPerPage<totalPut then
            rs.move  (currentPage-1)*MaxPerPage
            dim bookmark
            bookmark=rs.bookmark
           showpage totalput,MaxPerPage,"eoff.asp"
            showContent
             showpage totalput,MaxPerPage,"eoff.asp"
        else
	        currentPage=1
           showpage totalput,MaxPerPage,"eoff.asp"
           showContent
           showpage totalput,MaxPerPage,"eoff.asp"
	      end if
	   end if
   end if
	        

  

   sub showContent
       dim i
	   i=0

  %><br>
<div align="center"> 
  <table class="tableBorder" width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><div align="center"><a href="deleoff.ASP"><font color="#000000">ɾ������ǰ������</font></a> 
          <font color="#000000"></font><font color="#FF0000"> </font>��<a href="deleoffall.ASP"><font color="#000000">ɾ�����л�Ա����</font></a> </div></td>
    </tr>
  </table>
</div>
<center>
  <%do while not rs.eof%>
  <table class="tableBorder" border="0" cellspacing="1" width="100%"  bordercolorlight="#000000" bordercolordark="#FFFFFF" cellpadding="2" height="48" style="border-collapse: collapse" bordercolor="#111111">
    <tr> 
      <td height="22" colspan="5" class="title"><div align="center">����<%=rs("title")%>�Ĵ��󱨸�</div></td>
    </tr>
    <tr> 
      <td width="93" height="12" class="tdbg"> <p align="center">����ʱ�䣺</td>
      <td width="253" height="12" class="tdbg"><%=rs("times")%></td>
      <td width="205" height="12" class="tdbg"><div align="center">�����Ա��</div></td>
      <td width="160" height="12" class="tdbg"> <p> <a href="Admin_User_Add.Asp?Username=<%=rs("user")%>" target="_blank"><%=rs("user")%></a></td>
      <td width="270" height="12" class="tdbg"> <p align="center">����ID��<%=rs("musicid")%> <a href="../yxplay.asp?id=<%=rs("musicid")%>" target="_blank">��������˸�</a></td>
    </tr>
    <tr> 
      <td width="93" height="11" class="tdbg"> <p align="center">���ݣ�</td>
      <td height="11" colspan="4" class="tdbg"><%=rs("conten")%></td>
    </tr>
  </table>
  <% i=i+1
	      if i>=MaxPerPage then exit do
	      rs.movenext
	   loop
		  %>
  <%
   end sub 

function showpage(totalnumber,maxperpage,filename)
  dim n
  if totalnumber mod maxperpage=0 then
     n= totalnumber \ maxperpage
  else
     n= totalnumber \ maxperpage+1
  end if
  response.write "<form method=Post action="&filename&"?typeid="&typeid&">"
    if CurrentPage<2 then
    response.write "<font color='#000080'>��ҳ ��һҳ</font>&nbsp;"
  else
    response.write "<a href="&filename&"?page=1&typeid="&typeid&">��ҳ</a>&nbsp;"
    response.write "<a href="&filename&"?page="&CurrentPage-1&"&typeid="&typeid&">��һҳ</a>&nbsp;"
  end if
  if n-currentpage<1 then
    response.write "<font color='#000080'>��һҳ βҳ</font>"
  else
    response.write "<a href="&filename&"?page="&(CurrentPage+1)&"&typeid="&typeid&">"
    response.write "��һҳ</a> <a href="&filename&"?page="&n&"&typeid="&typeid&">βҳ</a>"
  end if
   response.write "<font color='#000080'>&nbsp;ҳ�Σ�</font><strong><font color=red>"&CurrentPage&"</font><font color='#000080'>/"&n&"</strong>ҳ</font> "
    response.write "<font color='#000080'>&nbsp;��<b>"&totalnumber&"</b>�����󱨸� <b>"&maxperpage&"</b>������/ҳ</font> "
   response.write " <font color='#000080'>ת����</font><input type='text' name='page' size=4 maxlength=10 class=smallInput value="&currentpage&">"
   response.write " <input class=buttonface type='submit'  value='Goto'  name='cndok'></span></p></form>"
       
end function
    
    rs.close
    set rs=nothing  
   conn.close
   set conn=nothing
  %>
  <p></p>
</center>

</body>

</html>
