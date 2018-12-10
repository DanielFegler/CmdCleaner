@echo off
@title Cmd-Cleaner

set "_ver_=v2018.12.10"
help|find /i "hilfe">nul&&set "_lng_=DE"||set "_lng_=EN"

cls
if not "%~z0"=="11623" call:_ERRR BT
if "%~d0"=="\\" call:_ERRR NT
for %%a in (6\.1\. 6\.2\. 6\.3\. 10\.0) do (ver|findstr /il " %%a">nul&&goto:_STRT)
call:_ERRR OS

:_STRT
net sessions>nul 2>&1
if %errorlevel% neq 0 (set "_adm_=0") else (set "_adm_=1")
if "%_adm_%"=="0" (
	color f0
	if "%1"=="" (
	mode con cols=58 lines=18
	))
if "%_adm_%"=="1" (
	color f4
	if "%1"=="" (
	mode con cols=58 lines=22
	))
if "%1"=="/!" mode con cols=58 lines=8
if "%1"=="/?" mode con cols=58 lines=13

:_SET1
cd /d "%~dp0">nul 2>&1
set "_dat_=%~dp0%~n0.dat"
if exist "%_dat_%" (call:_DATE "%_dat_%") else (goto:_SET2)
for %%a in (a b c d e f 1 2) do (set "_%%a_= ")
for %%a in (a b c d e f 1 2) do (findstr "_%%a_" "%_dat_%">nul&&set "_%%a_=*")
goto:_SET3

:_SET2
for %%a in (a b c) do (set "_%%a_=*")
for %%a in (d e f 1 2) do (set "_%%a_= ")

:_SET3
set "_desk=%userprofile%/desktop"
set "_name=WMCP"
set "_clid={ED7BA470-8E54-465E-825C-99712043E01C}"
if exist "%_desk%/%_name%.%_clid%" (set "_mcp_=*") else (set "_mcp_= ")
if "%1"=="/!" (set "_run_=1"&goto:_EXEC) else (set "_run_=0")
if "%1"=="/?" (set "_hlp_=1"&goto:_INFO) else (set "_hlp_=0")

:_MENU
cls
echo.
echo  ÉÍÍÍÄÄÄÄÄÄÄÄÄÄ» ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo  º   ÉÍËÍ» ÉÍÍÍ¹ º  CMD-CLEANER                [?] INFO º
echo  ÈÍÍÍ¼   ÈÍÊÍÍÍ¼ º  %_ver_%                [%_mcp_%] WMCP º
echo  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo  º                                                      º
call:_%_lng_%
echo  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
set "_inp_="
set /p "_inp_=¯ "
if /i "%_inp_%"==""  (goto:_SAVE)
if /i "%_inp_%"=="?" (goto:_INFO)
if /i "%_inp_%"=="info" (goto:_INFO)
if /i "%_inp_%"=="wmcp" (goto:_WMCP)
if /i "%_inp_%"=="a" (if /i "%_a_%"==" " (set "_a_=*") else (set "_a_= "))
if /i "%_inp_%"=="b" (if /i "%_b_%"==" " (set "_b_=*") else (set "_b_= "))
if /i "%_inp_%"=="c" (if /i "%_c_%"==" " (set "_c_=*") else (set "_c_= "))
if /i "%_inp_%"=="d" (if /i "%_d_%"==" " (set "_d_=*") else (set "_d_= "))
if /i "%_inp_%"=="e" (if /i "%_e_%"==" " (set "_e_=*") else (set "_e_= "))
if /i "%_inp_%"=="f" (if /i "%_f_%"==" " (set "_f_=*") else (set "_f_= "))
if /i "%_inp_%"=="1" (if /i "%_1_%"==" " (set "_1_=*") else (set "_1_= "))
if /i "%_inp_%"=="2" (if /i "%_2_%"==" " (set "_2_=*") else (set "_2_= "))
if /i "%_inp_%"=="y" (exit)
if /i "%_inp_%"=="z" (exit)
if "%_inp_%"=="0" (exit)
goto:_MENU

