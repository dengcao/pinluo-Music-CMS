// �Ƿ��Զ�����?
// �趨������������ҳ��ʱ���Ƿ��Զ�����(Auto Start)ý���ļ���
// true = �Զ����� (һ��վ����ѡ�������ʽ)
// false = ��Ҫ�Զ����ţ���ʹ�����ֶ�����
var blnAutoStart = true;

var blnRndPlay = false; 

var blnStatusBar = true; 

var blnShowVolCtrl = true;

var blnShowPlist = true;

// �Ƿ�ʹ����Ļ���ܣ�������Ļ��?
// �趨�Ƿ�ʹ��SMIL��Ļ����(Closed Captioning-�������չ��Ϊ"SMI"�Ĵ��ı��ļ�ʹ��)��
// true = ʹ����Ļ���ܣ�����Ļ������ʾͬ����ʻ�����ѶϢ(Ҳ���԰���ͼƬ����Ϣ)
// false = �ر���Ļ����
var blnUseSmi = true;

var blnLoopTrk = true;

// �Ƿ񵯳�������ʾý�嵵����Ϣ?
// �趨�ڿ�ʼ����ÿһ����Ŀʱ���Ƿ񵯳�������ʾý�嵵����Ϣ(Media Info)��
// true = ��ʾý�嵵����Ϣ (�����濼���������Ϊ����߿��ܻ�е��ᷳ�ģ��˹���ֻ�ʺϲ�����)
// false = ����ʾý�嵵����Ϣ
var blnShowMmInfo =false;

function openPlaylist(layername)
{
	if (opener)
	{
		if (document.getElementById(layername).style.visibility == 'visible')
			{
				document.getElementById(layername).style.visibility = 'hidden';
				window.resizeTo(screen.availWidth, screen.availHeight);
			}
		else
			{
				document.getElementById(layername).style.visibility = 'visible';
				window.resizeTo(screen.availWidth, screen.availHeight);
			}
	}
	else
	{
		if (document.getElementById(layername).style.visibility == 'visible') 
			document.getElementById(layername).style.visibility = 'hidden';
		else
			document.getElementById(layername).style.visibility = 'visible';
	}
}


function wmpVolMove(layername)
{
	if (event.x - 6 > 152 && event.x - 6 < 213)
	{
		document.getElementById(layername).style.posLeft = event.x - 6;

		var wmps=JNNC.playState;

		if (wmps == 3) clearInterval(tidTLab);

		var ps = JNNC.settings;

		if (ps.mute)
		{
			ps.mute = false;
			disp2.innerHTML="Speach";
			imgChange('vmute',0);
		}
		
		else
		{
			//   0% = 161 ~ 166
			//  10% = 167 ~ 172
			//  20% = 173 ~ 178
			//  30% = 179 ~ 184
			//  40% = 185 ~ 190
			//  50% = 191 ~ 196
			//  60% = 197 ~ 202
			//  70% = 203 ~ 208
			//  80% = 209 ~ 214
			//  90% = 215 ~ 220
			// 100% = 221 ~ 226

			if (event.x - 6 >  152 && event.x - 6 <  153) ps.volume = vmin;
			else if (event.x - 6 >= 153 && event.x - 6 <= 156) ps.volume = 5;
			else if (event.x - 6 >= 156 && event.x - 6 <= 159) ps.volume = 10;
			else if (event.x - 6 >= 159 && event.x - 6 <= 162) ps.volume = 15;
			else if (event.x - 6 >= 162 && event.x - 6 <= 165) ps.volume = 20;
			else if (event.x - 6 >= 165 && event.x - 6 <= 168) ps.volume = 25;
			else if (event.x - 6 >= 168 && event.x - 6 <= 171) ps.volume = 30;
			else if (event.x - 6 >= 171 && event.x - 6 <= 174) ps.volume = 35;
			else if (event.x - 6 >= 174 && event.x - 6 <= 177) ps.volume = 40;
			else if (event.x - 6 >= 177 && event.x - 6 <= 180) ps.volume = 45;
			else if (event.x - 6 >= 180 && event.x - 6 <= 183) ps.volume = 50;
			else if (event.x - 6 >= 183 && event.x - 6 <= 186) ps.volume = 55;
			else if (event.x - 6 >= 186 && event.x - 6 <= 189) ps.volume = 60;
			else if (event.x - 6 >= 189 && event.x - 6 <= 192) ps.volume = 65;
			else if (event.x - 6 >= 192 && event.x - 6 <= 195) ps.volume = 70;
			else if (event.x - 6 >= 195 && event.x - 6 <= 198) ps.volume = 75;
			else if (event.x - 6 >= 198 && event.x - 6 <= 201) ps.volume = 80;
			else if (event.x - 6 >= 201 && event.x - 6 <= 204) ps.volume = 85;
			else if (event.x - 6 >= 204 && event.x - 6 <= 207) ps.volume = 90;
			else if (event.x - 6 >= 207 && event.x - 6 <= 210) ps.volume = 95;
			else if (event.x - 6 == 210 && event.x - 6 <= 213) ps.volume = vmax;
			else ps.volume = ps.volume;
			
			disp2.innerHTML="Vol. " + ps.volume +"%";
		}

		tidMsg=setTimeout('rtnTLab()',1000);
	}
}
