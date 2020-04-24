<DIV id=headnav>
<table class="tableBorder" cellSpacing=0 cellPadding=0 width=790 align=left border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=left width=40 height=25><IMG height=25 
      src="pinluo.com_style1/music07zj11_03.gif" width=11></TD>
    <TD class=black12 align=left width=557>仙乐飘飘，<%=webname%>让您一饱耳福……</TD>
    <TD align=middle width=193><A class=black12 
      onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('<%=weburl%>');" 
      href="#">设为首页</A> 
      <SPAN class=black12>&nbsp;|&nbsp;</SPAN><A class=black12 
      href="javascript:window.external.AddFavorite('<%=weburl%>','<%=webname%>')">加入收藏</A> 
    </TD></TR>
  <TR>
    <TD vAlign=top align=middle 
    background=pinluo.com_style1/music07zjqie_04.gif colSpan=3 height=73>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
        <TR>
          <TD class=gnavt14line align=middle height=32>
		  <A class=gnavt14line 
            href="<%=weburl%>" target=_self>首页</A> 
			<%
i=0
MaxList=9  '定义显示前多少个栏目，默认为15
set rs=server.createobject("adodb.recordset")
sql="SELECT * FROM Sclass order by Sclassid ASC"
rs.Open sql,conn,1,1
do while not rs.eof
i=i+1
%>
| <A 
            class=gnavt14line 
            href="PL_ShowSinger.asp?SClassid=<%=rs("SClassID")%>" 
            target=_self><%=rs("SClass")%></A> 
<%
if i>=MaxList then exit do
rs.movenext
loop
rs.close%>
</TD></TR>
        <TR>
          <TD class=wnavt12line align=middle height=46>
		  <MARQUEE id=scrollarea onmouseover=this.stop(); onmouseout=this.start(); scrollAmount=2 scrollDelay=90 direction=left width=60% height=30>最新公告：<A class=wnavt12line 
            href="<%=Weburl1%>" 
            target=_blank title="<%=WebPost1%>"><%=WebPost1%></A> | <A class=wnavt12line 
            href="<%=Weburl2%>" target=_blank title="<%=WebPost2%>"><%=WebPost2%></A> | <A 
            class=wnavt12line 
            href="<%=Weburl3%>" 
            target=_blank title="<%=WebPost3%>"><%=WebPost3%></A> | <A class=wnavt12line 
            href="<%=Weburl4%>" 
            target=_blank title="<%=WebPost4%>"><%=WebPost4%></A></MARQUEE>
		  </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>