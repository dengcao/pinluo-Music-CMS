<LINK href="admin.css" type=text/css rel=stylesheet>
<!--#include file="Const.Asp"-->
<!--#include file="../PL_INC/Function.asp"-->
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
Act = Request("Act")

Select Case Act
	Case "GET"
	Call IDModfy()
	Case Else
	Call Main()
End Select 

Sub Main()
	Dim MusicCount
	MusicCount = Conn.Execute("Select Count(ID) From LrcWord")(0)
	Conn.Close
	Set Conn = Nothing
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����޸�LRC���</title>
<LINK href="admin.css" type=text/css rel=stylesheet>
</head>
<body>
<b>�����޸ĸ��<form name=pid method="GET" action="?"><input type="hidden" name="Act" value="GET">��ʼID��<input size=8 name="ID" value='1'> ��ֹID��<input size=8 name="EndID" value='<%=MusicCount%>'><input name="change" class="buttonface" value="ȷ������" type="submit"></form>
</body>
</html>
<%
End Sub


Sub IDModfy()
	Server.ScriptTimeOut = 99999
	ID = CheckRequest("ID")
	EndID = CheckRequest("EndID")
	Dim DoGet,WDown,Rs
	Dim TexGeci,LrcGeci

	If CLng(ID) > CLng(EndID) Then
		Rw "�޸����!"
		Response.End
	End If

	Set Rs = Server.CreateObject("ADODB.RecordSet")
	mSql="Select top 2 MusicID,Singer,MusicName,SpecialName,Words From [LrcWord] Where MusicID >= " & Request("ID") & " Order By MusicID Asc"
	Rs.Open mSql,Conn,1,1
	Do While Not Rs.Eof

		If CLng(Rs("MusicID")) = Clng(ID) Then
			
			MusicID = Rs("MusicID")
			SinGer    = Rs("Singer")
			MusicName = Rs("MusicName")
			SpecialName = Rs("SpecialName")
			LrcGeci	= Rs("Words")

			Rw "[<b>" & Singer & " - " & MusicName & "</b>]<br>"

			Rw "<BR><BR>"

			If LrcGeci = "����LRC���" Then
				Rw LrcGeci
			Else
				If InStr(LrcGeci,"[type:emv]")>0 Then
					Response.Write "<Meta http-equiv=Refresh content='0;URL=?Act=GET&ID=" & Clng(Rs("MusicID"))+1 & "&EndID=" & EndID & "'>"
					Response.Flush
					Response.End
				End If
                                '//��ʼ����
                                Dim LrcType, LrcHead, InstrArr(3), HeadLength
                                
                                LrcType = "[type:emv]"
                                LrcHead = LrcType & vbCrLf
                                ti = RegContent(LrcGeci, "[ti:", "]", 1, "")
                                If Trim(ti) = "" Then
                                    ti = "[ti:" & MusicName & "]"
                                    LrcHead = LrcHead & ti & vbCrLf
                                    InstrArr(0) = 0
                                Else
                                    LrcHead = LrcHead & ti & vbCrLf
                                    InstrArr(0) = InStr(LrcGeci, ti) + Len(ti)
                                End If
                                ar = RegContent(LrcGeci, "[ar:", "]", 1, "")
                                If Trim(ar) = "" Then
                                    ar = "[ar:" & Singer & "]"
                                    LrcHead = LrcHead & ar & vbCrLf
                                    InstrArr(1) = 0
                                Else
                                    LrcHead = LrcHead & ar & vbCrLf
                                    InstrArr(1) = InStr(LrcGeci, ar) + Len(ar)
                                End If
                                al = RegContent(LrcGeci, "[al:", "]", 1, "")
                                If Trim(al) = "" Then
                                    al = "[al:" & SpecialName & "]"
                                    LrcHead = LrcHead & al & vbCrLf
                                    InstrArr(2) = 0
                                Else
                                    LrcHead = LrcHead & al & vbCrLf
                                    InstrArr(2) = InStr(LrcGeci, al) + Len(al)
                                End If
                                By = RegContent(LrcGeci, "[by:", "]", 1, "")
                                If InStr(By,"[by:") <= 0 Then
                                    InstrArr(3) = 0
				    By = "[by:Ʒ��Ƽ� A306.Com]"
                                    LrcHead = LrcHead & By & vbCrLf
                                Else
                                    InstrArr(3) = InStr(LrcGeci, By) + Len(By)
                                    By = "[by:Ʒ��Ƽ� A306.Com]"
                                    LrcHead = LrcHead & By & vbCrLf
                                End If
                                url = "[url:{Url}]"
                                LrcHead = LrcHead & url & vbCrLf
                                bg = "[bg:/EmvPlayer/Pics/"&RndNum(1,5)&".jpg]"
                                LrcHead = LrcHead & bg & vbCrLf
                    
                                HeadLength = InstrArr(0)
                                For i = 0 To UBound(InstrArr)
                                    If HeadLength < InstrArr(i) Then
                                        HeadLength = InstrArr(i)
                                    End If
                                Next
                    
                                If HeadLength <= 0 Then
                                    LrcGeci = LrcGeci
                                Else
                                    LrcGeci = Mid(LrcGeci, HeadLength, Len(LrcGeci))
                                End If
                                Dim LrcArr, TempLrc, LrcWord
                                LrcArr = Split(LrcGeci, vbCrLf)
                                For i = 0 To UBound(LrcArr)
                                    If (i Mod 2) = 0 Then
                                        len1 = InStrRev(LrcArr(i), "]")
                                        If len1 > 0 Then
                                            TempLrc = Mid(LrcArr(i),1,len1) & "<bg:/EmvPlayer/Pics/"&RndNum(1,5)&".jpg;>" & Mid(LrcArr(i),len1+1,Len(LrcArr(i))) & vbCrLf
                                        End If
                                    Else
                                        TempLrc = LrcArr(i) & vbCrLf
                                    End If
                                    If LrcWord = "" Then
                                        LrcWord = TempLrc
                                    Else
                                        LrcWord = LrcWord & TempLrc
                                    End If
                                Next
                                LrcGeci = LrcHead & LrcWord

				Rw "�޸�LRC���" & Len(LrcGeci) & "��"
			End If

			'Rw "<br>"
			'Rw LrcGeci
			'Response.End
			Call WriteText(MusicID,SinGer,MusicName,SpecialName,TexGeci)
			Call WriteLrc(MusicID,SinGer,MusicName,SpecialName,LrcGeci)
		Else
			Response.Write "<Meta http-equiv=Refresh content='0;URL=?Act=GET&ID=" & Rs("MusicID") & "&EndID=" & EndID & "'>"
			Response.Flush
			Response.End
		End If

		Rs.MoveNext
	Loop
	Rs.Close
	Set Rs = Nothing
	Conn.Close
	Set Conn = Nothing
