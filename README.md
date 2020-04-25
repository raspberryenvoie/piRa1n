# piRa1n
If you want to jailbreak your iDevice and you do not have access to your computer, you can create your own box with a Raspberry Pi 4 and carry it anywhere, you just have to connect it to a power bank.

**This only works with a Raspberry Pi 4! Other versions of the Raspberry Pi will not work.**

## ⚠️ Disclaimer
If you use piRa1n please note that I am in no way responsible for any damage to your devices.

## How does it work?
piRa1n jailbreak your iDevice using [Checkra1n](https://checkra.in/).

Connect the Raspberry Pi 4 to a powerbank. After that, plug you iDevice to the Pi. Put the iDevice in DFU mode and let piRa1n do the rest!

## Parts list
- a Raspberry Pi 4 with either 1GB, 2GB, 4GB of RAM (1GB of RAM is enough so I recommend the 1GB version).
- a USB to USB Type-C cable.\
- a USB to lightning cable.\
- a powerbank

## Installation 

### 1. Install and set up Raspbian
A. Download the [Raspberry Imager](https://www.raspberrypi.org/downloads/) software and install Raspbian "A port of Debian with the Raspberry Pi Desktop (Recommended) on your MicroSD Card.\
B. Set up Raspbian\
If you have a monitor, a mouse and a keyboard: Plug the MicroSD Card in the Raspberry Pi 4 and turn it on. Connect them to the Raspberry Pi and configure the OS with the instructions displayed on the screen.\
Else: Configure the OS with [this guide](https://www.jamesfmackenzie.com/2017/01/02/raspberry-pi-headless-rasbian-install/) from step 3.   

### 2. Install piRa1n
Copy and paste the following command into the terminal application and press the enter key.\
`cd /home/pi && git clone https://github.com/raspberryenvoie/piRa1n.git && sudo chmod +x install_piRa1n.sh && ./install_piRa1n.sh`

You're done 👏! Now connect the Raspberry Pi 4 to a power bank. After that, plug you iDevice to the Pi. Put the iDevice in [DFU mode](https://www.reddit.com/r/jailbreak/wiki/dfumode) and let piRa1n do the rest! Carry it anywhere!


