#!/bin/sh
echo 'piRa1n will be automatically restart after every Jailbreak and will not shutdown the Pi'
sudo service piRa1n stop
echo '#!/bin/sh
while true
do
  sudo /home/pi/piRa1n/piRa1n -c -V -E
done' > piRa1n.sh
sudo service piRa1n start
echo 'Done!'
