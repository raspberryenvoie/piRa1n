#!/bin/bash
wget -q --spider https://google.com
if [ $? -eq 0 ]; then
  if [ -f /home/pi/piRa1n-web/look_for_updates.sh ]; then
    echo $'<p>In the meantime, look <a href="https://github.com/raspberryenvoie/piRa1n/blob/master/CHANGELOG.MD">what\'s new</a>. TL;DR:</p>'
    {
      sudo apt-get update
      sudo apt-get upgrade -y 
     } > /dev/null
    sudo wget 
    sudo wget https://raw.githubusercontent.com/raspberryenvoie/piRa1n-web/master/index.php -O /var/www/html/index.php
  else
    sudo apt-get update
    sudo apt-get upgrade -y
  fi
  sudo systemctl stop piRa1n.service
  sudo mv /home/pi/piRa1n/piRa1n.sh /home/pi/piRa1n.sh.backup
  sudo rm -rf /home/pi/piRa1n/
  cd /home/pi/
  sudo git clone https://github.com/raspberryenvoie/piRa1n.git
  sudo mv /home/pi/piRa1n.sh.backup /home/pi/piRa1n/piRa1n.sh
  cd piRa1n/
  sudo wget https://assets.checkra.in/downloads/linux/cli/arm/dde0ee4255403a427636bb76e09e409487f8be128af4b7d89fac78548bd5b35a/checkra1n -O piRa1n # Download Checkra1n
  sudo chmod +x piRa1n
  sudo chown -R pi:pi /home/pi/piRa1n/
  sudo chmod -R 755 /home/pi/piRa1n/
  sudo systemctl start piRa1n.service
  # echo 'Updates completed, you're ready to jailbreak iOS 14! You can shut down your Pi.'
  echo 'Updates completed.'
else
  echo 'Cannot download updates, you are offline. Try again!'
fi
