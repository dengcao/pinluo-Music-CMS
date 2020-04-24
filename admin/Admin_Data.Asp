<!--#include file="const.asp"-->
<%CheckAdmin3%>
<%pagename="admin_Data"%>
<!--#include file="Top.Asp"-->
<LINK href="admin.css" type=text/css rel=stylesheet>
<BODY leftmargin="0" bottommargin="0" rightmargin="0" topmargin="0" marginheight="0" marginwidth="0">
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
action=trim(request("action"))
select case action
case "SpaceSize"		'系统空间占用
	
		call SpaceSize()
	

case else
		Errmsg=Errmsg+"<br>"+"<li>选取相应的操作。"
		call error()

end select

conn.close
set conn=nothing
response.write"</body></html>"


'====================系统空间占用=======================
sub SpaceSize()
on error resume next
%>
		<table class="tableBorder" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >			
		  <tr class="title">
  					<td height="22" colspan="3" align="center" background="images/manage/admin_bg_1.gif"><font color=#FFFFFF>系统空间占用</font></td>
		  </tr> 	
 				<tr>
 					<td height=100 class="forumrow"> 			
 			数据库 ：&nbsp;<img src="images/bar1.gif" width=<%=drawbar("../Data")%> height=10>&nbsp;<%showSpaceinfo("../Data")%><br><br>
 			后台文件：&nbsp;<img src="images/bar1.gif" width=<%=drawbar("../Admin")%> height=10>&nbsp;<%showSpecialSpaceinfo("Program")%><br><br>
 			系统图片：&nbsp;<img src="images/bar1.gif" width=<%=drawbar("../Images")%> height=10>&nbsp;<%showSpaceinfo("../Images")%><br><br>
 			专辑图片：&nbsp;<img src="images/bar1.gif" width=<%=drawbar("../Tupian")%> height=10>&nbsp;<%showSpaceinfo("../Tupian")%><br><br>
 			JS：&nbsp;<img src="images/bar1.gif" width=<%=drawbar("../js")%> height=10>&nbsp;<%showSpaceinfo("../js")%><br><br>
 			歌手文件：&nbsp;<img src="images/bar1.gif" width=<%=drawbar("../Special")%> height=10>&nbsp;<%showSpaceinfo("../Special")%>&nbsp;../Special<br><br>
 			专辑文件：&nbsp;<img src="images/bar1.gif" width=<%=drawbar("../MusicList")%> height=10>&nbsp;<%showSpaceinfo("../MusicList")%>&nbsp;../Musiclist<br><br>
 			歌曲文件：&nbsp;<img src="images/bar1.gif" width=<%=drawbar("../MusicPlay")%> height=10>&nbsp;<%showSpaceinfo("../MusicPlay")%>&nbsp;../MusicPlay<br><br>
 			总计 ：&nbsp;<img src="images/bar1.gif" width=418 height=10>&nbsp;<%showSpaceinfo("../")%><br><br>
 					</td>
 				</tr>
</table>
<%
dim dbpath,boolIs97
dbpath = request("dbpath")
boolIs97 = request("boolIs97")

If dbpath <> "" Then
dbpath = server.mappath(dbpath)
	response.write(CompactDB(dbpath,boolIs97))
End If

end sub

'=====================系统空间参数=========================
	Sub ShowSpaceInfo(drvpath)
 		dim fso,d,size,showsize
 		set fso=server.createobject("scripting.filesystemobject") 		
 		drvpath=server.mappath(drvpath) 		 		
 		set d=fso.getfolder(drvpath) 		
 		size=d.size
 		showsize=size & "&nbsp;Byte" 
 		if size>1024 then
 		   size=(size\1024)
 		   showsize=size & "&nbsp;KB"
 		end if
 		if size>1024 then
 		   size=(size/1024)
 		   showsize=formatnumber(size,2) & "&nbsp;MB"		
 		end if
 		if size>1024 then
 		   size=(size/1024)
 		   showsize=formatnumber(size,2) & "&nbsp;GB"	   
 		end if   
 		response.write "<font face=verdana>" & showsize & "</font>"
 	End Sub	
 	
 	Sub Showspecialspaceinfo(method)
 		dim fso,d,fc,f1,size,showsize,drvpath 		
 		set fso=server.createobject("scripting.filesystemobject")
 		drvpath=server.mappath("pic")
 		drvpath=left(drvpath,(instrrev(drvpath,"\")-1))
 		set d=fso.getfolder(drvpath) 		
 		
 		if method="All" then 		
 			size=d.size
 		elseif method="Program" then
 			set fc=d.Files
 			for each f1 in fc
 				size=size+f1.size
 			next	
 		end if	
 		
 		showsize=size & "&nbsp;Byte" 
 		if size>1024 then
 		   size=(size\1024)
 		   showsize=size & "&nbsp;KB"
 		end if
 		if size>1024 then
 		   size=(size/1024)
 		   showsize=formatnumber(size,2) & "&nbsp;MB"		
 		end if
 		if size>1024 then
 		   size=(size/1024)
 		   showsize=formatnumber(size,2) & "&nbsp;GB"	   
 		end if   
 		response.write "<font face=verdana>" & showsize & "</font>"
 	end sub 	 	 	
 	
 	Function Drawbar(drvpath)
 		dim fso,drvpathroot,d,size,totalsize,barsize
 		set fso=server.createobject("scripting.filesystemobject")
 		drvpathroot=server.mappath("pic")
 		drvpathroot=left(drvpathroot,(instrrev(drvpathroot,"\")-1))
 		set d=fso.getfolder(drvpathroot)
 		totalsize=d.size
 		
 		drvpath=server.mappath(drvpath) 		
 		set d=fso.getfolder(drvpath)
 		size=d.size
 		
 		barsize=cint((size/totalsize)/2)
 		Drawbar=barsize
 	End Function 	
 	
 	Function Drawspecialbar()
 		dim fso,drvpathroot,d,fc,f1,size,totalsize,barsize
 		set fso=server.createobject("scripting.filesystemobject")
 		drvpathroot=server.mappath("pic")
 		drvpathroot=left(drvpathroot,(instrrev(drvpathroot,"\")-1))
 		set d=fso.getfolder(drvpathroot)
 		totalsize=d.size
 		
 		set fc=d.files
 		for each f1 in fc
 			size=size+f1.size
 		next	
 		
 		barsize=cint((size/totalsize)*10)
 		Drawspecialbar=barsize
 	End Function 	
%>
