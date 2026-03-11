#!/data/data/com.termux/files/usr/bin/bash

green='\033[1;32m'
red='\033[1;31m'
white='\033[1;37m'
reset='\033[0m'

echo ""
echo -e "$green"

echo "⚙️  🔋  📶  📱  ⏱  💾  🔌"

echo -e "$reset"

echo -e "$red"
echo "● ● ● ● ● ● ● ● ● ●"
echo -e "$reset"

echo ""

echo -e "$white Android  : $(getprop ro.build.version.release) aarch64"
echo " Device   : $(getprop ro.product.model)"
echo " Uptime   : $(uptime -p)"
echo " Shell    : $SHELL"
echo " CPU      : $(cat /proc/cpuinfo | grep -m1 MHz)"
echo ""

echo " RAM      : $(free -m | awk '/Mem:/ {print $3 \"MB / \" $2 \"MB\"}')"

echo ""

echo " Date     : $(date)"
echo ""

echo " Github   : https://github.com"
