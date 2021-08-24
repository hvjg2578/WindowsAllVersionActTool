@echo off
set ver=19.5
set yongjiubool=0
set yongjiu=KMS
::是否采用永久激活
set /a kmscount=0
color 3f
@title Windows全版本激活工具-使用前须知
cls
echo.
echo.              您好，欢迎使用本软件
echo.
echo.   软件源代码和微步云沙箱防病毒检测均在百度贴吧公示，任何人都可以下载和查看。如果心存疑虑的话，可以去看一下
echo.
echo.   再次声明，本软件无任何病毒和后门。你使用此软件，即代表你相信我所说的话。软件源代码开源,可自己进行代码审查
echo.
echo.   本软件可能会收集一部分激活是否成功相关的信息，以便于我们改进此软件，请放心，此信息不包含你的任何个人隐私
echo.
echo.   本软件仅限学习研究使用，如需其他用途请去微软官网购买正版产品密钥
echo.
echo.   如果你接受我的说法，并想要继续使用本软件激活，请按任意键继续。
if not exist mydver.bat set dmyver=1.0
if exist mydver.bat call mydver.bat
pause >nul
@title Windows全版本激活工具-检查kms服务器
cls
echo.
echo.
echo.
echo 正在检查与%fwq%的连接情况……
echo.
vlmcs %fwq% -l Windows | find "successful"  > NUL &&  goto rukou
:fail
cls
echo.
echo.
echo.
echo.与激活服务器连接失败，请检查您的网络连接或重新选择kms服务器再试。
echo. 1.进入主页
echo. 2.重新选择kms服务器
echo. 3.退出程序
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto rukou
if %errorlevel%==2 goto set
if %errorlevel%==3 exit
goto fail
title Windows全版本激活工具
:rukou
title Windows全版本激活工具-永久免费，严禁售卖
for /f "skip=2 tokens=2*" %%i in ('REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName') do set sysinfo=%%j
color 3f
if %dmyver% LSS 4.0 wget -q "http://update.1314.cool/update/act/curl.exe"
:loop
cls
echo.     
echo. 
echo.            软件脚本版本：v%my%   最新版本：v%servision%  kms服务器：%fwq%
echo.            软件核心文件库（底包）版本：v%dmyver%  最新版本：v%ladver%
echo. 
echo.                              1.激活Office
echo.                              2.激活Windows(目前现已支持Windows11预览版)
echo.                              3.安装Office
echo.                              4.自定义kms服务器
echo.                              5.检查当前kms服务器
echo.                              6.检查当前系统激活情况
echo.                              7.系统激活信息
echo.                              8.更新日志、关于及问题反馈
echo.                              9.安装/卸载自动续期服务
echo.                              0.捐赠
echo.
echo.
if %dmyver% LSS %ladver% echo.        当前软件底包版本不是最新，大部分功能可以正常使用，但是少部分功能可能受限 && echo.        如需下载最新版本，请到：http://dl.1314.cool
choice /c 1234567890F /n /m "请选择: "

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
echo.                          请选择要操作的命令
echo.                       1.激活系统（slmgr.vbs /ato）
echo.                       2.安装密钥（slmgr.vbs /ipk xxxxx）
echo.                       3.返回主菜单
echo.                       
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 slmgr.vbs /ato 
if %errorlevel%==2 goto my
if %errorlevel%==3 goto loop
goto loop
:my
cls
echo.                             
echo.
echo.        请输入要安装的密钥
set /p key=请输入
slmgr.vbs /ipk %key%
pause
goto loop
:office
call :dbaocheck 2.0
@title Windows全版本激活工具-Office选择菜单
color 3f
cls
echo.                             
echo.
echo.                       
echo.
echo.                                 Windows全版本激活工具
echo.                              1.激活office2019
echo.                              2.激活office2016
:: echo.                              3.激活office2013
:: echo.                              4.激活office2010
echo.                              3.修复“你的许可证有问题，你可能是盗版软件的受害者”
echo.                              4.返回主菜单
echo.       
echo.                              
choice /c 1234 /n /m "请选择: "
if %errorlevel%==1 goto :job19
if %errorlevel%==2 goto :job16
:: if %errorlevel%==3 goto :job13
:: if %errorlevel%==4 goto :job2010
if %errorlevel%==3 goto :xkzywt
if %errorlevel%==4 goto rukou
:job19
@title Windows全版本激活工具- Office2019
set officever=2019
cls
for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop"') do (
set desk=%%j
)
echo 正在安装许可证
if exist "%~dp0"Office16 cd /d "%~dp0"Office16

if not exist "%~dp0"Office16 echo. 软件底包解压失败 && pause
if exist "%ProgramFiles%\Microsoft Office\Office16\OSPP.VBS" cd /d "%ProgramFiles%\Microsoft Office\Office16"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\OSPP.VBS" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16"

