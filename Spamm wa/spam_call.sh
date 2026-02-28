#!/data/data/com.termux/files/usr/bin/bash

# ==========================================
# Spamm calll WhatsApp 
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
echo "               WhatsApp Tools               "
echo -e "${NC}"
}

# validasi nomor
validasi(){
if [[ -z "$1" ]]; then
echo -e "${RED}Nomor tidak boleh kosong!${NC}"
sleep 2
exit
fi

if [[ ! "$1" =~ ^[0-9]+$ ]]; then
echo -e "${RED}Nomor harus angka!${NC}"
sleep 2
exit
fi
}

logo
echo -e "${CYAN}WHATSAPP ENGINE - FITUR 2${NC}"
echo ""

echo -ne "${YELLOW}Masukkan Nomor Target : ${WHITE}"
read nomor

validasi "$nomor"

echo ""
echo -e "${CYAN}Menghubungkan ke server WhatsApp...${NC}"
sleep 1

# progress bar
bar="□□□□□□□□□□□□□□"
for i in {1..14}; do
bar=$(echo "$bar" | sed 's/□/■/')
printf "\r${GREEN}[%s] %d%%${NC}" "$bar" "$((i*7))"
sleep 0.15
done

echo ""
sleep 1

TEXT="Target:$nomor"
ENCODE=$(echo "$TEXT" | sed 's/ /%20/g')

echo -e "${CYAN}Membuka WhatsApp Admin...${NC}"

am start -a android.intent.action.VIEW \
-d "https://wa.me/$ADMIN?text=$ENCODE"

sleep 6

logo

echo -e "${WHITE}Menu   : Spamm call WhatsApp${NC}"
echo -e "${WHITE}Target : $nomor${NC}"
echo ""

echo -e "${GREEN}Memulai Engine...${NC}"
sleep 1

count=1
while true
do

case $((count % 3)) in
0) color=$YELLOW ;;
1) color=$CYAN ;;
2) color=$GREEN ;;
esac

printf "${color}[%d] memulai spamm target %s ...${NC}\n" "$count" "$nomor"

sleep 0.05

count=$((count+1))

done
