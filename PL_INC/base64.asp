<%
Bstr_base64="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789" 

function bin2dec(binStr) 
	towPow=1 
	numLen=len(binStr) 
	bin2Dec=0 
	decPos=numLen 
	do while decPos>0 
		cChar=mid(binStr,decPos,1) 
		nChar=Cint(cChar) 
		bin2Dec=bin2Dec+nChar*towPow 
		towPow=towPow*2 
		decPos=decPos-1 
	Loop 
end function 

function dec2bin(octNumber) 
	vara=octNumber 
	do 
		dec2bin=cstr(vara mod 2) & dec2bin 
		vara=vara \ 2 
	loop until vara=0 
end function 


function enCode_base64(strBin) 
	bins="" 
	Dim i
	for i=1 to lenB(strBin) 
		varTm=AscB(midB(strBin,i,1)) 
		bins=bins & right("00000000" & dec2bin(varTm),8) 
		if i mod 3=0 then 
			for w=0 to 3 
				sixBin=mid(bins,w*6+1,6) 
				nChar=bin2Dec(sixBin)+1 
				enCode_base64=enCode_base64 & mid(Bstr_base64,nChar,1) 
			next 
			bins="" 
		end if 
	next 

	if bins<>"" then 
		pads=3-len(bins) \ 8 
		exitLoop=false 
		do while not exitLoop 
			nChar=left(bins,6) 
			if len(nChar)<6 then 
				nChar=left(nChar & "000000",6) 
				exitLoop=true 
			end if 
			nNum=bin2dec(nChar)+1 
			enCode_base64=enCode_base64 & mid(Bstr_base64,nNum,1) 
			bins=mid(bins,7) 
		Loop 
		enCode_base64=enCode_base64 & String(pads,"=") 
	end if 
end function 

function deCode_base64(baseStr) 
	if len(baseStr) mod 4 <>0 then 
		exit function 
	end if 
	bins="" 
	Dim i
	for i=1 to Len(baseStr) 
		nChar=mid(baseStr,i,1) 
		if nChar="=" then 
			exit for 
		end if 
		oldValue=inStr(Bstr_base64,nChar)-1 
		binValue=right("000000" & dec2bin(oldValue),6) 
		bins=bins & binValue 

		if len(bins)>=8 then 
			deChar=left(bins,8) 
			bins=mid(bins,9) 
			deCode_base64=deCode_base64 & chrB(bin2Dec(deChar)) 
		end if 
	next 
end function 
%>