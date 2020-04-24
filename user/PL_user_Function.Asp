<%
function IsValidEmail(email)
IsValidEmail = true
names = Split(email, "@")
if UBound(names) <> 1 then
   IsValidEmail = false
   exit function
end if
for each name in names
   if Len(name) <= 0 then
     IsValidEmail = false
     exit function
   end if
   for i = 1 to Len(name)
     c = Lcase(Mid(name, i, 1))
     if InStr("abcdefghijklmnopqrstuvwxyz_-.", c) <= 0 and not IsNumeric(c) then
       IsValidEmail = false
       exit function
     end if
   next
   if Left(name, 1) = "." or Right(name, 1) = "." then
      IsValidEmail = false
      exit function
   end if
next
if InStr(names(1), ".") <= 0 then
   IsValidEmail = false
   exit function
end if
i = Len(names(1)) - InStrRev(names(1), ".")
if i <> 2 and i <> 3 then
   IsValidEmail = false
   exit function
end if
if InStr(email, "..") > 0 then
   IsValidEmail = false
end if
end function
%>
<% 
 'ASP生成随机码的函数
Function GetValidateCode(PinLuo_codenum) 'PinLuo_codenum为设置要生成多少位数
      Const PinLuo_cAmount = 36 ' 文字数量
      Const PinLuo_cCode = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      Dim PinLuo_vCode(), PinLuo_vCodes
   redim PinLuo_vCode(PinLuo_codenum)
   Randomize
      For i = 0 To PinLuo_codenum-1
            PinLuo_vCode(i) = Int(Rnd * PinLuo_cAmount)
            PinLuo_vCodes = PinLuo_vCodes & Mid(PinLuo_cCode,PinLuo_vCode(i) + 1, 1)
      Next
  
   GetValidateCode=PinLuo_vCodes
   'response.Write ("PinLuo.Com__"&PinLuo_vCodes)
End Function%>
