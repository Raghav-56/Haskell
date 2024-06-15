@echo off
REM Get the directory of this script
set scriptDir=%~dp0

REM Open the script's directory in Visual Studio Code
start "" "code" "%scriptDir%"

REM Open the script's directory in File Explorer
start "" "explorer.exe" "%scriptDir%"

REM Wait for a short moment to allow the processes to start
timeout /t 1 /nobreak >nul

REM Exit the batch script
exit
