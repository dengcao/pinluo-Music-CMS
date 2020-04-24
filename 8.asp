<%
Function GetUrl() 
Dim strHostName,strScriptName,strSubUrl,strRequestItem 
strHostName=CStr(Request.ServerVariables("LOCAL_ADDR"))
strScriptName=CStr(Request.ServerVariables("SCRIPT_NAME"))
strSubUrl=""
If Request.QueryString<>"" Then
   strScriptName=strScriptName&"?"
   For Each strRequestItem In Request.QueryString
    If InStr(strScriptName,strRequestItem)=0 Then
     If strSubUrl="" Then
      strSubUrl=strSubUrl&strRequestItem&"="&Server.URLEncode(Request.QueryString(""&strRequestItem&""))
     Else
      strSubUrl=strSubUrl&"&"&strRequestItem&"="&Server.URLEncode(Request.QueryString(""&strRequestItem&""))
     End If
    End If
   Next
End If
GetUrl="http://"&strHostName&strScriptName&strSubUrl
End Function
%>
<%=GetUrl()%>

<% 
response.write "http://"&Request.ServerVariables("server_name")&Request.ServerVariables("script_name") 
%>