<!-- #include file = "Cls_AspHttp.asp" -->
<!-- #include file = "style.asp" -->
<!-- #include File="Function.asp" -->
<%CheckAdmin1%>
<!-- #include File="6tingconn.asp" -->
<!-- #include File="conn.asp" -->
<%
Dim StarPage,EndPage,Co,Msg,Fid,ID
dim mp3save,picsave
Server.ScriptTimeOut=99999
StarPage=Request("StarPage")
EndPage=Request("EndPage")
mp3save=Request("mp3save")
picsave=Request("picsave")
zdid=checksql(request.QueryString("claid"))
ID=EndPage
Co=Request("Co")
If Co="" or Not IsNumeric(Co) Then Co=1
If StarPage="" or Not IsNumeric(StarPage) Or EndPage="" Or Not IsNumeric(EndPage) Then
   Response.write "您输入的ID参数有错误<br><A HREF=# onclick=""Javascript:history.back(-1)""><FONT  COLOR=#FF0000>请点这里返回</FONT></A>"
   Response.End
ElseIf Cint(StarPage)<Cint(EndPage) Then
   Response.write "您输入的起始ID小于结束ID<br><A HREF=# onclick=""Javascript:history.back(-1)""><FONT  COLOR=#FF0000>请点这里返回</FONT></A>"
   Response.End
End If

Set DoGet = New FlyCms_AspHttp
If StarPage=EndPage Then
   Msg="你所请求的功能已经完成,谢谢使用!<br>"
   MusicMake
Else
   Msg="正在取得远程HTML中,请等待......<br>"
   MusicMake
   MakeNextPage
End IF

Sub MusicMake
Response.write "<HTML>"
Response.write "<HEAD>"
Response.write "<TITLE>全自动歌曲采集&下载在本地 版本号：V3.0</TITLE>"
Response.write "<META http-equiv=Content-Type content=""text/html; charset=gb2312"">"
Response.write "<META content=""MSHTML 6.00.2800.1400"" name=GENERATOR>"
Response.write "</HEAD>"
Response.write "<BODY text=#000000 bgColor=#ffffff leftMargin=10 topMargin=0 marginheight=0 marginwidth=0>"
Response.write "<b><font color=#FF0000>"&StarPage&"</font>/<font color=#FF0000>"&EndPage&"</font>"
Response.write Msg&"</b>"
Response.write "<IE:Download ID=""oDownload"" STYLE=""behavior:url(#default#download)"" />"

MakeIMG
End Sub

Sub MakeIMG
	Dim k:k=0
	on error resume next
	'Response.write "<table class="tableBorder" border=0 width=100% height=300 align=center><tr>"
	'Response.write  "<td width=28% height=200 valign=top>"
	
	set rs=server.CreateObject("ADODB.RecordSet")
	Sql="Select top 1 * From const Where id="&zdid
	Rs.Open Sql,Conn1,1,1
		url=rs("url")
		mp3img=rs("mp3img")
		mp3name=rs("mp3name")
		mp3about=rs("mp3about")
		mp3singer=rs("mp3singer")
		mp3zjname=rs("mp3zjname")
		mp3yuyan=rs("mp3yuyan")
		mp3gongsi=rs("mp3gongsi")
		mp3time=rs("mp3time")
		mp3type=rs("mp3type")
		musll=rs("musll")
		nomp3img=rs("nomp3img")
		musicnamelist=rs("musicnamelist")
		musicid=rs("musicid")
		mp3path=rs("mp3path")
		cjmp3path=rs("cjmp3path")
		wmapath=rs("wmapath")
		mp3imgurl=rs("mp3imgurl")
		body=rs("body")
		xzmp3path=rs("xzmp3path")
		Cookie=rs("Cookie")
		songpath=rs("songpath")		
		imglj=rs("imglj")
		wmalj=rs("wmalj")
	rs.close
	set fs=nothing
	
	url=bqtf1(url)
	mp3img=bqtf1(mp3img)
	mp3name=bqtf1(mp3name)
	mp3about=bqtf1(mp3about)
	mp3singer=bqtf1(mp3singer)
	mp3zjname=bqtf1(mp3zjname)
	mp3yuyan=bqtf1(mp3yuyan)
	mp3gongsi=bqtf1(mp3gongsi)
	mp3time=bqtf1(mp3time)
	mp3type=bqtf1(mp3type)
	musll=bqtf1(musll)
	nomp3img=bqtf1(nomp3img)
	musicnamelist=bqtf1(musicnamelist)
	musicid=bqtf1(musicid)
	mp3path=bqtf1(mp3path)
	cjmp3path=bqtf1(cjmp3path)
	wmapath=bqtf1(wmapath)
	mp3imgurl=bqtf1(mp3imgurl)
	body=bqtf1(body)
	xzmp3path=bqtf1(xzmp3path)
	cqmusll=musll
	Cookie=bqtf1(Cookie)
	imglj=bqtf1(imglj)
	wmalj=bqtf1(wmalj)
	
	url1=Split(url,"[id]")
	mp3img1=Split(mp3img,"|")
	mp3name1=Split(mp3name,"|")
	mp3about1=Split(mp3about,"|")
	mp3singer1=Split(mp3singer,"|")
	mp3zjname1=Split(mp3zjname,"|")
	mp3yuyan1=Split(mp3yuyan,"|")
	mp3gongsi1=Split(mp3gongsi,"|")
	mp3time1=Split(mp3time,"|")
	mp3type1=Split(mp3type,"|")
	musll1=Split(musll,"|")
	musicnamelist1=Split(musicnamelist,"|")
	musicid1=Split(musicid,"|")
	mp3path1=Split(mp3path,"|")
	body1=Split(body,"|")
	xzmp3path1=Split(xzmp3path,"|")
	
	url=url1(0)&id&url1(1)
	
	On Error Resume Next 
