<!--#include file="../PL_config.asp"-->
<!--#include file="../PL_INC/PL_Path.Asp"-->
<%
if request("id")="" then
		response.write"<SCRIPT language=JavaScript>alert('出错啦! 至少要选择歌曲一首以上才能连播!');"
		response.write"javascript:window.close();</SCRIPT>"
		response.end()
	else
end if
id=replace(request("id")," ","")
Dim MusicID,MusicArray,MusicNum
MusicID=request.QueryString("id")&","
MusicArray=Split(MusicID, ",")
MusicNum = UBound(MusicArray)-1
%>
<SCRIPT language=javascript>
  <%
For i=0 To MusicNum
MusicArray(i)=replace(MusicArray(i)," ","")
set rs=server.createobject("adodb.recordset")
sql="select * from MusicList where id ="&musicarray(i)
rs.open sql,conn,1,3
'更新点击数
if rs("hits")<>"" then
rs("hits")=rs("hits")+1
rs.update
else
rs("hits")="1"
rs.update
end if

PL_song_path=rs("Song_Path")
if PL_song_path="0" then
PL_path=song_path
elseif PL_song_path="1" then
PL_path=song_path1
elseif PL_song_path="2" then
PL_path=song_path2
elseif PL_song_path="3" then
PL_path=song_path3
elseif PL_song_path="4" then
PL_path=song_path4
elseif PL_song_path="5" then
PL_path=song_path5
elseif PL_song_path="6" then
PL_path=song_path6
else
PL_path="http://s2.7t7t.com:81"
end if

%>
mkList("<%=PL_path%><%=rs("Wma")%>","<%=rs("MusicName")%>","","","<%=rs("Singer")%>","<%=rs("Specialid")%>","<%=rs("Id")%>");
<% 
rs.close
set rs=nothing
next
%></SCRIPT>