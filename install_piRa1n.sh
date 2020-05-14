#!/bin/sh
echo 'Installing piRa1n...make sure you have a working internet connection.'
sudo apt update
sudo apt upgrade -y
sudo apt install usbmuxd -y
wget https://assets.checkra.in/downloads/linux/cli/arm/1ed46fb34c72ee942a1af185fd5347b999f4bba667d594dd56554e3b3d3ea417/checkra1n-armel -O /home/pi/piRa1n/piRa1n #Download Checkra1n
cd $HOME/piRa1n/
sudo chmod +x piRa1n piRa1n.sh update_checkra1n.sh uninstall_piRa1n.sh piRa1n_no_automatic_shutdown.sh piRa1n_automatic_shutdown.sh piRa1n_safe_mode.sh #Make scripts executable
#The following commands will enable piRa1n at startup
echo " [Unit]
 Description=Checkra1n
 After=multi-user.target

 [Service]
 ExecStart=$HOME/piRa1n/piRa1n.sh

 [Install]
 WantedBy=multi-user.target" | sudo tee /lib/systemd/system/piRa1n.service
sudo chmod 644 /lib/systemd/system/piRa1n.service
sudo systemctl daemon-reload
sudo systemctl enable piRa1n.service
echo 'Done! Raspbian will now reboot.\nTo jailbreak your iDevice, put it in DFU mode and plug it to the Pi.\nEnjoy!'
sleep 5
sudo reboot #Reboot Pi
