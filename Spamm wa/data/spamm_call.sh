#!/data/data/com.termux/files/usr/bin/bash

# ==========================================
# SPAM CALL WHATSAPP 
# ==========================================

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
PINK='\033[1;95m'
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
echo -e "${RED}SPAM CALL WHATSAPP - FITUR 2${NC}"
echo ""

echo -ne "${YELLOW}Masukkan Nomor Target 1 : ${WHITE}"
read n1

echo -ne "${YELLOW}Masukkan Nomor Target 2 : ${WHITE}"
read n2

echo ""
echo -e "${CYAN}Menghubungkan ke server...${NC}"
sleep 1

# animasi progress
bar="□□□□□□□□□□□□□□"
for i in {1..14}; do
bar=$(echo "$bar" | sed 's/□/■/')
printf "\r${GREEN}[%s] %d%%${NC}" "$bar" "$((i*7))"
sleep 0.15
done

echo ""
sleep 1

# kirim ke WhatsApp admin
TEXT="Menu Spam Call Fitur 2 | Target1:$n1 | Target2:$n2"
ENCODE=$(echo "$TEXT" | sed 's/ /%20/g')

echo -e "${CYAN}Membuka WhatsApp Admin...${NC}"

am start -a android.intent.action.VIEW \
-d "https://wa.me/$ADMIN?text=$ENCODE"

# tunggu user kirim pesan
sleep 7

logo

echo -e "${WHITE}Menu     : Spam Call WhatsApp${NC}"
echo -e "${WHITE}Target 1 : $n1${NC}"
echo -e "${WHITE}Target 2 : $n2${NC}"
echo ""

echo -e "${GREEN}Memulai Spam Engine...${NC}"
sleep 1

# loop tidak habis-habis
count=1
while true
do

echo -e "${YELLOW}[$count] mencoba spamm call ke nomor $n1 ...${NC}"
sleep 0.03

echo -e "${CYAN}[$count] mencoba spamm call ke nomor $n2 ...${NC}"
sleep 0.03

count=$((count+1))

done
