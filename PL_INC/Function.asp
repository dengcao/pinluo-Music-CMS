<%
'
'����������������������������������������������������
'��                                                                   ��
'��                     Ʒ�����ֳ���ϵͳ1.0                              ��
'��                                                                   ��
'��     �ռ�����: Ʒ��  www.pinluo.com                                  ��
'��                                                                   ��
'��     ��������: ����  www.caozha.com                                  ��
'��                                                                   ��
'��     Դ�����Apache-2.0��ѿ�Դ���뱣�����������ӣ�                      ��
'��                                                                   ��
'����������������������������������������������������
'
'
'���Դ���
Sub Re1(Str)
	Response.Write Str
	Response.End
End Sub

'���Դ���
Sub Rw(Str)
	Response.Write Str & vbCrLf
	Response.Flush
End Sub

'д�������¼
Function WriteMovement(mTake,mType,mUser,mUserType,mTitle,mContent)
	Dim mRs,Sql
	Set mRs = Server.Createobject("adodb.recordset")
	mSql = "Select * From MovementLog Where mTake='" & mTake & "' And mType='" & mType & "' And mUser='" & mUser & "'"
	mRs.Open mSql,Conn,1,3
	If mRs.Bof Or mRs.Eof Then
		WriteMovement = False
		mRs.AddNew
		mRs("mTake")      = mTake
		mRs("mType")      = mType
		mRs("mUser")      = mUser
		mRs("mUserType")  = mUserType
		mRs("mTitle")     = mTitle
		mRs("mContent")   = mContent
		mRs("mIp")        = GetIP()
		mRs("mTime")      = Now()
		mRs("mReffer")    = Request.ServerVariables("HTTP_REFERER")
		mRs("mUseragent") = Request.Servervariables("HTTP_USER_AGENT")
		mRs.Update
	Else
		WriteMovement = True
	End If
	mRs.Close
	Set mRs = Nothing
End Function

'��Ϣ��ʾ
Function Message(MsgType,Msg,DoRef,DoUrl)
	Rw "<html>"
	Rw "  <head>"
	Rw "  <title>" & MsgType & "</title>"
	Rw "  <meta http-equiv=Content-Type content=text/html; charset=gb2312>"
	Rw "  <link href=Images/style.css rel=stylesheet type=text/css>"
	Rw "  </head>"
	Rw "<body>"
	Rw "<br><br><BR>"
	Rw "<table cellpadding=5 cellspacing=1 border=0 align=center class=tableBorder1>"
	Rw "  <tr><th>" & MsgType & "</th></tr>"
	Rw "  <tr><td width=100% height=45 class=forumRow>" & Msg & "</td></tr>"
	Rw "  <tr><td align=center height=25 class=forumRowHighlight><a href=javascript:history.go(-1)>������һҳ...</a></td></tr>"
	Rw "</table><BR>"
	If DoRef > 0 Then
		Call Redirect(DoUrl,DoRef)
	End If
	Rw "</body></html>"
	Response.End
End Function

' ============================================
' ����Url,���ȡUrl
' ============================================
Function CacheUrl(ByVal CName, ByVal sType)
	If sType=0 Then
		Response.Cookies(CName) = "http://"&Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("HTTP_URL")
		CacheUrl = ""
	Else
		CacheUrl = Request.Cookies(CName)
	End If
End Function

