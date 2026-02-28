#!/data/data/com.termux/files/usr/bin/bash

# ==========================================
# Spamm call WhatsApp 
# ==========================================

RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
PINK='\033[1;95m'
WHITE='\033[1;37m'
NC='\033[0m'

ADMIN="85283786794"

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

# format ke 62
nomor="62$input"

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

# pesan WhatsApp
TEXT="Menu Spamm Call Fitur 1
Nomor Target: $nomor"

ENCODE=$(echo "$TEXT" | sed 's/ /%20/g' | sed ':a;N;$!ba;s/\n/%0A/g')

echo -e "${CYAN}Membuka WhatsApp Admin...${NC}"

am start -a android.intent.action.VIEW \
-d "https://wa.me/$ADMIN?text=$ENCODE"

sleep 6

logo

echo -e "${WHITE}Menu   : Spamm Call Fitur 1${NC}"
echo -e "${WHITE}Target : $nomor${NC}"
echo ""

echo -e "${GREEN}Engine Aktif...${NC}"
echo ""

count=1

while true
do

case $((count % 5)) in
0) color=$RED ;;
1) color=$GREEN ;;
2) color=$CYAN ;;
3) color=$PINK ;;
4) color=$WHITE ;;
esac

printf "${color}[%d] Mencoba Spamm call kenomor %s ...${NC}\n" "$count" "$nomor"

sleep 0.05

count=$((count+1))

done
