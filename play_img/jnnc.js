var objMmInfo = null;
var intMmCnt = 0;
var intSelMmCnt = 0;
var intActMmCnt = 0;
var cActIdx = 0;
var cActTit = "nAnT";
var strMmInfo = "媒体档案信息";
var blnfpl = false;
var blnEnabled = false;
var blnEOT = false;
var arrSelMm = null;
var arrActMm = null;
var intJNNCStat = 0;
var tidTLab = null;
var tidErr = null;
var tidMsg = null;
var intErrCnt = 0;
var blnRept = false;
// 这是「自动连续播放」的设定。一般来说，播放一首音乐完毕后就会自动跳到下一首。
// 但是如果您要播放的媒体是视讯档案(例如:MV)的话，最好将这个设定值改为 false 。
// true = 自动连续播放
// false = 不要自动连续播放，让使用者自行挑选下一首曲目
var blnAutoProc = true;
// 设定播放面板上所显示的时间长度，预设是以正常方式(Elapse)抑或倒数方式(Lapse)显示：
// true = 以正常方式显示时间长度，即动态地显示曲目已播放的时间
// false = 以倒数方式显示时间长度，即动态地显示曲目剩余的时间
var blnElaps = true;
// 设定播放每首曲目之间的延迟时间(Delay Time)，单位是毫秒(msec)。
// 每100毫秒代表0.1秒，默认值是500毫秒(即0.5秒)，最少也要设为100毫秒。
var intDelay = 500;
// wmpInit() 函式: 使用 wmp-obj v7.x 链接库建立环境设定
function wmpInit(){
var wmps = JNNC.settings;
var wmpc = JNNC.ClosedCaption;
wmps.autoStart = true;
wmps.balance = 0;
wmps.enableErrorDialogs = false;
wmps.invokeURLs = false;
wmps.mute = false;
wmps.playCount = 1;
wmps.rate = 1;
wmps.volume = 100;
//if(blnUseSmi){wmpc.captioningID="capText"; capText.style.display="";}
JNNC.enabled = true;
}
//操作音乐盒函数开始------------------------------>>
function setCookie(name,value)
{
 var Days = 30;
 var exp = new Date(); //new Date("December 31, 9998");
 exp.setTime(exp.getTime() + Days*24*60*60*1000);
 document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}
function getCookie(name)
{
 var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
 if(arr=document.cookie.match(reg)) return unescape(arr[2]);
 else return null;
}
function delCookie(name)
{
 var exp = new Date();
 exp.setTime(exp.getTime() - 1);
 var cval=getCookie(name);
 if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}

function createBoxCookie()
{   
    var arrCok =new Array();
	var intCok=0
	for(var i=0;i<arrSelMm.length;i++)
	{
		arrCok[intCok]=objMmInfo[arrSelMm[i]].mmSid;
		intCok++;
	}
	setCookie("boxlist",arrCok.join(","))
	alert("当前列表已储存成功")	
}
function saveBoxCookie()
{   
    var arrCok =new Array();
	var intCok=0
	for(var i=0;i<arrSelMm.length;i++)
	{
		arrCok[intCok]=objMmInfo[arrSelMm[i]].mmSid;
		intCok++;
	}
	setCookie("boxlist",arrCok.join(","))	
}

function delArrayItem(arrayItem,idx)
{
  if(arrayItem.length>0)
  {
     
     var mArr=new Array()
	 var Arrint=0
	 for(var j=0;j<arrayItem.length;j++)
	 { 	  
	 if(j!=idx){	    	
		mArr[Arrint] =arrayItem[j];Arrint++}		
	 }
	
	return mArr		
  } 
  else
  {return null}
}
function delItem(idx)
{
   if(objMmInfo.length >1)
   {
   objMmInfo=delArrayItem(objMmInfo,idx);
   intMmCnt--;
   }
   else
   {
	   alert("最后一首歌曲不能删除")
   }
   
}
//操作音乐盒函数结束------------------------------<<

