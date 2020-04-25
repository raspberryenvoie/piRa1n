#!/bin/sh
read -p 'Make sure you have a working internet connection.\nGo to checkra.in/releases/#all-downloads, copy and past here the download link for Linux (CLI, arm) and hit enter: ' link
echo 'Updating Checkra1n...'
wget $link -O /home/pi/piRa1n/piRa1n
echo 'Done!'
