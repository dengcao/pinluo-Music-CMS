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
Class Cls_ShowoPage
	Private Showo_PageSize,Showo_CurrPage
	Private Showo_Conn,Showo_DbType,Showo_RecType,Showo_RecSql,Showo_RecTerm,Showo_CookieName
	Private S_Order,Showo_JsUrl
	Private Showo_Sql,Showo_Field,Showo_Table,Showo_Where,Showo_OrderBy,Showo_Id
	Private Showo_RecCount,Showo_PageCount,ResultSet_Sql
	Private Showo_Cm,Showo_WhereOther,Showo_Order,Showo_Size,Showo_Mm 'MSSQL��

	'================================================================
	' Class_Initialize ��ĳ�ʼ��
	'================================================================
	Private Sub Class_Initialize
		Showo_PageSize=10 '�趨ÿҳ��¼������Ĭ��ֵΪ10
		Showo_CurrPage=CheckNum(Trim(Request("Page")),1,-1) '��ȡ��ǰ���ֵ
		Showo_Order=">" 'Ĭ������
		Showo_Size="MAX" 'Ĭ������
		Showo_WhereOther="" 'Ĭ������
	End Sub

	'================================================================
	' Conn �õ����ݿ����Ӷ���
	'================================================================
	Public Property Let Conn(ByVal objConn)
		Set Showo_Conn=objConn
	End Property

	'================================================================
	' DbType �õ����ݿ�����
	'================================================================ 
	Public Property Let DbType(ByVal strDbType)
		Showo_DbType=strDbType
	End Property

	'================================================================
	' RecType ȡ��¼��������(0ִ��count,1��дsql���ȡ,2�̶�ֵ)
	'================================================================
	Public Property Let RecType(ByVal intRecType)
		Showo_RecType=CheckNum(intRecType,0,2) 
	End Property
	
	'================================================================
	' RecSql '���RecType��1��=ȡ��¼sql��䣬�����2=��ֵ������0=""
	'================================================================
	Public Property Let RecSql(ByVal strRecSql)
		Showo_RecSql=strRecSql
	End Property

	'================================================================
	' RecTerm ���������Ƿ�仯(0�ޱ仯,1�б仯)
	'================================================================
	Public Property Let RecTerm(ByVal intRecTerm)
		Showo_RecTerm=CheckNum(intRecTerm,0,2) 
	End Property

	'================================================================
	' CookieName ȡ��cookiename
	'================================================================
	Public Property Let CookieName(ByVal strCookieName)
		Showo_CookieName=strCookieName
	End Property

	'================================================================
	' Order ����(0˳��,1����)
	'================================================================
	Public Property Let Order(ByVal intOrder)
		S_Order=CheckNum(intOrder,0,1) 
		If S_Order=1 Then
			Showo_Order="<" 
			Showo_Size="MIN" 
		End If
	End Property

	'================================================================
	' PageSize ����ÿһҳ��¼����,Ĭ��10��¼
	'================================================================
	Public Property Let PageSize(ByVal intPageSize)
		Showo_PageSize=CheckNum(intPageSize,Showo_PageSize,-1) 
	End Property

	'================================================================
	' JsUrl ȡ��showo_page.js��·��
	'================================================================
	Public Property Let JsUrl(ByVal strJsUrl)
		Showo_JsUrl=strJsUrl
	End Property

	'================================================================
	' Sql ȡ��sql������ֶ���������,����:�ֶ�,��,����,����,��ID
	'================================================================
	Public Property Let Sql(ByVal str_sql)  
		Showo_Sql=Split(str_sql,"$")
		Showo_Field=Showo_Sql(0)
		Showo_Table=Showo_Sql(1)
		Showo_Where=Showo_Sql(2)
		Showo_OrderBy=Showo_Sql(3)
		Showo_Id=Showo_Sql(4)
		If Len(Showo_Where)>=3 Then 
			Showo_WhereOther=" And "&Showo_Where
			Showo_Where=" Where "&Showo_Where
		End If
		'If Len(Showo_OrderBy)>3 Then 
		Showo_OrderBy=" ORDER BY " & Showo_OrderBy &" DESC"
	End Property

	'================================================================
	' GetRecCount ȡ�ü�¼����
	'================================================================
	Private Function GetRecCount()
		Select Case Showo_RecType
			Case 1
				GetRecCount=Showo_Conn.execute(Showo_RecSql,0,1)(0)
			Case 2
				GetRecCount=CheckNum(Showo_RecSql,0,-1)
			Case Else
				GetRecCount=Showo_Conn.execute("SELECT Count("&Showo_Id&") FROM "&Showo_Table&" "&Showo_Where,0,1)(0)
		End Select
	End Function
	
	'================================================================
	' RecCount ������¼����
	'================================================================
	Public Property Get RecCount()
		RecCount=Request.Cookies("ShowoPage")(Showo_CookieName)
		RecCount=CheckNum(RecCount,0,-1) 
		Select Case Showo_RecTerm
			Case 1
				RecCount=GetRecCount()
				Response.Cookies("ShowoPage")(Showo_CookieName)=RecCount
			Case 2
				RecCount=GetRecCount()
			Case Else
				If RecCount=0 Then
					RecCount=GetRecCount()
					Response.Cookies("ShowoPage")(Showo_CookieName)=RecCount
				End If
		End Select
	End Property

	'================================================================
	' ResultSet ���ط�ҳ��ļ�¼��
	'================================================================
	Public Property Get ResultSet()
		ResultSet=Null
		'��¼����
		Showo_RecCount=RecCount()
		'��ǰҳ
		If Showo_RecCount>0 Then
		'ҳ��
			If (Showo_RecCount mod Showo_PageSize)=0 Then
				Showo_PageCount=Showo_RecCount\Showo_PageSize
			Else
				Showo_PageCount=Showo_RecCount\Showo_PageSize+1
			End If
			'��ǰҳ
			Showo_CurrPage=CheckNum(Showo_CurrPage,1,Showo_PageCount)
			Select Case Showo_DbType
				Case "AC" 'ac���ݿ�
					Set Showo_Rs=Server.CreateObject ("adodb.RecordSet")
					ResultSet_Sql="SELECT "&Showo_Field&" FROM "&Showo_Table&" "&Showo_Where&" "&Showo_OrderBy
					'response.write "<script>alert('"&ResultSet_Sql&"');</script>"
					Showo_Rs.Open ResultSet_Sql,Showo_Conn,1,1,&H0001
					Showo_Rs.AbsolutePosition=(Showo_CurrPage-1)*Showo_PageSize+1
				Case "MSSQL" 'sqlserver2000���ݿ�
					If Showo_CurrPage=1 Then
						ResultSet_Sql="SELECT TOP "&Showo_PageSize&" "&Showo_Field&" FROM "&Showo_Table&Showo_Where&" "&Showo_OrderBy
					Else
						ResultSet_Sql="SELECT "&Showo_Size&"("&Showo_Id&") FROM (SELECT TOP "&(Showo_CurrPage-1)*Showo_PageSize&" "&Showo_Id&" FROM "&Showo_Table&Showo_Where&" "&Showo_OrderBy&") AS tmpTable"
						Showo_Mm=Showo_Conn.execute(ResultSet_Sql,0,1)(0)
						ResultSet_Sql="SELECT TOP "&Showo_PageSize&" "&Showo_Field&" FROM "&Showo_Table&" WHERE "&Showo_Id&Showo_Order&Showo_Mm&Showo_WhereOther&" "&Showo_OrderBy
					End If
					Set Showo_Rs=Showo_Conn.execute(ResultSet_Sql)
				Case "MSSQL_SP" 'sqlserver2000���ݿ�洢���̰�
					Set Showo_Rs=server.CreateObject("Adodb.RecordSet")
					Set Showo_Cm=Server.CreateObject("Adodb.Command")
					Showo_Cm.CommandType=4
					Showo_Cm.ActiveConnection=Showo_Conn
					Showo_Cm.CommandText="SP_ShowoPage"
					Showo_Cm.parameters(1)=Showo_CurrPage
					Showo_Cm.parameters(2)=Showo_PageSize
					Showo_Cm.parameters(3)=Showo_Field
					Showo_Cm.parameters(4)=Showo_Table
					Showo_Cm.parameters(5)=Showo_Where
					Showo_Cm.parameters(6)=Showo_WhereOther
					Showo_Cm.parameters(7)=Showo_OrderBy
					Showo_Cm.parameters(8)=Showo_Id
					Showo_Cm.parameters(9)=Showo_Size
					Showo_Cm.parameters(10)=Showo_Order
					Showo_Rs.CursorLocation=1
					Showo_Rs.LockType=1
					Showo_Rs.Open Showo_Cm
				Case Else '�����������ԭʼ�ķ�������
					Set Showo_Rs = Server.CreateObject ("adodb.RecordSet")
					ResultSet_Sql="SELECT "&Showo_Field&" FROM "&Showo_Table&" "&Showo_Where&" "&Showo_OrderBy
					Showo_Rs.Open ResultSet_Sql,Showo_Conn,1,1,&H0001
					Showo_Rs.AbsolutePosition=(Showo_CurrPage-1)*Showo_PageSize+1
			End Select
			ResultSet=Showo_Rs.GetRows(Showo_PageSize)
			Showo_Rs.close
			Set Showo_Rs=Nothing
		End If  
	End Property

	'================================================================
	' ����:����ֶ�,��ʼ����(Ĭ������),��������(Ϊ-1�򲻼���С)
	'================================================================
	Private Function CheckNum(ByVal strStr,ByVal intStartNum,ByVal intEndNum)
		CheckNum=intStartNum
		If IsNumeric(strStr) Then CheckNum=Clng(strStr)        
		If intEndNum>-1Then
			If CheckNum<intStartNum Then CheckNum=intStartNum
			If CheckNum>intEndNum Then CheckNum=intEndNum
		End If
	End Function

	'================================================================
	' Class_Terminate ��ע��
	'================================================================
	Private Sub Class_Terminate()
		If IsObject(Showo_Conn) Then 
			'Showo_Conn.Close
			'Set Showo_Conn=Nothing
		End If
	End Sub

	'================================================================
	' ����ҳ����
	'================================================================
	Public Sub ShowPage()%>
		<Script Language="JavaScript" type="text/JavaScript" src="<%=Showo_JsUrl%>showo_page.js"></Script>
		<Script Language="JavaScript">
		ShowoPage("<table style='BORDER-COLLAPSE: collapse' borderColor='#111111' height='10' cellSpacing='0' cellPadding='0' width='95%' border='0'><tr><td vAlign='bottom'  style='font-family: Verdana,����; font-size: 11.5px; line-height: 15px'>","</td></tr></table>","ҳ��:<font color='red'>","</font>/","","&nbsp;","&nbsp;ÿҳ<font color='red'>","</font>&nbsp;","&nbsp;����:<font color='red'>","</font></td><td vAlign='bottom' align='right'  style='font-family: Verdana,����; font-size: 11.5px; line-height: 15px'>","<font face=webdings>9</font>","<font face=webdings>7</font>","<font face=webdings>8</font>","<font face=webdings>:</font>","&nbsp;&nbsp;��ת:","<font color='orange'>[","]</font>","","","<font color='red'>","</font>","","",<%=RecCount()%>,<%=Showo_PageSize%>,2)
		</Script>
	<%End Sub

	'================================================================
	' ����ҳ����
	'================================================================
	Public Sub ShowPage2()%>
		<Script Language="JavaScript" type="text/JavaScript" src="<%=Showo_JsUrl%>showo_page2.js"></Script>
		<Script Language="JavaScript">
		ShowoPage("<table style='BORDER-COLLAPSE: collapse' borderColor='#111111' height='10' cellSpacing='0' cellPadding='0' width='95%' border='0'><tr><td vAlign='bottom'  style='font-family: Verdana,����; font-size: 11.5px; line-height: 15px'>","</td></tr></table>","ҳ��:<font color='red'>","</font>/","","&nbsp;","&nbsp;ÿҳ<font color='red'>","</font>&nbsp;","&nbsp;����:<font color='red'>","</font></td><td vAlign='bottom' align='right'  style='font-family: Verdana,����; font-size: 11.5px; line-height: 15px'>","<font face=webdings>9</font>","<font face=webdings>7</font>","<font face=webdings>8</font>","<font face=webdings>:</font>","&nbsp;&nbsp;��ת:","<font color='orange'>[","]</font>","","","<font color='red'>","</font>","","",<%=RecCount()%>,<%=Showo_PageSize%>,2)
		</Script>
	<%End Sub

End Class%>
