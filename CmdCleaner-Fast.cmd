@echo off
cd /d "%~dp0">nul 2>&1
if exist "CmdCleaner.cmd" start /b "" "CmdCleaner.cmd" /!
if exist "CmdCleanerXP.cmd" start /b "" "CmdCleanerXP.cmd" /!
exit
