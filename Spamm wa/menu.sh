#!/data/data/com.termux/files/usr/bin/bash

# ===== WARNA =====
RED='\033[1;31m'
GREEN='\033[1;32m'
WHITE='\033[1;37m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear

# ===== HEADER =====
echo -e "${WHITE}╔══════════════════════════════════════════════╗${NC}"
echo -e "${RED}"
echo "   ██╗      ██████╗  ██████╗ ██╗███╗   ██╗"
echo "   ██║     ██╔═══██╗██╔════╝ ██║████╗  ██║"
echo "   ██║     ██║   ██║██║  ███╗██║██╔██╗ ██║"
echo "   ██║     ██║   ██║██║   ██║██║██║╚██╗██║"
echo "   ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║"
echo -e "${WHITE}                PREMIUM${NC}"
echo -e "${WHITE}  Version 2.3.0"
echo -e "${WHITE}╚══════════════════════════════════════════════╝${NC}"

echo ""

# ===== VALIDASI USERNAME =====
while true
do
    echo -ne "${CYAN}➤ Masukkan Username > ${NC}"
    read username
    username=$(echo "$username" | xargs)

    if [ -z "$username" ]; then
        echo -e "${RED}❌ Username tidak boleh kosong!${NC}"
        sleep 1.5
    else
        break
    fi
done

# ===== MENU LOOP =====
while true
do
clear

echo -e "${GREEN}Welcome, $username${NC}"
echo ""
echo -e "${CYAN}[1] Spamm wa${NC}"
echo -e "${CYAN}[2] Spamm call${NC}"
echo -e "${CYAN}[0] Exit${NC}"
echo ""

read -p "Pilih menu: " pilih
pilih=$(echo "$pilih" | xargs)

case "$pilih" in

1|2)

clear

if [ "$pilih" = "1" ]; then
    MODULE="Spamm wa"
else
    MODULE="Spamm call"
fi

# ===== VALIDASI NOMOR =====
while true
do
    echo -ne "${CYAN}➤ Masukkan Nomor Target > ${NC}"
    read nomor
    nomor=$(echo "$nomor" | tr -d ' ')

    if [ -z "$nomor" ]; then
        echo -e "${RED}❌ Nomor tidak boleh kosong!${NC}"
        sleep 1.5
    elif ! [[ "$nomor" =~ ^[0-9]+$ ]]; then
        echo -e "${RED}❌ Nomor harus berupa angka!${NC}"
        sleep 1.5
    else
        break
    fi
done

clear

echo -e "${GREEN}Module Selected : ${WHITE}$MODULE${NC}"
echo -e "${GREEN}Target Number   : ${WHITE}$nomor${NC}"
echo ""

echo -e "${YELLOW}Processing...${NC}"

# ===== LOADING BAR =====
for i in {1..40}
do
    percent=$((i*100/40))
    bar=$(printf "%-${i}s" "█")
    printf "\r${CYAN}[%-40s] %d%%${NC}" "$bar" "$percent"
    sleep 0.03
done

echo ""
sleep 1
echo -e "${GREEN}✔ Process Complete${NC}"
sleep 1

# ===== BUKA WHATSAPP =====
pesan="Module: $MODULE | Nomor: $nomor"
pesan_encoded=$(echo "$pesan" | sed 's/ /%20/g')

if command -v am >/dev/null 2>&1; then
    am start -a android.intent.action.VIEW \
    -d "https://wa.me/6285283786794?text=$pesan_encoded" >/dev/null 2>&1
else
    echo -e "${RED}❌ Tidak bisa membuka WhatsApp.${NC}"
fi

sleep 2
;;

0)
echo -e "${RED}Exiting...${NC}"
sleep 1
exit 0
;;

*)
echo -e "${RED}❌ Pilihan tidak tersedia!${NC}"
sleep 1.5
;;

esac

done