// mkMmPath() 函式: 准备建立 Multi-object 的数组
function mkMmPath(u,t,s,f,r,d,q){
	//alert("u="+u+"\n"+"t="+t+"\n"+"f="+f+"\n"+"s="+s+"\n"+"r="+r+"\n"+"d="+d+"\n"+"q="+q+"\n")
this.mmUrl = u;
this.mmTit = t;
this.mmDur = 0;
this.selMm = f;
this.actMm = f;
this.mmSer = r;  //歌手名
this.mmNid = d
this.mmSid = q
if(blnUseSmi){this.mmSmi=s;}
}
// mkList() 函式: 建立 Multi-object 的数组
function mkList(u,t,s,f,r,d,q){
var cu = u;
var ct = t;
var cs = s;
var cf = f;
var cr = r;//歌手名
var cd = d;//歌手的ID 
var cq = q;//歌曲的ID
var idx = 0;
if(objMmInfo == null){objMmInfo=new Array(); idx=0;}
else {idx=objMmInfo.length;}
if(u=="" || u==null){cu="mms://";}
if(t=="" || t==null){ct="nAnT";}
if(f=="f" || f=="F"){cf="f";}
else {cf="t"; intSelMmCnt++;}
if(blnUseSmi){  //事否显示歌词
objMmInfo[idx]=new mkMmPath(cu,ct,cs,cf,cr,cd,cq); 
} else {
objMmInfo[idx]=new mkMmPath(cu,ct,cf,cr,cd,cq);
}
intActMmCnt = intSelMmCnt;
intMmCnt = objMmInfo.length;
}
// mkSel() 函式: 建立已选取播放项目(Selected Media)的数组
function mkSel(){
arrSelMm = null;
intSelMmCnt = 0;
var selidx = 0;
if(intMmCnt<=0){intJNNCStat=1; blnEnabled=false; return;} // 没有任何播放清单项目
arrSelMm = new Array();
for(var i=0; i<intMmCnt; i++){
if(objMmInfo[i].selMm =="t"){arrSelMm[selidx]=i;selidx++;}
}
intSelMmCnt=arrSelMm.length;
if(intSelMmCnt<=0){blnEnabled=false; intJNNCStat=2; arrSelMm=null; return;}
else {blnEnabled=true; mkAct();}
}

// mkAct() 函式: 建立已启用播放项目(Activated Media)的数组
function mkAct(){
arrActMm = null;
intActMmCnt = 0;
var selidx = 0;
var actidx = 0;
if(blnEnabled){
arrActMm=new Array();
for(var i=0; i<intSelMmCnt; i++){
selidx=arrSelMm[i];
if(objMmInfo[selidx].actMm=="t"){arrActMm[actidx]=selidx; actidx++;}
}
intActMmCnt=arrActMm.length;
}
else { return;}
if(intActMmCnt<=0){blnEOT=true;arrActMm=null;}
else {blnEOT=false;}
}
// chkAllSel() 函式: 全部选取所有的播放清单项目
function chkAllSel(){
for(var i=0; i<intMmCnt; i++){
objMmInfo[i].selMm="t";
objMmInfo[i].actMm="t";
}
mkSel();
}
// chkAllDesel() 函式: 不选取所有的播放清单项目
function chkAllDesel(){
for(var i=0; i<intMmCnt; i++){
objMmInfo[i].selMm="f";
objMmInfo[i].actMm="f";
}
mkSel();
}
// chkItemSel() 函式: 选取或不选取播放清单项目
function chkItemSel(idx){
if(objMmInfo[idx].selMm =="t"){
objMmInfo[idx].selMm="f";objMmInfo[idx].actMm="f";
} else {
objMmInfo[idx].selMm="t";objMmInfo[idx].actMm="t";
}
mkSel();
}

