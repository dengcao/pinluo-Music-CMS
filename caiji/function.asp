<%
'���Դ���
Sub Re1(Str)
	Response.Write Str
	Response.End
End Sub

Sub Rw(Str)
	Response.Write Str & vbCrLf
	Response.Flush
End Sub

	Function checksql(str)
		sqlword="'|;|and|(|)|exec|insert|select|delete|update|count|*|%|chr|mid|master|truncate|char|declare"
	  if str<>"" then
		'�Զ�����Ҫ���˵��ִ�,�� "|" �ָ�
		str=Replace(str,"'","""")
		sqlword_f = split(sqlword,"|")
		For sqlword_xx=0 To Ubound(sqlword_f)
			str=Replace(str,sqlword_f(sqlword_xx),"")
		Next
	  end if
		checksql=str
	end function 
	
'�õ��ļ�����������
Function GetWebData(byval strUrl)
dim curlpath
dim Retrieval
  Set Retrieval = Server.CreateObject("Micro"&"soft."&"XMLH"&"TTP")
  With Retrieval
    .Open "Get", strUrl, False,"",""
    .Send
    GetWebData =.ResponseBody
  End With
  Set Retrieval = Nothing
End Function

'�����ݱ�����ļ�
Sub SaveFile(FileName,Data,Path)
Dim Ads
  Set ads = Server.CreateObject("ado"&"db."&"stre"&"am")
  With ads
    .Type=1
    .Open
    .Write Data
    .SaveToFile Path&"\"&FileName,2
    .Cancel()
    .Close()
  End With
  Set Ads=nothing
End Sub

'���Ŀ¼�Ƿ����
Function CheckDir1(FolderPath)
	folderpath1=folderpath'Server.MapPath("..")&"/"&folderpath
    Set fso1 = CreateObject("Scripting.FileSystemObject")
    If fso1.FolderExists(FolderPath1) then
       '����
       CheckDir1 = True
    Else
       '������
       CheckDir1 = False
    End if
    Set fso1 = nothing
End Function

'-------------����ָ����������Ŀ¼-----------------------
Function MakeNewsDir1(foldername)
	dim f
    Set fso1 = CreateObject("Scripting.FileSystemObject")
        Set f = fso1.CreateFolder(foldername)'Server.MapPath("..")&"/"&foldername)
        MakeNewsDir1 = True
    Set fso1 = nothing
End Function





'ȡ���ļ���ַ
Function GetFile(FileUrl,FilePath)
Dim AryFileName,Ary
  AryFileName=split(FileUrl,"\")
  Call  SaveFile(AryFileName(Ubound(AryFileName)),GetWebData(FileUrl),FilePath)
End Function


'ȡ��ҳ����
Function GetHttp(url) 
Dim Retrieval,GetBody
  Set Retrieval = CreateObject("Micro"&"soft."&"XMLH"&"TTP")
  Retrieval.Open "Get", url, False
  Retrieval.Send
  GetBody=Retrieval.ResponseBody 
  GetHttp=BytesToBstr(GetBody)
  Set Retrieval = Nothing 
End function


'������ת�ı�
Function BytesToBstr(body)
  Dim objstream
  Set objstream = Server.CreateObject("ado"&"db."&"stre"&"am")
  objstream.Type = 1
  objstream.Mode =3
  objstream.Open
  objstream.Write body
  objstream.Position = 0
  objstream.Type = 2
  objstream.Charset = "GB2312"
  BytesToBstr = objstream.ReadText 
  objstream.Close
set objstream = Nothing
End function





function DeHttpdata(sStr,Ptrn)
Dim regEx,aData,RetStr,Match   ' ����������
  Set regEx = New RegExp   ' �����淶���ʽ��
  regEx.IgnoreCase = False   ' �����Ƿ�������ĸ�Ĵ�Сд��
  regEx.Global = True   ' ����ȫ�����ʡ�
  regEx.Pattern = Ptrn  ' ����ģʽ��
  Set Matches = regEx.Execute(sStr)
  For Each Match in Matches   ' ���� Matches ���� 
     RetStr = RetStr & Replace(Match.Value,"""","") &"|"
  Next
  DeHttpData =RetStr
  'sStr=regEx.Replace(sStr,"^")
  'DeHttpData=sStr'(DeTextDatea(sStr,"^"))
  set regEx=nothing
End function




'ȡ�ú��ֵ�ƴ���׸���ĸ
function getpychar(char)
Dim tmp,C
        C=asc(char)
        if c<0 Then C=C+65536
		If c>255 Then
           tmp=65536+asc(char) 
           if(tmp>=45217 and tmp<=45252) then getpychar= "A" 
           if(tmp>=45253 and tmp<=45760) then getpychar= "B" 
           if(tmp>=45761 and tmp<=46317) then getpychar= "C" 
           if(tmp>=46318 and tmp<=46825) then getpychar= "D" 
           if(tmp>=46826 and tmp<=47009) then getpychar= "E" 
           if(tmp>=47010 and tmp<=47296) then getpychar= "F" 
           if(tmp>=47297 and tmp<=47613) then getpychar= "G" 
           if(tmp>=47614 and tmp<=48118) then getpychar= "H" 
           if(tmp>=48119 and tmp<=49061) then getpychar= "J" 
           if(tmp>=49062 and tmp<=49323) then getpychar= "K" 
           if(tmp>=49324 and tmp<=49895) then getpychar= "L" 
           if(tmp>=49896 and tmp<=50370) then getpychar= "M" 
           if(tmp>=50371 and tmp<=50613) then getpychar= "N" 
           if(tmp>=50614 and tmp<=50621) then getpychar= "O" 
           if(tmp>=50622 and tmp<=50905) then getpychar= "P" 
           if(tmp>=50906 and tmp<=51386) then getpychar= "Q" 
           if(tmp>=51387 and tmp<=51445) then getpychar= "R" 
           if(tmp>=51446 and tmp<=52217) then getpychar= "S" 
           if(tmp>=52218 and tmp<=52697) then getpychar= "T" 
           if(tmp>=52698 and tmp<=52979) then getpychar= "W" 
           if(tmp>=52980 and tmp<=53688) then getpychar= "X" 
           if(tmp>=53689 and tmp<=54480) then getpychar= "Y" 
           if(tmp>=54481 and tmp<=56289) then getpychar= "Z" 
        Else
		   getpychar=Char
	    End If
end function 

on error resume next
Function GetStr(TmpBody,Str1,Str2)
Dim TmpStr


'	TmpBody=zlp
'	Str1=body1(0)
'	Str2=body1(1)
	aa=Instr(TmpBody,Str1)
	bb=Instr(aa+1,TmpBody,Str1)
	cc=Instr(TmpBody,Str2)
	dd=Instr(cc+1,TmpBody,Str2)

	if bb<>0 and dd<>0 then
		ksid=aa							'���Ը���
		jsid=Instr(aa,TmpBody,Str2)
	else
		if bb=0 then
			ksid=aa
			jsid=Instr(aa,TmpBody,Str2)
		else
			if dd=0 then
				jsid=cc
				ksid=InstrRev(TmpBody,Str1,jsid,0)
			end if
		end if
	end if

	TmpStr=Mid(TmpBody,ksid+Len(Str1),jsid-ksid-Len(Str1))

GetStr=TmpStr
End Function

'------��ȥ�������Ӵ���------------
Function Delcjlj(Astr)
	
'	AstrId1=Instr(2,Astr,">")
'	AstrId2=Instr(2,Astr,"<")
'	Delcjlj=Mid(Astr,AstrId1+1,AstrId2-AstrId1-1)

	Astr=replace(Astr,"</font>","")
	Astr=replace(Astr,"</a>","")
	Astr=replace(Astr,"&nbsp;","")
	AstrId1=Instr(1,Astr,"<")
	AstrId2=Instr(1,Astr,">")
	j=1
	do while not (AstrId1=AstrId2)
		j=j+1
		if j>10 then exit do
		if AstrId1<AstrId2 then	
			sub_Astr=mid(Astr,AstrId1,AstrId2)
			Astr=replace(Astr,sub_Astr,"")
		elseif AstrId1>AstrId2 then
			sub_Astr=mid(Astr,1,AstrId2)
			Astr=replace(Astr,sub_Astr,"")
		end if
			AstrId1=Instr(1,Astr,"<")
			AstrId2=Instr(1,Astr,">")
	loop
	Delcjlj=Astr
End Function
'------��ȥ�������Ӵ���------------	




	Function HttpGet(lresolveTimeout,lconnectTimeout,lsendTimeout,lreceiveTimeout,Method,Url,Referer,Data,SetCookie,Language,CONTENT,Agent,Encoding,Accept,CodeBase)
		DoGet.lresolveTimeout 	= lresolveTimeout
		DoGet.lconnectTimeout 	= lconnectTimeout
		DoGet.lsendTimeout    	= lsendTimeout
		DoGet.lreceiveTimeout 	= lreceiveTimeout
		DoGet.Method 		= Method
		DoGet.Url 		= Url
		DoGet.Referer		= Referer
		DoGet.Data		= Data
		DoGet.SetCookie 	= SetCookie
		DoGet.Language 		= Language
		DoGet.CONTENT 		= CONTENT
		DoGet.Agent 		= Agent
		DoGet.Encoding 		= Encoding
		DoGet.Accept 		= Accept
		DoGet.CodeBase 		= CodeBase
		HttpGet = DoGet.HttpGet()
	End Function

    	' ============================================
    	' ȡ��cookieͷ
    	' ============================================
   	Function GetCookie(ByVal strHead, ByVal sBound)
       		If strHead = "" Then
            		GetCookie = ""
            		Exit Function
        	End If
        	Dim strCookie, iCookie, bNum
        	strCookie = strHead
        
        	If strCookie <> "" And InStr(strCookie, "Set-Cookie") > 0 Then
            		strCookie = Replace(strCookie, "Set-Cookie: ", "��")
            		strCookie = Replace(strCookie, ";", "��")
            		Patrn = "��[^��]+��"
           		strCookie = RegExpSearch(Patrn, strCookie, 0, "`")
            		strCookie = Replace(strCookie, "��", "")
            		strCookie = Replace(strCookie, "��", "")
           		strCookie = Split(strCookie, "`")
			bNum = sBound	
			If bNum=-1 Then
				For I=0 To UBound(strCookie)
					If iCookie = "" Then
						iCookie = strCookie(i)
					Else
						iCookie = iCookie & "; " & strCookie(i)
					End If
				Next
			Else
				If bNum > UBound(strCookie) Then
					bNum = UBound(strCookie)
				End If
            			iCookie = strCookie(bNum)
			End If
        	End If
        	GetCookie = iCookie
    	End Function

    	' ============================================
    	' ����ָ����������ʽ�����ַ�
    	' ============================================
	Function RegExpSearch(Patrn, Str, sType, Spacer)
        	Dim RegEx, Match, Matches, RetStr, i
        	i = 0
        	Set RegEx = New RegExp
        	RegEx.Pattern = Patrn
        	RegEx.IgnoreCase = True
        	RegEx.Global = True
        	Set Matches = RegEx.Execute(Str)
        	For Each Match In Matches
            		i = i + 1
            		If sType = 0 Then
                		RetStr = RetStr & Match.Value
                		If i < Matches.Count Then RetStr = RetStr & Spacer
            		Else
                		RetStr = RetStr & Match.Value
                		If i < Matches.Count Then RetStr = RetStr & Spacer
                		If sType = i Then Exit For
            		End If
        	Next
        	RegExpSearch = RetStr
    	End Function


    	'*****************************************************************
    	'   function��˽�У�
    	'   ���� �������������ļ�
    	'*****************************************************************
	Function SaveFiles(ByVal GetUrl, ByVal ToFile, ByVal sCookie, ByVal Agent, ByVal SaveShow, ByVal SaveFileType)
            	Dim Datas, dSize
            	GetUrl = Replace(GetUrl, "\", "/")
            	Datas = HttpGet(99999, 99999, 99999, 99999, "GET", GetUrl, "", "", sCookie, "zh-cn", "", Agent, "", "*/*", "")
				iSize = LenB(Datas)
            	dSize = FormatNumber(iSize / 1024, 3)
'-------------------�ļ�·���жϿ�ʼ------------------------------
				dim savefilesize,flagfile
				savefilesize=100
				flagfile=0
				if dSize<100 and savefiletype=2 then
					response.Write("GetUrl=")
					GetUrl=replace(GetUrl,"http://s2.7t7t.com:81/","http://s1.7t7t.com/")
					response.Write(GetUrl)
'  						response.End()
				'	http://s2.7t7t.com:81		
					GetUrl = Replace(GetUrl, "\", "/")
            		Datas = HttpGet(99999, 99999, 99999, 99999, "GET", GetUrl, "", "", sCookie, "zh-cn", "", Agent, "", "*/*", "")
					iSize = LenB(Datas)
            		dSize = FormatNumber(iSize / 1024, 3)
					savefiletype=2
					response.Write("1")
				end if

				if cint(dSize)<100 and savefiletype=2 then
					GetUrl=replace(GetUrl,"http://s2.7t7t.com:81/","http://s7.7t7t.com/")
					GetUrl = Replace(GetUrl, "\", "/")
            		Datas = HttpGet(99999, 99999, 99999, 99999, "GET", GetUrl, "", "", sCookie, "zh-cn", "", Agent, "", "*/*", "")
					iSize = LenB(Datas)
            		dSize = FormatNumber(iSize / 1024, 3)
					savefiletype=2
					response.Write("2")
				end if
				if cint(dSize)<100 and savefiletype=2 then
					GetUrl=replace(GetUrl,"http://s7.7t7t.com/","http://s4.7t7t.com/")
					GetUrl = Replace(GetUrl, "\", "/")
            		Datas = HttpGet(99999, 99999, 99999, 99999, "GET", GetUrl, "", "", sCookie, "zh-cn", "", Agent, "", "*/*", "")
					iSize = LenB(Datas)
            		dSize = FormatNumber(iSize / 1024, 3)	
					response.Write("3")
				end if
				if cint(dSize)<100 and savefiletype=2 then
					GetUrl=replace(GetUrl,"http://s4.7t7t.com/","http://s2.7t7t.com:81/")
					GetUrl = Replace(GetUrl, "\", "/")
            		Datas = HttpGet(99999, 99999, 99999, 99999, "GET", GetUrl, "", "", sCookie, "zh-cn", "", Agent, "", "*/*", "")
					iSize = LenB(Datas)
            		dSize = FormatNumber(iSize / 1024, 3)	
					response.Write("4")
				end if
				if cint(dSize)<100 and savefiletype=2 then
					GetUrl=replace(GetUrl,"http://s2.7t7t.com:81/","http://58.211.78.28/xx/")
					GetUrl = Replace(GetUrl, "\", "/")
            		Datas = HttpGet(99999, 99999, 99999, 99999, "GET", GetUrl, "", "", sCookie, "zh-cn", "", Agent, "", "*/*", "")
					iSize = LenB(Datas)
            		dSize = FormatNumber(iSize / 1024, 3)	
					response.Write("5")
				end if
				if cint(dSize)<100 and savefiletype=2 then
					GetUrl=replace(GetUrl,"http://58.211.78.28/xx/","http://s2.7t7t.com:81/")
					GetUrl = Replace(GetUrl, "\", "/")
            		Datas = HttpGet(99999, 99999, 99999, 99999, "GET", GetUrl, "", "", sCookie, "zh-cn", "", Agent, "", "*/*", "")
					iSize = LenB(Datas)
            		dSize = FormatNumber(iSize / 1024, 3)
					response.Write("6")	
				end if
				if cint(dSize)<100 and savefiletype=2 then
					GetUrl=replace(GetUrl,"http://s2.7t7t.com:81/","http://58.211.7.203:81/")
					GetUrl = Replace(GetUrl, "\", "/")
            		Datas = HttpGet(99999, 99999, 99999, 99999, "GET", GetUrl, "", "", sCookie, "zh-cn", "", Agent, "", "*/*", "")
					iSize = LenB(Datas)
            		dSize = FormatNumber(iSize / 1024, 3)
					response.Write("7")
					flagfile=1
				end if
'-------------------�ļ�·���жϽ���------------------------------
				
            '	If iSize < 30720 Then
			Set Ados = Server.CreateObject("ADODB.Stream")
                	Ados.Type = 1
                	Ados.Mode = 3
                	Ados.Open
                	Ados.Write Datas
                	Ados.SaveToFile ToFile,2
					Ados.Cancel()
                	Ados.Close()
			Set Ados = Nothing
                	SaveFiles = True
                	If SaveShow = 1 Then
                    		Response.Write "����ɹ���<font color=red>" & dSize & "</font>Kb<br>"
                	End If 
					if dSize<100 and savefiletype=2 and flagfile=0 then
  						response.End()
  					end if
            '	Else
			'	    Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
			'		Set MyTextFile=MyFileObject.OpenTextFile("no.txt",8,TRUE)
			'			MyTextFile.WriteLine(ToFile)
			'			MyTextFile.Close
            '    	SaveFiles = False
             '   	If SaveShow = 1 Then
             '       		Response.Write "����ʧ�ܣ�<font color=red>�ļ���С" & iSize & "K������30M</font>"
             '   	End If
            '	End If
    	End Function
    	' ============================================
    	' ����ļ����Ƿ���� ��������ھ��Զ������༶�ļ���
    	' ============================================
	Function CreatePath(strPath)
        	Dim fldr, FristStr
			strPath = Replace(strPath, "/", "\")
        	strPath = Replace(strPath, Chr(0), "")
        	'strPath = Replace(strPath, "\\", "\")
			If Right(strPath, 1) = "\" Then
            		strPath = Left(strPath, Len(strPath) - 1)
        	Else
            		strPath = strPath
        	End If
			ljfz=Split(strPath, "\\")
        	GetNewsFold = Split(ljfz(1), "\")
        	fldr = ""
		Set FSO = Server.CreateObject("Scripting.FileSystemObject")
        	For i = 0 To UBound(GetNewsFold)
            		If fldr = "" Then
                		fldr = ljfz(0)&"\" & GetNewsFold(i)
            		Else
                		fldr = fldr & "\" & GetNewsFold(i)
            		End If
            		If FSO.FolderExists(fldr) = False Then
                		Call FSO.CreateFolder (fldr)
            		End If
        	Next
		Set FSO = Nothing
    	End Function
    	' ============================================
    	'   function�����У�
    	'   ���� �������ļ������Զ������༶�ļ���
    	' ============================================
	Function SaveData(FromUrl, ToFiles, sCookie, sAgent, SaveType, SaveShow,SaveFileType)
        	Dim strFile, NewPath
			strFile = Replace(ToFiles, "/", "\")
        	'strFile = Replace(strFile, "\\", "\")
			strFile = Replace(strFile, Chr(0), "")
        	NewPath = Mid(strFile, 1, InStrRev(strFile, "\"))
		Set FSO = Server.CreateObject("Scripting.FileSystemObject")
        	If FSO.FileExists(strFile) = False Then
            		If FSO.FolderExists(NewPath) = False Then
                    		Call CreatePath(NewPath)
            		End If
            		SaveData = SaveFiles(FromUrl, strFile, sCookie, sAgent ,SaveShow,SaveFileType)
        	Else
            		' �����ļ�
            		If SaveType = 1 Then
                		SaveData = SaveFiles(FromUrl, strFile, sCookie, sAgent ,SaveShow,SaveFileType)
            		Else
                		SaveData = True
            		End If
        	End If
		Set FSO = Nothing
    	End Function
		
		Function RemoveHTML1(strHTML,Pattern1) 
			Dim objRegExp, Match, Matches 
			Set objRegExp = New Regexp 
			
			objRegExp.IgnoreCase = True 
			objRegExp.Global = True 
			'ȡ�պϵ�<> 
			objRegExp.Pattern = Pattern1
			'����ƥ�� 
			set Matches = objRegExp.Execute(strHTML) 
			
			' ����ƥ�伯�ϣ����滻��ƥ�����Ŀ 
			For Each Match in Matches 
				im=im+1
				if im=1 then
					strHTML1=Match.Value'Replace(strHTML,Match.Value,"2") 
				else
					strHTML1=strHTML1&"|"&Match.Value
				end if
			Next 
			RemoveHTML1=strHTML1 
			Set objRegExp = nothing 
		End Function 
		
		
	function bqtf(s)
		if s<>"" then
			s=replace(s,"'","''") 
			s=replace(s,"&nbsp;","&amp;nbsp;")
			s=replace(s,"<","&lt;")
			s=replace(s,">","&gt;")
		end if
		bqtf=s 
	end function

	function bqtf1(s)
		if s<>"" then
			s=replace(s,"''","'") 
			s=replace(s,"&amp;nbsp;","&nbsp;")
			s=replace(s,"&lt;","<")
			s=replace(s,"&gt;",">")
		end if
		bqtf1=s 
	end function 

	function CheckAdmin1
		if Session("IsAdmin")<>true then response.redirect "admin/error.asp"
	end function
	sub error()
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name=author content=����վ����ͨ�òɼ�����>
<title>����վ����ͨ�òɼ�����</title>
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
                <b>Error��&nbsp; <%=errmsg%>��&nbsp; :(</b>
                <p><b><a href="javascript:history.go(-1)">...::: �� �� �� �� 
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
