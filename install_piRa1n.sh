#!/bin/sh
# Made by raspberryenvoie
echo 'Installing piRa1n...make sure you have a working internet connection.'
sudo apt update
sudo apt upgrade -y
sudo apt install usbmuxd -y
wget https://assets.checkra.in/downloads/linux/cli/arm/dde0ee4255403a427636bb76e09e409487f8be128af4b7d89fac78548bd5b35a/checkra1n -O $HOME/piRa1n/piRa1n #Download Checkra1n
cd $HOME/piRa1n/
echo "#!/bin/sh
sudo $HOME/piRa1n/piRa1n -c -E
sudo /sbin/shutdown now" > piRa1n.sh
chmod +x piRa1n piRa1n.sh #Make scripts executable
sed -i "s|replaceMeByHomeDirectory|$HOME|g" $HOME/piRa1n/config.sh
sed -i "s|replaceMeByHomeDirectory|$HOME|g" $HOME/piRa1n/update.sh
if id pira1n > /dev/null 2>&1; then
  username=pira1n
elif id pi > /dev/null 2>&1; then
  username=pi
fi
sed -i "s|replaceMebyUsername|$username|g" $HOME/piRa1n/update.sh
#The following commands will enable piRa1n at startup
echo " [Unit]
 Description=Checkra1n
 After=multi-user.target

 [Service]
 ExecStart=$HOME/piRa1n/piRa1n.sh

 [Install]
 WantedBy=multi-user.target" | sudo tee /etc/systemd/system/piRa1n.service
sudo chmod 644 /etc/systemd/system/piRa1n.service
sudo systemctl daemon-reload
sudo systemctl enable piRa1n.service
echo 'Done! Raspbian will now reboot.\nTo jailbreak your iDevice, put it in DFU mode and plug it to the Pi.\nEnjoy!'
sleep 5
sudo reboot #Reboot Pi