:_SAVE
echo #CMD-CLEANER>"%_dat_%"
if "%_a_%"=="*" echo _a_>>"%_dat_%"
if "%_b_%"=="*" echo _b_>>"%_dat_%"
if "%_c_%"=="*" echo _c_>>"%_dat_%"
if "%_d_%"=="*" echo _d_>>"%_dat_%"
if "%_e_%"=="*" echo _e_>>"%_dat_%"
if "%_f_%"=="*" echo _f_>>"%_dat_%"
if "%_1_%"=="*" echo _1_>>"%_dat_%"
if "%_2_%"=="*" echo _2_>>"%_dat_%"
call:_DATE %_dat_%
goto:_EXEC

:_DATE
if exist %_dat_% title CmdCleaner  -  %~t1
goto:eof

:_GFX1
cls
echo.
echo  ÉÍÍÍÄÄÄÄÄÄÄÄÄÄ» ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo  º   ÉÍËÍ» ÉÍÍÍ¹ º  CMD-CLEANER                         º
echo  ÈÍÍÍ¼   ÈÍÊÍÍÍ¼ º  %_ver_%                         º
echo  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo  º
goto:eof

:_GFX2
if "%_lng_%"=="DE" echo. ÈÍ¹ Scripted by D niel Fegler (www.cmd-scripts.de)
if "%_lng_%"=="EN" echo. ÈÍ¹ Scripted by D niel Fegler (www.cmd-scripts.com)
echo.
echo. ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo.
goto:eof

:_EXEC
mode con lines=8
call:_BYTE RUN
if "%_a_%"=="*" call:_WINTMP
if "%_b_%"=="*" call:_WINUNN
if "%_c_%"=="*" call:_BRSRCC
if "%_d_%"=="*" call:_WDCURN
:: "%_e_%" processed:_WDCURN
if "%_f_%"=="*" if "%_adm_%"=="1" call:_WDUPDC
if "%_1_%"=="*" if "%_adm_%"=="1" if "%_run_%"=="0" call:_WDRSMN
if "%_2_%"=="*" if "%_adm_%"=="1" if "%_run_%"=="0" call:_WDMMDG
call:_BYTE END
if "%_run_%"=="1" exit
goto:_STRT

:_WMCP
if /i "%_mcp_%"==" " (set "_mcp_=*") else (set "_mcp_= ")
if "%_mcp_%"==" " rd "%_desk%/%_name%.%_clid%">nul 2>&1
if "%_mcp_%"=="*" md "%_desk%/%_name%.%_clid%">nul 2>&1
goto:_STRT

:_WINTMP
call:_GFX1
if "%_lng_%"=="DE" echo. ÈÍ¹ Tempor„re Dateien
if "%_lng_%"=="EN" echo. ÈÍ¹ Temporary Files
set "_dir_=tmp%\"&call:_DLFLDR
set "_dir_=%temp%\"&call:_DLFLDR
set "_dir_=%windir%\temp\"&call:_DLFLDR
set "_dir_=%systemroot%\temp\"&call:_DLFLDR
set "_dir_=%localappdata%\temp\"&call:_DLFLDR
set "_dir_=%allusersprofile%\temp\"&call:_DLFLDR
goto:eof

:_WINUNN
call:_GFX1
if "%_lng_%"=="DE" echo. ÈÍ¹ Unn”tige Dateien
if "%_lng_%"=="EN" echo. ÈÍ¹ Unnecessary Files
del /f /s /q "%systemroot%\inf\*.pnf">nul 2>&1
del /f /s /q "%systemroot%\installer\*.msp">nul 2>&1
set "_dir_=%systemroot%\prefetch\"&call:_DLFLDR
set "_dir_=%appdata%\microsoft\windows\recent\"&call:_DLFLDR
set "_dir_=%systemroot%\installer\$patchcache$\"&call:_DLFLDR
set "_dir_=%systemroot%\softwaredistribution\download\"&call:_DLFLDR
:: for %%a in (bak chk cnt diz dmp fts gid old thumbs\.db tmp) do (del /s /f %systemdrive%\*.%%a>nul 2>&1)
goto:eof

:_BRSRCC
call:_GFX1
if "%_lng_%"=="DE" echo. ÈÍ¹ Browser Cache Dateien
if "%_lng_%"=="EN" echo. ÈÍ¹ Browser Cache Files
for %%a in (IE GC FF OP ST OR) do (call:_BRSRCC-%%a)
goto:eof

