#!/data/data/com.termux/files/usr/bin/bash

# ==========================================
# SPAM CHAT WHATSAPP
# ==========================================

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
PINK='\033[1;95m'
NC='\033[0m'

ADMIN="6281385998324"

logo(){
clear
echo -e "${PINK}"
echo "                       /\_/\                    "
echo "                      / o o \                   "
echo "                     (   \"   )                  "
echo "                      \~(*)~/                   "
echo "                       - ^ -                    "
echo ""
echo "              Sepamm Chat WhatsApp v4.0     "
echo -e "${NC}"
}

# ===============================
# DETEKSI WAKTU
# ===============================

jam=$(date +"%H")

if [ $jam -ge 5 ] && [ $jam -lt 11 ]; then
salam="Selamat Pagi ☀️ Awan ceria!"
elif [ $jam -ge 11 ] && [ $jam -lt 17 ]; then
salam="Selamat Siang ☀️ Matahari terang!"
else
salam="Selamat Malam 🌙 Bulan gelap!"
fi

# ===============================
# DETEKSI OPERATOR
# ===============================

deteksi_operator(){

prefix=${1:0:3}

case $prefix in
811|812|813|821|822|823|852|853)
echo "Telkomsel"
;;
817|818|819|859|877|878)
echo "XL"
;;
831|832|833|838)
echo "Axis"
;;
856|857)
echo "Indosat"
;;
881|882|883|887|888)
echo "Smartfren"
;;
*)
echo "Operator tidak diketahui"
;;
esac
echo -e "\nOperator : ${GREEN}$operator${NC}"
echo -e "${RED}Warning: gunakan dengan bijak${NC}"
}

logo
echo -e "${RED}SPAM CHAT WHATSAPP - FITUR 2${NC}"
echo ""

echo -ne "${YELLOW}Masukkan Nomor Target : ${WHITE}"
read nomor

echo ""
echo -e "${CYAN}Menghubungkan ke server...${NC}"
sleep 20

echo ""
echo -e "${CYAN}Mendeteksi operator nomor...${NC}"
sleep 10

operator=$(deteksi_operator $nomor)

echo -e "${GREEN}Operator : $operator${NC}"
echo -e "${YELLOW}$salam${NC}"
echo ""
sleep 5

# animasi progress
bar="□□□□□□□□□□□□□□"
for i in {1..14}; do
bar=$(echo "$bar" | sed 's/□/■/')
printf "\r${WHITE}[%s] %d%%${NC}" "$bar" "$((i*7))"
sleep 0.15
done

echo ""
sleep 1

# kirim ke WhatsApp admin
TEXT="Menu Spam Chat Fitur 2 | Target:$nomor"
ENCODE=$(echo "$TEXT" | sed 's/ /%20/g')

echo -e "${CYAN}Membuka WhatsApp Admin...${NC}"

am start -a android.intent.action.VIEW \
-d "https://wa.me/$ADMIN?text=$ENCODE"

# tunggu kirim pesan
sleep 7

logo

echo -e "${WHITE}Menu   : Spam Chat WhatsApp${NC}"
echo -e "${WHITE}Target : $nomor${NC}"
echo ""

echo -e "${GREEN}Memulai Spam Engine...${NC}"
sleep 1

# loop tidak habis
count=1
while true
do

echo -e "${PINK}[$count] mencoba spamm chat ke nomor $nomor ...${NC}"
sleep 0.03

count=$((count+1))

done
