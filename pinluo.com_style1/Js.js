function change(a)
{
  a.style.backgroundColor="#E1F4FD"    
}
function rechange(a)
{
  a.style.backgroundColor="#ffffff"  
}

function lbsong(form)
{
	var found =false
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
//		if (e.name != 'chkall')
			if (e.checked==true)
			{
				found = true;// form.chkall.checked;
			}
			
	}
	if(found ==true)
	{
		window.open("","Listen","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=yes,top=10,left=10,width=275,height=116");		
	}
	else
	{
		alert("还没有选择歌曲！")
      return false;
	}
}
function lbsong2(form)
{
	var found =false
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
//		if (e.name != 'chkall')
			if (e.checked==true)
			{
				found = true;// form.chkall.checked;
			}
			
	}
	if(found ==true)
	{
		form.submit();
		return true;
	}
	else
	{
		alert("还没有选择歌曲！")
      return false;
	}
}

function lbfile(form)
{
	var found =false
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
//		if (e.name != 'chkall')
			if (e.checked==true)
			{
				found = true;// form.chkall.checked;
			}
			
	}
	if(found ==true)
	{
		return true;	
	}
	else
	{
		alert("还没有选择要上传的歌曲！")
      return false;
	}
}
function open_window(url,windowname,size) 
{
var
newwin=window.open(url,windowname,"toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,top=10,left=10,"+ size); 
newwin.focus();
}
function open_window1(url,windowname,size) 
{
var
newwin=window.open(url,windowname,"toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=yes,top=10,left=10,"+ size); 
newwin.focus();
}
function CheckOthers(form)
{
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
//		if (e.name != 'chkall')
			if (e.checked==false)
			{
				e.checked = true;// form.chkall.checked;
			}
			else
			{
				e.checked = false;
			}
	}
}

function CheckAll(form)
{
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
//		if (e.name != 'chkall')
			e.checked = true// form.chkall.checked;
	}
}
function call(htmlurl){
var
newwin=window.open(htmlurl,"newsssWin","top=10,left=10,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=378,height=292");
newwin.focus();
return false;
}
  
function getword(a)
{
  document.getElementById("content").value=a
}
 