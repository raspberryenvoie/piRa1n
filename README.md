# piRa1n
If you want to jailbreak your iDevice and you do not have access to your computer, you can create your own box with a Raspberry Pi 4 and carry it anywhere, you just have to connect it to a powerbank.

⚠️ **This only works with a Raspberry Pi 4!**

## Installation 

### Install and set up Raspbian
A. Download the [Raspberry Imager](https://www.raspberrypi.org/downloads/) software and install Raspbian on your MicroSD Card.  
B. Set up Raspbian  
Plug the MicroSD Card in the Raspberry Pi 4 and turn it on.  
If you have a monitor, a mouse and a keyboard: Connect them to the Raspberry Pi and configure the OS with the instructions displayed on the screen.   
Else: Configure the OS with [this guide](https://hackernoon.com/raspberry-pi-headless-install-462ccabd75d0) from step 3.   

### Install checkra1n
Clone the repository: `git clone https://github.com/raspberryenvoie/piRa1n.git`\
Go in the directory: `cd piRa1n`\
Make installer executable: `sudo chmod +x install_piRa1n.sh`\
Execute the installer: `./install_piRa1n.sh`\
