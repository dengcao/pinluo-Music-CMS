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
Class Cls_ShowoPage
	Private Showo_PageSize,Showo_CurrPage
	Private Showo_Conn,Showo_DbType,Showo_RecType,Showo_RecSql,Showo_RecTerm,Showo_CookieName
	Private S_Order,Showo_JsUrl
	Private Showo_Sql,Showo_Field,Showo_Table,Showo_Where,Showo_OrderBy,Showo_Id
	Private Showo_RecCount,Showo_PageCount,ResultSet_Sql
	Private Showo_Cm,Showo_WhereOther,Showo_Order,Showo_Size,Showo_Mm 'MSSQL用

	'================================================================
	' Class_Initialize 类的初始化
	'================================================================
	Private Sub Class_Initialize
		Showo_PageSize=10 '设定每页记录条数的默认值为10
		Showo_CurrPage=CheckNum(Trim(Request("Page")),1,-1) '获取当前面的值
		Showo_Order=">" '默认排序
		Showo_Size="MAX" '默认排序
		Showo_WhereOther="" '默认条件
	End Sub

	'================================================================
	' Conn 得到数据库连接对象
	'================================================================
	Public Property Let Conn(ByVal objConn)
		Set Showo_Conn=objConn
	End Property

	'================================================================
	' DbType 得到数据库类型
	'================================================================ 
	Public Property Let DbType(ByVal strDbType)
		Showo_DbType=strDbType
	End Property

	'================================================================
	' RecType 取记录总数方法(0执行count,1自写sql语句取,2固定值)
	'================================================================
	Public Property Let RecType(ByVal intRecType)
		Showo_RecType=CheckNum(intRecType,0,2) 
	End Property
	
	'================================================================
	' RecSql '如果RecType＝1则=取记录sql语句，如果是2=数值，等于0=""
	'================================================================
	Public Property Let RecSql(ByVal strRecSql)
		Showo_RecSql=strRecSql
	End Property

	'================================================================
	' RecTerm 搜索条件是否变化(0无变化,1有变化)
	'================================================================
	Public Property Let RecTerm(ByVal intRecTerm)
		Showo_RecTerm=CheckNum(intRecTerm,0,2) 
	End Property

	'================================================================
	' CookieName 取得cookiename
	'================================================================
	Public Property Let CookieName(ByVal strCookieName)
		Showo_CookieName=strCookieName
	End Property

	'================================================================
	' Order 排序(0顺序,1降序)
	'================================================================
	Public Property Let Order(ByVal intOrder)
		S_Order=CheckNum(intOrder,0,1) 
		If S_Order=1 Then
			Showo_Order="<" 
			Showo_Size="MIN" 
		End If
	End Property

	'================================================================
	' PageSize 设置每一页记录条数,默认10记录
	'================================================================
	Public Property Let PageSize(ByVal intPageSize)
		Showo_PageSize=CheckNum(intPageSize,Showo_PageSize,-1) 
	End Property

	'================================================================
	' JsUrl 取得showo_page.js的路径
	'================================================================
	Public Property Let JsUrl(ByVal strJsUrl)
		Showo_JsUrl=strJsUrl
	End Property

	'================================================================
	' Sql 取得sql所需表字段条件排序,输入:字段,表,条件,排序,主ID
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
	' GetRecCount 取得记录总数
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
	' RecCount 修正记录总数
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
	' ResultSet 返回分页后的记录集
	'================================================================
	Public Property Get ResultSet()
		ResultSet=Null
		'记录总数
		Showo_RecCount=RecCount()
		'当前页
		If Showo_RecCount>0 Then
		'页数
			If (Showo_RecCount mod Showo_PageSize)=0 Then
				Showo_PageCount=Showo_RecCount\Showo_PageSize
			Else
				Showo_PageCount=Showo_RecCount\Showo_PageSize+1
			End If
			'当前页
			Showo_CurrPage=CheckNum(Showo_CurrPage,1,Showo_PageCount)
			Select Case Showo_DbType
				Case "AC" 'ac数据库
					Set Showo_Rs=Server.CreateObject ("adodb.RecordSet")
					ResultSet_Sql="SELECT "&Showo_Field&" FROM "&Showo_Table&" "&Showo_Where&" "&Showo_OrderBy
					'response.write "<script>alert('"&ResultSet_Sql&"');</script>"
					Showo_Rs.Open ResultSet_Sql,Showo_Conn,1,1,&H0001
					Showo_Rs.AbsolutePosition=(Showo_CurrPage-1)*Showo_PageSize+1
				Case "MSSQL" 'sqlserver2000数据库
					If Showo_CurrPage=1 Then
						ResultSet_Sql="SELECT TOP "&Showo_PageSize&" "&Showo_Field&" FROM "&Showo_Table&Showo_Where&" "&Showo_OrderBy
					Else
						ResultSet_Sql="SELECT "&Showo_Size&"("&Showo_Id&") FROM (SELECT TOP "&(Showo_CurrPage-1)*Showo_PageSize&" "&Showo_Id&" FROM "&Showo_Table&Showo_Where&" "&Showo_OrderBy&") AS tmpTable"
						Showo_Mm=Showo_Conn.execute(ResultSet_Sql,0,1)(0)
						ResultSet_Sql="SELECT TOP "&Showo_PageSize&" "&Showo_Field&" FROM "&Showo_Table&" WHERE "&Showo_Id&Showo_Order&Showo_Mm&Showo_WhereOther&" "&Showo_OrderBy
					End If
					Set Showo_Rs=Showo_Conn.execute(ResultSet_Sql)
				Case "MSSQL_SP" 'sqlserver2000数据库存储过程版
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
				Case Else '其他情况按最原始的方法处理
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
	' 输入:检查字段,开始数字(默认数字),结束数字(为-1则不检查大小)
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
	' Class_Terminate 类注销
	'================================================================
	Private Sub Class_Terminate()
		If IsObject(Showo_Conn) Then 
			'Showo_Conn.Close
			'Set Showo_Conn=Nothing
		End If
	End Sub

	'================================================================
	' 上下页部分
	'================================================================
	Public Sub ShowPage()%>
		<Script Language="JavaScript" type="text/JavaScript" src="<%=Showo_JsUrl%>showo_page.js"></Script>
		<Script Language="JavaScript">
		ShowoPage("<table style='BORDER-COLLAPSE: collapse' borderColor='#111111' height='10' cellSpacing='0' cellPadding='0' width='95%' border='0'><tr><td vAlign='bottom'  style='font-family: Verdana,宋体; font-size: 11.5px; line-height: 15px'>","</td></tr></table>","页次:<font color='red'>","</font>/","","&nbsp;","&nbsp;每页<font color='red'>","</font>&nbsp;","&nbsp;共计:<font color='red'>","</font></td><td vAlign='bottom' align='right'  style='font-family: Verdana,宋体; font-size: 11.5px; line-height: 15px'>","<font face=webdings>9</font>","<font face=webdings>7</font>","<font face=webdings>8</font>","<font face=webdings>:</font>","&nbsp;&nbsp;跳转:","<font color='orange'>[","]</font>","","","<font color='red'>","</font>","","",<%=RecCount()%>,<%=Showo_PageSize%>,2)
		</Script>
	<%End Sub

	'================================================================
	' 上下页部分
	'================================================================
	Public Sub ShowPage2()%>
		<Script Language="JavaScript" type="text/JavaScript" src="<%=Showo_JsUrl%>showo_page2.js"></Script>
		<Script Language="JavaScript">
		ShowoPage("<table style='BORDER-COLLAPSE: collapse' borderColor='#111111' height='10' cellSpacing='0' cellPadding='0' width='95%' border='0'><tr><td vAlign='bottom'  style='font-family: Verdana,宋体; font-size: 11.5px; line-height: 15px'>","</td></tr></table>","页次:<font color='red'>","</font>/","","&nbsp;","&nbsp;每页<font color='red'>","</font>&nbsp;","&nbsp;共计:<font color='red'>","</font></td><td vAlign='bottom' align='right'  style='font-family: Verdana,宋体; font-size: 11.5px; line-height: 15px'>","<font face=webdings>9</font>","<font face=webdings>7</font>","<font face=webdings>8</font>","<font face=webdings>:</font>","&nbsp;&nbsp;跳转:","<font color='orange'>[","]</font>","","","<font color='red'>","</font>","","",<%=RecCount()%>,<%=Showo_PageSize%>,2)
		</Script>
	<%End Sub

End Class%>
