@echo off
set ver=19.5
set yongjiubool=0
set yongjiu=KMS
::�Ƿ�������ü���
set /a kmscount=0
color 3f
@title Windowsȫ�汾�����-ʹ��ǰ��֪
cls
echo.
echo.              ���ã���ӭʹ�ñ����
echo.
echo.   ���Դ�����΢����ɳ������������ڰٶ����ɹ�ʾ���κ��˶��������غͲ鿴������Ĵ����ǵĻ�������ȥ��һ��
echo.
echo.   �ٴ���������������κβ����ͺ��š���ʹ�ô����������������������˵�Ļ������Դ���뿪Դ,���Լ����д������
echo.
echo.   ��������ܻ��ռ�һ���ּ����Ƿ�ɹ���ص���Ϣ���Ա������ǸĽ������������ģ�����Ϣ����������κθ�����˽
echo.
echo.   ���������ѧϰ�о�ʹ�ã�����������;��ȥ΢��������������Ʒ��Կ
echo.
echo.   ���������ҵ�˵��������Ҫ����ʹ�ñ��������밴�����������
if not exist mydver.bat set dmyver=1.0
if exist mydver.bat call mydver.bat
pause >nul
@title Windowsȫ�汾�����-���kms������
cls
echo.
echo.
echo.
echo ���ڼ����%fwq%�������������
echo.
vlmcs %fwq% -l Windows | find "successful"  > NUL &&  goto rukou
:fail
cls
echo.
echo.
echo.
echo.�뼤�����������ʧ�ܣ����������������ӻ�����ѡ��kms���������ԡ�
echo. 1.������ҳ
echo. 2.����ѡ��kms������
echo. 3.�˳�����
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto rukou
if %errorlevel%==2 goto set
if %errorlevel%==3 exit
goto fail
title Windowsȫ�汾�����
:rukou
title Windowsȫ�汾�����-������ѣ��Ͻ�����
for /f "skip=2 tokens=2*" %%i in ('REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName') do set sysinfo=%%j
color 3f
if %dmyver% LSS 4.0 wget -q "http://update.1314.cool/update/act/curl.exe"
:loop
cls
echo.     
echo. 
echo.            ����ű��汾��v%my%   ���°汾��v%servision%  kms��������%fwq%
echo.            ��������ļ��⣨�װ����汾��v%dmyver%  ���°汾��v%ladver%
echo. 
echo.                              1.����Office
echo.                              2.����Windows(Ŀǰ����֧��Windows11Ԥ����)
echo.                              3.��װOffice
echo.                              4.�Զ���kms������
echo.                              5.��鵱ǰkms������
echo.                              6.��鵱ǰϵͳ�������
echo.                              7.ϵͳ������Ϣ
echo.                              8.������־�����ڼ����ⷴ��
echo.                              9.��װ/ж���Զ����ڷ���
echo.                              0.����
echo.
echo.
if %dmyver% LSS %ladver% echo.        ��ǰ����װ��汾�������£��󲿷ֹ��ܿ�������ʹ�ã������ٲ��ֹ��ܿ������� && echo.        �����������°汾���뵽��http://dl.1314.cool
choice /c 1234567890F /n /m "��ѡ��: "

if %errorlevel%==1 goto office
if %errorlevel%==2 goto windows
if %errorlevel%==3 goto setupo
if %errorlevel%==4 goto set
if %errorlevel%==5 goto checkkms
if %errorlevel%==6 goto checkact
if %errorlevel%==7 goto inf
if %errorlevel%==8 goto bugreport
if %errorlevel%==9 goto zidongxvqi
if %errorlevel%==10 goto juanzeng
if %errorlevel%==11 start http://qm.qq.com/cgi-bin/qm/qr?k=GXMq5O5N1wrFH0VQDBojPGpGpRZKTJtd&authKey=zYxpuJPa%2BP05Ydt2EZRhHFXtFutohXx8ZMqz09Gm6cv4ToTcoqNsaDvYfFJXVE75&group_code=853241207
goto :loop
:ml
cls
echo.                             
echo.
echo.                          ��ѡ��Ҫ����������
echo.                       1.����ϵͳ��slmgr.vbs /ato��
echo.                       2.��װ��Կ��slmgr.vbs /ipk xxxxx��
echo.                       3.�������˵�
echo.                       
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 slmgr.vbs /ato 
if %errorlevel%==2 goto my
if %errorlevel%==3 goto loop
goto loop
:my
cls
echo.                             
echo.
echo.        ������Ҫ��װ����Կ
set /p key=������
slmgr.vbs /ipk %key%
pause
goto loop
:office
call :dbaocheck 2.0
@title Windowsȫ�汾�����-Officeѡ��˵�
color 3f
cls
echo.                             
echo.
echo.                       
echo.
echo.                                 Windowsȫ�汾�����
echo.                              1.����office2019
echo.                              2.����office2016
:: echo.                              3.����office2013
:: echo.                              4.����office2010
echo.                              3.�޸���������֤�����⣬������ǵ���������ܺ��ߡ�
echo.                              4.�������˵�
echo.       
echo.                              
choice /c 1234 /n /m "��ѡ��: "
if %errorlevel%==1 goto :job19
if %errorlevel%==2 goto :job16
:: if %errorlevel%==3 goto :job13
:: if %errorlevel%==4 goto :job2010
if %errorlevel%==3 goto :xkzywt
if %errorlevel%==4 goto rukou
:job19
@title Windowsȫ�汾�����- Office2019
set officever=2019
cls
for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop"') do (
set desk=%%j
)
echo ���ڰ�װ���֤
if exist "%~dp0"Office16 cd /d "%~dp0"Office16

if not exist "%~dp0"Office16 echo. ����װ���ѹʧ�� && pause
if exist "%ProgramFiles%\Microsoft Office\Office16\OSPP.VBS" cd /d "%ProgramFiles%\Microsoft Office\Office16"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\OSPP.VBS" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16"

