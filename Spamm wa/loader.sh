#!/data/data/com.termux/files/usr/bin/bash

# Warna
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
RED='\033[1;31m'
WHITE='\033[1;37m'
CYAN='\033[1;36m'
NC='\033[0m'

clear

# Ambil waktu & tanggal
tanggal=$(date +"%d-%m-%Y")
jam=$(date +"%H:%M:%S")

echo -e "${WHITE}╔══════════════════════════════════════════════════════╗${NC}"
echo -e "${RED}              LOGIN - PREMIUM${NC}"
echo -e "${WHITE}                 versi 2.1.0${NC}"
echo -e "${WHITE}     Login - Page Premium - Created Vindra${NC}"
echo -e "${WHITE}╚══════════════════════════════════════════════════════╝${NC}"
echo ""

echo -e "${CYAN}Tanggal : $tanggal${NC}"
echo -e "${CYAN}Jam     : $jam${NC}"
echo ""

echo -e "${YELLOW}⚠ Pakai dengan bijak jangan di salah gunakan${NC}"
echo -e "${YELLOW}⚠ Resiko di tanggung pengguna${NC}"
echo -e "${YELLOW}⚠ by Pecinta hpkentang${NC}"
echo ""
echo -e "${GREEN}Tunggu 1 sampai 5 menit mohon bersabar...${NC}"
echo -e "${GREEN}Untuk menjaga keamanan sistem...${NC}"
echo ""

# Animasi loading 5 detik
for i in {1..5}
do
    echo -e "${WHITE}Loading keamanan [$i/5]...${NC}"
    sleep 1
done

sleep 1
bash login.sh
