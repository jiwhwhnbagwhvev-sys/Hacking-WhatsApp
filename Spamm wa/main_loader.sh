#!/data/data/com.termux/files/usr/bin/bash

# Warna
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
CYAN='\033[1;36m'
NC='\033[0m'

clear

# Buka Channel YouTube otomatis
am start -a android.intent.action.VIEW -d "https://youtube.com/@pecinta-hpkentang?si=RAYC769vFGgRIDHX"

sleep 3
clear

# LOGO BESAR
echo -e "${GREEN}"
echo "██     ██ ██   ██  █████  ████████ ███████  ██████  ██████ "
echo "██     ██ ██   ██ ██   ██    ██    ██      ██    ██ ██   ██"
echo "██  █  ██ ███████ ███████    ██    █████   ██    ██ ██████ "
echo "██ ███ ██ ██   ██ ██   ██    ██    ██      ██    ██ ██   ██"
echo " ███ ███  ██   ██ ██   ██    ██    ███████  ██████  ██   ██"
echo -e "${WHITE}"
echo "              WHATSAPP TOOLS v2.0"
echo "---------------------------------------------"
echo -e "${NC}"

echo -e "${YELLOW}* Creator   : hpkentang${NC}"
echo -e "${YELLOW}* Youtube   : Pecinta hpkentang${NC}"
echo ""

echo -e "${YELLOW}Pakai dengan bijak jangan di salah gunakan${NC}"
echo -e "${YELLOW}Resiko di tanggung pengguna${NC}"
echo ""

echo -e "${CYAN}Tunggu 5-10 menit untuk masuk ke halaman utama...${NC}"
echo ""

# Animasi loading
for i in {1..5}
do
  echo -e "${WHITE}Loading [$i/5]...${NC}"
  sleep 1
done

sleep 1
bash menu.sh.gpg
