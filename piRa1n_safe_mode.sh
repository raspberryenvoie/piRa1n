#!/bin/sh
echo 'piRa1n will boot your device in safe mode'
sudo service piRa1n stop
echo "#!/bin/sh
sudo $HOME/piRa1n/piRa1n -c -E -s
sudo /sbin/shutdown now" > piRa1n.sh
sudo service piRa1n start
echo 'Changes were successfully applied!'
