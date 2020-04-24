<%@ LANGUAGE = VBScript.Encode %>
<%#@~^0AIAAA==o!x^DkKxPhS|(x9+a{UtGAkWxTskkY`hJmYHw~KSmhm6b@#@&~PEnJmDXwn：显示类型S	+A为新歌，tKO为热歌，b/LKW9为推荐，其他F、 、2等数字类型为频道。ndm:m6：显示数目@#@&@#@&dnDPDkx/D\. mM+mYnW8%mO`rCNKN8 M+mG.9/nYrb@#@&r6PhS{DXan'rxnhrPO4x@#@&~PE读取新歌@#@&k5s'r?AS3ZP~CPoI}\PtEdr1SkdO,W.N.,4z,qGPN/1EBBPr/TWG[,N+k^~,tkDd~N/1@#@&+sdkWPhJ{DX2n{JtGOrPOtU@#@&~E读取热歌@#@&/;^'rj2d2/K,e~o"rH,\EkkmdrdY,WMNnD~8HP4kDdP9+d^rB~~rkoGW9~9+d1@#@&+Vk+bWPhSmYHwnxrk/TGW9JPD4nx@#@&,B读取推荐歌@#@&d5^'E?AJ2;K~M,sI6\,H;/b^dkdDPKDND,8X,qdoKW[~9+/1EBBPkkLGW9P9+dm@#@&Vd+@#@&P,B读取栏目最新歌曲@#@&k;VxEU2J2;P,e~wI}HPtEkrmdkdY,h4nM+PU/Vm//&9xJLnd{OX2nLJ~WM[+MP8z,qf~[/^JES,kdTWKNP9+k^~,trYkP[nkm@#@&nx9Pk6@#@&DkRKwnx~d$VSmKUxBFSq@#@&nJm	+A/KUT{r{!@#@&nd{	nhkWUo|:Ca{nS|hlXPB最多显示歌曲B默认为qT@#@&didCcQAAA==^#~@%>
	 
	 <table class="tableBorder" cellSpacing=1 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD class=black12 align=middle bgColor=#e8efd6 colSpan=2 
          height=22>排行</TD>
          <TD class=black12 align=middle bgColor=#e8efd6 colSpan=2 
            height=22>歌曲-歌手</TD>
          <TD class=black12 align=middle width="10%" bgColor=#e8efd6 
            height=22>试听</TD>
          <TD class=black12 align=middle width="9%" bgColor=#e8efd6 
            height=22>下载</TD>
          <TD class=black12 align=middle width="10%" bgColor=#e8efd6 
            height=22>收藏</TD>
        </TR>
		      <%#@~^PAAAAA==@#@&NG,h4kVP	GY,DdRWW@#@&nS|U+S/W	Lmk{nd{U+AdKxL{bQF@#@&7~eREAAA==^#~@%>		
        <TR onmousemove=change(this) onmouseout=rechange(this)>
          <TD align=middle width="7%" height=22><LABEL><INPUT id=id 
            type=checkbox value="<%=#@~^CAAAAA==.k`EbNr#RwIAAA==^#~@%>" name=id> </LABEL></TD>
          <TD align=middle width="8%" height=22><IMG height=16 alt="<%=#@~^DwAAAA==.k`EsEkkm	lsnJ*PAUAAA==^#~@%>" 
            src="pinluo.com_style1/<%=#@~^DAAAAA==Kd{UhkWxT{bxAQAAA==^#~@%>.gif" width=17></TD>
          <TD class=g12t align=left width="34%" height=22><SPAN 
            style="WIDTH: 110px"><A class=g12t title="<%=#@~^DwAAAA==.k`EsEkkm	lsnJ*PAUAAA==^#~@%>" 
            href="javascript:open_window('ShowMusic.asp?id=<%=#@~^CAAAAA==.k`EbNr#RwIAAA==^#~@%>','showmusic','width=378,height=161,scrollbars=no')">
            <DIV 
            style="OVERFLOW: hidden; WIDTH: 119px; HEIGHT: 22px"><%#@~^0wAAAA==Kd{h!/bmxm:xDk`E:!/r^	l:E#@#@&P,~~P,P,P~P~~,P~P,~P,P~~,PkW~^+U`hJ|:;kk1xls+*@*FZPOtx~Kd{:!dk1xlsnxV0D`KSmh!/rm	C:~qT*@#@&~~,P~P,~,P~,P,PP,P,~P,P~P,DndaWxknRSDkDn~nd{sEdk^Um:n@#@&~P,P~~,PP~~,P~P,~,P~,P,PP,P,KjUAAA==^#~@%></DIV></A></SPAN></TD>
          <TD class=gray12t align=left width="19%"><A class=gray12t 
            title="<%=#@~^DAAAAA==.k`Ekk	o+MJ*AgQAAA==^#~@%>" 
            href="PL_Singer.asp?NClassid=<%=#@~^DgAAAA==.k`EgZ^l/kk9E#iwQAAA==^#~@%>">(<%#@~^vwAAAA==Kd{dbxT+D{DkcJkkUoDEb@#@&P,~P,PP,~~P,P,P~P~~,P~P,~Pb0~sx`KJ|/rxTnM#@*2PDt+	PhJ{kkUoDxs0YvKS|/k	LnDB&*@#@&P~~,P~P,~P,P~~,PP~~,P~P,~,DnkwKx/RS.kD+~nd{dr	o+M@#@&,PP,~~P,P,P~P~~,P~P,~P,P~~,Pci0AAA==^#~@%>..)</A></TD>
          <TD align=middle width="10%" height=22><A 
            href="javascript:open_window('Play.asp?id=<%=#@~^CAAAAA==.k`EbNr#RwIAAA==^#~@%>','Listen','width=295,height=134')"><IMG 
            height=12 src="pinluo.com_style1/music07homeqie_17.gif" width=13 
            border=0></A></TD>
          <TD align=middle width="9%" height=22><A 
            onclick="return call(this.href);" 
            href="PL_download.asp?id=<%=#@~^CAAAAA==.k`EbNr#RwIAAA==^#~@%>" 
            target=_blank><IMG height=12 src="pinluo.com_style1/music07homeqie_19.gif" 
            width=13 border=0></A></TD>
          <TD align=middle width="10%" height=22><A href="javascript:open_window('User/PL_UserCollect.asp?action=add&id=<%=#@~^CAAAAA==.k`EbNr#RwIAAA==^#~@%>','CollectMusic','')"><IMG 
            height=15 src="pinluo.com_style1/music07homeqie_14.gif" width=14 
            border=0></A></TD></TR>
			<%#@~^XgAAAA==@#@&kW,nd{xhkGxT{r@*{nJm	+hkGxT{:ma~Y4+	Pn6rO,NG@#@&./c:G-x+aO@#@&sWK2@#@&.kR1VWk+,v读取结束@#@&kRoAAA==^#~@%>			
			</TBODY></TABLE>
<%#@~^DAAAAA==3	N~wE	mYbW	fQQAAA==^#~@%>