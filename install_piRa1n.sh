#!/bin/bash
# Made with ♥️ by raspberryenvoie
echo 'Installing piRa1n...make sure you have a working internet connection.'
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install git usbmuxd libimobiledevice6 libimobiledevice-utils build-essential checkinstall git autoconf automake libtool-bin libreadline-dev libusb-1.0-0-dev libusbmuxd-tools -y
cd /home/pi/
# Compile libirecovery
git clone https://github.com/libimobiledevice/libirecovery.git
cd libirecovery
./autogen.sh
cd /home/pi/libirecovery/
make
sudo make install
sudo ldconfig
cd /home/pi/
rm -rf libirecovery/
git clone https://github.com/raspberryenvoie/piRa1n.git
cd piRa1n/
wget https://assets.checkra.in/downloads/linux/cli/arm/dde0ee4255403a427636bb76e09e409487f8be128af4b7d89fac78548bd5b35a/checkra1n -O checkra1n # Download Checkra1n
chmod +x checkra1n
# The following commands will enable piRa1n at startup
echo '[Unit]
Description=piRa1n
After=multi-user.target

[Service]
ExecStart=/home/pi/piRa1n/piRa1n.sh
StandardOutput=file:/var/log/piRa1n.log
StandardError=file:/var/log/piRa1n.log

[Install]
WantedBy=multi-user.target' | sudo tee /etc/systemd/system/piRa1n.service
sudo chmod 644 /etc/systemd/system/piRa1n.service
sudo systemctl daemon-reload
sudo systemctl enable piRa1n.service
echo 'Done, the system will reboot. Enjoy!'
sleep 5
sudo reboot
