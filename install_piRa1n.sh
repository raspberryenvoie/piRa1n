#!/bin/bash
[[ $EUID -ne 0 ]] && { echo 'Please run as root'; exit 1; }

echo -e "\033[0;32m#####################################"
echo -e "\033[0;32m#                                   #\033[0m"
echo -e "\033[0;32m#  \033[0;36mWelcome to the piRa1n installer  \033[0;32m#\033[0m"
echo -e "\033[0;32m#      \033[0;36mMade by raspberryenvoie      \033[0;32m#\033[0m"
echo -e "\033[0;32m#                                   #\033[0m"
echo -e "\033[0;32m#####################################\033[0m"

# Create a new pi user if it doesn't exist
if ! id -u pi >/dev/null 2>&1; then
  adduser --disabled-password --gecos "" pi
  password="$(openssl rand -base64 30)"
  echo "pi:${password}" | chpasswd
  unset password
fi

# Update the system and install the dependencies
apt-get update
apt-get upgrade -y
apt-get install -y git usbmuxd libimobiledevice6 libimobiledevice-utils \
build-essential checkinstall git autoconf automake libtool-bin libreadline-dev \
libusb-1.0-0-dev libusbmuxd-tools sshpass
# Compile libirecovery
git clone https://github.com/libimobiledevice/libirecovery.git /home/pi/libirecovery
cd /home/pi/libirecovery/
./autogen.sh
cd /home/pi/libirecovery/
make
make install
ldconfig
cd /home/pi/
rm -rf libirecovery/

# Install piRa1n
git clone https://github.com/raspberryenvoie/piRa1n.git

# Create file with version of checkra1n
cd /home/pi/piRa1n/
./checkra1n --version > checkra1n_version 2>&1
# Keep only second line
sed -i -n -e 2p checkra1n_version
# Remove '# '
sed -i 's/# //g' checkra1n_version
# Lower case
sed -i 's/\(.*\)/\L\1/' checkra1n_version
cd -

# Fix file permissions
chown -R pi:pi /home/pi/piRa1n/
chmod -R 755 /home/pi/piRa1n/

# Enable piRa1n at startup
cat << EOF > /etc/systemd/system/piRa1n.service
[Unit]
Description=piRa1n
After=multi-user.target

[Service]
ExecStart=/home/pi/piRa1n/startup.sh

[Install]
WantedBy=multi-user.target
EOF
chmod 644 /etc/systemd/system/piRa1n.service
systemctl daemon-reload
systemctl enable piRa1n.service
systemctl start piRa1n.service
