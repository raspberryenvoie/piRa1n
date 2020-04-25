# piRa1n
If you want to jailbreak your iDevice and you do not have access to your computer, you can create your own box with a Raspberry Pi 4 and carry it anywhere, you just have to connect it to a powerbank. (piRa1n uses [Checkra1n](https://checkra.in/).)\
**This only works with a Raspberry Pi 4! Other versions of the Raspberry Pi will not work.**

## ⚠️ Disclaimer
If you use piRa1n please note that I am in no way responsible for any damage to your devices.

## How does it work?
piRa1n jailbreak your iDevice using [Checkra1n](https://checkra.in/).

Connect the Raspberry Pi 4 to a powerbank. After that plug you iDevice to the Pi. Put the iDevice in DFU mode and let piRa1n to the rest!

## Parts list
- a Raspberry Pi 4\
- a USB to USB Type-C cable.\
- a USB to lightning cable.\
- a powerbank

## Installation 

### 1. Install and set up Raspbian
A. Download the [Raspberry Imager](https://www.raspberrypi.org/downloads/) software and install Raspbian "A port of Debian with the Raspberry Pi Desktop (Recommended) on your MicroSD Card.\
B. Set up Raspbian\
Plug the MicroSD Card in the Raspberry Pi 4 and turn it on.\
If you have a monitor, a mouse and a keyboard: Connect them to the Raspberry Pi and configure the OS with the instructions displayed on the screen.\
Else: Configure the OS with [this guide](https://hackernoon.com/raspberry-pi-headless-install-462ccabd75d0) from step 3.   

### 2. Install piRa1n
Copy and paste each of the following commands into the terminal application and press the Enter key.\
Go in pi directory: `cd /home/pi`
Clone the repository: `git clone https://github.com/raspberryenvoie/piRa1n.git`\
Go in the directory: `cd piRa1n`\
Make installer executable: `sudo chmod +x install_piRa1n.sh`\
Execute the installer: `./install_piRa1n.sh`

### 3. Run piRa1n at Startup
Go in the directory: `cd /home/pi/piRa1n`\
Make run_piRa1n_at_startup.sh executable: `sudo chmod +x run_piRa1n_at_startup.sh`
Run run_piRa1n_at_startup.sh (This will reboot the Raspberry Pi.) : `./run_piRa1n_at_startup.sh`
