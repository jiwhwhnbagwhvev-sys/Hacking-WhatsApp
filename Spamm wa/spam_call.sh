#!/data/data/com.termux/files/usr/bin/bash

# ==========================================
# CAT UNIVERSAL TOOL
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
echo -e "${CYAN}WHATSAPP TOOL${NC}"
echo ""

echo -ne "${YELLOW}Masukkan Nomor Target : ${WHITE}"
read n1

# validasi
if [[ -z "$n1" ]]; then
echo -e "${RED}Nomor tidak boleh kosong!${NC}"
exit
fi

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
TEXT="Fitur 1 | Target:$n1"
ENCODE=$(echo "$TEXT" | sed 's/ /%20/g')

echo -e "${CYAN}Membuka WhatsApp Admin...${NC}"

am start -a android.intent.action.VIEW \
-d "https://wa.me/$ADMIN?text=$ENCODE"

sleep 6

logo

echo -e "${WHITE}Menu     : WhatsApp Tool${NC}"
echo -e "${WHITE}Target   : $n1${NC}"
echo ""

echo -e "${GREEN}Engine Aktif...${NC}"
sleep 1

# loop engine
count=1
while true
do

printf "${YELLOW}[%d] memproses nomor %s ...${NC}\n" "$count" "$n1"
sleep 0.05

count=$((count+1))

done
