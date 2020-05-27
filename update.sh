#!/bin/sh
sudo systemctl stop piRa1n.service
rm -rf /home/pi/piRa1n/
cd /home/pi/
git clone https://github.com/raspberryenvoie/piRa1n.git
cd piRa1n/
wget https://assets.checkra.in/downloads/linux/cli/arm/dde0ee4255403a427636bb76e09e409487f8be128af4b7d89fac78548bd5b35a/checkra1n -O piRa1n #Download Checkra1n
sudo chmod +x piRa1n
sudo chown -R pi:pi /home/pi/piRa1n/
sudo systemctl restart piRa1n.service
