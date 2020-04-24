<!--#include file="const.asp"-->
<%CheckAdmin3%>
<!--#include file="Top.asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
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
id=request.QueryString("id")
AskClassid=request.QueryString("AskClassid")
AskSClassid=request.QueryString("AskSClassid")
AskNClassid=request.QueryString("AskNClassid")
page=request.QueryString("page")
set rs=server.createobject("adodb.recordset")
sql="select * from MusicList where id="&id
rs.open sql,conn,1,1
if rs.eof then
	errmsg=errmsg+"<br>"+"<li>操作错误！请联系管理员"
	call error()
	Response.End 
else
	Wma=rs("Wma")
	song_path=rs("song_path")
	MusicName=rs("MusicName")
	hits=rs("hits")
	Classid=rs("Classid")
	SClassid=rs("SClassid")
	Nclassid=rs("Nclassid")
	Specialid=rs("Specialid")
	singer=rs("singer")
end if
rs.close
%>
<table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
        <form method="POST" action="Admin_Allmusic_Err.Asp?id=<%=id%>&AskClassid=<%=AskClassid%>&AskSClassid=<%=AskSClassid%>&AskNClassid=<%=AskNClassid%>&page=<%=page%>">
          <tr class="title">
           <td width="100%" height="20" colspan=2 align=center background="images/manage/admin_bg_1.gif"><b>修 改 歌 曲</b></td>
          </tr>
          <tr>
                  <td class="forumrow" colspan=2>&nbsp;&nbsp;
              分类：<select  name="classid" size="1" onChange="window.open('Admin_Allmusic_Ok.Asp?id=<%=request("id")%>&AskClassid=<%=Askclassid%>&AskSClassid=<%=AskSclassid%>&AskNClassid=<%=AskNclassid%>&page=<%=page%>&Classid='+this.options[this.selectedIndex].value,'_self')">
<%
set rs=server.createobject("adodb.recordset")
sql="select * from class"
rs.open sql,conn,1,1
do while not rs.eof
%>
                <option<%if (cstr(request("classid"))=cstr(rs("classid")) and request("classid")<>"") or (cstr(Classid)=cstr(rs("Classid")) and request("classid")="") then%> selected<%end if%> value="<%=CStr(rs("classID"))%>" name=classid><%=rs("class")%></option>
<%
rs.movenext
loop
rs.close
%>
              </select>&nbsp;&nbsp;
<%if request("classid")<>"" or request("Sclassid")<>"" then
	if request("classid")<>"" then%>
              <select  name="Sclassid" size="1" onChange="window.open('Admin_Allmusic_Ok.Asp?id=<%=request("id")%>&AskClassid=<%=Askclassid%>&AskSClassid=<%=AskSclassid%>&AskNClassid=<%=AskNclassid%>&page=<%=page%>&Classid=<%=request("Classid")%>&SClassid='+this.options[this.selectedIndex].value,'_self')">
<%	else%>
              <select  name="Sclassid" size="1" onchange="window.open('Admin_Allmusic_Ok.Asp?id=<%=request("id")%>&AskClassid=<%=Askclassid%>&AskSClassid=<%=AskSclassid%>&AskNClassid=<%=AskNclassid%>&page=<%=page%>&Classid=<%=Classid%>&SClassid='+this.options[this.selectedIndex].value,'_self')">
<%	end if%>
                <option value="" <%if request("Nclassid")="" then%> selected<%end if%>>选择栏目</option>
<%
	if request("classid")<>"" then
		sql="select * from Sclass where classid="&request("classid")
	else
		sql="select * from Sclass where classid="&classid
	end if
	rs.open sql,conn,1,1
	Do while not rs.eof
%>
                <option<%if (cstr(request("Sclassid"))=cstr(rs("Sclassid")) and request("Sclassid")<>"") then%> selected<%end if%> value="<%=CStr(rs("Sclassid"))%>" name=Sclassid><%=rs("Sclass")%></option>
<%
	rs.MoveNext
	Loop
	rs.close

else
%>
              <select  name="Sclassid" size="1" onchange="window.open('Admin_Allmusic_Ok.Asp?id=<%=request("id")%>&AskClassid=<%=Askclassid%>&AskSClassid=<%=AskSclassid%>&AskNClassid=<%=AskNclassid%>&page=<%=page%>&Classid=<%=request("Classid")%>&SClassid='+this.options[this.selectedIndex].value,'_self')">
                <option value="">选择栏目</option>
<%
	sql="select * from Sclass where classid="&Classid
	rs.open sql,conn,1,1
	Do while not rs.eof
