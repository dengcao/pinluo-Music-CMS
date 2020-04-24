接收 Active Server Page (ASP) 页重新构造变量： 

<% 
Dim BigTextArea 

For I = 1 To Request.Form("BigTextArea").Count 
BigTextArea = BigTextArea & Request.Form("BigTextArea")(I) 
Next 
'response.Write(BigTextArea)
%>


<FORM method=post action=LargePost.asp name=theForm onsubmit="BreakItUp()"> 
<Textarea rows=50 cols=120 name=BigTextArea1><%=BigTextArea%></Textarea> 
<input type=submit value=go> 
</form> 