End Sub

'ȡ��ר��ID
Function GetSpecialName(SpecialID)
    'On Error Resume Next
    If SpecialID < 1 Then
        GetSpecialName = ""
        Exit Function
    End If
    Sql = "Select * From [Special] Where SpecialID=" & SpecialID
    Set Rs1 = Conn.Execute(Sql)
    If Not Rs1.Eof Then
    	GetSpecialName = Rs1("name")
    Else
	GetSpecialName = ""
    End If	
    Rs1.Close
    Set Rs1 = Nothing
End Function


'д���ı����
Sub WriteText(MusicID,SinGer,MusicName,SpecialName,Words)
	Set RsText = Server.CreateObject("ADODB.RecordSet")
    	Sql = "Select * From TextWord Where MusicID=" & MusicID
    	RsText.Open Sql,Conn,1,3
    	If RsText.BOF Or RsText.EOF Then
        	RsText.AddNew
    	End If
	RsText("MusicID")     = MusicID
	RsText("SinGer")      = SinGer
	RsText("MusicName")   = MusicName
	RsText("SpecialName") = SpecialName
	RsText("Words")       = Words
    	If Words = "���޸��" Then
        	RsText("Flag") = False
    	Else
        	RsText("Flag") = True
		RsText("ErrNum") = 0
    	End If
	RsText("AddUser")     = "admin"
	RsText("AddTime")     = Now()
    	RsText.Update
    	RsText.Close
    	Set RsText = Nothing
End Sub

'д��LRC���
Sub WriteLrc(MusicID,SinGer,MusicName,SpecialName,Words)
	Set RsLrc = Server.CreateObject("ADODB.RecordSet")
    	Sql = "Select * From LrcWord Where MusicID=" & MusicID
    	RsLrc.Open Sql,Conn,1,3
    	If RsLrc.BOF Or RsLrc.EOF Then
        	RsLrc.AddNew
    	End If
	RsLrc("MusicID")     = MusicID
	RsLrc("SinGer")      = SinGer
	RsLrc("MusicName")   = MusicName
	RsLrc("SpecialName") = SpecialName
	RsLrc("Words")       = Words
    	If Words = "����LRC���" Then
        	RsLrc("Flag") = False
    	Else
        	RsLrc("Flag") = True
		RsLrc("ErrNum") = 0
    	End If
	RsLrc("AddUser")     = "admin"
	RsLrc("AddTime")     = Now()
    	RsLrc.Update
    	RsLrc.Close
    	Set RsLrc = Nothing
End Sub

Function RndNum(ByVal StartNum,ByVal EndNum)
	Randomize
	RndNum = Int((EndNum-StartNum) * Rnd) + StartNum
End Function
%>
