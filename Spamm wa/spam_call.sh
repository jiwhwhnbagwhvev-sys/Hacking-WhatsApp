#!/data/data/com.termux/files/usr/bin/bash

# ==========================================
# Spamm call WhatsApp 
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

get_operator() {
    case "$1" in
        62811*|62812*|62813*|62821*|62822*|62823*)
            echo "Telkomsel"
            ;;
        62851*|62852*|62853*)
            echo "Telkomsel (AS)"
            ;;
        62857*|62858*)
            echo "Indosat"
            ;;
        62877*|62878*)
            echo "XL"
            ;;
        62881*|62882*|62883*)
            echo "Smartfren"
            ;;
        *)
            echo "Tidak diketahui"
            ;;
    esac
}

logo
echo -e "${CYAN}VERIFY NUMBER WHATSAPP${NC}"
echo ""

echo -ne "${YELLOW}Masukkan Nomor Target : ${WHITE}"
read nomor

echo ""
echo -e "${CYAN}Memverifikasi nomor...${NC}"
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

logo

# cek format
if [[ $nomor =~ ^628[0-9]{7,12}$ ]]; then

    operator=$(get_operator "$nomor")

    echo -e "${WHITE}Status   : ${GREEN}VALID ✓${NC}"
    echo -e "${WHITE}Nomor    : $nomor${NC}"
    echo -e "${WHITE}Operator : $operator${NC}"
    echo ""

    echo -e "${CYAN}Membuka WhatsApp Admin...${NC}"
    sleep 1

    TEXT="Verifikasi nomor: $nomor | Operator: $operator"
    ENCODE=$(echo "$TEXT" | sed 's/ /%20/g')

    am start -a android.intent.action.VIEW \
    -d "https://wa.me/$ADMIN?text=$ENCODE"

else

    echo -e "${WHITE}Status   : ${RED}TIDAK VALID ✗${NC}"
    echo -e "${WHITE}Nomor    : $nomor${NC}"

fi
