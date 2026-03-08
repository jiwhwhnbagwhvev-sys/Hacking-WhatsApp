#!/bin/bash

red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
reset='\033[0m'

clear
bash banner.sh

echo -e "$yellow"
echo "╔══════════════════════════════╗"
echo "║           MAIN MENU          ║"
echo "╚══════════════════════════════╝"
echo -e "$reset"

echo -e "$green[1] Jalankan Tool"
echo -e "[2] Update Tool"
echo -e "[3] Info Author"
echo -e "[4] Exit$reset"

echo ""
read -p "Pilih menu : " menu

if [ $menu = 1 ]
then
echo "Menjalankan Tool..."
sleep 2
fi

if [ $menu = 2 ]
then
echo "Updating..."
git pull
fi

if [ $menu = 3 ]
then
echo ""
echo "Author  : Pecinta hpkentang"
echo "YouTube : Pecinta hpkentang"
echo "Version : 1.0"
fi

if [ $menu = 4 ]
then
exit
fi
