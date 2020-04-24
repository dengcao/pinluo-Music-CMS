//
// ■ 进行动态按钮图文件的切换动作
// 
toggleKey = new Object();
toggleKey[0] = "_off";
toggleKey[1] = "_on";
toggleKey[2] = "_ovr";
toggleKey[3] = "_out";
toggleKey[4] = "_mdn";
toggleKey[5] = "_mup";
function imgChange(id,act){
if(document.images){ document.images[id].src = eval("img." + id + toggleKey[act] + ".src");}
}
// 当这段程序代码应用到播放器使用时：
// 以函式 imgChange('按钮识别名称',0) 进行的动作即使用 "off" 的图档；
// 以函式 imgChange('按钮识别名称',1) 进行的动作即使用 "on" 的图档。
// 下面的部份就是设定 "off" 与 "on" 的动态按钮图文件。
// vmute, pmode, rept, playt, pauzt, stopt 这些都是「按钮识别名称」。
if(document.images){
img = new Object();
// 「静音模式」按钮的图文件 (已关闭／已开启)
img.vmute_off = new Image();
img.vmute_off.src = "./anniulogo/player-21.gif";
img.vmute_on = new Image();
img.vmute_on.src = "./anniulogo/player-211.gif";

// 「播放顺序模式」按钮的图文件 (循序／随机)
img.pmode_off = new Image();
img.pmode_off.src = "./pimg/xunhuan.gif";
img.pmode_on = new Image();
img.pmode_on.src = "./pimg/suiji.gif";
// 「是否重复播放」按钮的图文件 (不重复／重复)
img.rept_off = new Image();
img.rept_off.src = "./pimg/s.gif";
img.rept_on = new Image();
img.rept_on.src = "./pimg/r.gif";
// 「播放」按钮的图文件 (非播放中／播放中／鼠标移至时)
img.playt_off = new Image();
img.playt_off.src = "./anniulogo/player-10.gif";
img.playt_on = new Image();
img.playt_on.src = "./anniulogo/player1-10.gif";
img.playt_ovr = new Image();
img.playt_ovr.src = "./anniulogo/player1-10.gif";
// 「暂停」按钮的图文件 (非暂停中／暂停中／鼠标移至时)
img.pauzt_off = new Image();
img.pauzt_off.src = "./anniulogo/player-15.gif";
img.pauzt_on = new Image();
img.pauzt_on.src = "./anniulogo/player1-15.gif";
img.pauzt_ovr = new Image();
img.pauzt_ovr.src = "./anniulogo/player1-15.gif";
// 「停止」按钮的图文件 (未被停止／已停止／鼠标移至时)
img.stopt_off = new Image();
img.stopt_off.src = "./anniulogo/player-12.gif";
img.stopt_on = new Image();
img.stopt_on.src = "./anniulogo/player1-12.gif";
img.stopt_ovr = new Image();
img.stopt_ovr.src = "./anniulogo/player1-12.gif";
// 「上一首曲目」按钮的图文件 (一般显示／鼠标移至时)
img.prevt_out = new Image();
img.prevt_out.src = "./anniulogo/player-17.gif";
img.prevt_ovr = new Image();
img.prevt_ovr.src = "./anniulogo/player-171.gif";
// 「下一首曲目」按钮的图文件 (一般显示／鼠标移至时)
img.nextt_out = new Image();
img.nextt_out.src = "./anniulogo/player-19.gif";
img.nextt_ovr = new Image();
img.nextt_ovr.src = "./anniulogo/player-191.gif";
// 「增加音量」按钮的图文件 (一般显示／鼠标移至时)
img.vup_out = new Image();
img.vup_out.src = "./anniulogo/bar.gif";
img.vup_ovr = new Image();
img.vup_ovr.src = "./anniulogo/playanb_18.gif";
// 「减少音量」按钮的图文件 (一般显示／鼠标移至时)
img.vdn_out = new Image();
img.vdn_out.src = "./anniulogo/bar.gif";
img.vdn_ovr = new Image();
img.vdn_ovr.src = "./anniulogo/playanb_18.gif";
// 「显示播放清单内容」按钮的图文件 (一般显示／鼠标移至时)
img.plist_out = new Image();
img.plist_out.src = "./pimg/g_plist.gif";
img.plist_ovr = new Image();
img.plist_ovr.src = "./pimg/g_plist.gif";
// 显示播放状态的 Scope 动态图文件 (静止／转动)
img.scope_off = new Image();
img.scope_off.src = "./anniulogo/act.gif";
img.scope_on = new Image();
img.scope_on.src = "./anniulogo/actup.gif";
}
function imgtog(tg,act){
if(tg=="vmute") { if(act=="2"){imgChange("vmute",1);} else {imgmute("vmute",0);} }
if(tg=="vdn") { if(act=="2"){imgChange("vdn",2);} else {imgChange("vdn",3);} }
if(tg=="vup") { if(act=="2"){imgChange("vup",2);} else {imgChange("vup",3);} }
if(tg=="pmode") { if(act=="2"){imgChange("pmode",1);} else {imgrnd();} }
if(tg=="rept") { if(act=="2"){imgChange("rept",1);} else {imgrept();} }
if(tg=="nextt") { if(act=="2"){imgChange("nextt",2);} else {imgChange("nextt",3);} }
if(tg=="prevt") { if(act=="2"){imgChange("prevt",2);} else {imgChange("prevt",3);} }
if(tg=="pauzt") { if(act=="2"){imgpauz(2);} else {imgpauz();} }
if(tg=="playt") { if(act=="2"){imgplay(2);} else {imgplay();} }
if(tg=="stopt") { if(act=="2"){imgstop(2);} else {imgstop();} }
if(tg=="plist") { if(act=="2"){imgChange("plist",2);} else {imgChange("plist",3);} }
}
function imgmute()
{
	if(playClass=true)
	{
		var ps=JNNC.settings; <!--song -->
		if(ps.mute){imgChange("vmute",1);}
		else {imgChange("vmute",0);}
	}
	else
	{
		var ps=play.GetMute();<!--song -->
		if(ps){imgChange("vmute",1);}
		else {imgChange("vmute",0);}
	}
}
function imgrnd(){
if(blnRndPlay){imgChange("pmode",1);}
else {imgChange("pmode",0);}
}
function imgrept(){
if(blnRept){imgChange("rept",1);}
else {imgChange("rept",0);}
}
function imgpauz(f){
	if(playClass==true)
	{
		var wmps=JNNC.playState; <!--song -->
		if(f==2){imgChange("pauzt",2);}
		else {
		if(wmps==2){imgChange("pauzt",1);}
		else {imgChange("pauzt",0);}
		}
	}
	else
	{
		var wmps=play.GetPlayState(); <!--song -->
		if(f==4){imgChange("pauzt",2);}
		else {
		if(wmps==4){imgChange("pauzt",1);}
		else {imgChange("pauzt",0);}
		}
	}
}
function imgplay(f){ 
if(playClass==true)
{
		var wmps=JNNC.playState;<!--song -->
		if(f==2){imgChange("playt",2);}
		else {
		if(wmps==3){imgChange("playt",1);}
		else {imgChange("playt",0);}
		}
}
else
{
	    var wmps=play.GetPlayState();  <!--song -->
		if(f==4){imgChange("playt",2);}
		else {
		if(wmps==3){imgChange("playt",1);}
		else {imgChange("playt",0);}
		}
}
}
function imgstop(f){
 if(playClass==true)
 {
	var wmps=JNNC.playState; <!--song -->
	if(f==2){imgChange("stopt",2);}
	else {
	if(wmps==2 || wmps==3){imgChange("stopt",0);}
	else {imgChange("stopt",1);}
	}
 }
 else
 {
	 var wmps=play.GetPlayState(); <!--song -->
	if(f==4){imgChange("stopt",2);}
	else {
	if(wmps==4 || wmps==3){imgChange("stopt",0);}
	else {imgChange("stopt",1);}
	}
 }
}