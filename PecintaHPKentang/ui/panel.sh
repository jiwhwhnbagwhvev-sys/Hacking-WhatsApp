#!/data/data/com.termux/files/usr/bin/bash

white='\033[1;37m'
reset='\033[0m'

echo -e "$white"

echo "╔══════════════════════════════════════════════╗"
echo "║                 SYSTEM INFO                  ║"
echo "╠══════════════════════════════════════════════╣"
echo "║                                              ║"

echo "║  Android : $(getprop ro.build.version.release)                         ║"
echo "║  Device  : $(getprop ro.product.model)            ║"
echo "║  Kernel  : $(uname -r)                 ║"
echo "║  User    : $(whoami)                           ║"

echo "║                                              ║"
echo "╚══════════════════════════════════════════════╝"

echo -e "$reset"
