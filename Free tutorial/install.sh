#!/bin/bash

clear

red='\033[1;31m'
green='\033[1;32m'
reset='\033[0m'

echo -e "$red"
echo "╔════════════════════════════════════╗"
echo "║     INSTALL PECINTA HPKENTANG      ║"
echo "╚════════════════════════════════════╝"
echo -e "$reset"

sleep 2

echo -e "$green[+] Menginstall package...$reset"
pkg update -y
pkg upgrade -y
pkg install git -y
pkg install figlet -y
pkg install ruby -y
pkg install lolcat -y

echo ""
echo -e "$green[+] Memberi izin file...$reset"
chmod +x banner.sh
chmod +x menu.sh

sleep 2

echo ""
echo -e "$green[✔] Install selesai!$reset"
echo ""
echo "Jalankan tool dengan perintah:"
echo ""
echo "bash menu.sh"
echo ""
