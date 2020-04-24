<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!--#include file="PL_config.asp"-->

<!--#include file="caiji/function.asp"-->
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
Dim ID
ID=request.QueryString("id")
If ID="" or not IsNumeric(ID) Then
	Response.Write ("<SCRIPT language=JavaScript>alert('晕，请不要乱搞哦!'); javascript:top.window.close();</SCRIPT>")
	Response.End
End If
id=replace(request("id")," ","")
set rs=server.createobject("adodb.recordset")
'rs.open ("select * from MusicList where id in("&id&")"),conn,1,1
rs.open ("select * from LrcWord where musicid in("&id&")"),conn,1,1

if (rs.eof and rs.bof) or rs("Words")="暂无LRC歌词" then
'没添加歌词
	set rs1=server.createobject("adodb.recordset")
	'sql="select * from MusicList where id =1465"
	sql1="Select musicname,id,singer From MusicList Where id="&id
	rs1.Open Sql1,Conn,1,3
	gcname=rs1("musicname")
	gs=rs1("singer")
	url="http://mp3.baidu.com/m?f=ms&tn=baidump3lyric&ct=150994944&lf=2&rn=10&word="&gcname&"&lm=-1"
	zpl=GetHttp(URL)
	url1=GetStr(zpl,"lrcdw.gif"" style=""padding-right:10px"" align=""absmiddle""><a href=""",""" >LRC歌词</a>")
	body=GetHttp(url1)
	LrcWords=replace(body,"51lrc.com","pinluo.com")
else
'LrcWords=rs("LrcWords")
LrcWords=rs("Words")
end if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>

<!-- saved from url=(0049)http://www.pinluo.com/ -->
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<STYLE type=text/css>TD {
	FONT-SIZE: 13pt; LINE-HEIGHT: 15px
}
BODY {
	SCROLLBAR-FACE-COLOR: #b3e2fe; SCROLLBAR-SHADOW-COLOR: #daf1ff; SCROLLBAR-ARROW-COLOR: #50baec; SCROLLBAR-TRACK-COLOR: #edfbff; SCROLLBAR-DARKSHADOW-COLOR: #b3e2fe; SCROLLBAR-BASE-COLOR: #b3e2fe; scrollbar-mediumlight-color: #B3E2FE
}
BODY {
	FONT-SIZE: 13pt; MARGIN: 0px; LINE-HEIGHT: 15px
}
#lrcollbox TD {
	FONT-SIZE: 13px; FONT-FAMILY: 宋体
}
#lrcollbox FONT {
	FONT-SIZE: 13px; FONT-FAMILY: 宋体
}
#lrcoll TD {
	CURSOR: default; COLOR: #0058b3
}
#lrcbox {
	COLOR: #834400
}
#lrcfilter {
	FILTER: alpha(opacity=0)
}
#lrcbc {
	COLOR: #FF9900
}
</STYLE>

<META content="MSHTML 6.00.2800.1601" name=GENERATOR></HEAD>
<BODY><SPAN id=lrcdata><!--
<%=LrcWords%>
欢迎您访问http://www.pinluo.com/下载完毕，请关闭窗口

--></SPAN>
<DIV id=lrcollbox 
style="OVERFLOW: hidden; WIDTH: 100%; HEIGHT: 300px; BACKGROUND-COLOR: #EDFBFF">
<table class="tableBorder" width="100%" 
border=0 cellPadding=0 cellSpacing=0 id=lrcoll 
style="POSITION: relative; TOP: -15px" oncontextmenu="return false;" name="lrcoll">
  <TBODY>
  <TR>
    <TD id=lrcwt1 noWrap align=middle height=15></TD></TR>
  <TR>
    <TD id=lrcwt2 noWrap align=middle height=15></TD></TR>
  <TR>
    <TD id=lrcwt3 noWrap align=middle height=15></TD></TR>
  <TR>
    <TD id=lrcwt4 noWrap align=middle height=15></TD></TR>
  <TR>
    <TD id=lrcwt5 noWrap align=middle height=15></TD></TR>
  <TR>
    <TD id=lrcwt6 noWrap align=middle height=15></TD></TR>
  <TR>
    <TD noWrap align=middle height=15>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD noWrap height=15><SPAN id=lrcwt7 
        style="HEIGHT: 15px"></SPAN></TD></TR>
        <TR style="Z-INDEX: 6; POSITION: relative; TOP: -15px">
          <TD noWrap height=15>
            <DIV id=lrcfilter 
            style="OVERFLOW: hidden; WIDTH: 100%; COLOR: #FF9900; HEIGHT: 15px"></DIV></TD></TR></TBODY></TABLE></TD></TR>
  <TR style="POSITION: relative; TOP: -15px">
    <TD noWrap align=middle height=15>
      <table class="tableBorder" cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD noWrap height=15><SPAN id=lrcbox 
            style="HEIGHT: 15px">歌词加载中</SPAN></TD></TR>
        <TR style="Z-INDEX: 6; POSITION: relative; TOP: -15px">
          <TD noWrap height=15>
            <DIV id=lrcbc 
            style="OVERFLOW: hidden; WIDTH: 0px; HEIGHT: 15px"></DIV></TD></TR></TBODY></TABLE></TD></TR>
  <TR style="POSITION: relative; TOP: -30px">
    <TD id=lrcwt8 noWrap align=middle height=15></TD></TR>
  <TR style="POSITION: relative; TOP: -30px">
    <TD id=lrcwt9 noWrap align=middle height=15></TD></TR>
  <TR style="POSITION: relative; TOP: -30px">
    <TD id=lrcwt10 noWrap align=middle height=15></TD></TR>
  <TR style="POSITION: relative; TOP: -30px">
    <TD id=lrcwt11 noWrap align=middle height=15></TD></TR>
  <TR style="POSITION: relative; TOP: -30px">
    <TD id=lrcwt12 noWrap align=middle height=15></TD></TR>
  <TR style="POSITION: relative; TOP: -30px">
  <TD id=lrcwt13 noWrap align=middle height=15></TD></TR></TBODY></TABLE></DIV>
<SCRIPT language=JavaScript>
var lrc0;
var lrc1;
var min;
lrcobj = new lrcClass(lrcdata.innerHTML.slice(4,-3));

function lrcClass(tt)
{
  this.inr = [];
  this.min = [];

  this.oTime = 0;

  this.dts = -1;
  this.dte = -1;
  this.dlt = -1;
  this.ddh;
  this.fjh;

  lrcbc.style.width = 0;

  if(/\[offset\:(\-?\d+)\]/i.test(tt))
    this.oTime = RegExp.$1/1000;
 
  tt = tt.replace(/\[\:\][^$\n]*(\n|$)/g,"$1");
  tt = tt.replace(/\[[^\[\]\:]*\]/g,"");
  tt = tt.replace(/\[[^\[\]]*[^\[\]\d]+[^\[\]]*\:[^\[\]]*\]/g,"");
  tt = tt.replace(/\[[^\[\]]*\:[^\[\]]*[^\[\]\d\.]+[^\[\]]*\]/g,"");
  tt = tt.replace(/<[^<>]*[^<>\d]+[^<>]*\:[^<>]*>/g,"");
  tt = tt.replace(/<[^<>]*\:[^<>]*[^<>\d\.]+[^<>]*>/g,"");

  while(/\[[^\[\]]+\:[^\[\]]+\]/.test(tt))
  {
    tt = tt.replace(/((\[[^\[\]]+\:[^\[\]]+\])+[^\[\r\n]*)[^\[]*/,"\n");
    var zzzt = RegExp.$1;
    /^(.+\])([^\]]*)$/.exec(zzzt);
    var ltxt = RegExp.$2;
    var eft = RegExp.$1.slice(1,-1).split("][");
    for(var ii=0; ii<eft.length; ii++)
    {
      var sf = eft[ii].split(":");
      var tse = parseInt(sf[0],10) * 60 + parseFloat(sf[1]);
      var sso = { t:[] , w:[] , n:ltxt }
      sso.t[0] = tse-this.oTime;
      this.inr[this.inr.length] = sso;
    }
  }
  this.inr = this.inr.sort( function(a,b){return a.t[0]-b.t[0];} );

  for(var ii=0; ii<this.inr.length; ii++)
  {
    while(/<[^<>]+\:[^<>]+>/.test(this.inr[ii].n))
    {
      this.inr[ii].n = this.inr[ii].n.replace(/<(\d+)\:([\d\.]+)>/,"%=%");
      var tse = parseInt(RegExp.$1,10) * 60 + parseFloat(RegExp.$2);
      this.inr[ii].t[this.inr[ii].t.length] = tse-this.oTime;
    }
    lrcbc.innerHTML = "<font>"+ this.inr[ii].n.replace(/&/g,"&").replace(/</g,"<").replace

(/>/g,">").replace(/%=%/g,"</font><font>") +"</font>";
    var fall = lrcbc.getElementsByTagName("font");
    for(var wi=0; wi<fall.length; wi++)
      this.inr[ii].w[this.inr[ii].w.length] = fall[wi].offsetWidth;
    this.inr[ii].n = lrcbc.innerText;
  }

  for(var ii=0; ii<this.inr.length-1; ii++)
    this.min[ii] = Math.floor((this.inr[ii+1].t[0]-this.inr[ii].t[0])*10);
  this.min.sort(function(a,b){return a-b});
  min = this.min[0]/2;

  this.run = function(tme)
  {
    if(tme<this.dts || tme>=this.dte)
    {
      var ii;
      for(ii=this.inr.length-1; ii>=0 && this.inr[ii].t[0]>tme; ii--){}
      if(ii<0) return;
      this.ddh = this.inr[ii].t;
      this.fjh = this.inr[ii].w;
      this.dts = this.inr[ii].t[0];
      this.dte = (ii<this.inr.length-1)?this.inr[ii+1].t

[0]:parent.document.MediaPlayer.currentMedia.duration;

      lrcwt1.innerText = this.retxt(ii-7);
      lrcwt2.innerText = this.retxt(ii-6);
      lrcwt3.innerText = this.retxt(ii-5);
      lrcwt4.innerText = this.retxt(ii-4);
      lrcwt5.innerText = this.retxt(ii-3);
      lrcwt6.innerText = this.retxt(ii-2);
      lrcwt7.innerText = this.retxt(ii-1);
      lrcfilter.innerText = this.retxt(ii-1);
      lrcwt8.innerText = this.retxt(ii+1);
      lrcwt9.innerText = this.retxt(ii+2);
      lrcwt10.innerText = this.retxt(ii+3);
      lrcwt11.innerText = this.retxt(ii+4);
      lrcwt12.innerText = this.retxt(ii+5);
      lrcwt13.innerText = this.retxt(ii+6);
      this.print(this.retxt(ii));
      if(this.dlt==ii-1)
      {
        clearTimeout(lrc0);
        if(lrcoll.style.pixelTop!=0) lrcoll.style.top = 0;
        golrcoll(0);
        clearTimeout(lrc1);
        lrcfilter.filters.alpha.opacity = 100;
        golrcolor(0);
      }
      else if(parseInt(lrcoll.style.top)!=-15)
      {
        clearTimeout(lrc0);
        lrcoll.style.top = -15;
        clearTimeout(lrc1);
        lrcfilter.filters.alpha.opacity = 0;
      }
      this.dlt = ii;
    }
    var bbw = 0;
    var ki;
    for(ki=0; ki<this.ddh.length && this.ddh[ki]<=tme; ki++)
      bbw += this.fjh[ki];
    var kt = ki-1;
    var sc = ((ki<this.ddh.length)?this.ddh[ki]:this.dte) - this.ddh[kt];
    var tc = tme - this.ddh[kt];
    bbw -= this.fjh[kt] - tc / sc * this.fjh[kt];
    if(bbw>lrcbox.offsetWidth)
      bbw = lrcbox.offsetWidth;
    lrcbc.style.width = Math.round(bbw);
  }

  this.retxt = function(i)
  {
    return (i<0 || i>=this.inr.length)?"":this.inr[i].n;
  }

  this.print = function(txt)
  {
    lrcbox.innerText = txt;
    lrcbc.innerText = txt;
  }
  this.print("[品络科技] www.pinluo.com 欢迎您！");
  lrcwt1.innerText = "";
  lrcwt2.innerText = "";
  lrcwt3.innerText = "";
  lrcwt4.innerText = "";
  lrcwt5.innerText = "";
  lrcwt6.innerText = "";
  lrcwt7.innerText = "";
  lrcfilter.innerText = "";
  lrcwt8.innerText = "";
  lrcwt9.innerText = "";
  lrcwt10.innerText = "";
  lrcwt11.innerText = "";
  lrcwt12.innerText = "";
  lrcwt13.innerText = "";
}

function lrcrun()
{
  with(parent.document.MediaPlayer)
  {
    lrcobj.run(controls.currentPosition);
  }
  if(arguments.length==0) setTimeout("lrcrun()",10);
}

function golrcoll(s)
{
  lrcoll.style.top = -(s++)*2;
  if(s<=9)
    lrc0 = setTimeout("golrcoll("+s+")",min*10);
}

function golrcolor(t)
{
  lrcfilter.filters.alpha.opacity = 110-(t++)*10;
  if(t<=10)
    lrc1 = setTimeout("golrcolor("+t+")",min*10);
}
window.onerror = function()
{return true;}
lrcrun();
</SCRIPT>
</BODY></HTML>
