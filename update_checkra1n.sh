#!/bin/sh
echo 'Make sure you have a working internet connection.'
read -p 'Go to checkra.in/releases/#all-downloads, copy and past here the download link for Linux (CLI, arm) and hit enter: ' link
echo 'Updating Checkra1n...'
sudo service piRa1n stop
if command ; then
    wget $link -O $HOME/piRa1n/piRa1n
    chmod +x $HOME/piRa1n/piRa1n
    sudo service piRa1n start
    echo 'Done!'
else
    echo "Invalid URL"
fi
