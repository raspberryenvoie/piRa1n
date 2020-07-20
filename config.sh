#!/bin/bash
while true; do
  read -r -p 'Auto recovery mode (recommended unless it causes issues) [Y/n]: ' input_autoRecoveryMode
  case $input_autoRecoveryMode in
      [yY][eE][sS]|[yY])
        sudo systemctl stop piRa1n.service
        echo '#!/bin/bash
echo "Waiting for an iDevice..."
while true; do
  if idevice_id -l > /dev/null 2>&1 && [[ ! -z $(idevice_id -l) ]]; then
    ideviceenterrecovery $(idevice_id -l)
    sleep 4
  elif lsusb | grep -q "Recovery"; then
    echo "Device is in recovery mode."
    /usr/local/bin/irecovery -c "setenv auto-boot true"
    /usr/local/bin/irecovery -c "saveenv"
    sleep 13
  elif lsusb | grep -q "DFU"; then
    echo "Device is in DFU mode."
    sudo /home/pi/piRa1n/checkra1n -c -E' > /home/pi/piRa1n/piRa1n.sh
        break
        ;;
      [nN][oO]|[nN])
        sudo systemctl stop piRa1n.service
        echo > /home/pi/piRa1n/piRa1n.sh
        break
        ;;
      *)
        echo 'Invalid input...'
        ;;
  esac
done
while true; do
  read -r -p 'Auto shutdown [Y/n]: ' input_autoShutdown
  case $input_autoShutdown in
      [yY][eE][sS]|[yY])
        if grep -q 'ideviceenterrecovery' /home/pi/piRa1n/piRa1n.sh; then
          echo '    echo "Shutting down..."
    sudo /sbin/shutdown now
  else
    sleep 1
  fi
done' >> /home/pi/piRa1n/piRa1n.sh
        else
          echo '#!/bin/bash
sudo /home/pi/piRa1n/checkra1n -c -E
sudo /sbin/shutdown now' > /home/pi/piRa1n/piRa1n.sh
        fi
        break
        ;;
      [nN][oO]|[nN])
        if grep -q 'ideviceenterrecovery' /home/pi/piRa1n/piRa1n.sh; then
          echo "    echo 'Waiting for the next iDevice...'
  else
    sleep 1
  fi
done" >> /home/pi/piRa1n/piRa1n.sh
        else
          echo "#!/bin/bash
while true
do
  sudo /home/pi/piRa1n/checkra1n -c -E
done" > /home/pi/piRa1n/piRa1n.sh
        fi
        break
        ;;
      *)
        echo 'Invalid input...'
        ;;
  esac
done
while true; do
  read -r -p 'Safe mode [Y/n]: ' input_safeMode
  case $input_safeMode in
      [yY][eE][sS]|[yY])
        sed -i 's/^\(.*sudo \/home\/pi\/piRa1n\/checkra1n -c -E\).*$/& -s/g' /home/pi/piRa1n/piRa1n.sh # Add -s argument for safe mode
        break
        ;;
      [nN][oO]|[nN])
        break
        ;;
      *)
        echo 'Invalid input...'
        ;;
  esac
done
while true; do
  read -r -p 'Verbose boot [Y/n]: ' input_verbose
  case $input_verbose in
      [yY][eE][sS]|[yY])
        sed -i 's/^\(.*sudo \/home\/pi\/piRa1n\/checkra1n -c -E\).*$/& -V/g' /home/pi/piRa1n/piRa1n.sh # Add -v argument for verbose boot
        break
        ;;
      [nN][oO]|[nN])
        break
        ;;
      *)
        echo 'Invalid input...'
        ;;
  esac
done
sudo systemctl start piRa1n.service
echo 'The changes have been applied!'
