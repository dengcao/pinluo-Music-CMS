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

Class FlyCms_AspHttp
	Public oForm,oXml,Ados
	Public strHeaders
	Public sMethod
	Public sUrl
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
	' 类模块初始化
	' ============================================
	Private Sub Class_Initialize()
		oForm = ""	
		Set oXml = Server.CreateObject("MSXML2.ServerXMLHTTP")
		set Ados = Server.CreateObject("Adodb.Stream") 
    		slresolveTimeout = 20000   ' 解析DNS名字的超时时间,20秒
    		slconnectTimeout = 20000   ' 建立Winsock连接的超时时间,20秒
    		slsendTimeout 	 = 30000   ' 发送数据的超时时间,30秒
    		slreceiveTimeout = 30000   ' 接收response的超时时间,30秒
	End Sub

	' ============================================
	' 返回版本信息
	' ============================================
	Public Property Get Version
		Version = "飞扬asphttp类1.0.0"
	End Property
	' ============================================
	' 解析DNS名字的超时时间
	' ============================================
	Public Property Let lresolveTimeout(LngSize)
		If IsNumeric(LngSize) Then
			slresolveTimeout = Clng(LngSize)
		End If
	End Property
	' ============================================
	' 建立Winsock连接的超时时间
	' ============================================
	Public Property Let lconnectTimeout(LngSize)
		If IsNumeric(LngSize) Then
			slconnectTimeout = Clng(LngSize)
		End If
	End Property
	' ============================================
	' 发送数据的超时时间
	' ============================================
	Public Property Let lsendTimeout(LngSize)
		If IsNumeric(LngSize) Then
			slsendTimeout = Clng(LngSize)
		End If
	End Property
	' ============================================
	' 接收response的超时时间
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
	' 发送url
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
	' 建立数据传送对向!
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
	' 发送数据并取回远程数据
	' ============================================
	Public Function HttpGet()
		Dim sReturn
		With oXml
			.setTimeouts slresolveTimeout,slconnectTimeout,slsendTimeout,slreceiveTimeout
			.Open sMethod,sUrl,False
			If sSetCookie<>"" Then
				.setRequestHeader "Cookie", sSetCookie 							'设定Cookie
			End If
			If sReferer<>"" Then
				.setRequestHeader "Referer", sReferer							'设定页面来源
			Else
				.setRequestHeader "Referer", sUrl
			End If
			If sLanguage<>"" Then
				.setRequestHeader "Accept-Language", sLanguage						'设定语言
			End If
			.setRequestHeader "Content-Length",Len(sData) 						'设定数据长度
			If sCONTENT<>"" Then
				.setRequestHeader "CONTENT-Type",sCONTENT 						'设定接受数据类型
			End If
			If sAgent<>"" Then
				.setRequestHeader "User-Agent", sAgent			 				'设定浏览器
			End If
			If sEncoding<>"" Then
				.setRequestHeader "Accept-Encoding", sEncoding 						'设定gzip压缩
			End If
			If sAccept<>"" Then
				.setRequestHeader "Accept", sAccept							'文档类型
			End If
			.Send sData										'发送数据 
			While .readyState <> 4 
				.waitForResponse 1000 
			Wend 
			strHeaders = .getAllResponseHeaders() 
			sReturn    = BytesToBstr(.responseBody,sCodeBase)
		End With
		HttpGet = sReturn
	End Function
	' ============================================
	' 使用Adodb.Stream处理二进制数据 
	' ============================================
	Private Function BytesToBstr(strBody,CodeBase) 
		Ados.Type = 1 
		Ados.Mode =3 
		Ados.Open 
		Ados.Write strBody 
		Ados.Position = 0 
		Ados.Type = 2 
		Ados.Charset = CodeBase 
		BytesToBstr = Ados.ReadText 
		Ados.Close 
	End Function 
	' ============================================
	' 类模块注销
	' ============================================
	Private Sub Class_Terminate
		oForm = ""	
		Set oXml = Nothing
		Set Ados = Nothing 
	End Sub
End Class
%>
