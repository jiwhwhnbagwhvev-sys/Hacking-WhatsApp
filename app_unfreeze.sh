#!/bin/bash
clear
read -p "Package name: " pkg
su -c "pm enable $pkg"
echo "[✓] App unfrozen"
read; bash main.sh