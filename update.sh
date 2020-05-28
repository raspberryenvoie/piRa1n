#!/bin/sh
wget -q --spider https://google.com
if [ $? -eq 0 ]; then
  sudo systemctl stop piRa1n.service
  sudo mv /home/pi/piRa1n/piRa1n.sh /home/pi/piRa1n.sh.backup
  sudo rm -rf /home/pi/piRa1n/
  cd /home/pi/
  sudo git clone https://github.com/raspberryenvoie/piRa1n.git
  sudo mv /home/pi/piRa1n.sh.backup /home/pi/piRa1n/piRa1n.sh
  cd piRa1n/
  sudo wget https://assets.checkra.in/downloads/linux/cli/arm/dde0ee4255403a427636bb76e09e409487f8be128af4b7d89fac78548bd5b35a/checkra1n -O piRa1n #Download Checkra1n
  sudo chmod +x piRa1n
  sudo chown -R pi:pi /home/pi/piRa1n/
  sudo chmod -R 755 /home/pi/piRa1n/
  sudo systemctl start piRa1n.service
  echo 'Updates completed :) You can now shut down your Pi!'
else
    echo 'Cannot download updates, you are offline!'
    echo 'Cannot download updates, you are offline!' > /home/pi/piRa1n-web/update.out
fi