// chkItemAct() 函式: 将某个已启用播放项目(Activated Media)冻结
function chkItemAct(idx){
objMmInfo[idx].actMm="f";
mkAct();
}
// mkSelAct() 函式: 将已选取播放项目(Selected Media)加入到已启用播放项目(Activated Media)
function mkSelAct(){
var idx=0;
for(var i=0; i<intSelMmCnt; i++){
idx=arrSelMm[i];
objMmInfo[idx].actMm="t";
}
mkAct();
}
// initJNNC() 函式: 初始化 JNNC MP 媒体播放程序
function initJNNC(){
wmpInit();
mkSel();
blnfpl = false;
if(!blnShowVolCtrl) {
document.images['vmute'].style.display = "none";
document.images['vdn'].style.display = "none";
document.images['vup'].style.display = "none";
}
//if(!blnShowPlist){ document.images['plist'].style.display = "none";}
//if(blnRept){imgChange('rept',1);}
//else {imgChange('rept',0);}
//if(blnRndPlay){imgChange('pmode',1);}
//else {imgChange('pmode',0);}
showTLab();
disp1.innerHTML = "品络音乐系统www.pinluo.com   仙乐飘飘，让您一饱耳福……";
if(blnStatusBar){ window.status=('品络音乐系统www.pinluo.com   仙乐飘飘，让您一饱耳福……');}
if(blnAutoStart){startJNNC();}
}
//startJNNC() 函式: 开始播放曲目
function startJNNC(){

var wmps = JNNC.playState;
if(wmps==2){
JNNC.controls.play(); 
try{clearInterval(play_time)}catch(e){}
return;
}
if(wmps==3){ return;}
blnfpl=false;
if(!blnEnabled){waitMsg();return;}
if(blnEOT){mkSelAct();}
if(intErrCnt>0){intErrCnt=0;tidErr=setTimeout('retryPlay(),1000');return;}
if(blnRndPlay){rndPlay();}
else {cActIdx=arrActMm[0];selMmPlay(cActIdx);}
}
// selMmPlay() 函式: 处理媒体标题
function selMmPlay(idx){
clearTimeout(tidErr);
cActIdx=idx;
var trknum=idx+1;
var ctit =objMmInfo[idx].mmTit;
if(ctit=="nAnT"){ctit="(没有媒体标题)"}
if(blnUseSmi){JNNC.ClosedCaption.SAMIFileName = objMmInfo[idx].mmSmi;}
JNNC.URL = objMmInfo[idx].mmUrl;
cActTit = trknum + ". " + ctit;
disp1.innerHTML = cActTit;
if(blnStatusBar){ window.status=(cActTit);}
chkItemAct(cActIdx);
}
// wmpPlay() 函式: 使用 wmp-obj v7.x 链接库播放曲目
function wmpPlay(){JNNC.controls.play();}
// wmpStop() 函式: 停止播放曲目及显示「就绪」状态讯息
function wmpStop(){
intErrCnt=0;
clearTimeout(tidErr);
clearInterval(tidTLab);
imgChange("stopt",1);
imgChange("pauzt",0);
imgChange("scope",0);
showTLab();
mkSelAct();
JNNC.controls.stop();
JNNC.close();
CourseButton.style.pixelLeft=0
disp1.innerHTML = "<font class=title>品络音乐系统www.pinluo.com   仙乐飘飘，让您一饱耳福……</font>";
if(blnStatusBar){ window.status=('品络音乐系统www.pinluo.com   仙乐飘飘，让您一饱耳福……');return true;}
}
// wmpPause() 函式: 使用 wmp-obj v7.x 链接库暂停播放曲目
function wmpPause(){JNNC.controls.pause();}
// wmpPP() 函式: 在暂停播放和继续播放之间进行切换
function wmpPP(){
var wmps = JNNC.playState;
var wmpc = JNNC.controls;
clearInterval(tidTLab);
clearTimeout(tidMsg);
if(wmps==2){wmpc.play();}
if(wmps==3){wmpc.pause(); disp2.innerHTML="<font color=#333300><b>暂停</b></font>"; tidMsg=setTimeout('rtnTLab()',1500);}
return;
}
// rndPlay() 函式: 随机播放(Random Play)的运算方式
function rndPlay(){
if(!blnEnabled){waitMsg();return;}
intErrCnt=0;
var idx=Math.floor(Math.random() * intActMmCnt);
cActIdx=arrActMm[idx];
selMmPlay(cActIdx);
}
// playAuto() 函式: 对已启用播放项目进行「自动连续播放」的处理
// 这是根据上面 blnAutoProc 的设定值而决定的动作。
function playAuto(){
/*var st="blnRept"+blnRept+"\n"
    st=st+"!blnAutoProc "+!blnAutoProc+"\n"
	st=st+"blnfpl "+blnfpl+"\n"
	st=st+"!blnEnabled "+!blnEnabled+"\n"
	st=st+"blnEOT "+blnEOT+"\n"
	st=st+"blnLoopTrk "+blnLoopTrk+"\n"
	st=st+"blnRndPlay "+blnRndPlay
	alert(st)*/
if(blnRept){selMmPlay(cActIdx);return;}
if(!blnAutoProc){wmpStop();return;}
if(blnfpl){wmpStop();return;}
if(!blnEnabled){wmpStop();return;}
if(blnEOT){
if(blnLoopTrk){startJNNC();}
else {wmpStop();}
} else {
if(blnRndPlay){rndPlay();}
else {cActIdx=arrActMm[0]; selMmPlay(cActIdx);}
}
}
// 播放使用者在播放清单上所点选的单一曲目
function selPlPlay(idx){
blnfpl=true;
selMmPlay(idx);
}
// playPrev() 函式: 播放上一首已启用播放项目
function playPrev(){
var wmps = JNNC.playState;
if(wmps==2 || wmps==3){JNNC.controls.stop();}
blnfpl=false;
if(!blnEnabled){waitMsg();return;}
if(blnEOT){mkSelAct();}
intErrCnt=0;
if(blnRndPlay){rndPlay();}
else {
var idx=cActIdx;
var blnFind=false;
for(var i=0;i<intSelMmCnt;i++){ if(cActIdx==arrSelMm[i]){idx=i-1; blnFind=true;}}
if(!blnFind){startJNNC();return;}
if(idx<0){idx=intSelMmCnt-1;cActIdx=arrSelMm[idx];}
else {cActIdx=arrSelMm[idx];}
selMmPlay(cActIdx);
}
}
// playNext() 函式: 播放下一首已启用播放项目
function playNext(){
var wmps = JNNC.playState;
if(wmps==2 || wmps==3){JNNC.controls.stop();}
blnfpl=false;
if(!blnEnabled){waitMsg();return;}
if(blnEOT){mkSelAct();}
intErrCnt=0;
if(blnRndPlay){rndPlay();}
else {
var idx=cActIdx;
var blnFind=false;
for(var i=0;i<intSelMmCnt;i++){ if(cActIdx==arrSelMm[i]){idx=i+1; blnFind=true;}}
if(!blnFind){startJNNC();return;}
if(idx>=intSelMmCnt){idx=0;cActIdx=arrSelMm[idx];}
else {cActIdx=arrSelMm[idx];}
selMmPlay(cActIdx);
}
}
// retryPlay() 函式: 再次尝试联机到媒体档案
function retryPlay(){
selMmPlay(cActIdx);
}
// chkRept() 函式: 切换是否重复播放目前的曲目(已启用播放项目)
function chkRept(){
var wmps = JNNC.playState;
if(wmps==3){clearInterval(tidTLab);}
if(blnRept){
blnRept=false; imgChange('rept',0); disp2.innerHTML="<font color=#333300><b>不重复播放</b></font>";
} else {
blnRept=true; imgChange('rept',1); disp2.innerHTML="<font color=#333300><b>重复播放</b></font>";
}
tidMsg=setTimeout('rtnTLab()',1000);
}
// chgPMode() 函式: 切换以循序(Sequential)抑或随机(Random)的方式来播放媒体项目
function chgPMode(){
var wmps = JNNC.playState;
if(wmps==3){clearInterval(tidTLab);}
if(blnRndPlay){
blnRndPlay=false; imgChange('pmode',0); disp2.innerHTML="<font color=#333300><b>循序播放</b></font>";
} else {
blnRndPlay=true; imgChange('pmode',1); disp2.innerHTML="<font color=#333300><b>随机播放</b></font>";
}
tidMsg=setTimeout('rtnTLab()',1000);
}
// evtOSChg() 函式: 以弹出窗口方式显示媒体档案信息
function evtOSChg(f){
// 以下是状态值 (f) 的说明:
// 0(未定义) 8(转换媒体中) 9(寻找媒体中) 10(联机媒体中) 11(加载媒体中)
// 12(开启媒体中) 13(媒体已开启) 20(等待播放中) 21(正在开启不明的连结)
if(f==8){capText.innerHTML="<p class=title>&copy;&nbsp;Cuiz.Net&nbsp;&trade;";}
if(f==13){
var strTitle = JNNC.currentMedia.getItemInfo("Title");
if(strTitle.length <= 0){strTitle = "(未命名的标题)"}
var strAuthor = JNNC.currentMedia.getItemInfo("Author");
if(strAuthor.length <= 0){strAuthor = "(未命名的演出者)"}
var strCopy = JNNC.currentMedia.getItemInfo("Copyright");
if(strCopy.length <= 0){strCopy = "(没有著作权信息)"}
var strType = JNNC.currentMedia.getItemInfo("MediaType");
var strDur = JNNC.currentMedia.durationString;
var strUrl = JNNC.URL;
var trknum = cActIdx+1;
var ctit = objMmInfo[cActIdx].mmTit;
if(ctit=="nAnT"){
objMmInfo[cActIdx].mmTit = strAuthor + " - " + strTitle;
ctit = strAuthor + " - " + strTitle;
cActTit = trknum + ". " + ctit;
disp1.innerHTML = cActTit;
}
strMmInfo = "　　标题： " + strTitle + " (形式: " + strType +")" + "\n\n";
strMmInfo += "　演出者： " + strAuthor + "\n\n";
strMmInfo += "档案位置： " + strUrl + "\n\n";
strMmInfo += "　著作权： " + strCopy + "\n\n";
strMmInfo += "时间长度： " + strDur + "\n\n\n";
strMmInfo += "　　 Cuiz.Net.\n";
strMmInfo += "　　 ALL RIGHTS RESERVED.\n";
if(blnShowMmInfo){alert(strMmInfo);}
}
}
// evtPSChg() 函式: 切换播放程序的动作
function evtPSChg(f){
// 以下是状态值 (f) 的说明:
// 0(未定义) 1(已停止播放) 2(已暂停播放) 3(正在播放中) 4(向前搜索) 5(向后搜索)
// 6(缓冲处理中) 7(等待中) 8(已播放完毕) 9(转换曲目中) 10(就绪状态)
switch(f){	
case 1:
evtStop();
break;
case 2:
evtPause();
break;
case 3:
evtPlay();
break;
case 8:
setTimeout('playAuto()',1000);
break;
}
}
// evtWmpBuff() 函式: 对媒体档案进行缓冲处理(Buffering)的动作
function evtWmpBuff(f){
if(f){
disp2.innerHTML = "缓冲处理中";
var msg = cActTit;
disp1.innerHTML = msg;
if(blnStatusBar){ window.status=(msg);}
} else {
disp1.innerHTML = cActTit; showTLab();
}
}
// evtWmpError() 函式: 当无法联机到媒体档案时，显示错误讯息
function evtWmpError(){
intErrCnt++;
JNNC.Error.clearErrorQueue();
if(intErrCnt<=3){
disp2.innerHTML = "<font color=#333300><b>尝试联机 (" + intErrCnt + ")</font>";
var msg = "<font color=#333300><b>(尝试第 " + intErrCnt + " 次联机) " + cActTit+"</font>";
disp1.innerHTML = "<font color=#333300><b><无法播放> " + cActTit +"</font>";
if(blnStatusBar){ window.status=(msg);}
tidErr=setTimeout('retryPlay()',1000);
} else {
clearTimeout(tidErr);
intErrCnt=0;showTLab();
var msg = "<font color=#333300><b>已放弃尝试再联机。现在将会播放下一首曲目。</font>";
if(blnStatusBar){ window.status=(msg);}
setTimeout('playAuto()',1000);}
}
// evtStop() 函式: 停止播放
function evtStop(){
clearTimeout(tidErr);
clearInterval(tidTLab);
showTLab();
intErrCnt=0;
imgChange("pauzt",0);
imgChange("playt",0);
imgChange("scope",0);
CourseButton.style.pixelLeft=0
disp1.innerHTML = "<font class=title>等待中…</font>";
if(blnStatusBar){ window.status=('等待…');return true;}
}
// evtPause() 函式: 暂停播放
function evtPause(){
imgChange("pauzt",1)
imgChange("playt",0);
imgChange("stopt",0);
imgChange("scope",0);
clearInterval(tidTLab);
showTLab();
}
// evtPlay() 函式: 开始播放
function evtPlay(){
imgChange("pauzt",0)
imgChange("playt",1);
imgChange("stopt",0);
imgChange("scope",1);

tidTLab=setInterval('showTLab()',1000);
}
// showTLab() 函式: 显示时间长度
function showTLab(){
var ps = JNNC.playState;
if(ps==2 || ps==3){
var cp=JNNC.controls.currentPosition;
var cps=JNNC.controls.currentPositionString;
var dur=JNNC.currentMedia.duration;
var durs=JNNC.currentMedia.durationString;
if(blnElaps){
disp2.innerHTML = "<font color=#333300><b>"+cps + " | " + durs+"</b></font>";
var msg = "<font color=#333300><b>"+cActTit + " (" + cps + " | " + durs + ")</b></font>";
if(ps==2){msg = "(暂停) " + msg;}
if(blnStatusBar){ 
//window.status=(msg);
CourseButton.style.pixelLeft=Math.round((CourseButtonBox.offsetWidth-CourseButton.offsetWidth)*JNNC.controls.currentposition/JNNC.currentMedia.duration)
return true;
}
} else {
var laps = dur-cp;
var strLaps = wmpTime(laps);
disp2.innerHTML = "<font color=#333300><b>"+strLaps + " | " + durs+"</b></font>";
var msg = "<font color=#333300><b>"+cActTit + " (" + strLaps + " | " + durs + ")</b></font>";
if(ps==2){msg = "(暂停) " + msg;}
if(blnStatusBar){ 
//window.status=(msg);
CourseButton.style.pixelLeft=Math.round((CourseButtonBox.offsetWidth-CourseButton.offsetWidth)*JNNC.controls.currentposition/JNNC.currentMedia.duration)
return true;}
}
} else {
disp2.innerHTML = "<font color=#333300><b>00:00 | 00:00</b></font>";
}
}
// chgTimeFmt() 函式: 变更时间长度的显示方式
function chgTimeFmt(){
var wmps = JNNC.playState;
if(wmps==3){clearInterval(tidTLab);}
if(blnElaps){
blnElaps=false; disp2.innerHTML="<font color=#333300><b>倒数方式</b></font>";
} else {
blnElaps=true; disp2.innerHTML="<font color=#333300><b>正常方式</b></font>";
}
tidMsg=setTimeout('rtnTLab()',1000);
}
// rtnTLab() 函式: 传回时间长度
function rtnTLab(){
clearTimeout(tidMsg);
var wmps = JNNC.playState;
if(wmps==3){tidTLab=setInterval('showTLab()',1000);}
else {showTLab();}
}
// wmpTime() 函式: 计算时间长度
function wmpTime(dur){
var hh, min, sec, timeLabel;
hh=Math.floor(dur/3600);
min=Math.floor(dur/60)%60;
sec=Math.floor(dur%60);
if(isNaN(min)){ return "00:00";}
if(isNaN(hh) || hh==0){timeLabel="";}
else {
if(hh>9){timeLabel = hh.toString() + ":";}
else {timeLabel = "0" + hh.toString() + ":";}
}
if(min>9){timeLabel = timeLabel + min.toString() + ":";}
else {timeLabel = timeLabel + "0" + min.toString() + ":";}
if(sec>9){timeLabel = timeLabel + sec.toString();}
else {timeLabel = timeLabel + "0" + sec.toString();}
return timeLabel;
}

