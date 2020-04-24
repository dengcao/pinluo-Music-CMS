<%
IsAdmin=session("IsAdmin")
If IsAdmin=true Then
		Session("AdminID")=""
		Session("IsAdmin")=""
		Session("KEY")=""
end if	
response.redirect ("/")
%>