%>
                <option<%if cstr(Sclassid)=cstr(rs("Sclassid")) then%> selected<%end if%> value="<%=CStr(rs("Sclassid"))%>" name=Sclassid><%=rs("Sclass")%></option>
<%
	rs.MoveNext
	Loop
	rs.close

end if
%>
              </select>&nbsp;&nbsp;  
<%if request("Sclassid")<>"" or request("Nclassid")<>"" then
	if request("Sclassid")<>"" then%>
              <select  name="Nclassid" size="1" onChange="window.open('Admin_Allmusic_Ok.Asp?id=<%=request("id")%>&AskClassid=<%=Askclassid%>&AskSClassid=<%=AskSclassid%>&AskNClassid=<%=AskNclassid%>&page=<%=page%>&Classid=<%=request("Classid")%>&SClassid=<%=request("SClassid")%>&NClassid='+this.options[this.selectedIndex].value,'_self')">
<%	else%>
              <select  name="Nclassid" size="1" onchange="window.open('Admin_Allmusic_Ok.Asp?id=<%=request("id")%>&AskClassid=<%=Askclassid%>&AskSClassid=<%=AskSclassid%>&AskNClassid=<%=AskNclassid%>&page=<%=page%>&Classid=<%=Classid%>&SClassid=<%=SClassid%>&NClassid='+this.options[this.selectedIndex].value,'_self')">
<%	end if%>
                <option value="" <%if request("Nclassid")="" then%> selected<%end if%>>选择子栏目</option>
<%
	if request("Sclassid")<>"" then
		sql="select * from Nclass where Sclassid="&request("Sclassid")
	else
		sql="select * from Nclass where Sclassid="&Sclassid
	end if
	rs.open sql,conn,1,1
	Do while not rs.eof
%>
                <option<%if (cstr(request("Nclassid"))=cstr(rs("Nclassid")) and request("Nclassid")<>"") then%> selected<%end if%> value="<%=CStr(rs("Nclassid"))%>" name=Nclassid><%=rs("Nclass")%></option>
<%
	rs.MoveNext
	Loop
	rs.close

else
%>
              <select  name="Nclassid" size="1" onchange="window.open('Admin_Allmusic_Ok.Asp?id=<%=request("id")%>&AskClassid=<%=Askclassid%>&AskSClassid=<%=AskSclassid%>&AskNClassid=<%=AskNclassid%>&page=<%=page%>&Classid=<%=request("Classid")%>&SClassid=<%=request("SClassid")%>&NClassid='+this.options[this.selectedIndex].value,'_self')">
                <option value="">选择子栏目</option>
<%
	sql="select * from Nclass where Sclassid="&SClassid
	rs.open sql,conn,1,1
	Do while not rs.eof
%>
                <option<%if cstr(Nclassid)=cstr(rs("Nclassid")) then%> selected<%end if%> value="<%=CStr(rs("Nclassid"))%>" name=Nclassid><%=rs("Nclass")%></option>
<%
	rs.MoveNext
	Loop
	rs.close

end if
%>
              </select>
            </td>
          </tr>
          <tr>
            <td class="forumrow" align=right>专辑：</td>
            <td class="forumrow">
<%
if request("Classid")<>"" or request("Nclassid")<>"" or request("Specialid")<>"" then
	if request("Classid")<>"" then
%>
              <select  name="Specialid" size="1" onChange="window.open('Admin_Allmusic_Ok.Asp?id=<%=request("id")%>&AskClassid=<%=Askclassid%>&AskSClassid=<%=AskSclassid%>&AskNClassid=<%=AskNclassid%>&page=<%=page%>&Classid=<%=request("Classid")%>&SClassid=<%=request("SClassid")%>&NClassid=<%=request("NClassid")%>&Specialid='+this.options[this.selectedIndex].value,'_self')">
<%	elseif request("NClassid")<>"" then%>
              <select  name="Specialid" size="1" onchange="window.open('Admin_Allmusic_Ok.Asp?id=<%=request("id")%>&AskClassid=<%=Askclassid%>&AskSClassid=<%=AskSclassid%>&AskNClassid=<%=AskNclassid%>&page=<%=page%>&Classid=<%=Classid%>&SClassid=<%=request("SClassid")%>&NClassid=<%=request("NClassid")%>&Specialid='+this.options[this.selectedIndex].value,'_self')">
<%	else%>
              <select  name="Specialid" size="1" onchange="window.open('Admin_Allmusic_Ok.Asp?id=<%=request("id")%>&AskClassid=<%=Askclassid%>&AskSClassid=<%=AskSclassid%>&AskNClassid=<%=AskNclassid%>&page=<%=page%>&Classid=<%=Classid%>&SClassid=<%=request("SClassid")%>&NClassid=<%=NClassid%>&Specialid='+this.options[this.selectedIndex].value,'_self')">