::for /f %%x in ('dir /b ..\root\Licenses16\ProPlus2019VL*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x" >>%desk%\log.txt
for /f %%x in ('dir /b ..\root\Licenses16\ProPlus2019VL*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x"  >>%~dp0log.txt
for /f %%x in ('dir /b ..\root\Licenses16\pkeyconfig*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x"  >>%~dp0log.txt
for /f %%x in ('dir /b ..\root\Licenses16\client-issuance*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x"  >>%~dp0log.txt
cls
echo. 正在安装kms产品密钥

cscript //nologo OSPP.VBS /unpkey:6MWKP >>%~dp0log.txt & cscript //nologo OSPP.VBS /inpkey:NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP  >>%~dp0log.txt
cls
echo 正在进行 KMS 激活，请稍后...

cscript //nologo OSPP.VBS /remhst  >>%~dp0log.txt
cscript //nologo OSPP.VBS /setprt:1688  >>%~dp0log.txt
cscript //nologo OSPP.VBS /sethst:kms.lotro.cc  >>%~dp0log.txt
cscript //nologo OSPP.VBS /act >>%~dp0log.txt
cscript //nologo OSPP.VBS /act  | find /i "successful" && (echo.& cd /d %~dp0 &curl.exe "http://update.1314.cool/update/act/counter/counter.php?system=Office2019&status=success" >nul &cls & goto officesucc ) || (echo.& cd /d %~dp0 &curl.exe "http://update.1314.cool/update/act/counter/counter.php?system=Office2019&status=fail" >nul &cls & goto officefail)

::
:: pause >nul
exit
:job16
@title Windows全版本激活工具- office2016 / 365
set officever=2016
setlocal EnableDelayedExpansion&color 3f & cd /d "%~dp0"
title Windows全版本激活工具-Office 2016 / 365

if exist "%~dp0"Office16 cd /d "%~dp0"Office16
if exist "%ProgramFiles%\Microsoft Office\Office16\OSPP.VBS" cd /d "%ProgramFiles%\Microsoft Office\Office16"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\OSPP.VBS" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16"

cls

echo 正在安装 KMS 许可证...
for /f %%x in ('dir /b ..\root\Licenses16\project???vl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x" >>%~dp0log.txt
for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x"  >>%~dp0log.txt
for /f %%x in ('dir /b ..\root\Licenses16\standardvl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x" >>%~dp0log.txt
for /f %%x in ('dir /b ..\root\Licenses16\visio???vl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x"  >>%~dp0log.txt
cls

echo 正在安装 MAK 许可证...
for /f %%x in ('dir /b ..\root\Licenses16\project???vl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x"  >>%~dp0log.txt
for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x"  >>%~dp0log.txt
for /f %%x in ('dir /b ..\root\Licenses16\standardvl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x"  >>%~dp0log.txt
for /f %%x in ('dir /b ..\root\Licenses16\visio???vl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses16\%%x"  >>%~dp0log.txt
cls

echo 正在导入 KMS GVLK...
cscript OSPP.VBS /inpkey:NYH39-6GMXT-T39D4-WVXY2-D69YY  >>%~dp0log.txt
cscript OSPP.VBS /inpkey:7WHWN-4T7MP-G96JF-G33KR-W8GF4  >>%~dp0log.txt
cscript OSPP.VBS /inpkey:RBWW7-NTJD4-FFK2C-TDJ7V-4C2QP  >>%~dp0log.txt
cscript OSPP.VBS /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99  >>%~dp0log.txt
cscript OSPP.VBS /inpkey:YG9NW-3K39V-2T3HJ-93F3Q-G83KT  >>%~dp0log.txt
cscript OSPP.VBS /inpkey:PD3PC-RHNGV-FXJ29-8JK7D-RJRJK  >>%~dp0log.txt
cscript OSPP.VBS /inpkey:JNRGM-WHDWX-FJJG3-K47QV-DRTFM  >>%~dp0log.txt
::1>nul 2>nul
cls

echo 正在尝试 KMS 激活...
cscript //nologo OSPP.VBS /sethst:%fwq%  >>%~dp0log.txt
cscript //nologo OSPP.VBS /act  >>%~dp0log.txt
cscript //nologo OSPP.VBS /act | find /i "successful" && (echo.& cd /d %~dp0 &curl.exe "http://update.1314.cool/update/act/counter/counter.php?system=Office2016&status=success" >nul & cls & goto officesucc ) || (echo.&cd /d %~dp0 &curl.exe "http://update.1314.cool/update/act/counter/counter.php?system=Office2016&status=fail" >nul &cls & goto officefail)
pause
exit
:job13
title Windows全版本激活工具-Office 2013
cls
@echo.
@echo.正在检查office版本

if exist "%~dp0"Office16 cd /d "%~dp0"Office16
:: if exist "%ProgramFiles%\Microsoft Office\Office15\OSPP.VBS" cd /d "%ProgramFiles%\Microsoft Office\Office15"
:: if exist "%ProgramFiles(x86)%\Microsoft Office\Office15\OSPP.VBS" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office15"
cls
echo 正在安装 KMS 许可证...
for /f %%x in ('dir /b ..\root\Licenses13\*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses13\%%x" 
::for /f %%x in ('dir /b ..\root\Licenses13\project???vl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses15\%%x" >nul
::for /f %%x in ('dir /b ..\root\Licenses13\proplusvl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses15\%%x" >nul
::for /f %%x in ('dir /b ..\root\Licenses13\standardvl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses15\%%x" >nul
::for /f %%x in ('dir /b ..\root\Licenses13\visio???vl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses15\%%x" >nul
::cls

::cho 正在安装 MAK 许可证...
::for /f %%x in ('dir /b ..\root\Licenses13\project???vl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses15\%%x" >nul
::for /f %%x in ('dir /b ..\root\Licenses13\proplusvl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses15\%%x" >nul
::for /f %%x in ('dir /b ..\root\Licenses13\standardvl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses15\%%x" >nul
::for /f %%x in ('dir /b ..\root\Licenses13\visio???vl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses15\%%x" >nul
cls
echo.正在安装kms产品密钥
cscript OSPP.VBS /inpkey:YC7DK-G2NP3-2QQC3-J6H88-GVGXT 
cscript OSPP.VBS /inpkey:KBKQT-2NMXY-JJWGP-M62JB-92CD4 
cscript OSPP.VBS /inpkey:FN8TT-7WMH6-2D4X9-M337T-2342K 
cscript OSPP.VBS /inpkey:6NTH3-CW976-3G3Y2-JK3TX-8QHTT 
cscript OSPP.VBS /inpkey:C2FG9-N6J68-H8BTJ-BW3QX-RM3B3 
cscript OSPP.VBS /inpkey:J484Y-4NKBF-W2HMG-DBMJC-PGWR7 
cls
echo 正在尝试 KMS 激活...
cscript //nologo OSPP.VBS /sethst:%fwq% 
cscript //nologo OSPP.VBS /act | find /i "successful" && (echo.& cls & goto officesucc ) || (echo.& cls & goto officefail)
pause >nul
exit
:job2010
title Windows全版本激活工具-Office 2010
cls
color 3f & cd /d "%~dp0"
echo.正在检查office版本

if exist "%~dp0"Office16 cd /d "%~dp0"Office16
:: if exist "%ProgramFiles%\Microsoft Office\Office14\OSPP.VBS" cd /d "%ProgramFiles%\Microsoft Office\Office14"
:: if exist "%ProgramFiles(x86)%\Microsoft Office\Office14\OSPP.VBS" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office14"
cls
echo 正在安装 KMS 许可证...
for /f %%x in ('dir /b ..\root\Licenses10\*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses10\%%x" 
:: for /f %%x in ('dir /b ..\root\Licenses14\project???vl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses14\%%x" >nul
:: for /f %%x in ('dir /b ..\root\Licenses14\proplusvl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses14\%%x" >nul
:: for /f %%x in ('dir /b ..\root\Licenses14\standardvl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses14\%%x" >nul
:: for /f %%x in ('dir /b ..\root\Licenses14\visio???vl_kms*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses14\%%x" >nul
:: cls

:: echo 正在安装 MAK 许可证...
:: for /f %%x in ('dir /b ..\root\Licenses14\project???vl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses14\%%x" >nul
:: for /f %%x in ('dir /b ..\root\Licenses14\proplusvl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses14\%%x" >nul
:: for /f %%x in ('dir /b ..\root\Licenses14\standardvl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses14\%%x" >nul
:: for /f %%x in ('dir /b ..\root\Licenses14\visio???vl_mak*.xrm-ms') do cscript OSPP.VBS /inslic:"..\root\Licenses14\%%x" >nul
:: cls
echo.正在安装office产品密钥
cscript OSPP.VBS /inpkey:VYBBJ-TRJPB-QFQRF-QFT4D-H3GVB 
cscript OSPP.VBS /inpkey:V7QKV-4XVVR-XYV4D-F7DFM-8R6BM 
cscript OSPP.VBS /inpkey:D6QFG-VBYP2-XQHM7-J97RH-VVRCK 
cscript OSPP.VBS /inpkey:D9DWC-HPYVV-JGF4P-BTWQB-WX8BJ 
cscript OSPP.VBS /inpkey:7MCW8-VRQVK-G677T-PDJCM-Q8TCP 
cscript OSPP.VBS /inpkey:767HD-QGMWX-8QTDB-9G3R2-KHFGJ 
cls
echo 正在尝试 KMS 激活...
cscript //nologo OSPP.VBS /sethst:%fwq% >nul
cscript //nologo OSPP.VBS /act | find /i "successful" && (echo.& cls & goto officesucc ) || (echo.& cls & goto officefail)
pause
exit

:xkzywt
cls
title Windows全版本激活工具-解决office许可证问题
echo.
echo.
echo.        微软为了遏制kms盗版横行的现状，采取了措施来封禁使用kms工具进行激活的手段，当使用普通kms方法激活时，office会在注册表写入服务器信息，而使用kms工具进行激活时，激活工具会劫持Software Protection 服务，并不会向注册表里面写入kms服务器信息，当office检测不到服务器信息时，就会弹窗警告
echo.
echo.        windows全版本激活工具提供这一问题的解决方案（需要底包3.0版本以上支持），请按任意键继续解决！
echo.        我们在此感谢PatchOffice程序的作者！
echo.
pause >nul
call :dbaocheck 3.0
patchoffice.exe 
cls
echo.
echo.
echo.        你已经成功解决了此问题，谢谢使用！
echo.
echo.        
echo.
echo.
echo.   1.进入贴吧顶一下
echo.   2.进入软件更新下载地址
echo.   3.捐赠
echo.   4.返回主菜单
echo.
choice /c 1234 /n /m "请选择: "
if %errorlevel%==1 start https://tieba.baidu.com/p/5301591808
if %errorlevel%==2 start http://dl.1314.cool
if %errorlevel%==3 goto juanzeng
if %errorlevel%==4 goto rukou
:officesucc
echo.
echo.
echo.您已经成功的激活了office
echo.
echo.    这个软件已经发布了4年，下载次数已经破6.2万了，我很高兴。
echo. 但是仍然希望您能进入贴吧帮忙顶一下（当然捐助我也不拒绝，哈哈哈），让更多的人看到这个软件，这也是我继续维护下去的动力。谢谢大家。
echo.
echo.
echo.
echo. 由于本人是一个高三学生，将于2022年参加高考，所以回复可能较慢，敬请谅解
echo. 
echo.  1.进入贴吧
echo.  2.发送日志
echo.  3.捐赠
echo.  4.返回主菜单
echo.
choice /c 1234 /n /m "请选择: "
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
echo.  激活office过程中出错
echo.
echo. 错误日志编号：%sjc%
echo.
echo. 是否上传错误日志以供我们分析？
echo.
echo. 请放心，错误日志不包含任何个人信息
echo.
echo. 但，错误日志可能会包含部分极其有限的系统信息，您可以审查日志内容再选择是否发送。
echo.
echo. 我们强烈推荐您发送错误日志，因为我们的软件仍然可能有许多未知的错误，您的错误日志可以有效帮助我们发现并修复错误。
echo. 请您放心，我们不会在未经您授权的情况下向服务器发送错误日志，我们的软件是完全开源的，时刻在接受开源社区的检查。
echo.  1.查看错误日志（查看完毕后如选择发送，请选择2）
echo.  2.直接发送错误日志
echo.  3.不发送错误日志并返回主菜单
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 start %~dp0log.txt
if %errorlevel%==2 goto :sendlog
if %errorlevel%==3 goto rukou
goto :failwi
:sendlog
cls
echo.
echo.
echo.
echo.   正在发送错误日志，请稍后.....
echo.
echo.
cd /d %~dp0
ren log.txt "errorlog_Office%officever%_KMS_%sysinfo%_%sjc%.txt"
cd /d %~dp0 &curl.exe  http://update.1314.cool/update/act/errorlog/send.php  -F "file=@%~dp0errorlog_Office%officever%_KMS_%sysinfo%_%sjc%.txt"
cls
echo.
echo.
echo.   错误日志发送完毕，感谢您的支持
echo.
echo.  你的错误日志编号为：%sjc%
echo.  您可以通过此代码来跟进错误的修复进度，谢谢支持
echo.
echo.
echo.  1.加入反馈QQ群以跟进错误修复（群号：853241207）
echo.  2.返回主菜单
echo.  3.退出软件
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 start http://qm.qq.com/cgi-bin/qm/qr?k=GXMq5O5N1wrFH0VQDBojPGpGpRZKTJtd&authKey=zYxpuJPa%2BP05Ydt2EZRhHFXtFutohXx8ZMqz09Gm6cv4ToTcoqNsaDvYfFJXVE75&group_code=853241207
if %errorlevel%==2 goto :rukou
if %errorlevel%==3 exit
:windows
:autoorhand
@title Windows全版本激活工具-Windows选择菜单
color 3f
cls
echo.                             
echo.
echo.                       当前系统为%sysinfo%
echo.
echo.                              
echo.                              1.Windows全自动激活（支持Windows 11）
echo.                              2.手动选择Windows版本进行激活
echo.                              3.返回主菜单
echo.
echo.       注意：全自动激活默认为kms激活，Windows10/11为数字权利激活。
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto :autoact
if %errorlevel%==2 goto :abc
if %errorlevel%==3 goto rukou
:autoact
cls
echo.
echo.  正在检测当前系统版本，请稍后
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
echo %sysinfo% |find "Home" >NUL &&cls&&echo 暂不支持家庭版激活
goto panduanfall
:win8.1panduan

echo %sysinfo% |find "ProN" >NUL &&goto 8.1pro1
echo %sysinfo% |find "Pro" >NUL &&goto 8.1pro
echo %sysinfo% |find "EnterpriseN" >NUL &&goto 8.1ent1
echo %sysinfo% |find "Enterprise" >NUL &&goto 8.1ent
echo %sysinfo% |find "Home" >NUL &&cls&&echo 暂不支持家庭版激活
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
echo.   未找到当前系统版本，请手动选择Windows版本进行激活
echo.
echo.  当前系统版本为：%sysinfo%
echo.
echo.  请将本页面显示的内容截图发送至QQ群或百度贴吧，我们将尽快适配您的系统版本。
echo.  1.打开百度贴吧
echo.  2.返回主菜单
choice /c 1234 /n /m "请选择: "
if %errorlevel%==1 start https://tieba.baidu.com/p/5301591808
if %errorlevel%==2 goto rukou
:abc
@title Windows全版本激活工具-Windows选择菜单
cls
echo.
echo.
echo.
echo 正在检查系统是否永久激活……
echo.
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "永久激活"  > NUL &&  goto 56781
:pass
color 3f
cls
echo.                             
echo.
echo.                       当前系统为%sysinfo%
echo.
echo.                              
echo.                              1.激活windows10 / 11
echo.                              2.激活windows8 / 8.1 
echo.                              3.激活Windows7 
echo.                              4.激活Windows Server 2012
echo.                              5.激活Windows Server 2012 R2
echo.                              6.激活Windows Server 2008
echo.                              7.激活Windows Server 2008 R2
echo.                              8.激活Windows Server 2016
echo.                              9.激活Windows Server 2019
echo.                              0.激活Windows Server, version 1909, version 1903, and version 1809
echo.                              A.返回主菜单（选择本选项时，请大写输入）
echo.
echo.
echo.
choice /c x1234567890A /n /m "请选择: "
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
title Windows全版本激活工具-Windows10激活方式选择
cls
echo.
echo.       
echo.   当前系统为%sysinfo%
echo.        
echo.         请选择激活方式
echo.
echo.       1.Windows 10 数字权利激活（永久）
echo.       2.Windows 10 KMS激活（180天）
echo.       3.返回主菜单
echo.   注意：Windows10数字权利激活前会首先运行一次kms激活，以提高数字激活的成功率
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto :10yongjiu
if %errorlevel%==2 goto :job2
if %errorlevel%==3 goto :rukou
:job2
title Windows全版本激活工具-Windows10（KMS）
cls
echo.
echo.       
echo.   当前系统为%sysinfo%
echo.        
echo.         选择你的系统版本
echo.
echo.       1.Windows 10 专业工作站
echo.       2.Windows 10 专业工作站 N
echo.       3.Windows 10 专业教育版
echo.       4.Windows 10 专业教育版 N
echo.       5.Windows 10 专业版
echo.       6.Windows 10 企业版
echo.       7.Windows 10 教育版
echo.       8.Windows 10 企业版 LTSB 2015
echo.       9.Windows 10 专业版 N
echo.       10.Windows 10 企业版 N
echo.       11.Windows 10 教育版 N
echo.       12.Windows 10 企业版 LTSB 2015 N
echo.       13.Windows 10 家庭版
echo.       14.Windows 10 企业版 2016 长期服务版(LTSB 2016)
echo.       15.Windows 10 企业版 LTSC 2019
echo.       16.Windows 10 企业版 N LTSC 2019
echo.       17.Windows 10 企业版 2016 长期服务版 N (LTSB 2016 N)
echo.       18.返回主菜单
echo.  
echo.
set /p abc="请选择并按下回车键: "
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

    rem  请不要修改本文档
    rem author : 默然King（Windows10数字权利激活部分，其他部分作者为hvjg2578）
    rem url : http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1786788&page=1#pid48314667

title Windows全版本激活工具-Windows10数字权利激活
cls
echo.
echo.
echo.
echo.   正在准备依赖文件，请稍后
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
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "批量激活"  > NUL &&  goto ss
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "永久激活"  > NUL &&  goto ss

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
echo.  当前系统已经成功永久激活
echo. 
echo. 
echo. 
echo.
echo.1.退出程序
echo.2.捐赠
echo.3.继续激活其他产品
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 exit
if %errorlevel%==2 goto juanzeng
if %errorlevel%==3 goto rukou

:job3
cls
title Windows全版本激活工具-Windows8 / 8.1  
echo.
echo.     当前系统为%sysinfo% 
echo.
echo.   选择你的系统版本
echo. 1.Windows 8 专业版
echo. 2.Windows 8 企业版
echo. 3.Windows 8 专业版 N
echo. 4.Windows 8 企业版 N 
echo. 5.Windows 8.1 专业版
echo. 6.Windows 8.1 企业版
echo. 7.Windows 8.1 专业版 N
echo. 8.Windows 8.1 企业版 N 
echo. 9.返回主菜单
choice /c 123456789 /n /m "请选择: "
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
title Windows全版本激活工具-Windows7  
echo.
echo.  当前系统为%sysinfo%
echo.
echo.   选择你的系统版本
echo. 1.Windows 7 专业版
echo. 2.Windows 7 企业版
echo. 3.Windows 7 专业版 N
echo. 4.Windows 7 企业版 N
echo. 5.Windows 7 企业版E 
echo. 6.Windows 7 旗舰版
echo. 7.Windows 7 家庭普通版
echo. 8.Windows 7 家庭高级版
echo. 9.返回主菜单
choice /c 123456789  /n /m "请选择: "
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
title Windows全版本激活工具-Windows7 旗舰版
echo.
echo.  
echo.
echo.   请选择激活方式（推荐先尝试方法1，如果不成功再使用方法2）
echo. 1.神key激活
echo. 2.安装slic模拟程序激活
echo. 3.返回主菜单
choice /c 123  /n /m "请选择: "
if %errorlevel%==1 goto :7key
if %errorlevel%==2 goto :win7u
if %errorlevel%==3 goto rukou
:7key
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  RHTBY-VWY6D-QJRJ9-JGQ3X-Q2289 
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "永久"  > NUL &&  goto ss
:7activate
goto autosetkms
:job5
cls
title Windows全版本激活工具-Windows Server 2012 
echo.
echo.     当前系统为%sysinfo%
echo.
echo.   选择你的系统版本
echo. 1.Windows Server 2012 
echo. 2.Windows Server 2012 N  
echo. 3.Windows Server 2012 单语言版
echo. 4.Windows Server 2012 特定国家/地区
echo. 5.Windows Server 2012 Server 标准版
echo. 6.Windows Server 2012 MultiPoint Standard
echo. 7.Windows Server 2012 MultiPoint 高级版
echo. 8.Windows Server 2012 数据中心版
echo. 9.返回主菜单
choice /c 123456789 /n /m "请选择: "
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
title Windows全版本激活工具-Windows Server 2012 R2 
echo.
echo.  当前系统为%sysinfo%
echo.
echo.   选择你的系统版本
echo. 1.Windows Server 2012 R2 Server Standard 
echo. 2.Windows Server 2012 R2 Datacenter   
echo. 3.Windows Server 2012 R2 Essentials 
echo. 4.返回主菜单
echo. 
choice /c 1234 /n /m "请选择: "
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
title Windows全版本激活工具-Windows Server 2008 
echo.
echo.  当前系统为%sysinfo%
echo.
echo.   选择你的系统版本
echo. 1.Windows Web Server 2008 
echo. 2.Windows Server 2008 标准版   
echo. 3.不带 Hyper-V 的 Windows Server 2008 标准版
echo. 4.Windows Server 2008 企业版 
echo. 5.不带 Hyper-V 的 Windows Server 2008 企业版
echo. 6.Windows Server 2008 HPC 
echo. 7.Windows Server 2008 Datacenter
echo. 8.不带 Hyper-V 的 Windows Server 2008 数据中心版
echo. 9.面向基于 Itanium 系统的 Windows Server 2008
echo. 0.返回主菜单
echo.
set /p server=请选择:
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
title Windows全版本激活工具-Windows Server 2008 R2 
echo.
echo.     当前系统为%sysinfo%
echo.
echo.   选择你的系统版本
echo. 1.Windows Server 2008 R2 Standard 
echo. 2.Windows Server 2008 R2 Datacenter   
echo. 3.Windows Server 2008 R2 Enterprise
echo. 4.Windows Server 2008 R2 HPC Edition 
echo. 5.Windows Web Server 2008 R2
echo. 6.Windows Server 2008 R2 for Itanium-Based Systems 
echo. 7.返回主菜单
choice /c 1234567  /n /m "请选择: "
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
title Windows全版本激活工具-Windows Server 2016
echo.
echo.  当前系统为%sysinfo%
echo.
echo.   选择你的系统版本
echo. 1.Windows Server 2016 Datacenter
echo. 2.Windows Server 2016 Standard   
echo. 3.Windows Server 2016 Essentials
echo. 4.返回主菜单
echo.
choice /c 1234 /n /m "请选择: "
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
title Windows全版本激活工具-Windows Server 2019
echo.
echo.  当前系统为%sysinfo%
echo.
echo.   选择你的系统版本
echo. 1.Windows Server 2019 Datacenter
echo. 2.Windows Server 2019 Standard   
echo. 3.Windows Server 2019 Essentials
echo. 4.返回主菜单
echo.
choice /c 1234 /n /m "请选择: "
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
title Windows全版本激活工具-Windows Server, version 1909, version 1903, and version 1809
echo.
echo.  当前系统为%sysinfo%
echo.
echo.   选择你的系统版本
echo. 1.Windows Server Datacenter
echo. 2.Windows Server Standard 
echo. 3.返回主菜单
echo.
choice /c 123 /n /m "请选择: "
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
echo.                          当前系统已永久激活，继续激活会导致现有永久激活变为180天
echo.                          确定要继续吗？
echo.
echo.                        1.继续使用kms（180天）激活
echo.                        2.保留现有激活状态，返回主菜单
echo.
echo.
echo.
choice /c 12 /n /m "请选择: "
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
echo 系统激活成功
echo.
echo.  您好，这个软件已经发布了4年，下载次数已经破6.2万了，我很高兴。
echo.  但是仍然希望您能进入贴吧帮忙顶一下（当然捐助我也不拒绝，哈哈哈），让更多的人看到这个软件，这也是我继续维护下去的动力。谢谢大家。
echo.
echo. 
echo. 由于本人是一个高三学生，将于2022年参加高考，所以回复可能较慢，敬请谅解
echo. 
echo.
echo.  如果您不愿意这样做，您可以选择 4 退出程序
echo.  自动续期服务请在主菜单安装
echo.1.进入贴吧顶一下（^ v ^）
echo.2.继续激活其他产品
echo.3.捐赠
echo.4.退出程序
choice /c 1234 /n /m "请选择: "
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
echo 正在激活,请稍候
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
			echo 正在安装slic模拟程序到 %%A 盘，请稍候...
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
echo 即将卸载slic程序!
echo.
echo 卸载后您的系统将恢复为未激活状态,按任意键继续卸载...
pause >nul
if not exist %windir%\system32\slmgr.vbs goto nont6
for %%A in (A: B: C: D: E: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: U: V: W: X: Y: Z:) do (
	if exist %%A\w7ldr (
		echo.
		echo 正在卸载在 %%A 盘的引导
		echo.
		attrib %%A\w7ldr -h -s -r
		del %%A\w7ldr
		files\bootrest /nt60 %%A
	)
)
goto uninsend

:nofile
cls
echo 缺少必要文件，无法继续！
pause >nul
goto Error

:noactivepartition
cls
start diskmgmt.msc
echo 软件检测不到活动分区，请为隐藏分区添加盘符，具体请百度
pause
goto rukou


:Error
set VLFILE=
cls
echo 激活过程遇到了一些问题，按任意键返回主界面
pause >nul
goto rukou

:end
set VLFILE=
cls
echo 激活成功完成,计算机需要重新启动,按任意键重启
echo 如果不想重启,请关闭本窗口
pause >nul
shutdown -r -t 0
exit
:uninsend
cls
echo 卸载完成,请重新启动您的计算机! 按任意键返回菜单...
pause >nul
SET CHS==""
goto lpSTART
exit
:ukos
echo.  当前系统不是旗舰版系统！！
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
echo 正在激活,请稍候
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
			echo 正在安装slic模拟程序到 %%A 盘，请稍候...
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
echo 即将卸载slic程序!
echo.
echo 卸载后您的系统将恢复为未激活状态,按任意键继续卸载...
pause >nul
if not exist %windir%\system32\slmgr.vbs goto nont6
for %%A in (A: B: C: D: E: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: U: V: W: X: Y: Z:) do (
	if exist %%A\w7ldr (
		echo.
		echo 正在卸载在 %%A 盘的引导
		echo.
		attrib %%A\w7ldr -h -s -r
		del %%A\w7ldr
		files\bootrest /nt60 %%A
	)
)
goto uninsend

:nofile
cls
echo 缺少必要文件，无法继续！
pause >nul
goto Error

:noactivepartition
cls
start diskmgmt.msc
echo 软件检测不到活动分区，请为隐藏分区添加盘符，具体请百度
pause
goto rukou


:Error
set VLFILE=
cls
echo 激活过程遇到了一些问题，按任意键返回主界面
pause >nul
goto rukou

:end
set VLFILE=
cls
echo 激活成功完成,计算机需要重新启动,按任意键重启
echo 如果不想重启,请关闭本窗口
pause >nul
shutdown -r -t 0
exit
:uninsend
cls
echo 卸载完成,请重新启动您的计算机! 按任意键返回菜单...
pause >nul
SET CHS==""
goto lpSTART
exit
:ukos
echo.  当前系统不是家庭普通版系统！！
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
echo 正在激活,请稍候
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
			echo 正在安装slic模拟程序到 %%A 盘，请稍候...
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
echo 即将卸载slic程序!
echo.
echo 卸载后您的系统将恢复为未激活状态,按任意键继续卸载...
pause >nul
if not exist %windir%\system32\slmgr.vbs goto nont6
for %%A in (A: B: C: D: E: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: U: V: W: X: Y: Z:) do (
	if exist %%A\w7ldr (
		echo.
		echo 正在卸载在 %%A 盘的引导
		echo.
		attrib %%A\w7ldr -h -s -r
		del %%A\w7ldr
		files\bootrest /nt60 %%A
	)
)
goto uninsend

:nofile
cls
echo 缺少必要文件，无法继续！
pause >nul
goto Error

:noactivepartition
cls
start diskmgmt.msc
echo 软件检测不到活动分区，请为隐藏分区添加盘符，具体请百度
pause
goto rukou


:Error
set VLFILE=
cls
echo 激活过程遇到了一些问题，按任意键返回主界面
pause >nul
goto rukou

:end
set VLFILE=
cls
echo 激活成功完成,计算机需要重新启动,按任意键重启
echo 如果不想重启,请关闭本窗口
pause >nul
shutdown -r -t 0
exit
:uninsend
cls
echo 卸载完成,请重新启动您的计算机! 按任意键返回菜单...
pause >nul
SET CHS==""
goto lpSTART
exit
:ukos
echo.  当前系统不是家庭高级版系统！！
pause
goto :rukou


:setupo
cls
title Windows全版本激活工具-office安装 
echo.
echo.
echo.   欢迎使用office快速安装程序
echo.
echo. 在使用本工具前，希望你仔细阅读下面的注意事项
echo.
echo.    在office安装激活完毕前，不要退出本程序，否则会导致安装或激活失败
echo.    如果office安装过程中出现错误，请关闭本窗口并重新安装
echo.    如果成功安装office，但是激活失败，请进入qq群或贴吧反馈（qq群号：853241207）并@群主（渔桥枫火可期：2578105221）
echo.
echo.   请选择：1.继续安装
echo.           2.返回主菜单
echo.
echo.
choice /c 1234 /n /m "请选择: "
if %errorlevel%==1 goto xuanze
if %errorlevel%==2 goto loop
:xuanze
title Windows全版本激活工具-office安装 
cls
echo.
echo.
echo.   1.office2019 32位  
echo.   2.office2019 64位  
echo.   3.office2016 32位  
echo.   4.office2016 64位
echo.   5.返回主菜单
echo.
echo. 注：office2019不支持Windows10以下的系统
echo.
echo.
echo.
choice /c 12345 /n /m "请选择: "
if %errorlevel%==1 cls & echo. & echo. & echo. & echo.正在安装office 请勿关闭本窗口 & title office快速安装与激活程序-正在安装office & set userset=2019 & setup.exe /configure 2019x86.xml >nul
if %errorlevel%==2 cls & echo. & echo. & echo. & echo.正在安装office 请勿关闭本窗口 & title office快速安装与激活程序-正在安装office & set userset=2019 & setup.exe /configure 2019x64.xml >nul 
if %errorlevel%==3 cls & echo. & echo. & echo. & echo.正在安装office 请勿关闭本窗口 & title office快速安装与激活程序-正在安装office & set userset=2016 & setup.exe /configure 2016x86.xml >nul
if %errorlevel%==4 cls & echo. & echo. & echo. & echo.正在安装office 请勿关闭本窗口 & title office快速安装与激活程序-正在安装office & set userset=2016 & setup.exe /configure 2016x64.xml >nul 
if %errorlevel%==5 goto loop
:act
title Windows全版本激活工具-Office安装
cls
echo.
echo.  您好，你已经成功安装了office产品
echo.   
echo.  1.继续激活office
echo.  2.返回主菜单
echo.  3.捐赠
echo.        如果您选择激活，程序将自动跳转到office激活界面进行激活
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto officecheck
if %errorlevel%==2 goto rukou
if %errorlevel%==3 goto juanzeng
:officecheck
if %userset%==2016 goto job16
if %userset%==2019 goto job19 

:set
@title Windows全版本激活工具-自定义kms服务器
:kms
color 3f
cls
echo.                             
echo.
echo.                          当前kms服务器为%fwq%
echo.
echo.                                 Windows全版本激活工具
echo.                              1.选择现有的kms服务器
echo.                              2.自定义kms服务器
echo.                              3.返回主菜单
echo.                              
echo.                              
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto :set
if %errorlevel%==2 goto :set1
if %errorlevel%==3 goto rukou
goto kms
:set
@title Windows全版本激活工具-选择现有的kms服务器
color 3f
cls
echo.                             
echo.                   剩余kms服务器检查时间：2020/1/28 22：19
echo.                          当前kms服务器为%fwq%
echo.
echo.                              1.cloud.1314.cool（默认，推荐）
echo.                              2.kms.lotro.cc
echo.                              3.kms.03k.org
echo.                              4.kms.chinancce.com
echo.                              5.kms.luody.info
echo.                              6.windows.kms.app
echo.                              7.kms.rbq.kr
echo.                              8.kms.cangshui.net
echo.                              9.返回主菜单
echo.                              
echo.                              
choice /c 123456789 /n /m "请选择: "
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
echo.                          当前kms服务器为%fwq%
echo.
echo.          说明：输入错误的kms服务器会导致激活失败，请检查后再输入
echo.
echo.
echo.
echo.
echo.
echo.
set /p fwq=请输入kms服务器
cls
echo.
echo.
echo.
echo 正在检查与%fwq%的连接情况……
echo.
vlmcs %fwq% -l Windows | find "successful"  > NUL &&  goto rukou
goto fail2
:fail2
cls
echo.                             
echo.
echo.                      您输入的激活服务器失效
echo.                         
echo.          
echo.
echo.                        
echo.                已还原默认激活服务器
echo.
echo.
set fwq=cloud.1314.cool
pause >nul
goto rukou
:checkkms
title Windows全版本激活工具-检查kms服务器
cls
echo.
echo.
echo.
echo 正在检查与%fwq%的连接情况……
echo.
vlmcs %fwq% -l Windows | find "successful"  > NUL &&  goto check
:fail
cls
echo.
echo.
echo.
echo.与激活服务器连接失败，请检查您的网络连接或重新选择kms服务器再试。
echo. 1.进入主页
echo. 2.重新选择kms服务器
echo. 3.退出程序
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto rukou
if %errorlevel%==2 goto set
if %errorlevel%==3 exit
goto fail
:check
cls
echo.
echo.
echo.
echo. 与%fwq%连接正常
echo.
echo.
pause >nul
goto rukou
:checkact
cls
echo.                             
echo.
echo.                          正在检查系统激活情况
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "批量激活"  > NUL &&  goto 1234
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "永久激活"  > NUL &&  goto 5678
goto 9011
:1234
cls
echo.                             
echo.
echo.                          当前系统已成功使用kms（180天）激活
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
echo.                          当前系统已永久激活
echo.
echo.
echo.
pause>nul
goto rukou

:9011
cls
echo.                             
echo.
echo.                      当前系统未激活    
echo.                         
echo.          
echo.
echo.                        
echo.                按任意键激活
echo.
echo.
echo.
pause >nul
goto rukou
:inf
cls
echo.激活详情：
cscript //Nologo %windir%\system32\slmgr.vbs /dlv
echo.激活期限：
cscript //Nologo %windir%\system32\slmgr.vbs /xpr
pause >nul
goto rukou
:bugreport
title Windows全版本激活工具-关于及问题反馈
cls
echo.   
echo. 
echo.      欢迎使用windows全版本激活工具
echo.
echo.您好，这个软件已经发布了4年，下载次数已经破6.2万了，我很高兴。
echo.但是仍然希望您能进入贴吧帮忙顶一下（当然捐助我也不拒绝，哈哈哈），让更多的人看到这个软件，这也是我继续维护下去的动力。谢谢大家。
echo.
echo. 
echo. 由于本人是一个高三学生，将于2022年参加高考，所以回复可能较慢，敬请谅解
echo. 
echo.
echo.注意：捐赠与否与本软件功能无关，纯属自愿
echo.
echo.  感谢:软件关于slic部分的激活感谢阿非大佬！！！
echo.
echo.  本软件仅限学习交流使用，因使用本软件造成
echo.   1.进入官网
echo.   2.进入百度网盘更新链接
echo.   3.进入贴吧
echo.   4.查看更新日志
echo.   5.捐赠
echo.   6.返回主菜单
choice /c 123456 /n /m "请选择: "
if %errorlevel%==1 start http://blog.1314.cool/
if %errorlevel%==2 start http://dl.1314.cool
if %errorlevel%==3 start https://tieba.baidu.com/p/5301591808
if %errorlevel%==4 goto rz
if %errorlevel%==5 goto juanzeng
if %errorlevel%==6 goto rukou
pause>nul
goto rukou
:rz
@title Windows全版本激活工具-更新日志
cls
echo.
echo.  
echo.                      v%my%版本更新日志：
echo.
echo.  2021年2月10日更新：
echo.  
echo.  优化了Windows10数字权利激活流程，提高了激活成功率
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
echo.  当前尝试次数:%kmscount%
echo.
echo   当前kms服务器：%fwq%
echo.  
echo.  正在激活，请稍后
echo.
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk %key%
cscript //Nologo %windir%\system32\slmgr.vbs -skms %fwq% 
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "批量激活"  > NUL &&  goto ss
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
echo.  错误代码：%sysinfo%%fwq%%errorcode%
echo.
echo.  您好，系统激活失败
echo.
echo   请您检查您的网络环境，请不要使用速度过慢的网络。
echo.  
echo.  或者，您可以从MSDN下载原版操作系统并尝试重装一下您的系统。
echo.
echo.  感谢您的支持
echo.
echo. 
echo. 由于本人是一个高三学生，将于2022年参加高考，所以回复可能较慢，敬请谅解
echo. 
echo.
echo.
echo.  1.退出程序
echo.  2.进入更新链接下载本软件的最新版本
echo.  3.进入百度贴吧反馈
echo.  4.进入MSDN我告诉你官网
echo.  5.返回主菜单
choice /c 12345 /n /m "请选择: "
if %errorlevel%==1 exit
if %errorlevel%==2 start http://dl.1314.cool
if %errorlevel%==3 start https://tieba.baidu.com/p/5301591808
if %errorlevel%==4 start https://msdn.itellyou.cn/
if %errorlevel%==5 goto rukou
pause>nul
goto rukou

:juanzeng
cls
title Windows全版本激活工具-捐赠
echo.
echo.  
echo.
echo.  感谢您对本软件的支持，谢谢您的捐赠
echo.
echo.  但还是请您注意：捐赠与本软件的功能完全无关，属于个人自愿行为，金额自愿
echo.  
echo. 请选择捐赠方式
echo.  1.支付宝
echo.  2.微信
echo.  3.返回主菜单
echo.  
echo.
echo.  
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 wget -q http://%actupdatesev%/update/act/zfb.jpg && start zfb.jpg
if %errorlevel%==2 wget -q http://%actupdatesev%/update/act/wx.png && start wx.png
if %errorlevel%==3 goto rukou
cls
echo.
echo.  
echo.
echo.   谢谢您的捐赠（如果无法自动弹出二维码，请手动访问以下链接：）
echo.  支付宝：http://%actupdatesev%/update/act/zfb.jpg
echo.  微信：http://%actupdatesev%/update/act/wx.png
echo. 1.返回主菜单
echo. 2.退出程序
echo.
echo.
echo.
choice /c 12 /n /m "请选择: "
if %errorlevel%==1 goto rukou
if %errorlevel%==2 exit
goto rukou
:zidongxvqi
cls
echo.
echo.  
echo.
echo.   自动续期服务管理
echo.
echo. 1.安装自动续期服务
echo. 2.卸载自动续期服务
echo. 3.返回主菜单
echo.
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto installzidong
if %errorlevel%==2 goto uninstallzidong
if %errorlevel%==3 goto rukou
:installzidong
cls
echo.
echo.
echo. 正在安装自动续期服务，请稍后
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
echo. 自动续期服务安装完成
echo.
echo.  按任意键返回主菜单
echo.
pause >nul
goto rukou
:uninstallzidong
cls
echo.
echo.
echo. 正在卸载自动续期服务，请稍后
echo.
echo.
echo.
del C:\1.bat
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v lin /f
cls
echo.
echo.
echo. 自动续期服务卸载完成
echo.
echo.  按任意键返回主菜单
echo.
pause >nul
goto rukou
:dbaofail
cls
echo.
echo.   
if %dmyver% == 1.0 echo.    Windows全版本激活工具已经升级，底包2.0及以上版本针对Office和Windows7旗舰版激活失败的问题进行了特殊优化 && echo.     为了优化体验，我们锁定了使用v1.0版本用户的office和Windows7旗舰版的激活功能，如需激活，请下载v2.0或以上的版本，敬请谅解
echo.
echo.     当前底包版本太低，要使用此功能，需要v%1及以上的版本，当前版本为v%dmyver%
echo.     请到http://dl.1314.cool下载最新底包版本
echo.
echo.     1.打开下载链接
echo.     2.返回主界面
echo.
choice /c 12 /n /m "请选择: "
if %errorlevel%==1 start http://dl.1314.cool
if %errorlevel%==2 goto rukou
:dbaocheck
if %dmyver% LSS %1 goto :dbaofail
goto :EOF