#!/bin/bash
# Made with ♥️ by raspberryenvoie
echo 'Installing piRa1n...make sure you have a working internet connection.'
sudo apt update
sudo apt upgrade -y
sudo apt install git usbmuxd -y
cd /home/pi/
git clone https://github.com/raspberryenvoie/piRa1n.git
cd piRa1n/
wget https://assets.checkra.in/downloads/linux/cli/arm/dde0ee4255403a427636bb76e09e409487f8be128af4b7d89fac78548bd5b35a/checkra1n -O piRa1n # Download Checkra1n
chmod +x piRa1n
# The following commands will enable piRa1n at startup
echo "[Unit]
Description=Checkra1n
After=multi-user.target

[Service]
ExecStart=/home/pi/piRa1n/piRa1n.sh

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/piRa1n.service
sudo chmod 644 /etc/systemd/system/piRa1n.service
sudo systemctl daemon-reload
sudo systemctl enable piRa1n.service
echo 'Done, Raspbian will now reboot. Enjoy!'
sleep 5
sudo reboot
