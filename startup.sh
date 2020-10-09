#!/bin/bash
cat << EOF
#
Starting piRa1n
#
$(< /home/pi/piRa1n/piRa1n.conf)
#
EOF

source /home/pi/piRa1n/piRa1n.conf

checkra1n() {
  echo "Starting checkra1n"
  [[ $Safe_Mode = true ]] && export CHECKRA1N_SAFE_MODE=1
  [[ $Verbose_Boot = true ]] && export CHECKRA1N_VERBOSE_BOOT=1
  /home/pi/piRa1n/checkra1n -c -E
}

shutDownPi() {
  echo "Shutting down"
  /sbin/shutdown now
}

if [[ $Auto_Recovery_Mode = false ]]; then
  # Auto_Recovery_Mode = false
  if [[ $Auto_Shutdown = false ]]; then
    # Auto_Shutdown = false
    while true; do
      checkra1n
      echo "Waiting for the next iDevice..."
    done
  else
    # Auto_Shutdown = true
    checkra1n
    shutDownPi
  fi
else
  # Auto_Recovery_Mode = true
  echo "Waiting for an iDevice..."
  while true; do
    # Enter recovery mode if iDevice is connected
    if idevice_id -l > /dev/null 2>&1 && [[ -n $(idevice_id -l) ]]; then
      echo "Entering recovery mode..."
      ideviceenterrecovery "$(idevice_id -l)"
      sleep 4
    # Check if iDevice is in recovery mode
    elif lsusb | grep -q 'Recovery'; then
      if [[ $idevice_recovery_mode != '1' ]]; then
        idevice_recovery_mode='1'
        echo "iDevice is in recovery mode."
        /usr/local/bin/irecovery -c 'setenv auto-boot true'
        /usr/local/bin/irecovery -c 'saveenv'
      fi
      sleep 16
    # Check if iDevice is in DFU mode
    elif lsusb | grep -q 'DFU'; then
      echo "iDevice is in DFU mode."
      checkra1n
      if [[ $Auto_Shutdown = false ]]; then
        # Auto_Shutdown = false
        echo "Waiting for the next iDevice..."
      else
        # Auto_Shutdown = true
        shutDownPi
      fi
    else
      sleep 1
    fi
  done
fi