//滚动条事件
var EventObject=0,Old_X,New_X;
function button_down(){//拖动按钮按下事件
    EventObject=event.srcElement;
    Old_X=event.clientX;
    EventObject.setCapture();
    }
function button_move(){//拖动按钮移动事件
    if(EventObject){
        New_X=event.clientX;
        var MovePels=EventObject.style.pixelLeft+New_X-Old_X;
        var MaxBound=document.all(EventObject.id+"Box").offsetWidth-EventObject.offsetWidth;
        if(EventObject&&MovePels<=MaxBound&&MovePels>=0){
            EventObject.style.pixelLeft=MovePels;
            eval(EventObject.id+"Event("+EventObject.style.pixelLeft+","+MaxBound+")");
            Old_X=New_X;
            }
        }
    }
function button_up(){//拖动按钮松开事件
    if(EventObject){
        EventObject.releaseCapture();
        EventObject=0;
        }
    }
function CourseButtonEvent(l,m){//播放进程控制
    JNNC.controls.currentposition=Math.round(JNNC.currentMedia.duration*l/m);
    }
function VolumeButtonEvent(l,m){//音量控制
    var wmps=JNNC.playState;
    if(wmps == 3){clearInterval(tidTLab);}
    var ps = JNNC.settings;
    ps.volume=Math.round((l/m)*100);
    disp2.innerHTML = "<font color=#333300><b>音量: " + ps.volume + "%</b></font>";
    }