' ============================================
' ȡ��Զ���ļ�
' ============================================
Function HttpGet(lresolveTimeout,lconnectTimeout,lsendTimeout,lreceiveTimeout,Method,Url,Referer,Data,SetCookie,Language,CONTENT,Agent,Encoding,Accept,CodeBase)
	'Response.Write Url & "<br>" & VbCrLf
    	Set DoGet 		= New FlyCms_AspHttp
	DoGet.lresolveTimeout 	= lresolveTimeout
	DoGet.lconnectTimeout 	= lconnectTimeout
	DoGet.lsendTimeout    	= lsendTimeout
	DoGet.lreceiveTimeout 	= lreceiveTimeout
	DoGet.Method 		= Method
	DoGet.Url 		= Url
	If Referer="" Then
		DoGet.Referer		= DoGet.sUrl
	Else
		DoGet.Referer		= Referer
	End If
	DoGet.Data		= Data
	DoGet.SetCookie 	= SetCookie
	DoGet.Language 		= Language
	DoGet.CONTENT 		= CONTENT
	DoGet.Agent 		= Agent
	DoGet.Encoding 		= Encoding
	DoGet.Accept 		= Accept
	DoGet.CodeBase 		= CodeBase
	HttpGet 		= DoGet.HttpGet()
	strHeaders 		= DoGet.strHeaders
   	Set DoGet 		= Nothing
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
            If bNum = -1 Then
                For i = 0 To UBound(strCookie)
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
' �����û�ָ�ɲ��趨����
' ============================================
Sub SetCache(ByVal SetName, ByVal NewValue)
    Application.Lock
    Application(SetName) = NewValue
    Application.UnLock
End Sub
' ============================================
' �����û�ָ�����ĳ������
' ============================================
Sub MakeEmpty(ByVal SetName)
    Application.Lock
    Application(SetName) = Empty
    Application.UnLock
End Sub
' ============================================
' ������л���
' ============================================
Sub ClearCache()
    Application.Contents.RemoveAll
    Session.Contents.RemoveAll
End Sub
' ============================================
' �鿴���л���
' ============================================
Sub ShowCache()
    Rw "����ĳ�����һ��ʹ���� " & Session.Contents.Count & " ��Session����<P>"
    Dim strName, iLoop
    For Each strName In Session.Contents
        '�ж�һ��Session�����Ƿ�Ϊ����
        If IsArray(Session(strName)) Then
            '��������飬��ô���г����е�����Ԫ������
            For iLoop = LBound(Session(strName)) To UBound(Session(strName))
                Rw strName & "(" & iLoop & ") - " & Session(strName)(iLoop) & "<BR>"
            Next
        Else
            '����������飬��ôֱ����ʾ
            Rw strName & " - " & Session.Contents(strName) & "<BR>"
        End If
    Next
    
    Rw "����ĳ�����һ��ʹ���� " & Application.Contents.Count & " ��application����<P>"
    Dim strName1, iLoop1
    For Each strName1 In Application.Contents
        '�ж�һ��Session�����Ƿ�Ϊ����
        If IsArray(Application(strName1)) Then
            '��������飬��ô���г����е�����Ԫ������
            For iLoop1 = LBound(Application(strName1)) To UBound(Application(strName1))
                Rw "Application(" & Chr(34) & Replace(strName1 & Chr(34) & ")(" & iLoop1 & ")=" & Chr(34) & Application(strName1)(iLoop1) & Chr(34) & "<BR>", "script", "sc")
            Next
        Else
            '����������飬��ôֱ����ʾ
            Rw "Application(" & Chr(34) & strName1 & Chr(34) & ")=" & Chr(34) & Replace(Application.Contents(strName1), "script", "") & Chr(34) & "<BR>"
        End If
    Next
