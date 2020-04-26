# piRa1n is an easy way to create a portable CheckRa1n dongle.
If you want to jailbreak your iDevice and you do not have access to your computer, you can create your own box with a Raspberry Pi 4 and carry it anywhere, you just have to connect it to a power bank.\
[Demo of piRa1n](https://youtu.be/lqGb8SG-VII)
![piRa1n](https://github.com/raspberryenvoie/piRa1n/blob/master/piRa1n.jpg)

**This only works with a Raspberry Pi 4! Other versions of the Raspberry Pi will not work. It also works with the Banana pi M2 Zero (tested by [u/gilshahar7 on Reddit](https://www.reddit.com/user/gilshahar7/).**

## ⚠️ Disclaimer
If you use piRa1n please note that I am in no way responsible for any damage to your devices.

## How does it work?
piRa1n jailbreaks your iDevice using [Checkra1n](https://checkra.in/).

Connect the Raspberry Pi 4 to a powerbank. After that, plug you iDevice to the Pi. Put the iDevice in DFU mode and let piRa1n do the rest!

## Parts list
- a Raspberry Pi 4 with either 1GB, 2GB, 4GB of RAM (1GB of RAM is enough and cheaper so I recommend the 1GB version).
- a USB to USB Type-C cable
- a USB to lightning cable
- a powerbank (For better performances, make sure it supports 5V/3A output.)
- a MicroSD Card of at least 8GB

## Installation 

### 1. Install and set up Raspbian
A. Download the [Raspberry Imager](https://www.raspberrypi.org/downloads/) software and install Raspbian "A port of Debian with the Raspberry Pi Desktop (Recommended)" on your MicroSD Card.

B. Set up Raspbian\
If you have a monitor, a mouse and a keyboard: Plug the MicroSD Card in the Raspberry Pi 4 and turn it on. Connect them to the Raspberry Pi and configure the OS with the instructions displayed on the screen.

Else: Configure the OS with [this guide](https://www.jamesfmackenzie.com/2017/01/02/raspberry-pi-headless-rasbian-install/) from step 3 (Don't forget to change the password).

### 2. Install piRa1n
Copy and paste the following command into the terminal application and press the enter key.\
`cd /home/pi && git clone https://github.com/raspberryenvoie/piRa1n.git && cd piRa1n && sudo chmod +x install_piRa1n.sh && ./install_piRa1n.sh`

You're done 👏!\
⚠️ Before jailbreaking your device, make an [iCloud/iTunes backup](https://support.apple.com/en-us/HT203977).\
You want to jailbreak? Connect the Raspberry Pi 4 to a power bank. After that, plug you iDevice to the Pi. Put the iDevice in [DFU mode](https://www.reddit.com/r/jailbreak/wiki/dfumode) and let piRa1n do the rest! Once your iDevice is jailbroken, the Pi will be shutdown. You can unplug the Pi from the power bank. Carry it anywhere!

## How to update Checkra1n?
If your piRa1n box is connected to the Internet and a new version of Checkra1n is available, you can install it by executing this command:
`cd /home/pi/piRa1n && ./update_checkra1n.sh`

## You don't want the Pi to shutdown after every Jailbreak?
piRa1n will automatically restart after every Jailbreak and won't shutdown the Pi. Run this command: `cd /home/pi/piRa1n && ./piRa1n_no_automatic_shutdown.sh`.

If you want to restore the default behavior (automatically shutdown Pi after every Jailbreak): `cd /home/pi/piRa1n && ./piRa1n_automatic_shutdown.sh`.

## Uninstall piRa1n
Execute this command: `cd /home/pi/piRa1n && ./uninstall_piRa1n.sh`

## Debug:
### Having issues? Try to reinstall piRa1n
Run this command: `cd /home/pi/ && rm -rf piRa1n/`\
Then run the command in the [Install piRa1n section](https://github.com/raspberryenvoie/piRa1n#2-install-pira1n).

### Having issues while using piRa1n on a Banana pi M2 Zero
Try to run this command: `sudo systemctl stop hciuart && sudo systemctl disable hciuart`
Note this command will disable the Bluetooth on your Banana pi M2 Zero.

### Check this post on reddit, someone maybe has the same issue as you

### Open an Issue [here](https://github.com/raspberryenvoie/piRa1n/issues/new)
