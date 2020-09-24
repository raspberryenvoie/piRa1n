#!/bin/sh
wget -q -T 0.5 -t 1 --spider https://google.com
if [ $? -eq 0 ]; then
  systemctl stop piRa1n.service
  if [ -f /home/pi/piRa1n-web/look_for_updates.sh ]; then
    echo 'Updating, it may take a while...'
    {
      apt-get update
      apt-get upgrade -y
    } > /dev/null
    echo '<br>20%'
    {
      apt-get install git usbmuxd libimobiledevice6 libimobiledevice-utils build-essential checkinstall git autoconf automake libtool-bin libreadline-dev libusb-1.0-0-dev libusbmuxd-tools sshpass -y
      if ! which irecovery >> /dev/null; then
        # Compile libirecovery
        git clone https://github.com/libimobiledevice/libirecovery.git
        cd libirecovery
        ./autogen.sh
        cd /home/pi/libirecovery/
        make
        make install
        ldconfig
        cd /home/pi/
        rm -rf libirecovery/
      fi
    } > /dev/null
    echo '<br>40%'
    cd /home/pi/
    git clone https://github.com/raspberryenvoie/piRa1n-web.git temp/
    mv temp/* piRa1n-web/
    rm -rf temp/
    chown -R pi:pi /home/pi/piRa1n-web/
    chmod -R 755 /home/pi/piRa1n-web/
    cd piRa1n-web/
    cp index.php options.php shutdown.php style.css stylesheet.css update.php update_status.php exit_recovery_mode.php odysseyra1n.php /var/www/html/
    if ! grep -q 'www-data ALL=(ALL) NOPASSWD: /home/pi/piRa1n/exit_recovery_mode.sh' /etc/sudoers; then
      cat /etc/sudoers > /home/pi/sudoers.temp
      sed -i '/End of piRa1n-web/iwww-data ALL=(ALL) NOPASSWD: /home/pi/piRa1n/exit_recovery_mode.sh' /home/pi/sudoers.temp
      if visudo -c -f /home/pi/sudoers.temp > /dev/null 2>&1; then
        cat /home/pi/sudoers.temp > /etc/sudoers
        rm -rf /home/pi/sudoers.temp
      else
        echo 'Failed to modify /etc/sudoers. Run "sudo visudo" and add this line: "www-data ALL=(ALL) NOPASSWD: /home/pi/piRa1n/exit_recovery_mode.sh"'
      fi
    fi
    if ! grep -q 'www-data ALL=(ALL) NOPASSWD: /home/pi/piRa1n/odysseyra1n.sh' /etc/sudoers; then
      cat /etc/sudoers > /home/pi/sudoers.temp
      sed -i '/End of piRa1n-web/iwww-data ALL=(ALL) NOPASSWD: /home/pi/piRa1n/odysseyra1n.sh' /home/pi/sudoers.temp
      if visudo -c -f /home/pi/sudoers.temp > /dev/null 2>&1; then
        cat /home/pi/sudoers.temp > /etc/sudoers
        rm -rf /home/pi/sudoers.temp
      else
        echo 'Failed to modify /etc/sudoers. Run "sudo visudo" and add this line: "www-data ALL=(ALL) NOPASSWD: /home/pi/piRa1n/odysseyra1n.sh"'
      fi
    fi
    if ! grep -q 'www-data ALL=(ALL) NOPASSWD: /home/pi/piRa1n-web/odysseyra1n_done.sh' /etc/sudoers; then
      cat /etc/sudoers > /home/pi/sudoers.temp
      sed -i '/End of piRa1n-web/iwww-data ALL=(ALL) NOPASSWD: /home/pi/piRa1n-web/odysseyra1n_done.sh' /home/pi/sudoers.temp
      if visudo -c -f /home/pi/sudoers.temp > /dev/null 2>&1; then
        cat /home/pi/sudoers.temp > /etc/sudoers
        rm -rf /home/pi/sudoers.temp
      else
        echo 'Failed to modify /etc/sudoers. Run "sudo visudo" and add this line: "www-data ALL=(ALL) NOPASSWD: /home/pi/piRa1n-web/odysseyra1n_done.sh"'
      fi
    fi
    echo '<br>60%'
  else
    apt-get update
    apt-get upgrade -y
    apt-get install git usbmuxd libimobiledevice6 libimobiledevice-utils build-essential checkinstall git autoconf automake libtool-bin libreadline-dev libusb-1.0-0-dev libusbmuxd-tools sshpass -y
    if ! which irecovery >> /dev/null; then
      # Compile libirecovery
      git clone https://github.com/libimobiledevice/libirecovery.git
      cd libirecovery
      ./autogen.sh
      cd /home/pi/libirecovery/
      make
      make install
      ldconfig
      cd /home/pi/
      rm -rf libirecovery/
    fi
  fi
  rm -rf /home/pi/piRa1n/
  cd /home/pi/
  git clone https://github.com/raspberryenvoie/piRa1n.git
  echo '<br>80%'
  cd piRa1n/
  wget https://assets.checkra.in/downloads/linux/cli/arm/d751f4b245bd4071c571654607ca4058e9e7dc4a5fa30639024b6067eebf5c3b/checkra1n -O checkra1n # Download Checkra1n
  chmod +x checkra1n
  chown -R pi:pi /home/pi/piRa1n/
  chmod -R 755 /home/pi/piRa1n/
  rm -rf /lib/systemd/system/piRa1n.service
  {
  echo '[Unit]
Description=piRa1n
After=multi-user.target

[Service]
ExecStart=/home/pi/piRa1n/piRa1n.sh
StandardOutput=file:/var/log/piRa1n.log
StandardError=file:/var/log/piRa1n.log

[Install]
WantedBy=multi-user.target' | tee /etc/systemd/system/piRa1n.service
  } > /dev/null
  chmod 644 /etc/systemd/system/piRa1n.service
  systemctl daemon-reload
  systemctl enable piRa1n.service
  systemctl start piRa1n.service
  echo '<br>100%, done!<br>New: checkra1n 0.11.0 beta.'
else
  echo 'Cannot download updates, you are offline. Try again later!'
fi
