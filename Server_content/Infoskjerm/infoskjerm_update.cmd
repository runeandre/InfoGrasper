@echo off

:top

:: Empty folders
del /s /q "C:\Infoskjerm\MediaFolders\Input_PowerPoints\*.*"
del /s /q "C:\Infoskjerm\MediaFolders\Output\*.*"

:: Copy raw images directly to the output folder
xcopy /s /Y C:\Infoskjerm\MediaFolders\Dropbox\Infoskjerm\Images C:\Infoskjerm\MediaFolders\Output

:: Copy PowerPoints in Dropbox to an intermediary input folder
xcopy C:\Infoskjerm\MediaFolders\Dropbox\Infoskjerm\PowerPoints C:\Infoskjerm\MediaFolders\Input_PowerPoints /E /D /C /Y

:: Convert PowerPoints in input folder to PNG images in the output folder
cd C:\Infoskjerm\PS
PowerShell.exe -command .\PPT_Converter.ps1

:: Upload changes to infoskjerm
cd C:\Infoskjerm\winscp
winscp.com /script=pi_sync.txt

:: Restart the imageviewer
cd C:\Infoskjerm\putty\
start "" "C:\Infoskjerm\putty\putty.exe" -ssh <username>@<devicename> 22 -pw <password> -m cmds.txt
timeout 10

cd C:\Infoskjerm\

:: Sleep for 1 hour
timeout 3600
goto top