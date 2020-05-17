#!/bin/sh
read -r -p "Do you really want to remove piRa1n? [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
    echo 'Removing piRa1n...'
    sudo systemctl stop piRa1n.service
    sudo systemctl disable piRa1n.service
    sudo rm -rf /lib/systemd/system/piRa1n.service
    sudo systemctl daemon-reload
    rm -rf $HOME/piRa1n/ 
    cd $HOME/
    echo 'piRa1n has been removed.' ;;
    [nN][oO]|[nN])
 echo "piRa1n won't be removed."
       ;;
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac
