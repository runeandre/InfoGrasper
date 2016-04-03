********************
*** Installation ***
********************
1. Copy the folder "Infoskjerm" to C:\
   The root folder should be: C:\Infoskjerm
2. Download PUTTY and copy the file "putty.exe" into the folder "C:\Infoskjerm\putty\"
   URL:  http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
   File: "putty.exe"
3. Download WinSCP and extract the files into the folder "C:\Infoskjerm\winscp\"
   URL:  https://winscp.net/eng/download.php
   File: "Portable executables"
4. Run commands in windows command line to setup WinSCP security certificate
   # C:\Infoskjerm\winscp\winscp.exe sftp://pi:raspberry@infoskjerm1/
   # C:\Infoskjerm\winscp\winscp.exe sftp://pi:raspberry@infoskjerm2/
5. Run the following commands in PowerShell terminal as admin to enable running PowerShell commands
   # Set-ExecutionPolicy unrestricted
   This should cause the following command to output "Get-ExecutionPolicy"
   # Get-ExecutionPolicy
6. Update the "<password>" text in the following file:
   - "C:\Infoskjerm\infoskjerm_update.cmd"
7. Mount the following corporate network folder as "Z:" (Oslo felles info)
   URL: \\corp.capgemini.com\Nordic\NO\OSLNTSAN01\common\Common\Felles\Felles Marketing and Communication\Felles info til TVskjermer
8. Share the folder "C:\Infoskjerm\MediaFolders" on the network.
   The input folders is where we can put the media we want to transfer.
9. Check the "C:\Infoskjerm\Tweaks\" folder for other things to apply!


*********************
*** Input folders ***
*********************
-PowerPoint input folder
	C:\Infoskjerm\MediaFolders\Input_FellesInfo
	C:\Infoskjerm\MediaFolders\Input_PowerPoints
-Other images input folder
	C:\Infoskjerm\MediaFolders\Input_Images

	
*********************
*** Output folder ***
*********************
C:\Infoskjerm\MediaFolders\Output


********************
*** What is done ***
********************
1. Copy "Oslo felles info" PowerPoints
2. Convert PowerPoints to PNG's
3. Copy other images to convert output folder
4. Transfer changes to raspberry pi's
5. Sleep for 1 hour and repeat