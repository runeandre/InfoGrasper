#################
#### Sources ####
#################

# Code
#   Convert code:     http://www.edugeek.net/forums/scripts/137390-manipulating-office-word-powerpoint-via-powershell.html#post1179665
#   Loop folder :     http://tfl09.blogspot.com/2012/11/saving-powerpoint-slides-to-pdf-with.html
#   Getting basename: http://stackoverflow.com/questions/18847145/loop-through-files-in-a-directory-using-powershell
#   Delete folder:    https://technet.microsoft.com/en-us/library/ee176938.aspx
#   Create folder:    https://technet.microsoft.com/en-us/library/ee176914.aspx
#   Setting security: http://www.dailyfreecode.com/code/hello-world-powershell-334.aspx

# Image quality
#   How to change resolution: https://support.microsoft.com/en-us/kb/827745

#####################
#### End Sources ####
#####################


#Output folder
$opath = "C:\Infoskjerm\MediaFolders\Output\"

#Remove old output folder files and folders
$content_to_remove = $opath + "*"
Remove-Item $content_to_remove -recurse


#####################################
### Fredrikstad PowerPoint folder ###
#####################################
$ipath = "C:\Infoskjerm\MediaFolders\Input_PowerPoints\"
#Loop thru all files in the input folder.
#   Note the filter used for the filename
foreach ($ifile in $(ls $ipath -Filter "*.ppt*")) {
	$MSPPT = New-Object -ComObject powerpoint.application
	$PRES = $MSPPT.presentations.open($ipath + $ifile, 2, $True, $False)
    
    #Number to add at the end of each picture
	$count=1
    #Remove the end of the filename (".pptx" etc) for the output name
    $ofile = $ifile.BaseName
    #New picture folder
    $new_picture_folder = $opath + $ofile

    #Create folder for the pictures
    New-Item -ItemType directory -Path $new_picture_folder

    #Loop thru each slide
	foreach($Slide in $PRES.slides)
	{
		#Save the slide as a picture
		$Slide.Export($new_picture_folder + "\" + $ofile + "_" + $count + ".png", "PNG")
        
		$count++
	}

	$MSPPT.Quit()
}


#######################################
### "Oslo felles" PowerPoint folder ###
#######################################
$ipath = "C:\Infoskjerm\MediaFolders\Input_OsloFellesInfo\"
#Loop thru all files in the input folder.
#   Note the filter used for the filename
foreach ($ifile in $(ls $ipath -Filter "*.ppt*")) {
	$MSPPT = New-Object -ComObject powerpoint.application
	$PRES = $MSPPT.presentations.open($ipath + $ifile, 2, $True, $False)
    
    #Number to add at the end of each picture
	$count=1
    #Remove the end of the filename (".pptx" etc) for the output name
    $ofile = $ifile.BaseName
    #New picture folder
    $new_picture_folder = $opath + $ofile

    #Create folder for the pictures
    New-Item -ItemType directory -Path $new_picture_folder

    #Loop thru each slide
	foreach($Slide in $PRES.slides)
	{
		#Save the slide as a picture
		$Slide.Export($new_picture_folder + "\" + $ofile + "_" + $count + ".png", "PNG")
        
		$count++
	}

	$MSPPT.Quit()
}