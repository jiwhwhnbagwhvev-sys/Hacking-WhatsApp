#!/bin/bash
clear
echo "1 Reboot"
echo "2 Reboot Recovery"
echo "3 Reboot Bootloader"
read -p "> " r

case $r in
1) su -c reboot ;;
2) su -c reboot recovery ;;
3) su -c reboot bootloader ;;
esac