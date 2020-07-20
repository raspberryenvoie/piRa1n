#!/bin/bash
/usr/local/bin/irecovery -c "setenv auto-boot true"
/usr/local/bin/irecovery -c "saveenv"
/usr/local/bin/irecovery -c "reboot"
