<!--#include file="../PL_INC/md5.asp"-->
<%
if md5(Request.Cookies("Www_PinLuo_Com_user")("PL_rand")&Request.Cookies("Www_PinLuo_Com_user")("PL_vipdate")&Request.Cookies("Www_PinLuo_Com_user")("PL_userid")&Request.Cookies("Www_PinLuo_Com_user")("PL_username")&Request.Cookies("Www_PinLuo_Com_user")("PL_password"))<>Request.Cookies("Www_PinLuo_Com_user")("PL_usercheck") then
'response.Write("�Բ�����û��Ȩ�޷������ҳ�棡������ʱ�������µ�½��")
response.Write("<script type='text/JavaScript'>alert('�Բ��𣡲�����ʱ�������µ�½��Ա��');location.href='"&webmulu&"PL_INC/PL_err.asp?content=<li>������ʱ,�����µ�½��<li>����Ҫ��½��Ա����ܽ��б�������';</script>")
Response.End()
'javascript:history.back();
else
end if
%>