:_BRSRCC-IE
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8>nul 2>&1
set "_dir_=%localappdata%\microsoft\windows\webcache\"&call:_DLFLDR
set "_dir_=%localappdata%\microsoft\windows\temporary internet files\"&call:_DLFLDR
goto:eof

:_BRSRCC-GC
if not exist "%localappdata%\google\chrome\" goto:eof
set "_dir_=%localappdata%\google\chrome\user data\default\cache\"&call:_DLFLDR
set "_dir_=%localappdata%\google\chrome\user data\default\gpucache\"&call:_DLFLDR
set "_dir_=%localappdata%\google\chrome\user data\default\media cache\"&call:_DLFLDR
set "_dir_=%localappdata%\google\chrome\user data\default\session storage\"&call:_DLFLDR
set "_dir_=%localappdata%\google\chrome\user data\default\application cache\"&call:_DLFLDR
goto:eof

:_BRSRCC-FF
if not exist "%localappdata%\mozilla\firefox\" goto:eof
set "_dir_=%localappdata%\mozilla\firefox\profiles\"&call:_DLFLDR
goto:eof

:_BRSRCC-OP
if not exist "%localappdata%\opera software\opera stable\" goto:eof
set "_dir_=%localappdata%\opera software\opera stable\cache\"&call:_DLFLDR
goto:eof

:_BRSRCC-ST
if not exist "%localappdata%\steam\" goto:eof
set "_dir_=%localappdata%\steam\htmlcache\"&call:_DLFLDR
goto:eof

:_BRSRCC-OR
if not exist "%localappdata%\origin\" goto:eof
set "_dir_=%localappdata%\origin\origin\cache\"&call:_DLFLDR
goto:eof

:_WDCURN
call:_GFX1
if "%_lng_%"=="DE" echo. ÈÍ¹ Windows Datentr„gerbereinigung
if "%_lng_%"=="EN" echo. ÈÍ¹ Windows Disk Cleanup Utility
if "%_e_%"=="*" if "%_run_%"=="0" %comspec% /c cleanmgr /d c /sageset:65535
%comspec% /c cleanmgr /d c /sagerun:65535
goto:eof

:_WDUPDC
call:_GFX1
if "%_lng_%"=="DE" echo. ÈÍ¹ Windows Update Installationsbereinigung
if "%_lng_%"=="EN" echo. ÈÍ¹ Windows Update Installation Cleanup
dism.exe /online /cleanup-image /spsuperseded>nul 2>&1
dism.exe /online /cleanup-image /startcomponentcleanup /resetbase>nul 2>&1
net stop wuauserv>nul 2>&1
timeout /t 1>nul
set "_dir_=%systemroot%\softwaredistribution\"&call:_DLFLDR
timeout /t 1>nul
net start wuauserv>nul 2>&1
goto:eof

:_WDRSMN
call:_GFX1
if "%_lng_%"=="DE" echo. ÈÍ¹ Windows Ressourcenmonitor
if "%_lng_%"=="EN" echo. ÈÍ¹ Windows Performance Monitoring Tool
timeout /t 1>nul
start "" perfmon.exe /res>nul 2>&1
goto:eof

:_WDMMDG
call:_GFX1
if "%_lng_%"=="DE" echo. ÈÍ¹ Windows Speicherdiagnose
if "%_lng_%"=="EN" echo. ÈÍ¹ Windows Memory Diagnostic Tool
mdsched.exe>nul 2>&1
goto:eof

:_DLFLDR
del /f /s /q "%_dir_%*.*">nul 2>&1
for /d %%a in ("%_dir_%*") do rd /s /q "%%a">nul 2>&1
goto:eof

:_DE
echo  º  [%_a_%]  a.  Tempor„re Dateien                          º
echo  º  [%_b_%]  b.  Unn”tige Dateien                           º
echo  º  [%_c_%]  c.  Browser Cache Dateien                      º
echo  º  [%_d_%]  d.  Windows Datentr„gerbereinigung             º
echo  º  [%_e_%]  e.  Windows Datentr„gerbereinigung Einstell.   º
if "%_adm_%"=="1" (
	echo  º  [%_f_%]  f.  Windows Update Installationsbereinigung    º
	echo  º                                                      º
	echo  º  [%_1_%]  1.  Windows Ressourcenmonitor                  º
	echo  º  [%_2_%]  2.  Windows Speicherdiagnose                   º
	)
