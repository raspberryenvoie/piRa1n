#!/bin/bash
while true; do
  read -r -p "Auto shutdown [Y/n]: " input
  case $input in
      [yY][eE][sS]|[yY])
        sudo systemctl stop piRa1n.service
        echo "#!/bin/bash
sudo /home/pi/piRa1n/checkra1n -c -E
sudo /sbin/shutdown now" > /home/pi/piRa1n/piRa1n.sh
        break
        ;;
      [nN][oO]|[nN])
        sudo systemctl stop piRa1n.service
        echo "#!/bin/bash
while true
do
  sudo /home/pi/piRa1n/checkra1n -c -E
done" > /home/pi/piRa1n/piRa1n.sh
        break 
        ;;
      *)
        echo "Invalid input..."
        ;;
  esac
done
while true; do
  read -r -p "Safe mode [Y/n]: " input
  case $input in
      [yY][eE][sS]|[yY])
        sed -i 's/^\(.*sudo \/home\/pi\/piRa1n\/checkra1n -c -E\).*$/& -s/g' /home/pi/piRa1n/piRa1n.sh # Add -s argument for safe mode
        break
        ;;
      [nN][oO]|[nN])
        break
        ;;
      *)
        echo "Invalid input..."
        ;;
  esac
done
while true; do
  read -r -p "Verbose boot [Y/n]: " input
  case $input in
      [yY][eE][sS]|[yY])
        sed -i 's/^\(.*sudo \/home\/pi\/piRa1n\/checkra1n -c -E\).*$/& -V/g' /home/pi/piRa1n/piRa1n.sh # Add -v argument for verbose boot
        break
        ;;
      [nN][oO]|[nN])
        break
        ;;
      *)
        echo "Invalid input..."
        ;;
  esac
done
sudo systemctl start piRa1n.service
echo 'The changes have been applied!'
