#!/bin/bash
sudo systemctl stop piRa1n.service
cd /home/pi/
rm -rf odysseyra1n/
mkdir odysseyra1n/
cd odysseyra1n/
wget https://raw.githubusercontent.com/coolstar/Odyssey-bootstrap/master/procursus-deploy-linux-macos.sh -O odysseyra1n.sh
chmod +x odysseyra1n.sh
sed -i 's/.*read -p.*//g' odysseyra1n.sh
sed -i 's/scp -P4444/sshpass -p "alpine" scp -P4444/g' odysseyra1n.sh
sed -i 's/ssh -p4444/sshpass -p "alpine" ssh -p4444/g' odysseyra1n.sh
sed -i 's/curl -L/curl -Lk/g' odysseyra1n.sh
sed -i '/curl -Lk/asleep 5' odysseyra1n.sh
./odysseyra1n.sh
