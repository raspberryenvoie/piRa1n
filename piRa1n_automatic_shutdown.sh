#!/bin/sh
echo 'Restoring the default behavior...'
sudo service piRa1n stop
echo '#!/bin/sh
sudo /home/pi/piRa1n/piRa1n -c -V -E
sudo /sbin/shutdown now' > piRa1n.sh
sudo service piRa1n start
echo 'Done!'
