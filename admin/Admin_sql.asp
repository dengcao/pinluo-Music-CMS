<!--#include file="const.asp"-->
<%CheckAdmin3%>
<%pagename="admin_sql"%>
<!--#include file="Top.Asp"-->  
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="admin.css" type=text/css rel=stylesheet>  
  <BODY>   
  <table class="tableBorder"   align="center">   
  <form   method="post"   name=myform>   
  <tr><td>ѡ�������<INPUT   TYPE="radio"   NAME="act"   id="act_backup"     value="backup">�������ݿ�<INPUT   TYPE="radio"   NAME="act"   id="act_restore"   value="restore">�ָ����ݿ�</td></tr>��   
  <tr><td>���ݿ�����<INPUT   TYPE="text"   NAME="databasename"   value="<%=strSQLDBName%>" size="40">(���ݻ�ָ���SQL���ݿ���,��music)</td></tr>   
  <tr><td>�ļ�·����<INPUT   TYPE="text"   NAME="BackUpPathFile"   value="<%=request.ServerVariables("APPL_PHYSICAL_PATH")%>databak\<%=year(date()) & month(date()) & day(date())%>.bak" size="40">(���ݻ�ָ����ļ�·��,��D:\SQL\music.bak)</td></tr>   
  <tr><td><input   type="submit"   value="ȷ��"></td></tr>   
  </form>   
  </table>   
  <%   
  'SQL   Server   ���ݿ�ı�����ָ�!   
  dim   sqlname,sqlLoginTimeout,BackUpPathFile,act
  sqlserver   =   "(local)"   'sql������   
  sqlname   =   "skymusicv5"        '�û���   
  sqlpassword   =   "skymusicv5"     '����   
  sqlLoginTimeout   =   15   '��½��ʱ   
        databasename   =   trim(request("databasename"))   
        BackUpPathFile   =   trim(request("BackUpPathFile"))   
        BackUpPathFile   =   replace(BackUpPathFile,"$1",databasename)   
  act   =   lcase(request("act"))   
    
  if   databasename   =   ""   then   
    response.write   "����д���ݿ������ļ�·��"   
  else   
    if   act   =   "backup"   then   
    Set   srv=Server.CreateObject("SQLDMO.SQLServer")   
  srv.LoginTimeout   =   sqlLoginTimeout   
  srv.Connect   sqlserver,sqlname,   sqlpassword   
  Set   bak   =   Server.CreateObject("SQLDMO.Backup")   
  bak.Database =databasename   
  bak.Devices =Files   
  bak.Files =BackUpPathFile   
  bak.SQLBackup   srv   
      if   err.number>0   then   
  response.write   err.number&"<font   color=red><br/>"   
  response.write   err.description&"</font>"   
      end   if   
        
  Response.write   "<font   color=green>���ݳɹ�!</font>"   
    elseif   act   =   "restore"   then   
  '�ָ�ʱҪ��û��ʹ�����ݿ�ʱ���У�   
      Set   srv=Server.CreateObject("SQLDMO.SQLServer")   
  srv.LoginTimeout   =   sqlLoginTimeout   
  srv.Connect   sqlserver,sqlname,   sqlpassword   
    
      Set   rest=Server.CreateObject("SQLDMO.Restore")   
  rest.Action=0   '   full   db   restore   
  rest.Database=databasename   
  rest.Devices=Files   
  rest.Files=BackUpPathFile   
  rest.ReplaceDatabase=True   'Force   restore   over   existing   database   
      if   err.number>0   then   
  response.write   err.number&"<font   color=red><br/>"   
  response.write   err.description&"</font>"   
      end   if   
      rest.SQLRestore   srv   
        
      Response.write   "<font   color=green>�ָ��ɹ�!</font>"   
    else   
      Response.write   "<font   color=red>û��ѡ�����</font>"   
    end   if   
  end   if   
'
'����������������������������������������������������
'��                                                                   ��
'��                     Ʒ�����ֳ���ϵͳ1.0                              ��
'��                                                                   ��
'��     �ռ�����: Ʒ��  www.pinluo.com                                  ��
'��                                                                   ��
'��     ��������: ����  www.caozha.com                                  ��
'��                                                                   ��
'��     Դ�����Apache-2.0��ѿ�Դ���뱣�����������ӣ�                      ��
'��                                                                   ��
'����������������������������������������������������
'
'
  %>   
  </BODY>   
  </HTML>
