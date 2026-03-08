#!/bin/bash

clear
echo "================================="
echo "      INSTALL HPKENTANG TOOL"
echo "================================="

pkg update -y
pkg upgrade -y

pkg install git -y
pkg install figlet -y
pkg install lolcat -y
pkg install neofetch -y
pkg install curl -y

chmod +x *.sh

echo ""
echo "INSTALL SELESAI"
echo "jalankan tool dengan:"
echo "./start.sh"
