<SCRIPT type=text/javascript>
<!--
function CheckForm()
{ 
 
  if (document.form1.kw.value=="")
  {
    alert("请填写搜索内容！");
	document.form1.kw.focus();	return false;
  }
 
  return true;  
}
-->
</SCRIPT>
<table class="tableBorder" width="95%" border=0 align="center" cellPadding=0 cellSpacing=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=left width=59 
          background=pinluo.com_style1/music07zjqie_17.gif><IMG height=46 
            src="pinluo.com_style1/music07zjqie_16.gif" width=59></TD>
          <TD width="682" vAlign=top background=pinluo.com_style1/music07zjqie_17.gif>
            <table class="tableBorder" cellSpacing=0 cellPadding=0 width="99%" border=0>
              <TBODY>
              <TR>
                <TD vAlign=top align=left>
                  <FORM id=form1 name=form1 onSubmit="return CheckForm();" 
                  action="PL_search.asp" method="get" target="_blank">
                  <table class="tableBorder" cellSpacing=0 cellPadding=0 width="99%" border=0>
                    <TBODY>
                    <TR>
                      <TD width="9%"><INPUT id=id type=radio CHECKED value=0 
                        name=t> 
                      <SPAN class=g13tit>歌曲 </SPAN></TD>
                      <TD width="9%" height=21><INPUT id=id type=radio value=1 
                        name=t> 
                      <SPAN class=g13tit>歌手</SPAN> </LABEL></TD>
                      <TD width="9%"><INPUT id=id type=radio value=2 name=t> 
                        <SPAN class=g13tit>专辑</SPAN></TD>
                      <TD width="9%"><INPUT id=id type=radio value=3 name=t> 
                        <SPAN class=g13tit>歌词</SPAN> </TD>
                      <TD align=middle width="19%" height=21><INPUT 
                        class=finput id=kw name=kw></TD>
                      <TD align=middle width="8%" height=21><A 
                        href="javascript:submit();"><INPUT type=image height=21 
                        width=42 src="pinluo.com_style1/btu_33.gif"></A></TD>
                      <TD class=gray12t width="37%" height=21>热门搜索: <A 
                        class=gray12u 
                        href="PL_search.asp?t=1&amp;kw=刘若英" 
                        target=_blank>刘若英</A>. <A class=gray12u 
                        href="PL_search.asp?t=0&amp;kw=爱" 
                        target=_blank>爱</A>. <A class=gray12u 
                        href="PL_search.asp?t=1&amp;kw=张学友" 
                        target=_blank>张学友</A>. <A class=gray12u 
                        href="PL_search.asp?t=0&amp;kw=神话" 
                        target=_blank>神话</A>. </TD>
                    </TR></TBODY></TABLE></FORM></TD></TR>
              <TR>
                <TD class=sg12b vAlign=bottom align=middle>
				
				<%call PL_ShowABCDlanmu() '读取分类ABCD导航栏目%>
				
				</TD></TR></TBODY></TABLE></TD>
        <TD vAlign=top align=right width=12 
          background=pinluo.com_style1/music07zjqie_17.gif><img height=46 
            src="pinluo.com_style1/music07zjqie_19.gif" 
        width=11></TD>
        </TR></TBODY></TABLE>