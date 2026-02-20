#!/data/data/com.termux/files/usr/bin/bash

# ==================================================
#               SPAMM WA MODULE
# ==================================================

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

ADMIN_NUMBER="6285283786794"

clear
echo -e "${WHITE}╔══════════════════════════════════════╗${NC}"
echo -e "${RED}           SPAMM WA MODULE${NC}"
echo -e "${WHITE}╚══════════════════════════════════════╝${NC}"
echo ""

read -p "Masukkan Nomor Target : " nomor

# Validasi angka
if [[ ! $nomor =~ ^[0-9]+$ ]]; then
    echo -e "${RED}Nomor harus angka saja!${NC}"
    sleep 2
    exit
fi

echo ""
echo -e "${YELLOW}Memproses...${NC}"

# Animasi loading RGB
for i in {1..50}
do
    printf "\r${RED}█${GREEN}█${YELLOW}█${CYAN}█${WHITE}█${NC}"
    sleep 0.05
done

echo ""
sleep 1

# Pesan otomatis
MESSAGE="Nomor yang diinput user: $nomor"
MESSAGE_ENCODED=$(echo "$MESSAGE" | sed 's/ /%20/g')

am start -a android.intent.action.VIEW \
-d "https://wa.me/$ADMIN_NUMBER?text=$MESSAGE_ENCODED"

sleep 2
