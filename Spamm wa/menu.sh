#!/data/data/com.termux/files/usr/bin/bash

# Warna
RED='\033[1;31m'
GREEN='\033[1;32m'
WHITE='\033[1;37m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear

# ====== HEADER BOX ======
echo -e "${WHITE}╔══════════════════════════════════════════════╗${NC}"
echo -e "${RED}"
echo "   ██╗      ██████╗  ██████╗ ██╗███╗   ██╗"
echo "   ██║     ██╔═══██╗██╔════╝ ██║████╗  ██║"
echo "   ██║     ██║   ██║██║  ███╗██║██╔██╗ ██║"
echo "   ██║     ██║   ██║██║   ██║██║██║╚██╗██║"
echo "   ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║"
echo -e "${WHITE}                PREMIUM${NC}"
echo -e "${WHITE}  versi 2.1.0"
echo -e "  Login - Page Premium - Created Andra"
echo -e "${WHITE}╚══════════════════════════════════════════════╝${NC}"

echo ""
echo -e "${WHITE}╔══════════════════════════════════════════════╗${NC}"
echo -e " Bisa Langsung Chat Admin di"
echo -e " Whatsapp ${GREEN}085283786794${NC}"
echo -e "${WHITE}╚══════════════════════════════════════════════╝${NC}"

echo ""
echo -ne "${CYAN}➤ Masukkan Username > ${NC}"
read username

# ====== MENU UTAMA ======
while true
do
clear

echo -e "${GREEN}Welcome $username${NC}"
echo ""
echo -e "${CYAN}[1] Spamm WA${NC}"
echo -e "${CYAN}[2] Spamm Call WA${NC}"
echo -e "${CYAN}[0] Exit${NC}"
echo ""
read -p "Pilih menu: " pilih

case $pilih in
1|2)

    clear
    read -p "Masukkan Nomor Target: " nomor

    echo ""
    echo -e "${YELLOW}Processing...${NC}"

    # Animasi RGB
    for i in {1..15}
    do
        echo -e "${RED}■${GREEN}■${YELLOW}■${CYAN}■${WHITE}■${NC}"
        sleep 0.15
    done

    pesan="Nomor target yang di input: $nomor"
    pesan_encoded=$(echo $pesan | sed 's/ /%20/g')

    am start -a android.intent.action.VIEW \
    -d "https://wa.me/6285283786794?text=$pesan_encoded"

    sleep 2
    ;;

0)
    exit
    ;;

*)
    echo "Pilihan tidak tersedia"
    sleep 1
    ;;
esac
done
