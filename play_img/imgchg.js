//
// �� ���ж�̬��ťͼ�ļ����л�����
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
// ����γ������Ӧ�õ�������ʹ��ʱ��
// �Ժ�ʽ imgChange('��ťʶ������',0) ���еĶ�����ʹ�� "off" ��ͼ����
// �Ժ�ʽ imgChange('��ťʶ������',1) ���еĶ�����ʹ�� "on" ��ͼ����
// ����Ĳ��ݾ����趨 "off" �� "on" �Ķ�̬��ťͼ�ļ���
// vmute, pmode, rept, playt, pauzt, stopt ��Щ���ǡ���ťʶ�����ơ���
if(document.images){
img = new Object();
// ������ģʽ����ť��ͼ�ļ� (�ѹرգ��ѿ���)
img.vmute_off = new Image();
img.vmute_off.src = "./anniulogo/player-21.gif";
img.vmute_on = new Image();
img.vmute_on.src = "./anniulogo/player-211.gif";

// ������˳��ģʽ����ť��ͼ�ļ� (ѭ�����)
img.pmode_off = new Image();
img.pmode_off.src = "./pimg/xunhuan.gif";
img.pmode_on = new Image();
img.pmode_on.src = "./pimg/suiji.gif";
// ���Ƿ��ظ����š���ť��ͼ�ļ� (���ظ����ظ�)
img.rept_off = new Image();
img.rept_off.src = "./pimg/s.gif";
img.rept_on = new Image();
img.rept_on.src = "./pimg/r.gif";
// �����š���ť��ͼ�ļ� (�ǲ����У������У��������ʱ)
img.playt_off = new Image();
img.playt_off.src = "./anniulogo/player-10.gif";
img.playt_on = new Image();
img.playt_on.src = "./anniulogo/player1-10.gif";
img.playt_ovr = new Image();
img.playt_ovr.src = "./anniulogo/player1-10.gif";
// ����ͣ����ť��ͼ�ļ� (����ͣ�У���ͣ�У��������ʱ)
img.pauzt_off = new Image();
img.pauzt_off.src = "./anniulogo/player-15.gif";
img.pauzt_on = new Image();
img.pauzt_on.src = "./anniulogo/player1-15.gif";
img.pauzt_ovr = new Image();
img.pauzt_ovr.src = "./anniulogo/player1-15.gif";
// ��ֹͣ����ť��ͼ�ļ� (δ��ֹͣ����ֹͣ���������ʱ)
img.stopt_off = new Image();
img.stopt_off.src = "./anniulogo/player-12.gif";
img.stopt_on = new Image();
img.stopt_on.src = "./anniulogo/player1-12.gif";
img.stopt_ovr = new Image();
img.stopt_ovr.src = "./anniulogo/player1-12.gif";
// ����һ����Ŀ����ť��ͼ�ļ� (һ����ʾ���������ʱ)
img.prevt_out = new Image();
img.prevt_out.src = "./anniulogo/player-17.gif";
img.prevt_ovr = new Image();
img.prevt_ovr.src = "./anniulogo/player-171.gif";
// ����һ����Ŀ����ť��ͼ�ļ� (һ����ʾ���������ʱ)
img.nextt_out = new Image();
img.nextt_out.src = "./anniulogo/player-19.gif";
img.nextt_ovr = new Image();
img.nextt_ovr.src = "./anniulogo/player-191.gif";
// ��������������ť��ͼ�ļ� (һ����ʾ���������ʱ)
img.vup_out = new Image();
img.vup_out.src = "./anniulogo/bar.gif";
img.vup_ovr = new Image();
img.vup_ovr.src = "./anniulogo/playanb_18.gif";
// ��������������ť��ͼ�ļ� (һ����ʾ���������ʱ)
img.vdn_out = new Image();
img.vdn_out.src = "./anniulogo/bar.gif";
img.vdn_ovr = new Image();
img.vdn_ovr.src = "./anniulogo/playanb_18.gif";
// ����ʾ�����嵥���ݡ���ť��ͼ�ļ� (һ����ʾ���������ʱ)
img.plist_out = new Image();
img.plist_out.src = "./pimg/g_plist.gif";
img.plist_ovr = new Image();
img.plist_ovr.src = "./pimg/g_plist.gif";
// ��ʾ����״̬�� Scope ��̬ͼ�ļ� (��ֹ��ת��)
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