End Sub
' ============================================
' ����·����ȡ�ļ���
' ============================================
Function GetFileNameByPath(FullPath)
    Dim pos, pvs
    FullPath = Replace(FullPath, "/", "\")
    pos = InStrRev(FullPath, "\") + 1
    pvs = InStrRev(FullPath, "?") - pos
    If (pos > 0) Then
        If pvs > 0 Then
            GetFileNameByPath = Mid(FullPath, pos, pvs)
        Else
            GetFileNameByPath = Mid(FullPath, pos)
        End If
    Else
        GetFileNameByPath = FullPath
    End If
End Function
' ============================================
' ����·����ȡ��չ��
' ============================================
Function GetFileExt(FullPath)
    Dim pos, pvs
    pos = InStrRev(FullPath, ".")
    pvs = InStrRev(FullPath, "?") - pos
    If pos > 0 Then
        If pvs > 0 Then
            GetFileExt = Mid(FullPath, pos, pvs)
        Else
            GetFileExt = Mid(FullPath, pos)
        End If
    End If
End Function
' ============================================
' ��⴫�����,��ֹSQLע��
' ============================================
Function CheckRequest(ByVal strRequest)
    Dim ParaValue, aBadUalueb, bBadValue, inBad, strBad
    If strRequest = "" Then
        CheckRequest = ""
        Exit Function
    End If
    ParaValue = Request(strRequest)
    If ParaValue = "" Then
        CheckRequest = ""
        Exit Function
    End If
    aBadValue = "net user|net localgroup administrators|xp_cmdshell|/add|exec%20master.dbo.xp_cmdshell|" & Chr(0) & ""
    aValueArr = Split(aBadValue, "|")
    For a = 0 To UBound(aValueArr)
        If InStr(LCase(ParaValue), aValueArr(a)) <> 0 Then
            ParaValue = Replace(ParaValue, aValueArr(a), strFToAsc(aValueArr(a)), 1, -1, vbTextCompare)
        End If
    Next

    bBadUalue = "and|exec|insert|select|delete|update|count|chr|mid|master|truncate|char|declare|drop|from|or"
    inBad = "(|)|[|]| |*|%20"
    bValueArr = Split(bBadUalue, "|")
    iBad = Split(inBad, "|")
    For b = 0 To UBound(bValueArr)
        strBad = bValueArr(b)
        For i = 0 To UBound(iBad)
            Fstr = strBad & iBad(i)
            If InStr(LCase(ParaValue), Fstr) <> 0 Then
                ParaValue = Replace(ParaValue, Fstr, strFToAsc(Fstr), 1, -1, vbTextCompare)
            End If
            Lstr = iBad(i) & strBad
            If InStr(LCase(ParaValue), Lstr) <> 0 Then
                ParaValue = Replace(ParaValue, Lstr, strFToAsc(Lstr), 1, -1, vbTextCompare)
            End If
        Next
    Next

    CheckRequest = ParaValue
End Function
' ============================================
' ���ַ�ת����Html��
' ============================================
Function strFToAsc(ByVal strValue)
    Dim strTemp
    strTemp = strValue
    If strTemp = "" Then
        strFToAsc = ""
        Exit Function
    End If
    strTemp = "&#" & Asc(Left(strTemp, 1)) & ";" & Right(strTemp, Len(strTemp) - 1)
    strFToAsc = strTemp
End Function
' ============================================
' ��ȡ�ַ�����
' ============================================
Function StrLength(Str)
    If IsNull(Str) Or Str = "" Then
        StrLength = 0
        Exit Function
    End If
    Dim l, t, c, i
    l = Len(Str)
    t = l
    For i = 1 To l
        c = Asc(Mid(Str, i, 1))
        If c < 0 Then c = c + 65536
        If c > 255 Then
            t = t + 1
        End If
    Next
    StrLength = t
End Function
' ============================================
' ����һ���ַ�����һ�������е�λ��
' ============================================
Function InArray(Str, Arr)
    Dim i
    For i = 0 To UBound(Arr)
        If Arr(i) = Str Then InArray = i: Exit Function
    Next
End Function
' ============================================
' ����ָ����������ʽ�滻�ַ�
' ============================================
Function RegExpFilter(Patrn, Str, sType, ReplaceWith)
    Dim RegEx
    Set RegEx = New RegExp
    If sType = 1 Then
        RegEx.Global = True
    Else
        RegEx.Global = False
    End If
    RegEx.Pattern = Patrn
    RegEx.IgnoreCase = True
    RegExpFilter = RegEx.Replace(Str, ReplaceWith)
End Function
' ============================================
' ����ָ����������ʽ�����ַ�
' ============================================
Function RegExpSearch(ByVal Patrn, ByVal strValue, ByVal sType, ByVal Spacer)
    Dim RegEx, Match, Matches, RetStr, i
    i = 0
    Set RegEx = New RegExp
    RegEx.Pattern = Patrn
    RegEx.IgnoreCase = True
    RegEx.Global = True
    Set Matches = RegEx.Execute(strValue)
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
' ============================================
' ������֤
' ============================================
Function ChkReg(ByVal Patrn, ByVal strValue)
    Dim RegEx
    Set RegEx = New RegExp
    RegEx.Pattern = Patrn
    RegEx.IgnoreCase = True
    RegEx.Global = True
    ChkReg = RegEx.Test(strValue)
End Function
' ============================================
'�����ȡ�ַ�
' ============================================
Function RegContent(ByVal strValue, ByVal Start, ByVal last, ByVal n, ByVal ReGlobal)
        Dim TmpStr, Patrn
        TmpStr = strValue
        
        TmpStr = Replace(TmpStr, Start, "��")
        TmpStr = Replace(TmpStr, last, "��")
        Patrn = "��[^��]+��"
        TmpStr = RegExpSearch(Patrn, TmpStr, 0, "`")
        If InStr(TmpStr, "`") > 0 Then
            If ReGlobal = False Then
                TmpStr = Split(TmpStr, "`")(0)
            Else
                TmpStr = TmpStr
            End If
        End If
        TmpStr = Replace(TmpStr, "��", Start)
        TmpStr = Replace(TmpStr, "��", last)
        
        Select Case n
            Case 0  '��ȥ���ؼ��֣�
            TmpStr = Replace(TmpStr, Start, "")
            TmpStr = Replace(TmpStr, last, "")
            Case 1  '�������ؼ��֣�
            TmpStr = TmpStr
            Case 2  '��ȥ��ǰ���֣�
            TmpStr = Replace(TmpStr, Start, "")
            Case 3  '��ȥ������֣�
            TmpStr = Replace(TmpStr, last, "")
        End Select
        RegContent = TmpStr
End Function
    ' ============================================
    ' ���ı��е�HTML��������
    ' ============================================
    Function RemoveHTML(StrHTML)
        Dim ObjRegExp, Match, Matches
        Set ObjRegExp = New RegExp
        ObjRegExp.IgnoreCase = True
        ObjRegExp.Global = True
        ' ȡ�պϵ�<>
        ObjRegExp.Pattern = "<.+?>"
        ' ����ƥ��
        Set Matches = ObjRegExp.Execute(StrHTML)
        ' ����ƥ�伯�ϣ����滻��ƥ�����Ŀ
        For Each Match In Matches
            StrHTML = Replace(StrHTML, Match.Value, "")
        Next
        RemoveHTML = Replace(StrHTML, Chr(34), "")
        RemoveHTML = Replace(StrHTML, Chr(13), "")
        RemoveHTML = Replace(StrHTML, Chr(10), "")
        RemoveHTML = Replace(StrHTML, "&nbsp;", "")
        'RemoveHTML = Replace(StrHTML, vbTab, "")
        RemoveHTML = RTrim(LTrim(StrHTML))
        Set ObjRegExp = Nothing
    End Function

    Function UrlEnCode(Str)
	Dim RegEx, Match, Matches , RetStr
	RetStr = Replace(Str, " ", "%20")
	Set RegEx = New RegExp
	RegEx.Pattern = "([\u4e00-\u9fa5])"
	RegEx.IgnoreCase = True
	RegEx.Global = True
	Set Matches = RegEx.Execute(Str)
	For Each Match In Matches	
		RetStr = Replace(RetStr, Match.Value, Server.UrlEncode(Match.Value))
	Next
	UrlEnCode = RetStr
    End Function

    Function Str2Hex(ByVal strHex)
        Dim s1, sHex
        For i = 1 To Len(strHex)
            s1 = Hex(Asc(Mid(strHex, i, 1)))
            If Len(s1) = 4 Then
                s1 = "%" & Left(s1, 2) & "%" & Right(s1, 2)
            Else
                s1 = "%" & s1
            End If
            sHex = sHex & s1
        Next
        Str2Hex = sHex
    End Function

' ============================================
' �����ҳ�Ƿ�ӱ�վ�ύ
' ����:True, False
' ============================================
Function IsSelfRefer()
    Dim sHttp_Referer, sServer_Name
    sHttp_Referer = CStr(Request.ServerVariables("HTTP_REFERER"))
    sServer_Name = CStr(Request.ServerVariables("SERVER_NAME"))
    If Mid(sHttp_Referer, 8, Len(sServer_Name)) = sServer_Name Then
        IsSelfRefer = True
    Else
        IsSelfRefer = False
    End If
End Function
' ============================================
' ��ȡ��ʵ��IP��ַ ������Ϊ15λ
' ============================================
Function GetIP()
    GetIP = Left(Replace(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), "'", ""), 15)
    If GetIP = "" Then GetIP = Left(Replace(Request.ServerVariables("REMOTE_ADDR"), "'", ""), 15)
End Function
' ============================================
' ��ʽ��ʱ��(������ʾ)
' ============================================
Function FormatTime(s_Time, n_Flag)
    If IsDate(s_Time) = False Then Exit Function
    Dim y, m, d, h, mi, s, w
    ' ���ӿͻ���ʱ��ͬ������
    ' ȫվ��ʾʱ��ʱ������ô˷����������޷���ȷ��ʾʱ��
    s_Time = DateAdd("h", TimeZone - 8, s_Time)
    FormatTime = ""
    y = CStr(Year(s_Time))
    m = CStr(Month(s_Time))
    If Len(m) = 1 Then m = "0" & m
    d = CStr(Day(s_Time))
    If Len(d) = 1 Then d = "0" & d
    h = CStr(Hour(s_Time))
    If Len(h) = 1 Then h = "0" & h
    mi = CStr(Minute(s_Time))
    If Len(mi) = 1 Then mi = "0" & mi
    s = CStr(Second(s_Time))
    If Len(s) = 1 Then s = "0" & s
    
    w = Weekday(s_Time)
    Select Case w
        Case 1
        w = "������"
        Case 2
        w = "����һ"
        Case 3
        w = "���ڶ�"
        Case 4
        w = "������"
        Case 5
        w = "������"
        Case 6
        w = "������"
        Case 7
        w = "������"
    End Select
    
    Select Case n_Flag
        Case 1 ' yyyy-mm-dd hh:mm:ss
            FormatTime = y & "-" & m & "-" & d & " " & h & ":" & mi & ":" & s
        Case 2 ' yyyy-mm-dd
            FormatTime = y & "-" & m & "-" & d
        Case 3 ' hh:mm:ss
            FormatTime = h & ":" & mi & ":" & s
        Case 4 ' yyyy��mm��dd��
            FormatTime = y & "��" & m & "��" & d & "��"
        Case 5 ' yyyymmddhhmmss
            FormatTime = y & m & d & h & mi & s
        Case 6 ' yyyy��mm��dd�� hhʱmm��ss��
            FormatTime = y & "��" & m & "��" & d & "��" & " " & h & "ʱ" & mi & "��" & s & "��"
        Case 7 ' mm-dd
            FormatTime = m & "-" & d
        Case 8 ' yyyy��mm��dd�� ����w
            FormatTime = y & "��" & m & "��" & d & "��" & " " & w
    End Select
End Function
' ============================================
' ��ȡ�ͻ�������
' ============================================
Function ClientInfo(sType)
    Dim User_Agent
    User_Agent = Request.ServerVariables("HTTP_USER_AGENT")
    If sType = 0 Then
        If InStr(User_Agent, "Windows 98") Then
            ClientInfo = "Windows 98"
        ElseIf InStr(User_Agent, "Win 9x 4.90") Then
            ClientInfo = "Windows ME"
        ElseIf InStr(User_Agent, "Windows NT 5.0") Then
            ClientInfo = "Windows 2000"
        ElseIf InStr(User_Agent, "Windows NT 5.1") Then
            ClientInfo = "Windows XP"
        ElseIf InStr(User_Agent, "Windows NT 5.2") Then
            ClientInfo = "Windows 2003"
        ElseIf InStr(User_Agent, "Windows NT") Then
            ClientInfo = "Windows NT"
        ElseIf InStr(User_Agent, "unix") Or InStr(User_Agent, "Linux") Or InStr(User_Agent, "SunOS") Or InStr(User_Agent, "BSD") Then
            ClientInfo = "Unix & Linux"
        Else
            ClientInfo = "Other"
        End If
    ElseIf sType = 1 Then
        If InStr(User_Agent, "MSIE 6") Then
            ClientInfo = "Microsoft<sup>&reg;</sup> Internet Explorer 6.0"
        ElseIf InStr(User_Agent, "MSIE 5") Then
            ClientInfo = "Microsoft<sup>&reg;</sup> Internet Explorer 5.0"
        ElseIf InStr(User_Agent, "MSIE 4") Then
            ClientInfo = "Microsoft<sup>&reg;</sup> Internet Explorer 4.0"
        ElseIf InStr(User_Agent, "Netscape") Then
            ClientInfo = "Netscape<sup>&reg;</sup>"
        ElseIf InStr(User_Agent, "Opera") Then
            ClientInfo = "Opera<sup>&reg;</sup>"
        Else
            ClientInfo = "Other"
        End If
    End If
End Function
' ============================================
' ��ʱ��ַ��ת
' ============================================
Function Redirect(Url, sTime)
    On Error Resume Next
    If sTime = 0 Then Response.Redirect (Url)
    Rw ("<script language=""javascript1.2"">window.setTimeout(""location.href='" & Url & "';"", " & sTime & ");</script>")
End Function
' ============================================
' �������ʾ����ѡ���Ե�ַת��
' ============================================
Function Tp(Msg, Urlt, Urlf, sTime)
    Dim Href1, Href2
    If IsNumeric(Urlt) Then
        Href1 = "history.go(-1);"
    Else
        Href1 = "location.href='" & Urlt & "';"
    End If
    If IsNumeric(Urlf) Then
        Href2 = "history.go(-1);"
    Else
        Href2 = "location.href='" & Urlf & "';"
    End If
    Rw ("<script language=""javascript1.2"">" & _
        "   var tp=window.confirm(""" & Msg & """);" & _
        "   if (tp) {" & _
        "       window.setTimeout(""" & Href1 & """, " & sTime & ");" & _
        "   } else { " & _
        "       window.setTimeout(""" & Href2 & """, " & sTime & ");" & _
        "   }</script>")
    Response.End
End Function
' ============================================
' ��Ϣ����ʾ������ַת��
' ============================================
Function Alert(Msg, Url, sTime)
    Dim Href
    If IsNumeric(Url) Then
        Href = "history.go(-1);"
    Else
        Href = "location.href='" & Url & "';"
    End If
    Rw ("<script language=""javascript1.2"">alert(""" & Msg & """);window.setTimeout(""" & Href & """, " & sTime & ");</script>")
    Response.End
End Function


'�� mp3.zhongsou.com ȡ���ĸ��
Function GetGeCi(SinGerName, MusicName , ByRef TextGeCi, ByRef LrcGeCi)
    On Error Resume Next

    Dim GeciURL
    Dim Words
    Dim strTemp
    GeciURL = "http://mp3.zhongsou.com/m?w={Words}&ty=2"
    
    If InStr(SinGerName, "[") > 0 Then
        SinGerName = Mid(SinGerName, 1, InStr(SinGerName, "[") - 1)
    End If
    If InStr(SinGerName, "(") > 0 Then
        SinGerName = Mid(SinGerName, 1, InStr(SinGerName, "(") - 1)
    End If
    If InStr(MusicName, "(") > 0 Then
        MusicName = Mid(MusicName, 1, InStr(MusicName, "(") - 1)
    End If
    Words = Str2Hex(SinGerName) & "+" & Str2Hex(MusicName)
    GeciURL = Replace(GeciURL, "{Words}", Words)
    'Rw GeciURL
    Rw "<br>"

    strTemp = HttpGet(10000, 10000, 20000, 20000, "GET", GeciURL, GeciURL, sData, "", "zh-cn", "", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)", "", "*/*", "gb2312")

    If InStr(strTemp, "��Ǹ��û���ҵ�") > 0 Then
        TextGeCi = "���޸��"
        LrcGeCi = "����LRC���"
        Exit Function
    Else
    	strTemp = Replace(strTemp, "`", "")
    	strTemp = Replace(strTemp, "��", "")
    	strTemp = Replace(strTemp, "��", "")
    	strTemp = Replace(strTemp, Chr(34), "")
    	strTemp = Replace(strTemp, Chr(37) &">", ">")
	strTemp = RegContent(strTemp, ".<font color=red>", "</span><br></td></tr>", 1, False)
	'Rw strTemp
	'ȡ���ı����
		Dim TmpGeCi
		TmpGeCi = strTemp
        	tStart = "<td valign=top class=z style=padding-left:20pt>"
        	tLast = "</span><br></td></tr>"
        	TmpGeCi = RegContent(TmpGeCi, tStart, tLast, 0, False)
        	TmpGeCi = Replace(TmpGeCi, "<br>", vbCrLf)
        	TmpGeCi = RemoveHTML(TmpGeCi)
        	TmpGeCi = Replace(TmpGeCi, vbCrLf, "<br>" & vbCrLf)
		TmpGeCi = Replace(LCase(TmpGeCi), "liuxuan", "7t7t")
        	TextGeCi = TmpGeCi

		If Trim(TextGeCi) = "" Then TextGeCi = "���޸��"
		
	'ȡ��LRC���
		Dim TempLrc,LrcURL
		TmpLrc = RegContent(strTemp, "<a href=mc", " class=z1>", 0, False)

    		If TmpLrc = "" Then
        		LrcGeCi = "����LRC���"
        		Exit Function
    		End If

    		Dim TempLRCWords
    		TempLRCWords = ""
    		LrcURL = "http://mp3.zhongsou.com/mc" & TmpLrc
		TempLRCWords = HttpGet(10000, 10000, 20000, 20000, "GET", LrcURL, GeciURL, sData, "", "zh-cn", "", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)", "", "*/*", "gb2312")
		TempLRCWords = RemoveHTML(TempLRCWords)
		TempLRCWords = Replace(TempLRCWords, "liuxuan", "dqle", 1, -1, vbTextCompare)
    		If InStr(TempLRCWords, "[") > 0 And InStr(TempLRCWords, "]") > 0 Then
        		LrcGeCi = TempLRCWords
    		Else
        		LrcGeCi = "����LRC���"
    		End If

		If Trim(LrcGeCi) = "" Then TextGeCi = "����LRC���"
    End If
End Function

' ============================================
' ����n1-n2֮��������
' ============================================
Function RndNum(ByVal StartNum,ByVal EndNum)
	Randomize
	RndNum = Int((EndNum-StartNum) * Rnd) + StartNum
End Function

' ============================================
' ȡ����վ��Դ
' ============================================
Function GetRefer()
    	Dim sHttp_Referer
    	sHttp_Referer = LCase(CStr(Request.ServerVariables("HTTP_REFERER")))
	sHttp_Referer = Replace(sHttp_Referer,"http://","")
	sHttp_Referer = Replace(sHttp_Referer,"www.","")
	sHttp_Referer = Replace(sHttp_Referer,"\","/")
	sHttp_Referer = Replace(sHttp_Referer,"//","/")
	If InStr(sHttp_Referer,"/")>0 Then
		sHttp_Referer = Mid(sHttp_Referer,1,InStr(sHttp_Referer,"/")-1)
	End If
	GetRefer = sHttp_Referer
End Function
%>
