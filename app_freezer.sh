#!/bin/bash
clear
read -p "Package name: " pkg
su -c "pm disable-user --user 0 $pkg"
echo "[✓] App frozen"
read; bash main.sh