#!/data/data/com.termux/files/usr/bin/bash

clear

# warna
red='\033[1;31m'
yellow='\033[1;33m'
green='\033[1;32m'
cyan='\033[1;36m'
reset='\033[0m'

echo -e "$red"
echo "             👑"
echo "        PECINTA HP"
echo "          KENTANG"
echo -e "$reset"

echo ""

echo -e "$yellow=============================="
echo "        SYSTEM INFORMATION"
echo -e "==============================$reset"

echo -e "$green Android  : $(getprop ro.build.version.release)"
echo -e " Device   : $(getprop ro.product.model)"
echo -e " CPU      : $(cat /proc/cpuinfo | grep -m1 Hardware)"
echo -e " Kernel   : $(uname -r)"
echo -e " User     : $(whoami)"
echo -e "$reset"

echo ""

echo -e "$cyan=============================="
echo "        MEMORY INFO"
echo -e "==============================$reset"

free -h

echo ""

echo -e "$yellow=============================="
echo "      WELCOME TO TERMUX"
echo -e "==============================$reset"

echo ""
echo "Pecinta HP Kentang Terminal Ready 🔥"
echo ""