<%	end if%>
                <option value="" <%if request("Specialid")="" then%> selected<%end if%>>选择专辑</option>
<%
	if request("NClassid")<>"" then
		sql="select * from special where Nclassid="&request("Nclassid")
	else
		sql="select * from special where Nclassid="&Nclassid
	end if
	rs.open sql,conn,1,1
	Do while not rs.eof
%>
                <option<%if cstr(request("Specialid"))=CStr(rs("Specialid")) then%> selected<%end if%> value="<%=CStr(rs("Specialid"))%>" name=Specialid><%=rs("name")%></option>
<%
	rs.MoveNext
	Loop
	rs.close
else
%>
              <select  name="Specialid" size="1" onchange="window.open('Admin_Allmusic_Ok.Asp?id=<%=request("id")%>&AskClassid=<%=Askclassid%>&AskSClassid=<%=AskSclassid%>&AskNClassid=<%=AskNclassid%>&page=<%=page%>&Classid=<%=request("Classid")%>&SClassid=<%=request("SClassid")%>&NClassid=<%=request("NClassid")%>&Specialid='+this.options[this.selectedIndex].value,'_self')">
                <option value="">选择专辑</option>
<%
	sql="select * from special where Nclassid="&Nclassid
	rs.open sql,conn,1,1
	Do while not rs.eof
%>
                <option<%if cstr(Specialid)=cstr(rs("Specialid")) then%> selected<%end if%> value="<%=CStr(rs("Specialid"))%>" name=Specialid><%=rs("name")%></option>
<%
	rs.MoveNext
	Loop
	rs.close

end if%>
              </select>
            </td>
          </tr>
          <tr>
            <td class="forumrow" align="right">歌曲名：</td>
            <td class="forumrow"><input type="text" name="MusicName" size="15" class="smallinput" maxlength="100" value="<%=MusicName%>"></td>
          </tr>
          <tr>
            <td class="forumrow" align="right">点击数：</td>
            <td class="forumrow"><input  type="text" name="hits" size="15" class="smallinput" maxlength="100" value="<%=hits%>"></td>
          </tr>
          <tr>
            <td width="15%" class="forumrow" align="right">音乐地址：</td>
            <td class="forumrow" width="85%">
              <select name="song_path" size="1">
                <option value="0"<%if song_path=0 Then response.write(" selected") End If%>>根路径(0)</option>
                <option value="1"<%if song_path=1 Then response.write(" selected") End If%>>根路径(一)</option>
                <option value="2"<%if song_path=2 Then response.write(" selected") End If%> >根路径(二)</option>
                <option value="3"<%if song_path=3 Then response.write(" selected") End If%> >根路径(三)</option>
                <option value="4"<%if song_path=4 Then response.write(" selected") End If%> >根路径(四)</option>
                <option value="5"<%if song_path=5 Then response.write(" selected") End If%> >根路径(五)</option>
                <option value="6"<%if song_path=6 Then response.write(" selected") End If%>>根路径(六)</option>
              </select> <input type="text" name="Wma" value="<%=Wma%>" size="40"></td>    
          </tr>
		   <tr>
            <td width="15%" class="forumrow" align="right">自定义时间：</td>
            <td class="forumrow" width="85%"><input name="LastTime" type="text" id="LastTime" value="<%=now()%>" size="20"> 
              时间格式如： 2006-5-15 11:30:09</td>
		   </tr>
          <tr>
            <td class="forumrow" colspan=2 align=center>
              <input  style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF" type="hidden" value="edit" name="act">
<%
if request("Classid")<>"" then
	if request("SClassid")="" then
%>
              <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type="button" value=" 确 定 " name="cmdok" onClick="window.alert('请先选择二级栏目！')">&nbsp; 
<%	elseif request("NClassid")="" then%>
              <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type="button" value=" 确 定 " name="cmdok" onClick="window.alert('请先选择三级栏目！')">&nbsp; 
<%	elseif request("Specialid")="" then%>
              <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type="button" value=" 确 定 " name="cmdok" onClick="window.alert('请先选择专辑！')">&nbsp; 
<%
	else
%>
              <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type="submit" value=" 确 定 " name="cmdok">&nbsp; 
<%
	end if
else
%>
              <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type="submit" value=" 确 定 " name="cmdok">&nbsp; 
<%end if%>
              <input style="color: #FFFFFF; background-color: #666699; border: 1px solid #FFFFFF"  type="reset" value=" 清 除 "  name="cmdcancel">
            </td>
          </tr>
        </form>
      </table>
<%
set rs=nothing
conn.close
set conn=nothing%></body></html>
