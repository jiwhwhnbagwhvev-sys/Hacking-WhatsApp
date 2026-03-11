#!/data/data/com.termux/files/usr/bin/bash

red='\033[1;31m'
yellow='\033[1;33m'
white='\033[1;37m'
green='\033[1;32m'
reset='\033[0m'

echo ""
echo -e "$yellow━━━━━━━━ MENU PECINTA HP KENTANG ━━━━━━━━$reset"
echo ""
echo -e "$white [1] System Info"
echo -e "$white [2] Run Matrix"
echo -e "$white [3] Scan System"
echo -e "$white [4] Show Skull"
echo -e "$white [0] Exit"
echo ""

read -p "Pilih menu: " pilih

case $pilih in

1)
bash ~/PecintaHPKentang/modules/battery.sh
bash ~/PecintaHPKentang/modules/ram.sh
bash ~/PecintaHPKentang/modules/cpu.sh
;;

2)
bash ~/PecintaHPKentang/scripts/matrix.sh
;;

3)
bash ~/PecintaHPKentang/scripts/scan.sh
;;

4)
bash ~/PecintaHPKentang/assets/skull_pro.sh
;;

0)
echo -e "$red Keluar...$reset"
;;

*)
echo "Menu tidak ada"
;;

esac
