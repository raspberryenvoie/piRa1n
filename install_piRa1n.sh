#!/bin/sh
echo "Installing piRa1n...make sure you have a working internet connection."
wget https://assets.checkra.in/downloads/linux/cli/arm64/ed074035bea72ae6a15a37c5900ed5bb4d0a74ccca5bc8c02f4575b45daecc3e/checkra1n-aarch64 -O /home/pi/piRa1n
sudo chmod +x /home/pi/piRa1n
echo "Done!"
