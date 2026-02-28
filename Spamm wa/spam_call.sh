#!/data/data/com.termux/files/usr/bin/bash

# ==========================================
# Spamm call WhatsApp 
# ==========================================

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
PINK='\033[1;95m'
WHITE='\033[1;37m'
NC='\033[0m'

ADMIN="6285283786794"

logo(){
clear
echo -e "${PINK}"
echo "                    /\_/\                    "
echo "                   / o o \                   "
echo "                  (   \"   )                  "
echo "                   \~(*)~/                   "
echo "                    - ^ -                    "
echo ""
echo "              CAT UNIVERSAL TOOL             "
echo -e "${NC}"
}

logo

# input nomor warna kuning
echo -ne "${YELLOW}Masukkan Nomor Target : ${NC}"
read input

# format nomor
nomor="62$input"

echo ""
echo -e "${CYAN}Menghubungkan ke WhatsApp...${NC}"
sleep 1

TEXT="Target:$nomor"
ENCODE=$(echo "$TEXT" | sed 's/ /%20/g')

am start -a android.intent.action.VIEW \
-d "https://wa.me/$ADMIN?text=$ENCODE"

sleep 6

logo

echo -e "${GREEN} Spamm call aktif ✓${NC}"
echo -e "${WHITE}Target : $nomor${NC}"
echo ""

count=1

# engine warna warni tanpa batas
while true
do

case $((count % 6)) in
0) color=$RED ;;
1) color=$GREEN ;;
2) color=$YELLOW ;;
3) color=$CYAN ;;
4) color=$PINK ;;
5) color=$WHITE ;;
esac

printf "\r${color}[%d] Menjalankan spamm call kenomor %s ...${NC}" "$count" "$nomor"

sleep 0.05
count=$((count+1))

done
