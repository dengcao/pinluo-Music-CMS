<!--#include file="../PL_INC/md5.asp"-->
<%
if md5(Request.Cookies("Www_PinLuo_Com_user")("PL_rand")&Request.Cookies("Www_PinLuo_Com_user")("PL_vipdate")&Request.Cookies("Www_PinLuo_Com_user")("PL_userid")&Request.Cookies("Www_PinLuo_Com_user")("PL_username")&Request.Cookies("Www_PinLuo_Com_user")("PL_password"))<>Request.Cookies("Www_PinLuo_Com_user")("PL_usercheck") then
'response.Write("对不起！您没有权限访问这个页面！操作超时！请重新登陆！")
response.Write("<script type='text/JavaScript'>alert('对不起！操作超时！请重新登陆会员！');location.href='"&webmulu&"PL_INC/PL_err.asp?content=<li>操作超时,请重新登陆！<li>你需要登陆会员后才能进行本操作！';</script>")
Response.End()
'javascript:history.back();
else
end if
%>