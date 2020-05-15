#!/bin/sh
echo 'Restoring the default behavior...'
sudo service piRa1n stop
echo "#!/bin/sh
sudo $HOME/piRa1n/piRa1n -c -E
sudo /sbin/shutdown now" > piRa1n.sh
sudo service piRa1n start
echo 'Done!'
