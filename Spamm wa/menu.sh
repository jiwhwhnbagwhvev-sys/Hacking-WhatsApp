#!/data/data/com.termux/files/usr/bin/bash

# ==========================================
# BRUTALWA TOOL
# Creator : Rio
# YouTube : Pecinta hpkentang
# ==========================================

GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
PINK='\033[1;95m'
RED='\033[1;31m'
NC='\033[0m'

logo(){
clear

echo -e "${PINK}"
echo "              /\_/\  "
echo "             ( o o ) "
echo "             (  V  ) "
echo "            /|     |\ "
echo "           /_|_____|_\ "
echo -e "${NC}"

echo -e "${GREEN}"
echo "██████╗ ██████╗ ██╗   ██╗████████╗ █████╗ ██╗     ██╗    ██╗ █████╗ "
echo "██╔══██╗██╔══██╗██║   ██║╚══██╔══╝██╔══██╗██║     ██║    ██║██╔══██╗"
echo "██████╔╝██████╔╝██║   ██║   ██║   ███████║██║     ██║ █╗ ██║███████║"
echo "██╔══██╗██╔══██╗██║   ██║   ██║   ██╔══██║██║     ██║███╗██║██╔══██║"
echo "██████╔╝██║  ██║╚██████╔╝   ██║   ██║  ██║███████╗╚███╔███╔╝██║  ██║"
echo "╚═════╝ ╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝"
echo -e "${NC}"

echo ""
echo -e "${YELLOW}Creator : Rio${NC}"
echo -e "${YELLOW}YouTube : Pecinta hpkentang${NC}"
echo ""
}

while true
do

logo

echo -e "${WHITE}┌────────────────────────────────────────────┐${NC}"
echo -e "${WHITE}│                    MENU                    │${NC}"
echo -e "${WHITE}├────────────────────────────────────────────┤${NC}"

echo -e "${GREEN}│ [1] Spam Call WhatsApp        active ✓    │${NC}"
echo -e "${GREEN}│ [2] Spam Chat WhatsApp        active ✓    │${NC}"
echo -e "${GREEN}│ [0] Keluar                    active ✓    │${NC}"

echo -e "${WHITE}└────────────────────────────────────────────┘${NC}"

echo ""
echo -ne "${CYAN}└──> Pilih Menu : ${WHITE}"
read pilih

case $pilih in

1)
bash spam_call.sh
;;

2)
bash spam_wa.sh
;;

0)
clear
echo -e "${GREEN}Terima kasih telah menggunakan tool ini${NC}"
sleep 1
exit
;;

*)
echo -e "${RED}Menu tidak valid!${NC}"
sleep 1
;;

esac

done
