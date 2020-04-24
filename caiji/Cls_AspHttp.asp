<%
'=================================================================

'=================================================================
Class FlyCms_AspHttp
	Public oForm,oXml,Ados
	Public strHeaders
	Public sMethod
	Public sUrl
	Public sReferer
	Public sSetCookie
	Public sLanguage
	Public sCONTENT
	Public sAgent
	Public sEncoding
	Public sAccept
	Public sData
	Public sCodeBase
	Private slresolveTimeout,slconnectTimeout,slsendTimeout,slreceiveTimeout
	' ============================================
	' ��ģ���ʼ��
	' ============================================
	Private Sub Class_Initialize()
		oForm = ""	
		Set oXml = Server.CreateObject("MSXML2.ServerXMLHTTP")
		set Ados = Server.CreateObject("Adodb.Stream") 
    		slresolveTimeout = 99999   ' ����DNS���ֵĳ�ʱʱ��,20��
    		slconnectTimeout = 99999   ' ����Winsock���ӵĳ�ʱʱ��,20��
    		slsendTimeout 	 = 99999   ' �������ݵĳ�ʱʱ��,30��
    		slreceiveTimeout = 99999   ' ����response�ĳ�ʱʱ��,30��
	End Sub

	' ============================================
	' ���ذ汾��Ϣ
	' ============================================
	Public Property Get Version
		Version = "1.0.0"
	End Property
	' ============================================
	' ����DNS���ֵĳ�ʱʱ��
	' ============================================
	Public Property Let lresolveTimeout(LngSize)
		If IsNumeric(LngSize) Then
			slresolveTimeout = Clng(LngSize)
		End If
	End Property
	' ============================================
	' ����Winsock���ӵĳ�ʱʱ��
	' ============================================
	Public Property Let lconnectTimeout(LngSize)
		If IsNumeric(LngSize) Then
			slconnectTimeout = Clng(LngSize)
		End If
	End Property
	' ============================================
	' �������ݵĳ�ʱʱ��
	' ============================================
	Public Property Let lsendTimeout(LngSize)
		If IsNumeric(LngSize) Then
			slsendTimeout = Clng(LngSize)
		End If
	End Property
	' ============================================
	' ����response�ĳ�ʱʱ��
	' ============================================
	Public Property Let lreceiveTimeout(LngSize)
		If IsNumeric(LngSize) Then
			slreceiveTimeout = Clng(LngSize)
		End If
	End Property
	' ============================================
	' Method
	' ============================================
	Public Property Let Method(strMethod)
		sMethod = strMethod
	End Property
	' ============================================
	' ����url
	' ============================================
	Public Property Let Url(strUrl)
		sUrl = strUrl
	End Property
	' ============================================
	' Data
	' ============================================
	Public Property Let Data(strData)
		sData = strData
	End Property
	' ============================================
	' Referer
	' ============================================
	Public Property Let Referer(strReferer)
		sReferer = strReferer
	End Property
	' ============================================
	' SetCookie
	' ============================================
	Public Property Let SetCookie(strCookie)
		sSetCookie = strCookie
	End Property
	' ============================================
	' Language
	' ============================================
	Public Property Let Language(strLanguage)
		sLanguage = strLanguage
	End Property
	' ============================================
	' CONTENT-Type
	' ============================================
	Public Property Let CONTENT(strCONTENT)
		sCONTENT = strCONTENT
	End Property
	' ============================================
	' User-Agent
	' ============================================
	Public Property Let Agent(strAgent)
		sAgent = strAgent
	End Property
	' ============================================
	' Accept-Encoding
	' ============================================
	Public Property Let Encoding(strEncoding)
		sEncoding = strEncoding
	End Property
	' ============================================
	' Accept
	' ============================================
	Public Property Let Accept(strAccept)
		sAccept = strAccept
	End Property
	' ============================================
	' CodeBase
	' ============================================
	Public Property Let CodeBase(strCodeBase)
		sCodeBase = strCodeBase
	End Property
	' ============================================
	' �������ݴ��Ͷ���!
	' ============================================
	Public Function AddItem(Key, Value)
    		On Error Resume Next
    		Dim TempStr
    		If oForm = "" Then
        		oForm = Key + "=" + Server.URLEncode(Value)
    		Else
        		oForm = oForm + "&" + Key + "=" + Server.URLEncode(Value)
    		End If
	End Function
	' ============================================
	' �������ݲ�ȡ��Զ������
	' ============================================
	Public Function HttpGet()
		Dim sReturn
		With oXml
			.setTimeouts slresolveTimeout,slconnectTimeout,slsendTimeout,slreceiveTimeout
			.Open sMethod,sUrl,False
			If sSetCookie<>"" Then	
				.setRequestHeader "Cookie", sSetCookie 						'�趨Cookie
			End If
			If sReferer<>"" Then
				.setRequestHeader "Referer", sReferer							'�趨ҳ����Դ
			Else
				.setRequestHeader "Referer", sUrl
			End If
			If sLanguage<>"" Then
				.setRequestHeader "Accept-Language", sLanguage						'�趨����
			End If
			.setRequestHeader "Content-Length",Len(sData) 						'�趨���ݳ���
			If sCONTENT<>"" Then
				.setRequestHeader "CONTENT-Type",sCONTENT 						'�趨������������
			End If
			If sAgent<>"" Then
				.setRequestHeader "User-Agent", sAgent			 				'�趨�����
			End If
			If sEncoding<>"" Then
				.setRequestHeader "Accept-Encoding", sEncoding 						'�趨gzipѹ��
			End If
			If sAccept<>"" Then
				.setRequestHeader "Accept", sAccept							'�ĵ�����
			End If
			.Send sData										'�������� 
			While .readyState <> 4 
				.waitForResponse 1000 
			Wend 
			strHeaders = .getAllResponseHeaders() 
			If sCodeBase<>"" Then
				sReturn    = bytes2BSTR(.responseBody)
			Else
				sReturn    = .responseBody
			End If
		End With
		HttpGet = sReturn
	End Function
	' ============================================
	' ������������� 
	' ============================================
	Private Function bytes2BSTR(vIn)
    		strReturn = ""
    		For i = 1 To LenB(vIn)
        		ThisCharCode = AscB(MidB(vIn,i,1))
        		If ThisCharCode < &H80 Then
            			strReturn = strReturn & Chr(ThisCharCode)
        		Else
            			NextCharCode = AscB(MidB(vIn,i+1,1))
            			strReturn = strReturn & Chr(CLng(ThisCharCode) * &H100 + CInt(NextCharCode))
            			i = i + 1
        		End If
    		Next
    		bytes2BSTR = strReturn
	End Function
	' ============================================
	' ��ģ��ע��
	' ============================================
	Private Sub Class_Terminate
		oForm = ""	
		Set oXml = Nothing
		Set Ados = Nothing 
	End Sub
End Class
%>