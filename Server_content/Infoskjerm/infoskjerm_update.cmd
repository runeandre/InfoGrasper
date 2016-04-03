@echo off

:top

:: Update "Felles info" from Capgemini Oslo
xcopy Z:\ C:\Infoskjerm\MediaFolders\Input_OsloFellesInfo /E /D /C /Y

:: Convert PowerPoints to PNG images
cd C:\Infoskjerm\PS
PowerShell.exe -command .\PPT_Converter.ps1

:: Copy other images to PS output folder
xcopy /s /Y C:\Infoskjerm\MediaFolders\Input_Images C:\Infoskjerm\MediaFolders\Output

:: Upload changes to infoskjerm
cd C:\Infoskjerm\winscp
winscp.com /script=pi_sync.txt

:: Restart the imageviewer
cd C:\Infoskjerm\putty\
start "" "C:\Infoskjerm\putty\putty.exe" -ssh pi@infoskjerm1 22 -pw <password> -m cmds.txt
timeout 10
start "" "C:\Infoskjerm\putty\putty.exe" -ssh pi@infoskjerm2 22 -pw <password> -m cmds.txt
timeout 10

cd C:\Infoskjerm\

:: Sleep for 1 hour
timeout 3600
goto top