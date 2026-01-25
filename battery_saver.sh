#!/bin/bash
clear
echo "[*] Battery Saver Mode"
su -c "
settings put global low_power 1
"
echo "[✓] Battery saver ON"
read; bash main.sh