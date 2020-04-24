	var via = parent;
	var write_via = "parent";
	var iLoc= self.location.href;

	function playSel(){via.wmpStop();via.startJNNC();}
	function refreshPl(){ self.location=iLoc;}
	function chkSel(){via.chkAllSel();refreshPl();}
	function chkDesel(){via.chkAllDesel();refreshPl();}
	function playSave(){via.createBoxCookie();refreshPl();}
	function intobox(a){
	var line="../User/PL_WriteSMusic.asp?id="+a;
	window.open(line,'WriteSMusic','width=397,height=322,scrollbars=no')}
    function dspList(n){
		
		var elmABlock= 5;// 设定每页可显示多少个播放项目
		var totElm = via.intMmCnt;
		var totBlock= Math.floor((via.intMmCnt -1) / elmABlock)+1;
		var cblock;
		if(n==null){cblock=1;}
		else{cblock=n;}
		var seed;
		var limit;
		if(cblock < totBlock){seed= elmABlock * (cblock-1); limit =  cblock*elmABlock -1}
		else{seed=elmABlock * (cblock-1); limit= totElm-1;}

	if(via.intMmCnt >0 ){
		var list_num=0;
		var elm ="" //song
        elm = elm +'<table class="tableBorder" width="358" border="0" cellpadding="0" cellspacing="0"><tbody>' //song
		for (var i=seed; i <= limit; i++)
		{	list_num = i + 1;
		    if(i % 2 ==0)
            {color="white"} 
			else
			{color="green"} 
			elm = elm + '<tr height="22" class="'+color+'" onmousemove=this.className="overs" onmouseout=this.className="'+color+'">'
			if(via.objMmInfo[i].selMm=="t"){elm=elm+'<td width="222" align="left"><span><input type=checkbox  style="cursor:hand;" onfocus=blur() onClick='+ write_via + '.chkItemSel('+ i +'); checked>';}
			else{elm=elm+'<td width="222" align="left"><span><input type=checkbox style="cursor:hand;" onfocus=blur() onClick='+ write_via + '.chkItemSel('+ i +');>';}
			elm = elm + list_num +'.'
			elm = elm + '<span onclick=javascript:' + write_via + '.selPlPlay(' + i + ') style="width:175; height:20;overflow:hidden";'
			elm = elm + ' onfocus=blur()>'
			if(via.objMmInfo[i].mmTit =="nAnT"){ elm = elm + "未指定媒体标题(等待自动取得媒体信息)";}
			else{elm = elm + via.objMmInfo[i].mmTit;}
			elm= elm +  '</span></span></td>';
			elm= elm + '<td width="70" align="left"><span  style="width:50; height:20;overflow:hidden" >'+via.objMmInfo[i].mmSer+'</span></td>'
			elm= elm + '<td width="25" align="left"><img src="heart_20.gif" width="12" height="11" border="0" alt="为好朋友点歌送去祝福"  onClick=intobox('+via.objMmInfo[i].mmSid+') /></td>'
			elm= elm + '<td width="22" align="left" ><img src="cha_20.gif" width="11" height="11" border="0" alt="从列中删除" onClick="'+ write_via + '.delItem('+ i +');refreshPl();chkSel();+'+ write_via + '.saveBoxCookie();"/></td>'
			elm= elm + '</tr>'			
			
		}
		elm = elm + '</tbody></table>'
		mmList.innerHTML=elm;

        var pmin=new Number(cblock)-3;
		var pmax=new Number(cblock)+3;
		var ppre=new Number(cblock)-1;
		var pnext=new Number(cblock)+1;
		if(pmin<=3){pmin=1;pmax=7;}
		if(pmax>totBlock){pmax=totBlock;}
		if(ppre<=1){ppre=1;}
		if(pnext>totBlock){pnext=totBlock;}

		for(var j=pmin; j<=pmax; j++){
			page='<a href=javascript:dspList('+j+') onFocus=blur()>['+j+']</a> ';
		}

		pageInfo.innerHTML='<span class="sg12b"><a href=javascript:dspList(1) onfocus=blur() title=首页 class="e12t"><font face="Webdings">9</font></a> <a href=javascript:dspList('+ppre+') onfocus=blur() class="e12t" title=上一页><font face="Webdings">3</font></a> 第<font color=#000000><b>'+cblock+ '</b></font>页 共'+ totBlock+'页 共'+totElm+'首 <a href=javascript:dspList('+pnext+') onfocus=blur() title=下一页 class="e12t"><font face="Webdings">4</font></a> <a href=javascript:dspList('+totBlock+') onfocus=blur() class="e12t" title=尾页><font face="Webdings">:</font></a></span>';

	}
	else { mmList.innerHTML='<div align=center>www.pinluo.com</div>'; }
	 }



// List Popping Up
function openPlaylist_i(layername)
{
	if (parent.opener)
	{
		if (parent.document.getElementById(layername).style.visibility == 'visible')
			{
				parent.document.getElementById(layername).style.visibility = 'hidden';
				parent.resizeTo(255,138);
			}
		else
			{
				parent.document.getElementById(layername).style.visibility = 'visible';
				parent.resizeTo(255,388);
			}
	}
	else
	{
		if (parent.document.getElementById(layername).style.visibility == 'visible') 
			parent.document.getElementById(layername).style.visibility = 'hidden';
		else
			parent.document.getElementById(layername).style.visibility = 'visible';
	}
}
