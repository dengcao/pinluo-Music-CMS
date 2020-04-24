<%
function picpath(str)
	if left(right(str,4),1)<>"." then
		str=str&".gif"
	else
		str=str
	end if
	picpath=str
end function
%>