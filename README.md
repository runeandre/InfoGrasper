# InfoGrasper
A really simple infoscreen solution for the Raspberry Pi, using a Windows machine to push images to the Pi. Read more further down about why Windows!


## Installation
Raspberry Pi = Client connected to a TV/screen

Windows PC = Server to push images to Pi's, also converts Power Points

### Device 1 - Raspberry Pi
1. Install Rasbian to a Micro SD card (follow the official guide)
2. Boot into Rasbian on the Pi, and make sure it is connected to the internet via an Ethernet cable
3. Download all the files located in [InfoGrasper/RaspberryPi_Setup/](https://github.com/runeandre/InfoGrasper/tree/master/RaspberryPi_Setup/)
4. Copy them onto the Raspberry Pi (via USB stick, download directly or something)
5. Open the terminal on the Pi and "cd" into the folder where you put the files
6. Run the following commands to make the script "PiSetup" executable and starting it

    ```    
    chmod +x PiSetup
    sudo ./PiSetup
    ```

7. The script will download updates to Rasbian, install network manager and fbi, and update config files and scripts.
8. Follow the manual instructions the script shows when it has completed (configuring the Pi).
⋅⋅⋅A text file and two images will be copied onto the Desktop of the Pi.
⋅⋅*Raspberry_Pi_Setup.txt
⋅⋅*RaspberryPi_Config.png
⋅⋅*Wifi.png

### Device 2 - Windows PC
1. Download the folder [InfoGrasper/Infoskjerm/](https://github.com/runeandre/InfoGrasper/tree/master/Infoskjerm/)
2. Setup the Windows content server by following the instructions in [InfoGrasper/Infoskjerm/README.txt](https://github.com/runeandre/InfoGrasper/tree/master/Infoskjerm/README.txt)

## Why a Windows machine?
Why use a Windows machine to push images to the Pi?

Because the Windows component of this setup converts Power Points to images using Power Shell.

It was problematic using Libre Office and getting good results when converting "corporate" Power Points to images.