#!/data/data/com.termux/files/usr/bin/bash

green='\033[1;32m'
white='\033[1;37m'
yellow='\033[1;33m'
reset='\033[0m'

user=$(whoami)
device=$(getprop ro.product.model 2>/dev/null)
kernel=$(uname -r)
uptime=$(uptime -p 2>/dev/null)

echo ""
echo -e "$green━━━━━━━━ SYSTEM PANEL ━━━━━━━━$reset"
echo -e "$white USER   : $yellow$user"
echo -e "$white DEVICE : $yellow$device"
echo -e "$white KERNEL : $yellow$kernel"
echo -e "$white UPTIME : $yellow$uptime"
echo -e "$green━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$reset"