::for /f %%x in ('dir /b ..\root\Licenses16\ProPlus2019VL*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x" >>%desk%\log.txt
for /f %%x in ('dir /b ..\root\Licenses16\ProPlus2019VL*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x"  >>%~dp0log.txt
for /f %%x in ('dir /b ..\root\Licenses16\pkeyconfig*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x"  >>%~dp0log.txt
for /f %%x in ('dir /b ..\root\Licenses16\client-issuance*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x"  >>%~dp0log.txt
cls
echo. ���ڰ�װkms��Ʒ��Կ

cscript //nologo OSPP.VBS /unpkey:6MWKP >>%~dp0log.txt & cscript //nologo OSPP.VBS /inpkey:NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP  >>%~dp0log.txt
cls
echo ���ڽ��� KMS ������Ժ�...

cscript //nologo OSPP.VBS /remhst  >>%~dp0log.txt
cscript //nologo OSPP.VBS /setprt:1688  >>%~dp0log.txt
cscript //nologo OSPP.VBS /sethst:kms.lotro.cc  >>%~dp0log.txt
cscript //nologo OSPP.VBS /act >>%~dp0log.txt
cscript //nologo OSPP.VBS /act  | find /i "successful" && (echo.& cd /d %~dp0 &curl.exe "http://update.1314.cool/update/act/counter/counter.php?system=Office2019&status=success" >nul &cls & goto officesucc ) || (echo.& cd /d %~dp0 &curl.exe "http://update.1314.cool/update/act/counter/counter.php?system=Office2019&status=fail" >nul &cls & goto officefail)

::
:: pause >nul
exit
:job16
@title Windowsȫ�汾�����- office2016 / 365
set officever=2016
setlocal EnableDelayedExpansion&color 3f & cd /d "%~dp0"
title Windowsȫ�汾�����-Office 2016 / 365

if exist "%~dp0"Office16 cd /d "%~dp0"Office16
if exist "%ProgramFiles%\Microsoft Office\Office16\OSPP.VBS" cd /d "%ProgramFiles%\Microsoft Office\Office16"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\OSPP.VBS" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16"

cls

echo ���ڰ�װ KMS ���֤...
for /f %%x in ('dir /b ..\root\Licenses16\project???vl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x" >>%~dp0log.txt
for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x"  >>%~dp0log.txt
for /f %%x in ('dir /b ..\root\Licenses16\standardvl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x" >>%~dp0log.txt
for /f %%x in ('dir /b ..\root\Licenses16\visio???vl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x"  >>%~dp0log.txt
cls

echo ���ڰ�װ MAK ���֤...
for /f %%x in ('dir /b ..\root\Licenses16\project???vl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x"  >>%~dp0log.txt
for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x"  >>%~dp0log.txt
for /f %%x in ('dir /b ..\root\Licenses16\standardvl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x"  >>%~dp0log.txt
for /f %%x in ('dir /b ..\root\Licenses16\visio???vl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x"  >>%~dp0log.txt
cls

echo ���ڵ��� KMS GVLK...
cscript OSPP.VBS /inpkey:NYH39-6GMXT-T39D4-WVXY2-D69YY  >>%~dp0log.txt
cscript OSPP.VBS /inpkey:7WHWN-4T7MP-G96JF-G33KR-W8GF4  >>%~dp0log.txt
cscript OSPP.VBS /inpkey:RBWW7-NTJD4-FFK2C-TDJ7V-4C2QP  >>%~dp0log.txt
cscript OSPP.VBS /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99  >>%~dp0log.txt
cscript OSPP.VBS /inpkey:YG9NW-3K39V-2T3HJ-93F3Q-G83KT  >>%~dp0log.txt
cscript OSPP.VBS /inpkey:PD3PC-RHNGV-FXJ29-8JK7D-RJRJK  >>%~dp0log.txt
cscript OSPP.VBS /inpkey:JNRGM-WHDWX-FJJG3-K47QV-DRTFM  >>%~dp0log.txt
::1>nul 2>nul
cls

echo ���ڳ��� KMS ����...
cscript //nologo OSPP.VBS /sethst:%fwq%  >>%~dp0log.txt
cscript //nologo OSPP.VBS /act  >>%~dp0log.txt
cscript //nologo OSPP.VBS /act | find /i "successful" && (echo.& cd /d %~dp0 &curl.exe "http://update.1314.cool/update/act/counter/counter.php?system=Office2016&status=success" >nul & cls & goto officesucc ) || (echo.&cd /d %~dp0 &curl.exe "http://update.1314.cool/update/act/counter/counter.php?system=Office2016&status=fail" >nul &cls & goto officefail)
pause
exit
:job13
title Windowsȫ�汾�����-Office 2013
cls
@echo.
@echo.���ڼ��office�汾

if exist "%~dp0"Office16 cd /d "%~dp0"Office16
:: if exist "%ProgramFiles%\Microsoft Office\Office15\OSPP.VBS" cd /d "%ProgramFiles%\Microsoft Office\Office15"
:: if exist "%ProgramFiles(x86)%\Microsoft Office\Office15\OSPP.VBS" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office15"
cls
echo ���ڰ�װ KMS ���֤...
for /f %%x in ('dir /b ..\root\Licenses13\*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses13\%%x" 
::for /f %%x in ('dir /b ..\root\Licenses13\project???vl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses15\%%x" >nul
::for /f %%x in ('dir /b ..\root\Licenses13\proplusvl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses15\%%x" >nul
::for /f %%x in ('dir /b ..\root\Licenses13\standardvl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses15\%%x" >nul
::for /f %%x in ('dir /b ..\root\Licenses13\visio???vl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses15\%%x" >nul
::cls

::cho ���ڰ�װ MAK ���֤...
::for /f %%x in ('dir /b ..\root\Licenses13\project???vl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses15\%%x" >nul
::for /f %%x in ('dir /b ..\root\Licenses13\proplusvl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses15\%%x" >nul
::for /f %%x in ('dir /b ..\root\Licenses13\standardvl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses15\%%x" >nul
::for /f %%x in ('dir /b ..\root\Licenses13\visio???vl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses15\%%x" >nul
cls
echo.���ڰ�װkms��Ʒ��Կ
cscript OSPP.VBS /inpkey:YC7DK-G2NP3-2QQC3-J6H88-GVGXT 
cscript OSPP.VBS /inpkey:KBKQT-2NMXY-JJWGP-M62JB-92CD4 
cscript OSPP.VBS /inpkey:FN8TT-7WMH6-2D4X9-M337T-2342K 
cscript OSPP.VBS /inpkey:6NTH3-CW976-3G3Y2-JK3TX-8QHTT 
cscript OSPP.VBS /inpkey:C2FG9-N6J68-H8BTJ-BW3QX-RM3B3 
cscript OSPP.VBS /inpkey:J484Y-4NKBF-W2HMG-DBMJC-PGWR7 
cls
echo ���ڳ��� KMS ����...
cscript //nologo OSPP.VBS /sethst:%fwq% 
cscript //nologo OSPP.VBS /act | find /i "successful" && (echo.& cls & goto officesucc ) || (echo.& cls & goto officefail)
pause >nul
exit
:job2010
title Windowsȫ�汾�����-Office 2010
cls
color 3f & cd /d "%~dp0"
echo.���ڼ��office�汾

if exist "%~dp0"Office16 cd /d "%~dp0"Office16
:: if exist "%ProgramFiles%\Microsoft Office\Office14\OSPP.VBS" cd /d "%ProgramFiles%\Microsoft Office\Office14"
:: if exist "%ProgramFiles(x86)%\Microsoft Office\Office14\OSPP.VBS" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office14"
cls
echo ���ڰ�װ KMS ���֤...
for /f %%x in ('dir /b ..\root\Licenses10\*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses10\%%x" 
:: for /f %%x in ('dir /b ..\root\Licenses14\project???vl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses14\%%x" >nul
:: for /f %%x in ('dir /b ..\root\Licenses14\proplusvl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses14\%%x" >nul
:: for /f %%x in ('dir /b ..\root\Licenses14\standardvl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses14\%%x" >nul
:: for /f %%x in ('dir /b ..\root\Licenses14\visio???vl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses14\%%x" >nul
:: cls

:: echo ���ڰ�װ MAK ���֤...
:: for /f %%x in ('dir /b ..\root\Licenses14\project???vl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses14\%%x" >nul
:: for /f %%x in ('dir /b ..\root\Licenses14\proplusvl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses14\%%x" >nul
:: for /f %%x in ('dir /b ..\root\Licenses14\standardvl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses14\%%x" >nul
:: for /f %%x in ('dir /b ..\root\Licenses14\visio???vl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses14\%%x" >nul
:: cls
echo.���ڰ�װoffice��Ʒ��Կ
cscript OSPP.VBS /inpkey:VYBBJ-TRJPB-QFQRF-QFT4D-H3GVB 
cscript OSPP.VBS /inpkey:V7QKV-4XVVR-XYV4D-F7DFM-8R6BM 
cscript OSPP.VBS /inpkey:D6QFG-VBYP2-XQHM7-J97RH-VVRCK 
cscript OSPP.VBS /inpkey:D9DWC-HPYVV-JGF4P-BTWQB-WX8BJ 
cscript OSPP.VBS /inpkey:7MCW8-VRQVK-G677T-PDJCM-Q8TCP 
cscript OSPP.VBS /inpkey:767HD-QGMWX-8QTDB-9G3R2-KHFGJ 
cls
echo ���ڳ��� KMS ����...
cscript //nologo OSPP.VBS /sethst:%fwq% >nul
cscript //nologo OSPP.VBS /act | find /i "successful" && (echo.& cls & goto officesucc ) || (echo.& cls & goto officefail)
pause
exit

:xkzywt
cls
title Windowsȫ�汾�����-���office���֤����
echo.
echo.
echo.        ΢��Ϊ�˶���kms������е���״����ȡ�˴�ʩ�����ʹ��kms���߽��м�����ֶΣ���ʹ����ͨkms��������ʱ��office����ע���д���������Ϣ����ʹ��kms���߽��м���ʱ������߻�ٳ�Software Protection ���񣬲�������ע�������д��kms��������Ϣ����office��ⲻ����������Ϣʱ���ͻᵯ������
echo.
echo.        windowsȫ�汾������ṩ��һ����Ľ����������Ҫ�װ�3.0�汾����֧�֣����밴��������������
echo.        �����ڴ˸�лPatchOffice��������ߣ�
echo.
pause >nul
call :dbaocheck 3.0
patchoffice.exe 
cls
echo.
echo.
echo.        ���Ѿ��ɹ�����˴����⣬ллʹ�ã�
echo.
echo.        
echo.
echo.
echo.   1.�������ɶ�һ��
echo.   2.��������������ص�ַ
echo.   3.����
echo.   4.�������˵�
echo.
choice /c 1234 /n /m "��ѡ��: "
if %errorlevel%==1 start https://tieba.baidu.com/p/5301591808
if %errorlevel%==2 start http://dl.1314.cool
if %errorlevel%==3 goto juanzeng
if %errorlevel%==4 goto rukou
:officesucc
echo.
echo.
echo.���Ѿ��ɹ��ļ�����office
echo.
echo.    �������Ѿ�������4�꣬���ش����Ѿ���6.2���ˣ��Һܸ��ˡ�
echo. ������Ȼϣ�����ܽ������ɰ�æ��һ�£���Ȼ������Ҳ���ܾ��������������ø�����˿�������������Ҳ���Ҽ���ά����ȥ�Ķ�����лл��ҡ�
echo.
echo.
echo.
echo. ���ڱ�����һ������ѧ��������2022��μӸ߿������Իظ����ܽ����������½�
echo. 
echo.  1.��������
echo.  2.������־
echo.  3.����
echo.  4.�������˵�
echo.
choice /c 1234 /n /m "��ѡ��: "
if %errorlevel%==1 start https://tieba.baidu.com/p/5301591808
if %errorlevel%==2 goto :sendlog
if %errorlevel%==3 goto juanzeng
if %errorlevel%==4 goto rukou
goto rukou
:officefail
Echo WScript.Echo((new Date()).getTime())>sjc.vbs
for /f %%i in ('cscript -nologo -e:jscript sjc.vbs') do set sjc=%%i
del sjc.vbs
:failwi
cls
echo.
echo.
echo.  ����office�����г���
echo.
echo. ������־��ţ�%sjc%
echo.
echo. �Ƿ��ϴ�������־�Թ����Ƿ�����
echo.
echo. ����ģ�������־�������κθ�����Ϣ
echo.
echo. ����������־���ܻ�������ּ������޵�ϵͳ��Ϣ�������������־������ѡ���Ƿ��͡�
echo.
echo. ����ǿ���Ƽ������ʹ�����־����Ϊ���ǵ������Ȼ���������δ֪�Ĵ������Ĵ�����־������Ч�������Ƿ��ֲ��޸�����
echo. �������ģ����ǲ�����δ������Ȩ�����������������ʹ�����־�����ǵ��������ȫ��Դ�ģ�ʱ���ڽ��ܿ�Դ�����ļ�顣
echo.  1.�鿴������־���鿴��Ϻ���ѡ���ͣ���ѡ��2��
echo.  2.ֱ�ӷ��ʹ�����־
echo.  3.�����ʹ�����־���������˵�
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 start %~dp0log.txt
if %errorlevel%==2 goto :sendlog
if %errorlevel%==3 goto rukou
goto :failwi
:sendlog
cls
echo.
echo.
echo.
echo.   ���ڷ��ʹ�����־�����Ժ�.....
echo.
echo.
cd /d %~dp0
ren log.txt "errorlog_Office%officever%_KMS_%sysinfo%_%sjc%.txt"
cd /d %~dp0 &curl.exe  http://update.1314.cool/update/act/errorlog/send.php  -F "file=@%~dp0errorlog_Office%officever%_KMS_%sysinfo%_%sjc%.txt"
cls
echo.
echo.
echo.   ������־������ϣ���л����֧��
echo.
echo.  ��Ĵ�����־���Ϊ��%sjc%
echo.  ������ͨ���˴���������������޸����ȣ�лл֧��
echo.
echo.
echo.  1.���뷴��QQȺ�Ը��������޸���Ⱥ�ţ�853241207��
echo.  2.�������˵�
echo.  3.�˳����
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 start http://qm.qq.com/cgi-bin/qm/qr?k=GXMq5O5N1wrFH0VQDBojPGpGpRZKTJtd&authKey=zYxpuJPa%2BP05Ydt2EZRhHFXtFutohXx8ZMqz09Gm6cv4ToTcoqNsaDvYfFJXVE75&group_code=853241207
if %errorlevel%==2 goto :rukou
if %errorlevel%==3 exit
:windows
:autoorhand
@title Windowsȫ�汾�����-Windowsѡ��˵�
color 3f
cls
echo.                             
echo.
echo.                       ��ǰϵͳΪ%sysinfo%
echo.
echo.                              
echo.                              1.Windowsȫ�Զ����֧��Windows 11��
echo.                              2.�ֶ�ѡ��Windows�汾���м���
echo.                              3.�������˵�
echo.
echo.       ע�⣺ȫ�Զ�����Ĭ��Ϊkms���Windows10/11Ϊ����Ȩ�����
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto :autoact
if %errorlevel%==2 goto :abc
if %errorlevel%==3 goto rukou
:autoact
cls
echo.
echo.  ���ڼ�⵱ǰϵͳ�汾�����Ժ�
echo.
echo.
echo %sysinfo% |find "Windows 10" >NUL &&goto win10panduan
echo %sysinfo% |find "Windows 8.1" >NUL &&goto win8.1panduan
echo %sysinfo% |find "Windows 8" >NUL &&goto win8panduan
echo %sysinfo% |find "Windows 7" >NUL &&goto win7panduan
echo %sysinfo% |find "Windows Server 2016" >NUL &&goto :ser2016
echo %sysinfo% |find "Windows Server 2019" >NUL &&goto :ser2019
echo %sysinfo% |find "Windows Server 2008R2" >NUL &&goto :job8
echo %sysinfo% |find "Windows Server 2008" >NUL &&goto :job7
echo %sysinfo% |find "Windows Server 2012R2" >NUL &&goto :job6
echo %sysinfo% |find "Windows Server 2012" >NUL &&goto :job5
pause
:win7panduan

echo %sysinfo% |find "ProN" >NUL &&goto 7pro1
echo %sysinfo% |find "Pro" >NUL &&goto 7pro
echo %sysinfo% |find "Ultimate" >NUL &&goto 7qjb
echo %sysinfo% |find "Home Basic" >NUL &&goto win7hb
echo %sysinfo% |find "EnterpriseN" >NUL &&goto 7ent1
echo %sysinfo% |find "EnterpriseE" >NUL &&goto 7ent2
echo %sysinfo% |find "Enterprise" >NUL &&goto 7ent
goto panduanfall
:win8panduan

echo %sysinfo% |find "ProN" >NUL &&goto 8pro1
echo %sysinfo% |find "Pro" >NUL &&goto 8pro
echo %sysinfo% |find "EnterpriseN" >NUL &&goto 8ent1
echo %sysinfo% |find "Enterprise" >NUL &&goto 8ent
echo %sysinfo% |find "Home" >NUL &&cls&&echo �ݲ�֧�ּ�ͥ�漤��
goto panduanfall
:win8.1panduan

echo %sysinfo% |find "ProN" >NUL &&goto 8.1pro1
echo %sysinfo% |find "Pro" >NUL &&goto 8.1pro
echo %sysinfo% |find "EnterpriseN" >NUL &&goto 8.1ent1
echo %sysinfo% |find "Enterprise" >NUL &&goto 8.1ent
echo %sysinfo% |find "Home" >NUL &&cls&&echo �ݲ�֧�ּ�ͥ�漤��
goto panduanfall
:win10panduan

goto 10yongjiu

echo %sysinfo% |find "Pro EducationN" >NUL &&goto 10edunw
echo %sysinfo% |find "Pro Education" >NUL &&goto 10eduw
echo %sysinfo% |find "Pro for WorkstationsN" >NUL &&goto 10pronw
echo %sysinfo% |find "Pro for Workstations" >NUL &&goto 10prow
echo %sysinfo% |find "Pro" >NUL &&goto 10pro
echo %sysinfo% |find "EducationN" >NUL &&goto 10edun
echo %sysinfo% |find "Education" >NUL &&goto 10edu
echo %sysinfo% |find "EnterpriseN" >NUL &&goto 10entn
echo %sysinfo% |find "Enterprise" >NUL &&goto 10ent
:panduanfall
cls
echo.
echo.
echo.   δ�ҵ���ǰϵͳ�汾�����ֶ�ѡ��Windows�汾���м���
echo.
echo.  ��ǰϵͳ�汾Ϊ��%sysinfo%
echo.
echo.  �뽫��ҳ����ʾ�����ݽ�ͼ������QQȺ��ٶ����ɣ����ǽ�������������ϵͳ�汾��
echo.  1.�򿪰ٶ�����
echo.  2.�������˵�
choice /c 1234 /n /m "��ѡ��: "
if %errorlevel%==1 start https://tieba.baidu.com/p/5301591808
if %errorlevel%==2 goto rukou
:abc
@title Windowsȫ�汾�����-Windowsѡ��˵�
cls
echo.
echo.
echo.
echo ���ڼ��ϵͳ�Ƿ����ü����
echo.
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "���ü���"  > NUL &&  goto 56781
:pass
color 3f
cls
echo.                             
echo.
echo.                       ��ǰϵͳΪ%sysinfo%
echo.
echo.                              
echo.                              1.����windows10 / 11
echo.                              2.����windows8 / 8.1 
echo.                              3.����Windows7 
echo.                              4.����Windows Server 2012
echo.                              5.����Windows Server 2012 R2
echo.                              6.����Windows Server 2008
echo.                              7.����Windows Server 2008 R2
echo.                              8.����Windows Server 2016
echo.                              9.����Windows Server 2019
echo.                              0.����Windows Server, version 1909, version 1903, and version 1809
echo.                              A.�������˵���ѡ��ѡ��ʱ�����д���룩
echo.
echo.
echo.
choice /c x1234567890A /n /m "��ѡ��: "
if %errorlevel%==1 goto :all
if %errorlevel%==2 goto :setwin10
if %errorlevel%==3 goto :job3
if %errorlevel%==4 goto :job4
if %errorlevel%==5 goto :job5
if %errorlevel%==6 goto :job6
if %errorlevel%==7 goto :job7
if %errorlevel%==8 goto :job8
if %errorlevel%==9 goto :ser2016
if %errorlevel%==10 goto :ser2019
if %errorlevel%==11 goto :ser1909
if %errorlevel%==12 goto rukou
goto job00
:setwin10
title Windowsȫ�汾�����-Windows10���ʽѡ��
cls
echo.
echo.       
echo.   ��ǰϵͳΪ%sysinfo%
echo.        
echo.         ��ѡ�񼤻ʽ
echo.
echo.       1.Windows 10 ����Ȩ��������ã�
echo.       2.Windows 10 KMS���180�죩
echo.       3.�������˵�
echo.   ע�⣺Windows10����Ȩ������ǰ����������һ��kms�����������ּ���ĳɹ���
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto :10yongjiu
if %errorlevel%==2 goto :job2
if %errorlevel%==3 goto :rukou
:job2
title Windowsȫ�汾�����-Windows10��KMS��
cls
echo.
echo.       
echo.   ��ǰϵͳΪ%sysinfo%
echo.        
echo.         ѡ�����ϵͳ�汾
echo.
echo.       1.Windows 10 רҵ����վ
echo.       2.Windows 10 רҵ����վ N
echo.       3.Windows 10 רҵ������
echo.       4.Windows 10 רҵ������ N
echo.       5.Windows 10 רҵ��
echo.       6.Windows 10 ��ҵ��
echo.       7.Windows 10 ������
echo.       8.Windows 10 ��ҵ�� LTSB 2015
echo.       9.Windows 10 רҵ�� N
echo.       10.Windows 10 ��ҵ�� N
echo.       11.Windows 10 ������ N
echo.       12.Windows 10 ��ҵ�� LTSB 2015 N
echo.       13.Windows 10 ��ͥ��
echo.       14.Windows 10 ��ҵ�� 2016 ���ڷ����(LTSB 2016)
echo.       15.Windows 10 ��ҵ�� LTSC 2019
echo.       16.Windows 10 ��ҵ�� N LTSC 2019
echo.       17.Windows 10 ��ҵ�� 2016 ���ڷ���� N (LTSB 2016 N)
echo.       18.�������˵�
echo.  
echo.
set /p abc="��ѡ�񲢰��»س���: "
if %abc%==1 goto :10prow
if %abc%==2 goto :10pronw
if %abc%==3 goto :10eduw
if %abc%==4 goto :10edunw
if %abc%==5 goto :10pro
if %abc%==6 goto :10ent
if %abc%==7 goto :10edu
if %abc%==8 goto :10entlstb
if %abc%==9 goto :10pron
if %abc%==10 goto :10entn
if %abc%==11 goto :10edun
if %abc%==12 goto :10entlstbn
if %abc%==13 goto :10home
if %abc%==14 goto :10long2016
if %abc%==15 goto :10long2019
if %abc%==16 goto :10longn2019
if %abc%==17 goto :10longn2016
if %abc%==18 goto rukou
goto job2

:10prow
cls
set key=NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J
goto :10activate

:10pronw
cls
set key=9FNHH-K3HBT-3W4TD-6383H-6XYWF
goto :10activate

:10eduw
cls
set key=6TP4R-GNPTD-KYYHQ-7B7DP-J447Y
goto :10activate

:10edunw
cls
set key=YVWGF-BXNMC-HTQYQ-CPQ99-66QFC
goto :10activate

:10pro
cls
set key=W269N-WFGWX-YVC9B-4J6C9-T83GX
goto :10activate

:10pron
cls
set key=MH37W-N47XK-V7XM9-C7227-GCQG9
goto :10activate

:10ent
cls
set key=NPPR9-FWDCX-D2C8J-H872K-2YT43
goto :10activate

:10entn
cls
set key=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
goto :10activate

:10edu
cls
set key=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
goto :10activate

:10edun
cls
set key=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
goto :10activate

:10entlstb
cls
set key=WNMTR-4C88C-JK8YV-HQ7T2-76DF9
goto :10activate

:10entlstbn
cls
set key=2F77B-TNFGY-69QQF-B8YKP-D69TJ
goto :10activate

:10home
cls
set key=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
goto :10activate

:10long2016
cls
set key=DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ
goto :10activate

:10long2019
cls
set key=M7XTQ-FN8P6-TTKYV-9D4CC-J462D
goto :10activate

:10longn2019
cls
set key=92NFX-8DJQP-P6BBQ-THF9C-7CG2H
goto :10activate

:10longn2016
cls
set key=QFFDN-GRT3P-VKWWX-X7T3R-8B639
goto :10activate

:10activate
goto autosetkms

:10yongjiu
cls

    rem  �벻Ҫ�޸ı��ĵ�
    rem author : ĬȻKing��Windows10����Ȩ������֣�������������Ϊhvjg2578��
    rem url : http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1786788&page=1#pid48314667

title Windowsȫ�汾�����-Windows10����Ȩ������
cls
echo.
echo.
echo.
echo.   ����׼�������ļ������Ժ�
echo.
echo.

md "bin/KMS38"
md "bin/Digital"
if not exist kmsgat.exe wget -q http://%actupdatesev%/update/act/kmsgat.exe
if not exist diggat.exe wget -q http://%actupdatesev%/update/act/diggat.exe
if not exist kmsslc.dll wget -q http://%actupdatesev%/update/act/kmsslc.dll
if not exist digslc.dll wget -q http://%actupdatesev%/update/act/digslc.dll


copy kmsgat.exe "bin/KMS38/gatherosstate.exe"
copy diggat.exe "bin/Digital/gatherosstate.exe"
copy kmsslc.dll "bin/KMS38/slc.dll"
copy digslc.dll "bin/Digital/slc.dll"
cls
set yongjiubool=1

echo %sysinfo% |find "Pro EducationN" >NUL &&goto 10edunw
echo %sysinfo% |find "Pro Education" >NUL &&goto 10eduw
echo %sysinfo% |find "Pro for WorkstationsN" >NUL &&goto 10pronw
echo %sysinfo% |find "Pro for Workstations" >NUL &&goto 10prow
echo %sysinfo% |find "Pro" >NUL &&goto 10pro
echo %sysinfo% |find "EducationN" >NUL &&goto 10edun
echo %sysinfo% |find "Education" >NUL &&goto 10edu
echo %sysinfo% |find "EnterpriseN" >NUL &&goto 10entn
echo %sysinfo% |find "Enterprise" >NUL &&goto 10ent

:kmsover

:StartActive
set yongjiubool=0
set yongjiu=YJ
wmic path SoftwareLicensingProduct where (LicenseStatus='1' and GracePeriodRemaining='0') get Name 2>nul | findstr /i "Windows" >nul 2>&1 && (goto end5)
for /f "tokens=6 delims=[]. " %%a in ('ver') do (set version=%%a)

:reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f >nul
for /f "tokens=3 delims= " %%i in ('cscript /nologo %SystemRoot%\System32\slmgr.vbs /dli ^| findstr /i "edition"') do (set edition=%%i)
call :%edition%

cscript /nologo %SystemRoot%\System32\slmgr.vbs /ipk %pidkey% || goto quit
timeout /nobreak /t 2 >nul

reg add "HKLM\SYSTEM\Tokens" /v "Channel" /t REG_SZ /d "%License%" /f >nul
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d "%sku%" /f >nul
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Security-SPP-GenuineLocalStatus" /t REG_DWORD /d "1" /f >nul
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "\"%~dp0bin\%ActiveType%\gatherosstate.exe"\" /d "^ WIN7RTM" /f >nul

if /i "%License:~-4%" equ "GVLK" (
set "ActiveType=KMS38"
) else (
set "ActiveType=Digital"
)

set "number=0"
:Reset
set /a "number=%number%+1"
start /wait "" ".\bin\%ActiveType%\gatherosstate.exe"
timeout /nobreak /t 3 >nul
if exist ".\bin\%ActiveType%\GenuineTicket.xml" (
goto app
)
if "%number%" lss "3" (
goto Reset
)
goto quit

 :app
clipup -v -o -altto .\bin\%ActiveType%\

if /i "%License:~-4%" equ "GVLK" (
cscript /nologo %SystemRoot%\system32\slmgr.vbs /skms "127.0.0.1"
) else (
cscript /nologo %SystemRoot%\system32\slmgr.vbs /ato
 )

:quit
reg delete "HKLM\SYSTEM\Tokens" /f >nul
reg delete "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "\"%~dp0bin\%ActiveType%\gatherosstate.exe"\" /f >nul
:reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "1" /f >nul

:end5
rmdir /q /s "%SystemRoot%\Setup\Scripts\bin"
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "��������"  > NUL &&  goto ss
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "���ü���"  > NUL &&  goto ss

:Cloud
if "%version%" equ "16299" (
set "sku=178"
set "pidkey=V3WVW-N2PV2-CGWC3-34QGF-VMJ2C"
set "License=Retail"
set "skus=Cloud"
goto :eof
) else (
goto end5
)

:CloudN
if "%version%" equ "16299" (
set "sku=179"
set "pidkey=NH9J3-68WK7-6FB93-4K3DF-DJ4F6"
set "License=Retail"
set "skus=CloudN"
goto :eof
 ) else (
goto end5
 )

:Core
set "sku=101"
set "pidkey=YTMG3-N6DKC-DKB77-7M9GH-8HVX7"
set "License=Retail"
set "skus=Core"
goto :eof

:CoreN
set "sku=98"
set "pidkey=4CPRK-NM3K3-X6XXQ-RXX86-WXCHW"
set "License=Retail"
set "skus=CoreN"
goto :eof

:CoreCountrySpecific
set "sku=99"
set "pidkey=N2434-X9D7W-8PF6X-8DV9T-8TYMD"
set "License=Retail"
set "skus=CoreCountrySpecific"
goto :eof

:CoreSingleLanguage
set "sku=100"
set "pidkey=BT79Q-G7N6G-PGBYW-4YWX6-6F4BT"
set "License=Retail"
set "skus=CoreSingleLanguage"
goto :eof

:Professional
set "sku=48"
set "pidkey=VK7JG-NPHTM-C97JM-9MPGT-3V66T"
set "License=Retail"
set "skus=Professional"
goto :eof

:ProfessionalN
set "sku=49"
set "pidkey=2B87N-8KFHP-DKV6R-Y2C8J-PKCKT"
set "License=Retail"
set "skus=ProfessionalN"
goto :eof

:ProfessionalEducation
set "sku=164"
set "pidkey=8PTT6-RNW4C-6V7J2-C2D3X-MHBPB"
set "License=Retail"
set "skus=ProfessionalEducation"
goto :eof

:ProfessionalEducationN
set "sku=165"
set "pidkey=GJTYN-HDMQY-FRR76-HVGC7-QPF8P"
set "License=Retail"
set "skus=ProfessionalEducationN"
goto :eof

:ProfessionalWorkstation
set "sku=161"
set "pidkey=DXG7C-N36C4-C4HTG-X4T3X-2YV77"
set "License=Retail"
set "skus=ProfessionalWorkstation"
goto :eof

:ProfessionalWorkstationN
set "sku=162"
set "pidkey=WYPNQ-8C467-V2W6J-TX4WX-WT2RQ"
set "License=Retail"
set "skus=ProfessionalWorkstationN"
goto :eof

:Education
set "sku=121"
set "pidkey=YNMGQ-8RYV3-4PGQ3-C8XTP-7CFBY"
set "License=Retail"
set "skus=Education"
goto :eof

:EducationN
set "sku=122"
set "pidkey=84NGF-MHBT6-FXBX8-QWJK7-DRR8H"
set "License=Retail"
set "skus=EducationN"
goto :eof

:Enterprise
set "sku=4"
set "pidkey=XGVPP-NMH47-7TTHJ-W3FW7-8HV2C"
set "License=OEM:NONSLP"
set "skus=Enterprise"
goto :eof

:EnterpriseN
set "sku=27"
set "pidkey=YHMNQ-PPQW2-P8PGP-32643-C372T"
set "License=Volume:MAK"
set "skus=EnterpriseN"
goto :eof

:EnterpriseS
if "%version%" equ "17763" (
set "sku=125"
set "pidkey=M7XTQ-FN8P6-TTKYV-9D4CC-J462D"
set "License=Volume:GVLK"
set "skus=EnterpriseS"
goto :eof
 )
if "%version%" geq "14393" (
if "%version%" leq "17134" (
set "sku=125"
set "pidkey=NK96Y-D9CD8-W44CQ-R8YTK-DYJWX"
set "License=Retail"
set "skus=EnterpriseS"
goto :eof
 ) else (
goto end5
)
)

:EnterpriseSN
if "%version%" equ "17763" (
set "sku=126"
set "pidkey=92NFX-8DJQP-P6BBQ-THF9C-7CG2H"
set "License=Volume:GVLK"
set "skus=EnterpriseSN"
goto :eof
)
if "%version%" geq "14393" (
if "%version%" leq "17134" (
set "sku=126"
set "pidkey=C73T8-FNJRG-FTQWK-2JP2R-VMJWR"
set "License=Retail"
set "skus=EnterpriseSN"
goto :eof
) else (
goto end5
)
)

:IoTEnterprise
if "%version%" geq "18362" (
set "sku=188"
set "pidkey=XQQYW-NFFMW-XJPBH-K8732-CKFFD"
set "License=OEM:NONSLP"
set "skus=IoTEnterprise"
goto :eof
) else (
goto end5
)
:ServerRdsh
if "%version%" geq "17134" (
set "sku=175"
set "pidkey=NJCF7-PW8QT-3324D-688JX-2YV66"
set "License=Retail"
set "skus=ServerRdsh"
goto :eof
) else (
goto end5
 )

:ServerDatacenter
if "%version%" equ "17763" (
set "sku=8"
set "pidkey=WMDGN-G9PQG-XVVXX-R3X43-63DFG"
set "License=Volume:GVLK"
set "skus=ServerDatacenter"
goto :eof
) else if "%version%" equ "14393" (
set "sku=8"
set "pidkey=CB7KF-BWN84-R7R2Y-793K2-8XDDG"
set "License=Volume:GVLK"
set "skus=ServerDatacenter"
goto :eof
 )
goto end5

:ServerStandard
if "%version%" equ "17763" (
set "sku=7"
set "pidkey=N69G4-B89J2-4G8F4-WWYCC-J464C"
set "License=Volume:GVLK"
set "skus=ServerStandard"
goto :eof
) else if "%version%" equ "14393" (
set "sku=7"
set "pidkey=WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY"
set "License=Volume:GVLK"
set "skus=ServerStandard"
goto :eof
 )
goto end5

pause >nul
goto job2
:yj
cd /d %~dp0 &curl.exe "http://update.1314.cool/update/act/counter/counter.php?system=Windows10YJ&status=success" >nul
cls
echo.
echo.
echo.
echo.  ��ǰϵͳ�Ѿ��ɹ����ü���
echo. 
echo. 
echo. 
echo.
echo.1.�˳�����
echo.2.����
echo.3.��������������Ʒ
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 exit
if %errorlevel%==2 goto juanzeng
if %errorlevel%==3 goto rukou

:job3
cls
title Windowsȫ�汾�����-Windows8 / 8.1  
echo.
echo.     ��ǰϵͳΪ%sysinfo% 
echo.
echo.   ѡ�����ϵͳ�汾
echo. 1.Windows 8 רҵ��
echo. 2.Windows 8 ��ҵ��
echo. 3.Windows 8 רҵ�� N
echo. 4.Windows 8 ��ҵ�� N 
echo. 5.Windows 8.1 רҵ��
echo. 6.Windows 8.1 ��ҵ��
echo. 7.Windows 8.1 רҵ�� N
echo. 8.Windows 8.1 ��ҵ�� N 
echo. 9.�������˵�
choice /c 123456789 /n /m "��ѡ��: "
if %errorlevel%==1 goto :8pro
if %errorlevel%==2 goto :8ent
if %errorlevel%==3 goto :8pro1
if %errorlevel%==4 goto :8ent1
if %errorlevel%==5 goto :8.1pro
if %errorlevel%==6 goto :8.1ent
if %errorlevel%==7 goto :8.1pro1
if %errorlevel%==8 goto :8.1ent1
if %errorlevel%==9 goto rukou
goto job3
:8pro
cls
set key=NG4HW-VH26C-733KW-K6F98-J8CK4
goto :8.1activate
:8ent
cls
set key=32JNW-9KQ84-P47T8-D8GGY-CWCK7
goto :8.1activate
:8pro1
cls
set key=XCVCF-2NXM9-723PB-MHCB7-2RYQQ
goto :8.1activate
:8ent1
cls
set key=JMNMF-RHW7P-DMY6X-RF3DR-X2BQT
goto :8.1activate
:8.1pro
cls
set key=GCRJD-8NW9H-F2CDX-CCM8D-9D6T9
goto :8.1activate
:8.1ent
cls
set key=MHF9N-XY6XB-WVXMC-BTDCT-MKKG7
goto :8.1activate
:8.1pro1
cls
set key=HMCNV-VVBFX-7HMBH-CTY9B-B4FXY
goto :8.1activate
:8.1ent1
cls
set key=TT4HM-HN7YT-62K67-RGRQJ-JFFXW
goto :8.1activate
:8.1activate
goto autosetkms
:job4
cls
title Windowsȫ�汾�����-Windows7  
echo.
echo.  ��ǰϵͳΪ%sysinfo%
echo.
echo.   ѡ�����ϵͳ�汾
echo. 1.Windows 7 רҵ��
echo. 2.Windows 7 ��ҵ��
echo. 3.Windows 7 רҵ�� N
echo. 4.Windows 7 ��ҵ�� N
echo. 5.Windows 7 ��ҵ��E 
echo. 6.Windows 7 �콢��
echo. 7.Windows 7 ��ͥ��ͨ��
echo. 8.Windows 7 ��ͥ�߼���
echo. 9.�������˵�
choice /c 123456789  /n /m "��ѡ��: "
if %errorlevel%==1 goto :7pro
if %errorlevel%==2 goto :7ent
if %errorlevel%==3 goto :7pro1
if %errorlevel%==4 goto :7ent1
if %errorlevel%==5 goto :7ent2
if %errorlevel%==6 goto :7qjb
if %errorlevel%==7 goto :win7hb
if %errorlevel%==8 goto :win7hp
if %errorlevel%==9 goto rukou
goto job4
:7pro
cls
set key=FJ82H-XT6CR-J8D7P-XQJJ2-GPDD4
goto :7activate
:7ent
cls
set key=33PXH-7Y6KF-2VJC9-XBBR8-HVTHH
goto :7activate
:7pro1
cls
set key=MRPKT-YTG23-K7D7T-X2JMM-QY7MG
goto :7activate
:7ent1
cls
set key=YDRBP-3D83W-TY26F-D46B2-XCKRJ
goto :7activate
:7ent2
cls
set key=C29WB-22CC8-VJ326-GHFJW-H9DH4
goto :7activate
:7qjb
cls
call :dbaocheck 2.0
title Windowsȫ�汾�����-Windows7 �콢��
echo.
echo.  
echo.
echo.   ��ѡ�񼤻ʽ���Ƽ��ȳ��Է���1��������ɹ���ʹ�÷���2��
echo. 1.��key����
echo. 2.��װslicģ����򼤻�
echo. 3.�������˵�
choice /c 123  /n /m "��ѡ��: "
if %errorlevel%==1 goto :7key
if %errorlevel%==2 goto :win7u
if %errorlevel%==3 goto rukou
:7key
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  RHTBY-VWY6D-QJRJ9-JGQ3X-Q2289 
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "����"  > NUL &&  goto ss
:7activate
goto autosetkms
:job5
cls
title Windowsȫ�汾�����-Windows Server 2012 
echo.
echo.     ��ǰϵͳΪ%sysinfo%
echo.
echo.   ѡ�����ϵͳ�汾
echo. 1.Windows Server 2012 
echo. 2.Windows Server 2012 N  
echo. 3.Windows Server 2012 �����԰�
echo. 4.Windows Server 2012 �ض�����/����
echo. 5.Windows Server 2012 Server ��׼��
echo. 6.Windows Server 2012 MultiPoint Standard
echo. 7.Windows Server 2012 MultiPoint �߼���
echo. 8.Windows Server 2012 �������İ�
echo. 9.�������˵�
choice /c 123456789 /n /m "��ѡ��: "
if %errorlevel%==1 goto :S1211
if %errorlevel%==2 goto :S1212
if %errorlevel%==3 goto :S1213
if %errorlevel%==4 goto :S1214
if %errorlevel%==5 goto :S1215
if %errorlevel%==6 goto :S1216
if %errorlevel%==7 goto :S1217
if %errorlevel%==8 goto :S1218
if %errorlevel%==9 goto rukou
goto job5
:S1211
cls
set key=BN3D2-R7TKB-3YPBD-8DRP2-27GG4
goto :S112activate
:S1212
cls
set key=8N2M2-HWPGY-7PGT9-HGDD8-GVGGY
goto :S112activate
:S1213
cls
set key=2WN2H-YGCQR-KFX6K-CD6TF-84YXQ
goto :S112activate
:S1214
cls
set key=4K36P-JN4VD-GDC6V-KDT89-DYFKP
goto :S112activate
:S1215
cls
set key=XC9B7-NBPP2-83J2H-RHMBY-92BT4
goto :S112activate
:S1216
cls
set key=HM7DN-YVMH3-46JC3-XYTG7-CYQJJ
goto :S112activate
:S1217
cls
set key=XNH6W-2V9GX-RGJ4K-Y8X6F-QGJ2G
goto :S112activate
:S1218
cls
set key=48HP8-DN98B-MYWDG-T2DCC-8W83P
goto :S112activate
:S112activate
goto autosetkms
:job6
cls
title Windowsȫ�汾�����-Windows Server 2012 R2 
echo.
echo.  ��ǰϵͳΪ%sysinfo%
echo.
echo.   ѡ�����ϵͳ�汾
echo. 1.Windows Server 2012 R2 Server Standard 
echo. 2.Windows Server 2012 R2 Datacenter   
echo. 3.Windows Server 2012 R2 Essentials 
echo. 4.�������˵�
echo. 
choice /c 1234 /n /m "��ѡ��: "
if %errorlevel%==1 goto :S1221
if %errorlevel%==2 goto :S1222
if %errorlevel%==3 goto :S1223
if %errorlevel%==4 goto rukou
goto job
:S1221
cls
set key=D2N9P-3P6X9-2R39C-7RTCD-MDVJX
goto :S12activate
:S1222
cls 
set key=W3GGN-FT8W3-Y4M27-J84CP-Q3VJ9
goto :S12activate
:S1223
cls     
set key=KNC87-3J2TX-XB4WP-VCPJV-M4FWM
goto :S12activate
:S12activate
goto autosetkms
:job7
cls
title Windowsȫ�汾�����-Windows Server 2008 
echo.
echo.  ��ǰϵͳΪ%sysinfo%
echo.
echo.   ѡ�����ϵͳ�汾
echo. 1.Windows Web Server 2008 
echo. 2.Windows Server 2008 ��׼��   
echo. 3.���� Hyper-V �� Windows Server 2008 ��׼��
echo. 4.Windows Server 2008 ��ҵ�� 
echo. 5.���� Hyper-V �� Windows Server 2008 ��ҵ��
echo. 6.Windows Server 2008 HPC 
echo. 7.Windows Server 2008 Datacenter
echo. 8.���� Hyper-V �� Windows Server 2008 �������İ�
echo. 9.������� Itanium ϵͳ�� Windows Server 2008
echo. 0.�������˵�
echo.
set /p server=��ѡ��:
IF %server% ==0 goto rukou
IF %server% ==1 goto :S0811
IF %server% ==2 goto :S0821
IF %server% ==3 goto :S0831
IF %server% ==4 goto :S0841
IF %server% ==5 goto :S0851
IF %server% ==6 goto :S0861
IF %server% ==7 goto :S0871
IF %server% ==8 goto :S0881
IF %server% ==9 goto :S0891
goto job7
:S0811
cls
set key=WYR28-R7TFJ-3X2YQ-YCY4H-M249D
goto :081activate
:S0821
cls 
set key=TM24T-X9RMF-VWXK6-X8JC9-BFGM2
goto :081activate
:S0831
cls
set key=W7VD6-7JFBR-RX26B-YKQ3Y-6FFFJ
goto :081activate
:S0841
cls
set key=YQGMW-MPWTJ-34KDK-48M3W-X4Q6V
goto :081activate
:S0851
cls
set key=39BXF-X8Q23-P2WWT-38T2F-G3FPG
goto :081activate
:S0861
cls
set key=RCTX3-KWVHP-BR6TB-RB6DM-6X7HP
goto :081activate
:S0871
cls
set key=7M67G-PC374-GR742-YH8V4-TCBY3
goto :081activate
:S0881
cls
set key=22XQ2-VRXRG-P8D42-K34TD-G3QQC
goto :081activate
:S0891
cls
set key=4DWFP-JF3DJ-B7DTH-78FJB-PDRHK
goto :081activate
:081activate
goto autosetkms
:job8
cls
title Windowsȫ�汾�����-Windows Server 2008 R2 
echo.
echo.     ��ǰϵͳΪ%sysinfo%
echo.
echo.   ѡ�����ϵͳ�汾
echo. 1.Windows Server 2008 R2 Standard 
echo. 2.Windows Server 2008 R2 Datacenter   
echo. 3.Windows Server 2008 R2 Enterprise
echo. 4.Windows Server 2008 R2 HPC Edition 
echo. 5.Windows Web Server 2008 R2
echo. 6.Windows Server 2008 R2 for Itanium-Based Systems 
echo. 7.�������˵�
choice /c 1234567  /n /m "��ѡ��: "
if %errorlevel%==1 goto :S0812
if %errorlevel%==2 goto :S0822
if %errorlevel%==3 goto :S0832
if %errorlevel%==4 goto :S0842
if %errorlevel%==5 goto :S0852
if %errorlevel%==6 goto :S0862
if %errorlevel%==7 goto rukou
goto job8
:S0812
cls
set key=YC6KT-GKW9T-YTKYR-T4X34-R7VHC
goto :082activate
:S0822
cls
set key=74YFP-3QFB3-KQT8W-PMXWJ-7M648
goto :082activate
:S0832
cls
set key=489J6-VHDMP-X63PK-3K798-CPX3Y
goto :082activate
:S0842
cls
set key=FKJQ8-TMCVP-FRMR7-4WR42-3JCD7
goto :082activate
:S0852
cls
set key=6TPJF-RBVHG-WBW2R-86QPH-6RTM4
goto :082activate
:S0862
cls
set key=GT63C-RJFQ3-4GMB6-BRFB9-CB83V
goto :082activate
:082activate
goto autosetkms
:ser2016
cls
title Windowsȫ�汾�����-Windows Server 2016
echo.
echo.  ��ǰϵͳΪ%sysinfo%
echo.
echo.   ѡ�����ϵͳ�汾
echo. 1.Windows Server 2016 Datacenter
echo. 2.Windows Server 2016 Standard   
echo. 3.Windows Server 2016 Essentials
echo. 4.�������˵�
echo.
choice /c 1234 /n /m "��ѡ��: "
if %errorlevel%==1 goto :S1611
if %errorlevel%==2 goto :S1621
if %errorlevel%==3 goto :S1631
if %errorlevel%==4 goto rukou
goto :ser2016
:S1611
cls
set key=CB7KF-BWN84-R7R2Y-793K2-8XDDG
goto :161activate
:S1621
cls
set key=WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY
goto :161activate
:S1631
cls
set key=JCKRF-N37P4-C2D82-9YXRT-4M63B
goto :161activate
:161activate
goto autosetkms



:ser2019
cls
title Windowsȫ�汾�����-Windows Server 2019
echo.
echo.  ��ǰϵͳΪ%sysinfo%
echo.
echo.   ѡ�����ϵͳ�汾
echo. 1.Windows Server 2019 Datacenter
echo. 2.Windows Server 2019 Standard   
echo. 3.Windows Server 2019 Essentials
echo. 4.�������˵�
echo.
choice /c 1234 /n /m "��ѡ��: "
if %errorlevel%==1 goto :S1911
if %errorlevel%==2 goto :S1921
if %errorlevel%==3 goto :S1931
if %errorlevel%==4 goto rukou
goto :ser2019
:S1911
cls
set key=WMDGN-G9PQG-XVVXX-R3X43-63DFG
goto :191activate
:S1921
cls
set key=N69G4-B89J2-4G8F4-WWYCC-J464C
goto :191activate
:S1931
cls
set key=WVDHN-86M7X-466P6-VHXV7-YY726
goto :191activate
:191activate
goto autosetkms
:ser1909
cls
title Windowsȫ�汾�����-Windows Server, version 1909, version 1903, and version 1809
echo.
echo.  ��ǰϵͳΪ%sysinfo%
echo.
echo.   ѡ�����ϵͳ�汾
echo. 1.Windows Server Datacenter
echo. 2.Windows Server Standard 
echo. 3.�������˵�
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto :S190901
if %errorlevel%==2 goto :S190902
if %errorlevel%==3 goto rukou
goto :ser1909
:S190901
cls
set key=6NMRW-2C8FM-D24W7-TQWMY-CWH2D
goto :1901activate
:S190902
cls
set key=N2KJX-J94YW-TQVFB-DG9YT-724CC
goto :1901activate
:1901activate
goto autosetkms
:56781
cls
echo.                             
echo.
echo.                          ��ǰϵͳ�����ü����������ᵼ���������ü����Ϊ180��
echo.                          ȷ��Ҫ������
echo.
echo.                        1.����ʹ��kms��180�죩����
echo.                        2.�������м���״̬���������˵�
echo.
echo.
echo.
choice /c 12 /n /m "��ѡ��: "
if %errorlevel%==1 goto :pass
if %errorlevel%==2 goto rukou
:ss
cls
if %yongjiubool% == 1 goto kmsover

cd /d %~dp0 &curl.exe "http://update.1314.cool/update/act/counter/counter.php?system=%sysinfo%_%yongjiu%&status=success" >nul
cls
echo.
echo.
echo.
echo.
echo ϵͳ����ɹ�
echo.
echo.  ���ã��������Ѿ�������4�꣬���ش����Ѿ���6.2���ˣ��Һܸ��ˡ�
echo.  ������Ȼϣ�����ܽ������ɰ�æ��һ�£���Ȼ������Ҳ���ܾ��������������ø�����˿�������������Ҳ���Ҽ���ά����ȥ�Ķ�����лл��ҡ�
echo.
echo. 
echo. ���ڱ�����һ������ѧ��������2022��μӸ߿������Իظ����ܽ����������½�
echo. 
echo.
echo.  �������Ը����������������ѡ�� 4 �˳�����
echo.  �Զ����ڷ����������˵���װ
echo.1.�������ɶ�һ�£�^ v ^��
echo.2.��������������Ʒ
echo.3.����
echo.4.�˳�����
choice /c 1234 /n /m "��ѡ��: "
if %errorlevel%==1 start https://tieba.baidu.com/p/5301591808
if %errorlevel%==2 goto rukou
if %errorlevel%==3 goto juanzeng
if %errorlevel%==4 exit
goto rukou

:win7u
md "files"
copy bootrest.exe files
copy Certificate.xrm-ms files
copy showdrive.exe files
copy w7ldr files
copy bootinst.exe files
@echo off
echo.
files\showdrive.exe

if not exist %windir%\system32\slmgr.vbs goto nont6
if not exist files\bootinst.exe goto nofile
if not exist files\bootrest.exe goto nofile
if not exist files\w7ldr goto nofile
if not exist files\Certificate.xrm-ms goto nofile

cscript %windir%\system32\slmgr.vbs -ilc files\Certificate.xrm-ms >nul
if %errorlevel% neq 0 goto commandprompt

for /f "skip=2 tokens=2*" %%i in ('REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName') do set sysinfo=%%j

if exist sysname.* attrib -r -h -s sysname.*>nul &del sysname.*>nul

set /a nt6num = 0
if exist A:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1
if exist B:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist C:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1
if exist D:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist E:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist F:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist G:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist H:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist I:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist J:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist K:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist L:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist M:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist N:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist O:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist P:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist Q:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist R:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist S:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist T:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist U:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist V:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist W:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist X:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist Y:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist Z:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 

:lpSTART
cls
echo.

goto findinfo

:findinfo
echo.
echo ���ڼ���,���Ժ�
echo.
echo 
cls
echo 
)

REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName>sysname

type sysname | find "7" | find /i "Ultimate" >nul

if %errorlevel% equ 0 set cdkey=342DG-6YJR8-X92GV-V7DCV-P4K27 &goto install

type sysname | find "7" | find /i "Professional" >nul

goto ukos

:install
cls

set /a actpartition=0
for %%A in (A: B: C: D: E: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: U: V: W: X: Y: Z:) do (

	if exist %%A\bootmgr (

		if not exist %%A\sources\install.wim (

			set /a actpartition = 1
		)
	)
)

if %actpartition% == 0 goto noactivepartition

set VLFILE=%1
if {%1} == {} set VLFILE=Certificate
if not exist files\%VLFILE%.xrm-ms goto nofile
for %%A in (A: B: C: D: E: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: U: V: W: X: Y: Z:) do (
	if exist %%A\bootmgr (
		if not exist %%A\setup.exe (
			echo.
			echo ���ڰ�װslicģ����� %%A �̣����Ժ�...
			echo.
			if exist %%A\w7ldr attrib %%A\w7ldr -h -r -s >nul
			)
			copy files\w7ldr %%A\w7ldr >nul
			attrib %%A\w7ldr +h +s +r >nul
			if %errorlevel% neq 0 msg.vbs /errora
			files\bootinst /nt60 %%A >nul
			if %errorlevel% neq 0 msg.vbs /errorb
		)
	)
)
if exist files\%VLFILE%.xrm-ms cscript %windir%\system32\slmgr.vbs -ilc files\%VLFILE%.xrm-ms >nul
if %errorlevel% neq 0 msg.vbs /errorc

if exist files\%VLFILE%.xrm-ms cscript %windir%\system32\slmgr.vbs -ipk %cdkey% >nul
if %errorlevel% neq 0 msg.vbs /errord
goto end

:uninstall
cls
echo ����ж��slic����!
echo.
echo ж�غ�����ϵͳ���ָ�Ϊδ����״̬,�����������ж��...
pause >nul
if not exist %windir%\system32\slmgr.vbs goto nont6
for %%A in (A: B: C: D: E: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: U: V: W: X: Y: Z:) do (
	if exist %%A\w7ldr (
		echo.
		echo ����ж���� %%A �̵�����
		echo.
		attrib %%A\w7ldr -h -s -r
		del %%A\w7ldr
		files\bootrest /nt60 %%A
	)
)
goto uninsend

:nofile
cls
echo ȱ�ٱ�Ҫ�ļ����޷�������
pause >nul
goto Error

:noactivepartition
cls
start diskmgmt.msc
echo �����ⲻ�����������Ϊ���ط�������̷���������ٶ�
pause
goto rukou


:Error
set VLFILE=
cls
echo �������������һЩ���⣬�����������������
pause >nul
goto rukou

:end
set VLFILE=
cls
echo ����ɹ����,�������Ҫ��������,�����������
echo �����������,��رձ�����
pause >nul
shutdown -r -t 0
exit
:uninsend
cls
echo ж�����,�������������ļ����! ����������ز˵�...
pause >nul
SET CHS==""
goto lpSTART
exit
:ukos
echo.  ��ǰϵͳ�����콢��ϵͳ����
pause
goto :rukou

:win7hb
md "files"
copy bootrest.exe files
copy Certificate.xrm-ms files
copy showdrive.exe files
copy w7ldr files
copy bootinst.exe files
@echo off
echo.
files\showdrive.exe

if not exist %windir%\system32\slmgr.vbs goto nont6
if not exist files\bootinst.exe goto nofile
if not exist files\bootrest.exe goto nofile
if not exist files\w7ldr goto nofile
if not exist files\Certificate.xrm-ms goto nofile

cscript %windir%\system32\slmgr.vbs -ilc files\Certificate.xrm-ms >nul
if %errorlevel% neq 0 goto commandprompt

for /f "skip=2 tokens=2*" %%i in ('REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName') do set sysinfo=%%j

if exist sysname.* attrib -r -h -s sysname.*>nul &del sysname.*>nul

set /a nt6num = 0
if exist A:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1
if exist B:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist C:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1
if exist D:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist E:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist F:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist G:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist H:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist I:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist J:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist K:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist L:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist M:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist N:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist O:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist P:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist Q:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist R:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist S:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist T:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist U:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist V:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist W:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist X:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist Y:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist Z:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 

:lpSTART
cls
echo.

goto findinfo

:findinfo
echo.
echo ���ڼ���,���Ժ�
echo.
echo 
cls
echo 
)

REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName>sysname

set cdkey=36T88-RT7C6-R38TQ-RV8M9-WWTCY &goto install


goto ukos

:install
cls

set /a actpartition=0
for %%A in (A: B: C: D: E: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: U: V: W: X: Y: Z:) do (

	if exist %%A\bootmgr (

		if not exist %%A\sources\install.wim (

			set /a actpartition = 1
		)
	)
)

if %actpartition% == 0 goto noactivepartition

set VLFILE=%1
if {%1} == {} set VLFILE=Certificate
if not exist files\%VLFILE%.xrm-ms goto nofile
for %%A in (A: B: C: D: E: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: U: V: W: X: Y: Z:) do (
	if exist %%A\bootmgr (
		if not exist %%A\setup.exe (
			echo.
			echo ���ڰ�װslicģ����� %%A �̣����Ժ�...
			echo.
			if exist %%A\w7ldr attrib %%A\w7ldr -h -r -s >nul
			)
			copy files\w7ldr %%A\w7ldr >nul
			attrib %%A\w7ldr +h +s +r >nul
			if %errorlevel% neq 0 msg.vbs /errora
			files\bootinst /nt60 %%A >nul
			if %errorlevel% neq 0 msg.vbs /errorb
		)
	)
)
if exist files\%VLFILE%.xrm-ms cscript %windir%\system32\slmgr.vbs -ilc files\%VLFILE%.xrm-ms >nul
if %errorlevel% neq 0 msg.vbs /errorc

if exist files\%VLFILE%.xrm-ms cscript %windir%\system32\slmgr.vbs -ipk %cdkey% >nul
if %errorlevel% neq 0 msg.vbs /errord
goto end

:uninstall
cls
echo ����ж��slic����!
echo.
echo ж�غ�����ϵͳ���ָ�Ϊδ����״̬,�����������ж��...
pause >nul
if not exist %windir%\system32\slmgr.vbs goto nont6
for %%A in (A: B: C: D: E: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: U: V: W: X: Y: Z:) do (
	if exist %%A\w7ldr (
		echo.
		echo ����ж���� %%A �̵�����
		echo.
		attrib %%A\w7ldr -h -s -r
		del %%A\w7ldr
		files\bootrest /nt60 %%A
	)
)
goto uninsend

:nofile
cls
echo ȱ�ٱ�Ҫ�ļ����޷�������
pause >nul
goto Error

:noactivepartition
cls
start diskmgmt.msc
echo �����ⲻ�����������Ϊ���ط�������̷���������ٶ�
pause
goto rukou


:Error
set VLFILE=
cls
echo �������������һЩ���⣬�����������������
pause >nul
goto rukou

:end
set VLFILE=
cls
echo ����ɹ����,�������Ҫ��������,�����������
echo �����������,��رձ�����
pause >nul
shutdown -r -t 0
exit
:uninsend
cls
echo ж�����,�������������ļ����! ����������ز˵�...
pause >nul
SET CHS==""
goto lpSTART
exit
:ukos
echo.  ��ǰϵͳ���Ǽ�ͥ��ͨ��ϵͳ����
pause
goto :rukou

:win7hp
md "files"
copy bootrest.exe files
copy Certificate.xrm-ms files
copy showdrive.exe files
copy w7ldr files
copy bootinst.exe files
@echo off
echo.
files\showdrive.exe

if not exist %windir%\system32\slmgr.vbs goto nont6
if not exist files\bootinst.exe goto nofile
if not exist files\bootrest.exe goto nofile
if not exist files\w7ldr goto nofile
if not exist files\Certificate.xrm-ms goto nofile

cscript %windir%\system32\slmgr.vbs -ilc files\Certificate.xrm-ms >nul
if %errorlevel% neq 0 goto commandprompt

for /f "skip=2 tokens=2*" %%i in ('REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName') do set sysinfo=%%j

if exist sysname.* attrib -r -h -s sysname.*>nul &del sysname.*>nul

set /a nt6num = 0
if exist A:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1
if exist B:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist C:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1
if exist D:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist E:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist F:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist G:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist H:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist I:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist J:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist K:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist L:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist M:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist N:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist O:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist P:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist Q:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist R:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist S:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist T:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist U:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist V:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist W:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist X:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist Y:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist Z:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 

:lpSTART
cls
echo.

goto findinfo

SET CHS==""
cls
goto lpSTART

:findinfo
echo.
echo ���ڼ���,���Ժ�
echo.
echo 
cls
echo 
)

REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName>sysname

set cdkey=6RBBT-F8VPQ-QCPVQ-KHRB8-RMV82 &goto install


goto ukos

:install
cls

set /a actpartition=0
for %%A in (A: B: C: D: E: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: U: V: W: X: Y: Z:) do (

	if exist %%A\bootmgr (

		if not exist %%A\sources\install.wim (

			set /a actpartition = 1
		)
	)
)

if %actpartition% == 0 goto noactivepartition

set VLFILE=%1
if {%1} == {} set VLFILE=Certificate
if not exist files\%VLFILE%.xrm-ms goto nofile
for %%A in (A: B: C: D: E: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: U: V: W: X: Y: Z:) do (
	if exist %%A\bootmgr (
		if not exist %%A\setup.exe (
			echo.
			echo ���ڰ�װslicģ����� %%A �̣����Ժ�...
			echo.
			if exist %%A\w7ldr attrib %%A\w7ldr -h -r -s >nul
			)
			copy files\w7ldr %%A\w7ldr >nul
			attrib %%A\w7ldr +h +s +r >nul
			if %errorlevel% neq 0 msg.vbs /errora
			files\bootinst /nt60 %%A >nul
			if %errorlevel% neq 0 msg.vbs /errorb
		)
	)
)
if exist files\%VLFILE%.xrm-ms cscript %windir%\system32\slmgr.vbs -ilc files\%VLFILE%.xrm-ms >nul
if %errorlevel% neq 0 msg.vbs /errorc

if exist files\%VLFILE%.xrm-ms cscript %windir%\system32\slmgr.vbs -ipk %cdkey% >nul
if %errorlevel% neq 0 msg.vbs /errord
goto end

:uninstall
cls
echo ����ж��slic����!
echo.
echo ж�غ�����ϵͳ���ָ�Ϊδ����״̬,�����������ж��...
pause >nul
if not exist %windir%\system32\slmgr.vbs goto nont6
for %%A in (A: B: C: D: E: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: U: V: W: X: Y: Z:) do (
	if exist %%A\w7ldr (
		echo.
		echo ����ж���� %%A �̵�����
		echo.
		attrib %%A\w7ldr -h -s -r
		del %%A\w7ldr
		files\bootrest /nt60 %%A
	)
)
goto uninsend

:nofile
cls
echo ȱ�ٱ�Ҫ�ļ����޷�������
pause >nul
goto Error

:noactivepartition
cls
start diskmgmt.msc
echo �����ⲻ�����������Ϊ���ط�������̷���������ٶ�
pause
goto rukou


:Error
set VLFILE=
cls
echo �������������һЩ���⣬�����������������
pause >nul
goto rukou

:end
set VLFILE=
cls
echo ����ɹ����,�������Ҫ��������,�����������
echo �����������,��رձ�����
pause >nul
shutdown -r -t 0
exit
:uninsend
cls
echo ж�����,�������������ļ����! ����������ز˵�...
pause >nul
SET CHS==""
goto lpSTART
exit
:ukos
echo.  ��ǰϵͳ���Ǽ�ͥ�߼���ϵͳ����
pause
goto :rukou


:setupo
cls
title Windowsȫ�汾�����-office��װ 
echo.
echo.
echo.   ��ӭʹ��office���ٰ�װ����
echo.
echo. ��ʹ�ñ�����ǰ��ϣ������ϸ�Ķ������ע������
echo.
echo.    ��office��װ�������ǰ����Ҫ�˳������򣬷���ᵼ�°�װ�򼤻�ʧ��
echo.    ���office��װ�����г��ִ�����رձ����ڲ����°�װ
echo.    ����ɹ���װoffice�����Ǽ���ʧ�ܣ������qqȺ�����ɷ�����qqȺ�ţ�853241207����@Ⱥ�������ŷ����ڣ�2578105221��
echo.
echo.   ��ѡ��1.������װ
echo.           2.�������˵�
echo.
echo.
choice /c 1234 /n /m "��ѡ��: "
if %errorlevel%==1 goto xuanze
if %errorlevel%==2 goto loop
:xuanze
title Windowsȫ�汾�����-office��װ 
cls
echo.
echo.
echo.   1.office2019 32λ  
echo.   2.office2019 64λ  
echo.   3.office2016 32λ  
echo.   4.office2016 64λ
echo.   5.�������˵�
echo.
echo. ע��office2019��֧��Windows10���µ�ϵͳ
echo.
echo.
echo.
choice /c 12345 /n /m "��ѡ��: "
if %errorlevel%==1 cls & echo. & echo. & echo. & echo.���ڰ�װoffice ����رձ����� & title office���ٰ�װ�뼤�����-���ڰ�װoffice & set userset=2019 & setup.exe /configure 2019x86.xml >nul
if %errorlevel%==2 cls & echo. & echo. & echo. & echo.���ڰ�װoffice ����رձ����� & title office���ٰ�װ�뼤�����-���ڰ�װoffice & set userset=2019 & setup.exe /configure 2019x64.xml >nul 
if %errorlevel%==3 cls & echo. & echo. & echo. & echo.���ڰ�װoffice ����رձ����� & title office���ٰ�װ�뼤�����-���ڰ�װoffice & set userset=2016 & setup.exe /configure 2016x86.xml >nul
if %errorlevel%==4 cls & echo. & echo. & echo. & echo.���ڰ�װoffice ����رձ����� & title office���ٰ�װ�뼤�����-���ڰ�װoffice & set userset=2016 & setup.exe /configure 2016x64.xml >nul 
if %errorlevel%==5 goto loop
:act
title Windowsȫ�汾�����-Office��װ
cls
echo.
echo.  ���ã����Ѿ��ɹ���װ��office��Ʒ
echo.   
echo.  1.��������office
echo.  2.�������˵�
echo.  3.����
echo.        �����ѡ�񼤻�����Զ���ת��office���������м���
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto officecheck
if %errorlevel%==2 goto rukou
if %errorlevel%==3 goto juanzeng
:officecheck
if %userset%==2016 goto job16
if %userset%==2019 goto job19 

:set
@title Windowsȫ�汾�����-�Զ���kms������
:kms
color 3f
cls
echo.                             
echo.
echo.                          ��ǰkms������Ϊ%fwq%
echo.
echo.                                 Windowsȫ�汾�����
echo.                              1.ѡ�����е�kms������
echo.                              2.�Զ���kms������
echo.                              3.�������˵�
echo.                              
echo.                              
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto :set
if %errorlevel%==2 goto :set1
if %errorlevel%==3 goto rukou
goto kms
:set
@title Windowsȫ�汾�����-ѡ�����е�kms������
color 3f
cls
echo.                             
echo.                   ʣ��kms���������ʱ�䣺2020/1/28 22��19
echo.                          ��ǰkms������Ϊ%fwq%
echo.
echo.                              1.cloud.1314.cool��Ĭ�ϣ��Ƽ���
echo.                              2.kms.lotro.cc
echo.                              3.kms.03k.org
echo.                              4.kms.chinancce.com
echo.                              5.kms.luody.info
echo.                              6.windows.kms.app
echo.                              7.kms.rbq.kr
echo.                              8.kms.cangshui.net
echo.                              9.�������˵�
echo.                              
echo.                              
choice /c 123456789 /n /m "��ѡ��: "
if %errorlevel%==1 set fwq=cloud.1314.cool
if %errorlevel%==2 set fwq=kms.lotro.cc
if %errorlevel%==3 set fwq=kms.03k.org
if %errorlevel%==4 set fwq=kms.chinancce.com
if %errorlevel%==5 set fwq=kms.luody.info
if %errorlevel%==6 set fwq=windows.kms.app
if %errorlevel%==7 set fwq=kms.rbq.kr
if %errorlevel%==8 set fwq=kms.cangshui.net
if %errorlevel%==9 goto rukou
goto set
:set1
cls
echo.                             
echo.
echo.                          ��ǰkms������Ϊ%fwq%
echo.
echo.          ˵������������kms�������ᵼ�¼���ʧ�ܣ������������
echo.
echo.
echo.
echo.
echo.
echo.
set /p fwq=������kms������
cls
echo.
echo.
echo.
echo ���ڼ����%fwq%�������������
echo.
vlmcs %fwq% -l Windows | find "successful"  > NUL &&  goto rukou
goto fail2
:fail2
cls
echo.                             
echo.
echo.                      ������ļ��������ʧЧ
echo.                         
echo.          
echo.
echo.                        
echo.                �ѻ�ԭĬ�ϼ��������
echo.
echo.
set fwq=cloud.1314.cool
pause >nul
goto rukou
:checkkms
title Windowsȫ�汾�����-���kms������
cls
echo.
echo.
echo.
echo ���ڼ����%fwq%�������������
echo.
vlmcs %fwq% -l Windows | find "successful"  > NUL &&  goto check
:fail
cls
echo.
echo.
echo.
echo.�뼤�����������ʧ�ܣ����������������ӻ�����ѡ��kms���������ԡ�
echo. 1.������ҳ
echo. 2.����ѡ��kms������
echo. 3.�˳�����
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto rukou
if %errorlevel%==2 goto set
if %errorlevel%==3 exit
goto fail
:check
cls
echo.
echo.
echo.
echo. ��%fwq%��������
echo.
echo.
pause >nul
goto rukou
:checkact
cls
echo.                             
echo.
echo.                          ���ڼ��ϵͳ�������
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "��������"  > NUL &&  goto 1234
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "���ü���"  > NUL &&  goto 5678
goto 9011
:1234
cls
echo.                             
echo.
echo.                          ��ǰϵͳ�ѳɹ�ʹ��kms��180�죩����
echo.
echo.          
echo.
echo.
echo.
echo.
echo.
echo.
pause >nul
goto rukou
:5678
cls
echo.                             
echo.
echo.                          ��ǰϵͳ�����ü���
echo.
echo.
echo.
pause>nul
goto rukou

:9011
cls
echo.                             
echo.
echo.                      ��ǰϵͳδ����    
echo.                         
echo.          
echo.
echo.                        
echo.                �����������
echo.
echo.
echo.
pause >nul
goto rukou
:inf
cls
echo.�������飺
cscript //Nologo %windir%\system32\slmgr.vbs /dlv
echo.�������ޣ�
cscript //Nologo %windir%\system32\slmgr.vbs /xpr
pause >nul
goto rukou
:bugreport
title Windowsȫ�汾�����-���ڼ����ⷴ��
cls
echo.   
echo. 
echo.      ��ӭʹ��windowsȫ�汾�����
echo.
echo.���ã��������Ѿ�������4�꣬���ش����Ѿ���6.2���ˣ��Һܸ��ˡ�
echo.������Ȼϣ�����ܽ������ɰ�æ��һ�£���Ȼ������Ҳ���ܾ��������������ø�����˿�������������Ҳ���Ҽ���ά����ȥ�Ķ�����лл��ҡ�
echo.
echo. 
echo. ���ڱ�����һ������ѧ��������2022��μӸ߿������Իظ����ܽ����������½�
echo. 
echo.
echo.ע�⣺��������뱾��������޹أ�������Ը
echo.
echo.  ��л:�������slic���ֵļ����л���Ǵ��У�����
echo.
echo.  ���������ѧϰ����ʹ�ã���ʹ�ñ�������
echo.   1.�������
echo.   2.����ٶ����̸�������
echo.   3.��������
echo.   4.�鿴������־
echo.   5.����
echo.   6.�������˵�
choice /c 123456 /n /m "��ѡ��: "
if %errorlevel%==1 start http://blog.1314.cool/
if %errorlevel%==2 start http://dl.1314.cool
if %errorlevel%==3 start https://tieba.baidu.com/p/5301591808
if %errorlevel%==4 goto rz
if %errorlevel%==5 goto juanzeng
if %errorlevel%==6 goto rukou
pause>nul
goto rukou
:rz
@title Windowsȫ�汾�����-������־
cls
echo.
echo.  
echo.                      v%my%�汾������־��
echo.
echo.  2021��2��10�ո��£�
echo.  
echo.  �Ż���Windows10����Ȩ���������̣�����˼���ɹ���
echo.  
echo.  
echo.  
echo.  
echo.  
echo.  
echo.  
echo.  
echo.  
echo.  
echo.  
pause >nul
goto rukou


:autosetkms
set /a kmscount=%kmscount%+1
if %kmscount%==1 set fwq=%actmainsev%
if %kmscount%==2 set fwq=kms.lotro.cc
if %kmscount%==3 set fwq=kms.03k.org
if %kmscount%==4 set fwq=kms.chinancce.com
if %kmscount%==5 set fwq=kms.luody.info
if %kmscount%==6 set fwq=kms.rbq.kr
if %kmscount%==7 set fwq=kms.cz9.cn
if %kmscount%==8 set fwq=kms.cangshui.net
if %kmscount%==9 goto baoliover && set kmscount=1
cls
echo.
echo.
echo.  ��ǰ���Դ���:%kmscount%
echo.
echo   ��ǰkms��������%fwq%
echo.  
echo.  ���ڼ�����Ժ�
echo.
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk %key%
cscript //Nologo %windir%\system32\slmgr.vbs -skms %fwq% 
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "��������"  > NUL &&  goto ss
goto autosetkms

:baoliover
cls
if %yongjiubool% == 1 goto kmsover
set kmscount=0
set fwq=cloud.1314.cool
echo.
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
cd /d %~dp0 &curl.exe "http://update.1314.cool/update/act/counter/counter.php?system=%sysinfo%_%yongjiu%&status=fail" >nul
cls
echo.  ������룺%sysinfo%%fwq%%errorcode%
echo.
echo.  ���ã�ϵͳ����ʧ��
echo.
echo   ��������������绷�����벻Ҫʹ���ٶȹ��������硣
echo.  
echo.  ���ߣ������Դ�MSDN����ԭ�����ϵͳ��������װһ������ϵͳ��
echo.
echo.  ��л����֧��
echo.
echo. 
echo. ���ڱ�����һ������ѧ��������2022��μӸ߿������Իظ����ܽ����������½�
echo. 
echo.
echo.
echo.  1.�˳�����
echo.  2.��������������ر���������°汾
echo.  3.����ٶ����ɷ���
echo.  4.����MSDN�Ҹ��������
echo.  5.�������˵�
choice /c 12345 /n /m "��ѡ��: "
if %errorlevel%==1 exit
if %errorlevel%==2 start http://dl.1314.cool
if %errorlevel%==3 start https://tieba.baidu.com/p/5301591808
if %errorlevel%==4 start https://msdn.itellyou.cn/
if %errorlevel%==5 goto rukou
pause>nul
goto rukou

:juanzeng
cls
title Windowsȫ�汾�����-����
echo.
echo.  
echo.
echo.  ��л���Ա������֧�֣�лл���ľ���
echo.
echo.  ����������ע�⣺�����뱾����Ĺ�����ȫ�޹أ����ڸ�����Ը��Ϊ�������Ը
echo.  
echo. ��ѡ�������ʽ
echo.  1.֧����
echo.  2.΢��
echo.  3.�������˵�
echo.  
echo.
echo.  
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 wget -q http://%actupdatesev%/update/act/zfb.jpg && start zfb.jpg
if %errorlevel%==2 wget -q http://%actupdatesev%/update/act/wx.png && start wx.png
if %errorlevel%==3 goto rukou
cls
echo.
echo.  
echo.
echo.   лл���ľ���������޷��Զ�������ά�룬���ֶ������������ӣ���
echo.  ֧������http://%actupdatesev%/update/act/zfb.jpg
echo.  ΢�ţ�http://%actupdatesev%/update/act/wx.png
echo. 1.�������˵�
echo. 2.�˳�����
echo.
echo.
echo.
choice /c 12 /n /m "��ѡ��: "
if %errorlevel%==1 goto rukou
if %errorlevel%==2 exit
goto rukou
:zidongxvqi
cls
echo.
echo.  
echo.
echo.   �Զ����ڷ������
echo.
echo. 1.��װ�Զ����ڷ���
echo. 2.ж���Զ����ڷ���
echo. 3.�������˵�
echo.
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto installzidong
if %errorlevel%==2 goto uninstallzidong
if %errorlevel%==3 goto rukou
:installzidong
cls
echo.
echo.
echo. ���ڰ�װ�Զ����ڷ������Ժ�
echo.
echo.
echo.
del 1.bat >nul
wget -q http://%actupdatesev%/update/act/1.bat
copy 1.bat C:\ >nul
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v lin /t REG_SZ /d C:\1.bat /f
cls
echo.
echo.
echo. �Զ����ڷ���װ���
echo.
echo.  ��������������˵�
echo.
pause >nul
goto rukou
:uninstallzidong
cls
echo.
echo.
echo. ����ж���Զ����ڷ������Ժ�
echo.
echo.
echo.
del C:\1.bat
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v lin /f
cls
echo.
echo.
echo. �Զ����ڷ���ж�����
echo.
echo.  ��������������˵�
echo.
pause >nul
goto rukou
:dbaofail
cls
echo.
echo.   
if %dmyver% == 1.0 echo.    Windowsȫ�汾������Ѿ��������װ�2.0�����ϰ汾���Office��Windows7�콢�漤��ʧ�ܵ���������������Ż� && echo.     Ϊ���Ż����飬����������ʹ��v1.0�汾�û���office��Windows7�콢��ļ���ܣ����輤�������v2.0�����ϵİ汾�������½�
echo.
echo.     ��ǰ�װ��汾̫�ͣ�Ҫʹ�ô˹��ܣ���Ҫv%1�����ϵİ汾����ǰ�汾Ϊv%dmyver%
echo.     �뵽http://dl.1314.cool�������µװ��汾
echo.
echo.     1.����������
echo.     2.����������
echo.
choice /c 12 /n /m "��ѡ��: "
if %errorlevel%==1 start http://dl.1314.cool
if %errorlevel%==2 goto rukou
:dbaocheck
if %dmyver% LSS %1 goto :dbaofail
goto :EOF