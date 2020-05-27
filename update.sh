#!/bin/sh
sudo systemctl stop piRa1n.service
rm -rf replaceMeByHomeDirectory/piRa1n/
git clone https://github.com/raspberryenvoie/piRa1n.git
wget https://assets.checkra.in/downloads/linux/cli/arm/dde0ee4255403a427636bb76e09e409487f8be128af4b7d89fac78548bd5b35a/checkra1n -O replaceMeByHomeDirectory/piRa1n/piRa1n #Download Checkra1n
sudo chmod +x replaceMeByHomeDirectory/piRa1n/piRa1n
sudo chown -R replaceMebyUsername:replaceMebyUsername replaceMeByHomeDirectory/piRa1n/
sudo systemctl restart piRa1n.service