function TrackButtonEvent(l,m){//声道控制
    var n=Math.round(l/m*100);
    var ps = JNNC.settings;
    ps.balance=n==50?0:n>50?(n-50)*1.8:n<50?-(50-n)*1.8:0;
    }

vArray = new Array();
vArray[0] = 0;
vArray[1] = 10;
vArray[2] = 20;
vArray[3] = 30;
vArray[4] = 40;
vArray[5] = 50;
vArray[6] = 60;
vArray[7] = 70;
vArray[8] = 80;
vArray[9] = 90; 
vArray[10] = 100; 

function SetVolume(index)
{
var wmps=JNNC.playState;
if(wmps == 3){clearInterval(tidTLab);}
var ps = JNNC.settings;
ps.volume = vArray[index];
document.images["meter"].src = eval("meter" + index + ".src");
disp2.innerHTML="<font color=#333300><b>Vol. " + ps.volume +"%</b></font>";
if(ps.volume != 0 && ps.mute){ps.mute = false;imgChange("vmute", 0);}
if(ps.volume == 0 && !ps.mute){ps.mute = true;disp2.innerHTML="<font color=#333300><b>静音模式</b></font>"; imgChange("vmute", 1);}
tidMsg=setTimeout('rtnTLab()',1000);
}
function MeterClick(n)
{
SetVolume(n);
}
// wmpMute() 函式: 静音模式(Mute)
function wmpMute(){ 
var wmps=JNNC.playState;
if(wmps == 3){clearInterval(tidTLab);}
var ps = JNNC.settings;
if(!ps.mute){ps.mute = true;disp2.innerHTML="<font color=#333300><b>静音模式启动</b></font>"; imgChange("vmute", 1);}
else {ps.mute = false;disp2.innerHTML="<font color=#333300><b>静音模式关闭</b></font>"; imgChange("vmute", 0);}
tidMsg=setTimeout('rtnTLab()',1000);
}
//function wmpMute(){
// var wmps = JNNC.playState;
// if(wmps==3){clearInterval(tidTLab);}
// var ps = JNNC.settings;
// if(!ps.mute){
// ps.mute=true; disp2.innerHTML="开启静音模式"; imgChange("vmute",1);
// } else {
// ps.mute=false; disp2.innerHTML="关闭静音模式"; imgChange("vmute",0);
// }
// tidMsg=setTimeout('rtnTLab()',1000);
//}
// waitMsg() 函式: 显示因播放列表空白而无法播放的讯息
function waitMsg(){
capText.innerHTML="<p class=title>&nbsp;&copy;&nbsp;Cuiz.Net&nbsp;&trade;";
if(intJNNCStat==1){disp1.innerHTML = "无法播放 － 播放列表上没有设定任何曲目。";}
if(intJNNCStat==2){disp1.innerHTML = "无法播放 － 您没有选取播放列表上任何一首曲目。";}
if(blnStatusBar){
if(intJNNCStat==1){ window.status=('无法播放 － 播放列表上没有设定任何曲目。'); return true;}
if(intJNNCStat==2){ window.status=('无法播放 － 您没有选取播放列表上任何一首曲目。'); return true;}
}
}
// openPlist() 函式: 以弹出窗口显示播放清单内容
function openPlist(){
window.open("JNNCpl.htm","mplist","top=50,left=320,width=400,height=400,scrollbars=no,resizable=yes,copyhistory=no");
}
// chkWmpState() 函式: 当播放程序动作变更时，传回 playState 的状态值
function chkWmpState(){
// 以下是状态值的说明:
// 0(未定义) 1(已停止播放) 2(已暂停播放) 3(正在播放中) 4(向前搜索) 5(向后搜索)
// 6(缓冲处理中) 7(等待中) 8(已播放完毕) 9(转换曲目中) 10(就绪状态)
return JNNC.playState;
}
// chkWmpOState() 函式: 当播放程序开启媒体档案准备播放时，传回 openState 的状态值
function chkWmpOState(){
// 以下是状态值的说明:
// 0(未定义) 8(转换媒体中) 9(寻找媒体中) 10(联机媒体中) 11(加载媒体中)
// 12(开启媒体中) 13(媒体已开启) 20(等待播放中) 21(正在开启不明的连结)
return JNNC.openState;
}
// chkOnline() 函式: 检查使用者的联机状态 (不一定每款面板都会使用)
function chkOnline(){
// 传回值: true(已联机到因特网) false(没有联机到因特网)
return JNNC.isOnline;
}
// cnJNNC() 函式: 点选连到 JNNC MP 播放器简体中文网站 (不一定每款面板都会使用)
function cnJNNC(){
// 使用范例: <span onClick="vizJNNC()" style="cursor:hand" title="http://www.cuiz.net">
window.open("http://www.cuiz.net","vizJNNC");
}
// vizJNNC() 函式: 点选连到 JNNC MP 播放器原作者的官方网站[韩文] (不一定每款面板都会使用)
function vizJNNC(){
// 使用范例: <span onClick="vizJNNC()" style="cursor:hand" title="http://JNNC.nayana.org">
window.open("http://JNNC.nayana.org","vizJNNC");
}