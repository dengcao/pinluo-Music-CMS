<%
PL_cookiepath="/"
Response.Cookies("Www_PinLuo_Com_user").path=PL_cookiepath
Response.Cookies("Www_PinLuo_Com_user")("PL_userid")=""
Response.Cookies("Www_PinLuo_Com_user")("PL_rand") = ""
Response.Cookies("Www_PinLuo_Com_user")("PL_username") = ""
Response.Cookies("Www_PinLuo_Com_user")("PL_password") = ""
Response.Cookies("Www_PinLuo_Com_user")("PL_vipdate") = ""
Response.Cookies("Www_PinLuo_Com_user")("PL_usercheck") = ""
response.Write("<script type='text/JavaScript'>alert('��ϲ�����ѳɹ��˳���½��');location.href='../index.asp';</script>")
response.Write("��ϲ�����ѳɹ��˳���½��")
%>