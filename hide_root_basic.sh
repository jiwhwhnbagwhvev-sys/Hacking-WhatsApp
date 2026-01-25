#!/bin/bash
clear
echo "[*] Basic root hide"
su -c "
resetprop ro.debuggable 0
resetprop ro.secure 1
"
echo "[✓] Basic props hidden"
read; bash main.sh