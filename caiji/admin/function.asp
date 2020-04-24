<%
	Function checksql(str)
		sqlword="'|;|and|(|)|exec|insert|select|delete|update|count|*|%|chr|mid|master|truncate|char|declare"
	  if str<>"" then
		'自定义需要过滤的字串,用 "|" 分隔
		sqlword_f = split(sqlword,"|")
		For sqlword_xx=0 To Ubound(sqlword_f)
			str=Replace(str,sqlword_f(sqlword_xx),"")
		Next
	  end if
		checksql=str
	end function 
	
	function dyh(s)
		if s<>"" then
			s=replace(s,"''","'") 
		end if
		dyh=s 
	end function

	function bqtf(s)
'		if s<>"" then
'			s=replace(s,"'","''") 
'			s=replace(s,"&nbsp;","&amp;nbsp;")
'			s=replace(s,"<","&lt;")
'			s=replace(s,">","&gt;")
'		end if
		bqtf=s 
	end function

	function bqtf1(s)
'		if s<>"" then
'			s=replace(s,"''","'") 
'			s=replace(s,"&amp;nbsp;","&nbsp;")
'			s=replace(s,"&lt;","<")
'			s=replace(s,"&gt;",">")
'		end if
		bqtf1=s 
	end function  

function CheckAdmin1
	if Session("IsAdmin")<>true then response.redirect "error.asp"
end function
sub error()
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name=author content=第六音乐厅音乐通用采集程序>
<title>第六音乐厅音乐通用采集程序</title>
</head>
<body topmargin="111" leftmargin="0">
<div align="center">
  <center>
  <table class="tableBorder" border="0" cellspacing="0" width="60%">
    <tr>
      <td width="100%" bgcolor="GREEN">
        <div align="center">
          <table class="tableBorder" border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td width="100%" bgcolor="#FFFFFF" height="80" align="center">
                <b>Error！&nbsp; <%=errmsg%>！&nbsp; :(</b>
                <p><b><a href="javascript:history.go(-1)">...::: 点 此 返 回 
                :::...</a></b>
              </td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
  </table>
  </center>
</div>
</body>                    
</html>           
<%
end sub
%>