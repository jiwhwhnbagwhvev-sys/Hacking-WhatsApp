#!/data/data/com.termux/files/usr/bin/bash

# ==========================================
# Spam Call WhatsApp 
# ==========================================

GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
PINK='\033[1;95m'
WHITE='\033[1;37m'
RED='\033[1;31m'
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
echo -e "${CYAN}SPAM CALL WHATSAPP - FITUR 1${NC}"
echo ""

echo -ne "${WHITE}Masukkan Nomor Target : ${NC}"
read input

# validasi kosong
if [[ -z "$input" ]]; then
echo -e "${RED}Nomor tidak boleh kosong!${NC}"
exit
fi

# nomor tanpa 62
nomor="$input"

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

# pesan WhatsApp RAPAT TANPA JARAK
TEXT="Menu Spamm Call Fitur 1 | Nomor Target: $nomor | Status: Aktif ✓"

ENCODE=$(echo "$TEXT" | sed 's/ /%20/g')

echo -e "${CYAN}Membuka WhatsApp Admin...${NC}"

am start -a android.intent.action.VIEW \
-d "https://wa.me/$ADMIN?text=$ENCODE"

sleep 6

logo

echo -e "${WHITE}Menu   : Spamm Call WhatsApp${NC}"
echo -e "${WHITE}Target : $nomor${NC}"
echo ""

echo -e "${GREEN}Memulai Spam Engine...${NC}"
echo ""

count=1

while true
do

if ((count % 2 == 0)); then
color=$GREEN
else
color=$YELLOW
fi

printf "${color}[%d] mencoba spamm call ke nomor %s ...${NC}\n" "$count" "$nomor"

sleep 0.08

count=$((count+1))

done