echo  º                                                      º
echo  ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo  º  [ENTER] =  Ausfhren ³ [0,Y,Z] =  Programm beenden  º
goto:eof

:_EN
echo  º  [%_a_%]  a.  Temporary Files                            º
echo  º  [%_b_%]  b.  Unnecessary Files                          º
echo  º  [%_c_%]  c.  Browser Cache Files                        º
echo  º  [%_d_%]  d.  Windows Disk Cleanup Utility               º
echo  º  [%_e_%]  e.  Windows Disk Cleanup Utility Settings      º
if "%_adm_%"=="1" (
	echo  º  [%_f_%]  f.  Windows Update Installation Cleanup        º
	echo  º                                                      º
	echo  º  [%_1_%]  1.  Windows Performance Monitoring Tool        º
	echo  º  [%_2_%]  2.  Windows Memory Diagnostic Tool             º
	)
echo  º                                                      º
echo  ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo  º   [ENTER] = Execute   ³   [0,Y,Z] =  Exit Program    º
goto:eof

:_BYTE
for /f "tokens=2 delims==" %%a in ('wmic os get localdatetime /value') do (set _ldt=%%a)
for /f "tokens=2 delims==" %%a in ('wmic logicaldisk where "deviceid='%systemdrive%'" get freespace /value') do (set "_spc_=%%a")

if "%1"=="RUN" (
	set "_spr_=%_spc_%"
	set "_log_=%~dp0%~n0.log"
	set "_dttm_=%_ldt:~6,2%.%_ldt:~4,2%.%_ldt:~0,4% %_ldt:~8,2%:%_ldt:~10,2%:%_ldt:~12,2%
	)
if "%1"=="END" (
	echo.%_dttm_%>>"%_log_%"
	if "%clientname%"=="" (
		echo.  Computername..: %computername%>>"%_log_%"
		) else (
		echo.  Computername..: %computername%>>"%_log_%"
		echo.  Clientname....: %clientname%>>"%_log_%"
		)
	echo.  Username......: %username%>>"%_log_%"
	echo.  FreeSpace Run.: %_spr_% Bytes>>"%_log_%"
	echo.  FreeSpace End.: %_spc_% Bytes>>"%_log_%"
	echo.>>"%_log_%"
	)
goto:eof

:_INFO
color a0
mode con lines=13
call:_GFX1&call:_GFX2
if "%_lng_%"=="DE" echo.  OS: Wird geladen. Bitte warten...
if "%_lng_%"=="EN" echo.  OS: Loading. Please wait...
echo.
for %%a in (caption version csdversion osarchitecture) do (call:_INFO-GET %%a)
call:_GFX1&call:_GFX2
echo.  OS: %caption%
if "%csdversion%"=="" (
	echo.      Version %version% ^(%osarchitecture%^)
	) else (
	echo.      Version %version%: %csdversion% ^(%osarchitecture%^)
	)
timeout /t 10>nul
if "%_hlp_%"=="1" exit
goto:_STRT

:_INFO-GET
for /f "tokens=2 delims==" %%a in ('wmic os get %1 /value') do (set "%1=%%a")
goto:eof

:_ERRR
color c0
mode con cols=58 lines=8
call:_GFX1
if "%1"=="BT" (
	if "%_lng_%"=="DE" echo. ÈÍ¹ Fehler: Das Skript wurde ver„ndert!
	if "%_lng_%"=="EN" echo. ÈÍ¹ Error: The script has been changed!
	)
if "%1"=="NT" (
	if "%_lng_%"=="DE" echo. ÈÍ¹ Fehler: UNC-Pfade werden nicht untersttzt!
	if "%_lng_%"=="EN" echo. ÈÍ¹ Error: UNC paths are not supported!
	)
if "%1"=="OS" (
	if "%_lng_%"=="DE" echo. ÈÍ¹ Fehler: Das Betriebssystem wird nicht untersttzt!
	if "%_lng_%"=="EN" echo. ÈÍ¹ Error: The operating system is not supported!
	)
pause>nul
exit
