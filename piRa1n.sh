#!/bin/bash
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
    sudo /home/pi/piRa1n/checkra1n -c -E
    echo "Shutting down..."
    sudo /sbin/shutdown now
  else
    sleep 1
  fi
done
