#!/data/data/com.termux/files/usr/bin/bash

# ==================================================
#              INFO CREATOR MODULE
# ==================================================

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
MAGENTA='\033[1;35m'
NC='\033[0m'

clear
echo -e "${WHITE}╔══════════════════════════════════════════════╗${NC}"
echo -e "${MAGENTA}               INFORMATION SYSTEM${NC}"
echo -e "${WHITE}╚══════════════════════════════════════════════╝${NC}"
echo ""

echo -e "${CYAN}Creator        : ${GREEN}Pejuang hpkentang${NC}"
echo -e "${CYAN}Version        : ${GREEN}2.2.0${NC}"
echo -e "${CYAN}Status         : ${GREEN}Premium Edition${NC}"
echo -e "${CYAN}WhatsApp Admin : ${GREEN}085283786794${NC}"
echo ""

echo -e "${YELLOW}System Information:${NC}"
echo -e "${CYAN}Device  : $(getprop ro.product.model)${NC}"
echo -e "${CYAN}Android : $(getprop ro.build.version.release)${NC}"
echo -e "${CYAN}Kernel  : $(uname -r)${NC}"
echo ""

echo -e "${WHITE}Terima kasih telah menggunakan WhatsApp Tools Premium.${NC}"
echo -e "${WHITE}Gunakan dengan bijak dan bertanggung jawab.${NC}"

echo ""
read -p "Tekan Enter untuk kembali..."
