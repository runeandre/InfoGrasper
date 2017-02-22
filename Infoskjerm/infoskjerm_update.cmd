@setlocal enableextensions enabledelayedexpansion
@echo off

:: Code sources
:: http://stackoverflow.com/questions/3050898/how-to-check-if-ping-responded-or-not-in-a-batch-file

:top

:: Empty folders
del /s /q "C:\Infoskjerm\MediaFolders\Input_PowerPoints\*.*"
del /s /q "C:\Infoskjerm\MediaFolders\Output\*.*"

:: Copy PowerPoints in Dropbox to an intermediary input folder
xcopy C:\Infoskjerm\MediaFolders\Dropbox\Infoskjerm\PowerPoints C:\Infoskjerm\MediaFolders\Input_PowerPoints /E /D /C /Y

:: Convert PowerPoints in input folder to PNG images in the output folder
cd C:\Infoskjerm\PS
PowerShell.exe -command .\PPT_Converter.ps1

:: Copy raw images directly to the output folder
xcopy /s /Y C:\Infoskjerm\MediaFolders\Dropbox\Infoskjerm\Images C:\Infoskjerm\MediaFolders\Output

:: Copy raw images not in a sub folder to a default folder named "A_folder"
mkdir C:\Infoskjerm\MediaFolders\Output\A_folder
copy C:\Infoskjerm\MediaFolders\Dropbox\Infoskjerm\Images\* C:\Infoskjerm\MediaFolders\Output\A_folder

:: Upload changes to infoskjerm
cd C:\Infoskjerm\winscp
winscp.com /script=pi_sync.txt

:: Restart the imageviewer
cd C:\Infoskjerm\putty\

set ipinfo1=<devicename>
set stateinfo1=down

timeout 10

:: Pi #1
for /f "tokens=5,7" %%a in ('ping -n 1 !ipinfo1!') do (
    if "x%%a"=="xReceived" if "x%%b"=="x1," set stateinfo1=up
)
if "%stateinfo1%"=="up" (
	echo "Found IP %ipinfo1%"
	start "" "C:\Infoskjerm\putty\plink.exe" -ssh -P 22 -pw <password> <username>@%ipinfo1% -m cmds.txt
) else (
	echo "Cant find IP %ipinfo1%"
)

cd C:\Infoskjerm\

:: Sleep for 1 hour
timeout 3600
goto top