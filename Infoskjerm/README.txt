********************
*** Installation ***
********************
1. Root folder should be: C:\Infoskjerm

2. Replace <username>, <password> and <devicename> in the following files:
   - C:\Infoskjerm\README.txt
   - C:\Infoskjerm\infoskjerm_update.cmd
   - C:\Infoskjerm\winscp\pi_sync.txt

   (Don't include < > around the usernames etc)

3. Run commands in windows commandline to setup WinSCP security certificate
   > C:\Infoskjerm\winscp\winscp.exe sftp://<username>:<password>@<devicename>/

4. Run command in PowerShell terminal as admin to enable running PowerShell commands
   > Set-ExecutionPolicy unrestricted
   This should cause the following command to output "Unrestricted"
   > Get-ExecutionPolicy

5. To set the PowerPoint image resolution, apply the following registry setting:
   [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\15.0\PowerPoint\Options]
   "ExportBitmapResolution"=dword:00000200

6. On the Raspberry Pi, comment out the last 4 lines like this in "/etc/rsyslog.conf"
   #daemon.*;mail.*;\
   #       news.err;\
   #       *.=debug;*.=info;\
   #       *.=notice;*.=warn       |/dev/xconsole

7. Set the root of the Dropbox folder to "C:\Infoskjerm\MediaFolders\Dropbox"

8. Create a folder in Dropbox named "Infoskjerm", with 2 sub folders named "Images" and "PowerPoints"
   - Infoskjerm
     - Images 
     - PowerPoints

9. Note that if you have MULTIPLE Raspberry Pi's, the some things needs to run once for each device!
   - Run step 3 once for each Raspberry Pi (just do this once now to set things up)
   - In the text file C:\Infoskjerm\winscp\pi_sync.txt
     Add a copy of the code between the lines "# [START]" and "# [STOP]" once for each Raspberry Pi.
   - In the text file C:\Infoskjerm\infoskjerm_update.cmd
     Add a copy of the code below ":: Restart the imageviewer" once for each Raspberry Pi.


*********************
*** Input folders ***
*********************
-PowerPoint input folder
	C:\Infoskjerm\MediaFolders\Dropbox\Infoskjerm\PowerPoints
-Raw images input folder
	C:\Infoskjerm\MediaFolders\Dropbox\Infoskjerm\Images

	
*********************
*** Output folder ***
*********************
C:\Infoskjerm\MediaFolders\Output


********************
*** What is done ***
********************
1. Copy other images to convert output folder
2. Convert PowerPoints to PNG's and place in output folder
3. Transfer output folder changes to raspberry pi's
4. Sleep for 1 hour and repeat