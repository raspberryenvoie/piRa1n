#!/bin/sh
echo 'Installing piRa1n...make sure you have a working internet connection.'
wget https://assets.checkra.in/downloads/linux/cli/arm/1ed46fb34c72ee942a1af185fd5347b999f4bba667d594dd56554e3b3d3ea417/checkra1n-armel -O /home/pi/piRa1n/piRa1n #Download Checkra1n
sudo chmod +x /home/pi/piRa1n/piRa1n #Make script executable
sudo chmod +x /home/pi/piRa1n/piRa1n.sh #Make script executable
#The following commands will enable piRa1n at startup
sudo echo' [Unit]
 Description=Checkra1n
 After=multi-user.target

 [Service]
 Type=idle
 User=root
 ExecStart=sudo /home/pi/piRa1n/piRa1n.sh

 [Install]
 WantedBy=multi-user.target' > /lib/systemd/system/piRa1n.service
sudo chmod 644 /lib/systemd/system/piRa1n.service
sudo systemctl daemon-reload
sudo systemctl enable piRa1n.service
echo 'Done! Raspbian will now reboot.\nTo jailbreak your iDevice, put it in DFU mode and plug it to the Pi.'
sleep 3
sudo reboot #Reboot Pi
