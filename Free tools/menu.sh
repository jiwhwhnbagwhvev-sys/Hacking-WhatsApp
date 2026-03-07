clear

figlet -f slant "HPKentang" | lolcat
figlet -f small "TOOL UPDATE" | lolcat
echo ""

echo -e "\e[33m======================================="
echo "        PECINTA HPKENTANG TOOL"
echo "======================================="
echo ""

echo "1. Cek IP Address"
echo "2. Info HP Android"
echo "0. Keluar"
echo ""

read -p "Pilih Menu : " menu

if [ $menu = 1 ]
then
bash cekip.sh
fi

if [ $menu = 2 ]
then
bash infohp.sh
fi

if [ $menu = 0 ]
then
exit
fi
