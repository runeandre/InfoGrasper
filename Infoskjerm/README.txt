********************
*** Installation ***
********************
1. Root folder should be: C:\Infoskjerm

2. Download PLink and WinSCP
   Both executables (and additional files) should be located directly in their destination folders.
   
   - PLink
      - Download "plink.exe": http://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html
      - Destination folder:   C:\Infoskjerm\putty\

   - WinSCP
      - Download "Portable executables": https://winscp.net/eng/download.php
      - Destination folder: C:\Infoskjerm\winscp\

3. Replace <username>, <password> and <devicename> in the following files:
   - C:\Infoskjerm\README.txt
   - C:\Infoskjerm\infoskjerm_update.cmd
   - C:\Infoskjerm\winscp\pi_sync.txt

   (Don't include < > around the usernames etc)

4. Run commands in windows commandline to setup WinSCP security certificate
   > C:\Infoskjerm\winscp\winscp.exe sftp://<username>:<password>@<devicename>/

5. Run command in PowerShell terminal as admin to enable running PowerShell commands
   > Set-ExecutionPolicy unrestricted
   This should cause the following command to output "Unrestricted"
   > Get-ExecutionPolicy

6. To set the PowerPoint image resolution, apply the following registry settings via reg files or manually:

   Registry Files:
   - Tweaks\ExportBitmapResolution_Office14.0.reg
   - Tweaks\ExportBitmapResolution_Office15.0.reg

   Manual Registry example:
   [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\15.0\PowerPoint\Options]
   "ExportBitmapResolution"=dword:00000200

7. On the Raspberry Pi, comment out the last 4 lines like this in "/etc/rsyslog.conf"
   #daemon.*;mail.*;\
   #       news.err;\
   #       *.=debug;*.=info;\
   #       *.=notice;*.=warn       |/dev/xconsole

8. Set the root of the Dropbox folder to "C:\Infoskjerm\MediaFolders\Dropbox"

9. Create a folder in Dropbox named "Infoskjerm", with 2 sub folders named "Images" and "PowerPoints"
   - Infoskjerm
     - Images 
     - PowerPoints

10. Note that if you have MULTIPLE Raspberry Pi's, the some things needs to run once for each device!
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
1. Empty two work folders
2. Copy DropBox PowerPoints to "MediaFolders\Input_PowerPoints" folder
3. Run PowerShell script to convert PowerPoints to PNG images
4. Copy DropBox images to "MediaFolders\Output" folder
5. Copy DropBox images not in a subfolder to "MediaFolders\Output\A_folder"
6. Sync changed files with WinSCP to the Raspberry Pi(s)
7. Check if the script can find the Pi(s)
8. Use PLink to restart the image program on the Pi(s)