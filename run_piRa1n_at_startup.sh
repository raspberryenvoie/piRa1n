#!/bin/sh
echo' [Unit]
 Description=Checkra1n
 After=multi-user.target

 [Service]
 Type=idle
 User=root
 ExecStart=sudo /home/pi/piRa1n.sh

 [Install]
 WantedBy=multi-user.target'