'判断编码方式	
	if request("caijitype")="1" then
		zlp=getHTTPPageUTF8(url)
	else
		zlp=getHTTPPage(url)
	end if
		zlp=GetHttp(url)

	Set fs = Server.CreateObject("Scripting.FileSystemObject")
			tid = server.mappath("6ting.txt")
			Set a = fs.CreateTextFile(tid)
			a.Write id
			a.close
		set fs=nothing
	
	'采集专辑相关信息开始
	body=GetStr(zlp,body1(0),body1(1))
	musll=GetStr(body,musll1(0),musll1(1))
	mp3img=GetStr(body,mp3img1(0),mp3img1(1))
	mp3img=replace(mp3img,"..","")
	mp3img=replace(mp3img,"//","/")
	mp3img=mp3imgurl&mp3img
	mp3singer=GetStr(body,mp3singer1(0),mp3singer1(1))
	mp3zjname=GetStr(body,mp3zjname1(0),mp3zjname1(1))
'	mp3singer=Mid(mp3singer,AstrId1+1,strlen-AstrId1)
	mp3yuyan=GetStr(body,mp3yuyan1(0),mp3yuyan1(1))
	mp3gongsi=GetStr(body,mp3gongsi1(0),mp3gongsi1(1))
	mp3time=GetStr(body,mp3time1(0),mp3time1(1))
	mp3about=GetStr(body,mp3about1(0),mp3about1(1))
	mp3type=GetStr(body,mp3type1(0),mp3type1(1))
	mp3type=GetRStr(body,mp3type1(0),mp3type1(1))
'
	mp3singer=Delcjlj(mp3singer)
	mp3zjname=Delcjlj(mp3zjname)
	mp3type=Delcjlj(mp3type)	
	mp3time=Delcjlj(mp3time)
	mp3yuyan=Delcjlj(mp3yuyan)
	mp3gongsi=Delcjlj(mp3gongsi)
	mp3about=Delcjlj(mp3about)
	
'测试
'	mp3singer="a href='/index/AsT_1.htm'><font class=font2>&nbsp;华人男歌手&nbsp;</font></a><font class=font2></a></a>"
'	response.Write("<textarea name=textarea1 cols=50 rows=5>"&mp3singer&"</textarea>")
'	response.Write("<textarea name=textarea1 cols=50 rows=5>"&body1(0)&"==="&body1(1)&"</textarea>")
'	response.Write("<textarea name=textarea1 cols=50 rows=5>"&aa&"==="&bb&"==="&cc&"==="&dd&"</textarea>")
'	response.Write("<textarea name=textarea1 cols=50 rows=5>"&TmpBody&"</textarea>")
'	response.Write("<textarea name=textarea1 cols=50 rows=5>"&mp3gongsi&"</textarea>")
'	response.End()
	'关键字替换
	set rs=server.CreateObject("ADODB.RecordSet")
	Sql="Select * From gjz Where claid="&zdid
	rs.Open Sql,conn1,0,3
	do while not rs.eof
	tfnr=rs("tfnr")
	tfnr=bqtf1(tfnr)
	tfnr1=Split(tfnr,"|")
	tfzdname=rs("tfzdname")
	select case tfzdname
	  case "mp3img"
		  mp3img=replace(mp3img,tfnr1(0),tfnr1(1))
	  case "mp3singer"
		  mp3singer=replace(mp3singer,tfnr1(0),tfnr1(1))
	  case "mp3zjname"
		  mp3zjname=replace(mp3zjname,tfnr1(0),tfnr1(1))
	  case "mp3yuyan"
		  mp3yuyan=replace(mp3yuyan,tfnr1(0),tfnr1(1))
	  case "mp3gongsi"
		  mp3gongsi=replace(mp3gongsi,tfnr1(0),tfnr1(1))
	  case "mp3time"
		  mp3time=replace(mp3time,tfnr1(0),tfnr1(1))
	  case "mp3about"
		  mp3about=replace(mp3about,tfnr1(0),tfnr1(1))
	  case "mp3type"
		  mp3type=replace(mp3type,tfnr1(0),tfnr1(1))
	end select
	   rs.movenext
	loop
	
	rs.close
	set fs=nothing
	ABC=getpychar(left(mp3singer,1))
	mp3img=replace(mp3img,"http://","http:///")
	mp3img=replace(mp3img,"//","/")
	
	'是否下载图片到本地
	if picsave="picsave" then
		mp3img=trim(mp3img)
		if Instr(mp3img,nomp3img) = False then
			mp3imgpath=replace(mp3img,mp3imgurl,"")
			ljh=replace(mp3imgpath,"/","\")
			sUrl = url		'Cookie认证页面,我们可以从这里取得Cookie 
			TempStr = HttpGet(10000,10000,20000,20000,"GET",sUrl,"",sData,"","zh-cn","application/x-www-form-urlencoded","Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)","gzip, deflate","*/*","gb2312")
			sCookie = GetCookie(DoGet.strHeaders,-1) '这句用来取得上页面中的Cookie
			sUserAgent = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)"	'这句模拟Media Player身份
			FromUrl = mp3img
			hzm=""
			hzm = Mid(ljh, InStrRev(ljh, "."), len(ljh))
			if Instr(hzm,"asp") or Instr(hzm,"asa") or Instr(hzm,"php") or Instr(hzm,"aspx") then
						ljh=ljh&".jpg"
			end if
			ToFiles = replace(imglj&"\"&ljh,"\\\","\\")
			Response.Write "专辑图片采集"
			call SaveData(FromUrl, ToFiles, sCookie, sUserAgent, 1, 1,1)
		end if
	end if
	
	'处理歌手类别，如果数据库里面没有就添。
	on error resume next
	'是否采集到页面
	if cqmusll<>musll then
		set rs=server.CreateObject("ADODB.RecordSet")
		Sql="Select top 1 * From SClass Where SClass='"&mp3type&"'"
		Rs.Open Sql,Conn,1,3
		If Rs.Eof And Rs.Bof Then
		Rs.AddNew
		End If
		  rs("SClass")=checksql(mp3type)
		  rs("Classid")=1
		  Rs.Update
		Rs.Close
		Set Rs = Nothing
		Set rsc = Conn.Execute("select * from SClass where SClass='"&mp3type&"'")
		SClassID=rsc("SClassID")
		 rsc.close
		 set rsc=nothing
		'-------------------------------
		'处理歌手的二级类别,如数据库中没有该类别，则增加
		'-------------------------------
		on error resume next
		set rst=server.CreateObject("ADODB.RecordSet")
		Sql="Select top 1 * From NClass Where NClass='"&mp3singer&"'"
		Rst.Open Sql,Conn,1,3
		If Rst.Eof And Rst.Bof Then
		Rst.AddNew
		End If
		  rst("Classid")=1
		  rst("NClass")=checksql(mp3singer)
		  rst("SClassID")=checksql(SClassID)
		  rst("abcd")=checksql(abc)
		  Rst.Update
		Rst.Close
		Set Rst = Nothing
		'===================================================
		'===================================================
		'取类别的ID号
		'===================================================
		 Set rsc = Conn.Execute("select top 1 * from NClass where NClass='"&mp3singer&"'")
		 NClassID=rsc("NClassID")
		 rsc.close
		 set rsc=nothing
		'===================================================
		'可以开始写入专集记录
		'===================================================
		'===================================================
		on error resume next
		set rs=server.CreateObject("ADODB.RecordSet")
			mp3zjname=checksql(mp3zjname)		'防SQL注入
		Sql="Select top 1 * From Special Where nclass='"&mp3singer&"' and name='"&mp3zjname&"'" 
		Rs.Open Sql,Conn,1,3
		If Rs.Eof And Rs.Bof Then
			Rs.AddNew
		End If
		  rs("Classid")=1
		  rs("SClassID")=checksql(SClassID)
		  rs("SClass")=checksql(mp3type)
		  rs("NClassID")=checksql(NClassID)
		  rs("NClass")=checksql(mp3singer)
		  rs("name")=checksql(mp3zjname)
		  rs("Yuyan")=checksql(mp3Yuyan)
		  rs("Gongsi")=checksql(mp3Gongsi)
		  rs("Times")=checksql(mp3Time)
		  rs("intro")=checksql(mp3about)
		if picsave="picsave" then
		  rs("pic")="/Photo/"&replace(mp3img,mp3imgurl,"")
		else
		  rs("pic")=mp3img
		end if
		  rs("hits")=0
		  rs("formid")=checksql(id)
		  Rs.Update
		Rs.Close
		Set Rs = Nothing
		
		set rsedit=server.CreateObject("ADODB.RecordSet")
		Set rsedit = Conn.Execute("select top 1 * from Special where  NClass='"&mp3singer&"'and name='"&mp3zjname&"'")
		SpecialID=rsedit("SpecialID")
		rsedit.close
		set rsedit=nothing
		
		music=RemoveHTML1(musll,musicnamelist1(0)&".+?[\s\S]+?"&musicnamelist1(1))
		if Instr(music,"|") = False then
			music=music&"|"
			end if
			musicqy=split(music,"|")
			uu=0
			if musicqy(Ubound(musicqy))="" then
				musicqycs=Ubound(musicqy)-1
			else
				musicqycs=Ubound(musicqy)
		end if
		'on error resume next
		'RString=DeHttpdata(zlp,"'[^<>'']*','[^<>'']*','[^<>""]*'")
		Response.Write "专辑编号："&ID&"<br>"
		response.flush
		Response.Write "歌手字母："&ABC&"<br>"
		response.flush
		Response.Write "歌手分类："&mp3type&"<br>"
		response.flush
		Response.Write "专辑歌手："&mp3singer&"<br>"
		response.flush
		Response.Write "专辑名称："&mp3zjname&"<br>"
		response.flush
		Response.Write "专辑图片：<a href='"&mp3img&"' target='_blank'>"&mp3img&"</a><br>"
		response.flush
		Response.Write "发行公司："&mp3gongsi&"<br>"
		response.flush
		Response.Write "发行日期："&mp3Time&"<br>"
		response.flush
		Response.Write "所属语言："&mp3Yuyan&"<br>"
		response.flush
		Response.Write "歌曲总数：此专辑共有<font color=red>"&musicqycs+1&"</font>首歌曲&nbsp;&nbsp;[<font color=red>正在下载文件和添加数据，请耐心等待.....</font>]<br>"
		response.flush
		b=cjmp3path
		do while uu <= musicqycs
			cjmp3path=b
			mp3name=GetStr(musicqy(uu),mp3name1(0),mp3name1(1))
			musicID=GetStr(musicqy(uu),musicID1(0),musicID1(1))
			cjmusicid=musicID
			cjmp3path=replace(cjmp3path,"[musicID]",musicID)
			mp3path=GetStr(GetHttp(cjmp3path),mp3path1(0),mp3path1(1))
			mp3path=replace(mp3path,"//","/")
			xzmp3path=GetStr(GetHttp(cjmp3path),xzmp3path1(0),xzmp3path1(1))
			
			
			'关键字替换
			set rs=server.CreateObject("ADODB.RecordSet")
			Sql="Select * From gjz Where claid="&zdid
			Rs.Open Sql,Conn1,0,3
			do while not rs.eof
				tfnr=rs("tfnr")
				tfnr=bqtf1(tfnr)
				tfnr1=Split(tfnr,"|")
				tfzdname=rs("tfzdname")
				select case tfzdname
				  case "mp3name"
					  mp3name=replace(mp3name,tfnr1(0),tfnr1(1))
				  case "musicID"
					  musicID=replace(musicID,tfnr1(0),tfnr1(1))
				  case "mp3path"
					  mp3path=replace(mp3path,tfnr1(0),tfnr1(1))
				end select
				   rs.movenext
			loop
			rs.close
			Set Rs = Nothing
			
			'---------------------------------
			'入库
			'---------------------------------
			set rs=server.CreateObject("ADODB.RecordSet")
			Sql="Select top 1 * From MusicList Where MusicName='"&mp3name&"' and Singer='"&mp3singer&"' and SpecialID="&SpecialID
			Rs.Open Sql,Conn,1,3
			If Rs.Eof And Rs.Bof Then
				Rs.AddNew
			End If
			
			  if mp3save="mp3save" then
					submp3path=".com"
					aa=Instr(mp3path,submp3path)
					mp3path=right(mp3path,len(mp3path)-aa-3)
			  end if

			  if left(mp3path,5)="http:" then
				  mp3path=replace(mp3path,"http:","http:/")
			  end if

			  rs("wma")=mp3path
			  rs("ClassID")=1
			  rs("SClassID")=checksql(SClassID)
			  rs("NClassID")=checksql(NClassID)
			  rs("Singer")=checksql(mp3singer)
			  rs("SpecialID")=checksql(SpecialID)
			  rs("musicname")=checksql(mp3name)
			  if songpath="" or isnull(songpath) or songpath=0 then
				  rs("song_path")="0"  	
			  else
				  rs("song_path")=songpath
			  end if
			  rs("hits")=0
			  rs.update
			  rs.close
			Set Rs = Nothing
			
			'是否下载音乐到本地
			fldr=""
			if mp3save="mp3save" then
				dim ttt8down
				if wmapath="" then
					ttt8down=xzmp3path
				else
					ttt8down=wmapath&mp3path
				end if
					if Instr(Cookie,"当前采集页") = False then
						Cookieym=Cookie
					else
						Cookieym=cjmp3path
					end if
					sUrl = Cookieym		'Cookie认证页面,我们可以从这里取得Cookie 
					TempStr = HttpGet(10000,10000,20000,20000,"GET",sUrl,"",sData,"","zh-cn","application/x-www-form-urlencoded","Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)","gzip, deflate","*/*","gb2312")
					sCookie = GetCookie(DoGet.strHeaders,-1) '这句用来取得上页面中的Cookie
			
					sUserAgent = "NSPlayer/9.0.0.2991 WMFSDK/9.0 "	'这句模拟Media Player身份
					FromUrl = ttt8down
					hzm=""
					hzm = Mid(mp3path, InStrRev(mp3path, "."), len(mp3path))
					if Instr(hzm,"asp") or Instr(hzm,"asa") or Instr(hzm,"php") or Instr(hzm,"aspx") then
						mp3path=mp3path&".wma"
					end if
					ToFiles = replace(wmalj&"\"&mp3path,"\\\","\\")
					Response.Write "<br>采集第"&uu+1&"首歌"
					Call SaveData(FromUrl, ToFiles, sCookie, sUserAgent, 1, 1, 2)
					Response.Write "音乐下载成功<a href='"&ttt8down&"' target='_blank'>"&ttt8down&"</a><br>"
					response.flush
					Response.Write "保存路径为"&mp3path&"<br>"
					response.flush
			end if
		uu=uu+1
		loop
	end if
	Response.Write "<B>采集完成</B>"
	response.flush
End Sub

Sub MakeNextPage
Response.write "<meta http-equiv=""refresh"" content=""0;url='6tingcj.asp?claid="&zdid&"&mp3save="&mp3save&"&picsave="&picsave&"&StarPage="&StarPage&"&EndPage="&EndPage+1&"&Co="&Co+1&"'"">"
Response.write "</body>"
Response.write "</html>"
End Sub
%>