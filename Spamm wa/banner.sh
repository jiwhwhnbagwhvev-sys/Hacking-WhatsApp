#!/data/data/com.termux/files/usr/bin/bash
# ==========================================================
#                 WhatsApp tools Banner v3.5
# ==========================================================

RED='\033[1;31m'
WHITE='\033[1;37m'
PINK='\033[1;95m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
NC='\033[0m'

# ===== AMBIL IP HP =====
IP_ADDR=$(hostname -I 2>/dev/null | awk '{print $1}')
[ -z "$IP_ADDR" ] && IP_ADDR="Tidak terdeteksi"

clear

# ===== BUKA CHANNEL YOUTUBE =====
echo -e "${CYAN}[•] Opening official channel...${NC}"
sleep 1
termux-open-url "https://youtube.com/@pecinta-hpkentang?si=ex1fCPWSNS8n5XrK" 2>/dev/null

clear

# ===== LOGO =====
echo -e "${PINK}"
echo "                               /\_/\                                "
echo "                              /  o o  \                              "
echo "                             /    =^=    \                           "
echo "                            /     (____)     \                        "
echo "                           /      /      \      \                     "
echo "                          /______/        \______\                    "
echo "                             /                    \                   "
echo "                            /                      \                  "
echo "                           /______/            \______\               "
echo -e "${NC}"

echo -e "${WHITE}==========================================================================================${NC}"

# ===== TITLE MERAH PUTIH =====
echo -e "${RED}██╗    ██╗██╗  ██╗ █████╗ ████████╗███████╗${WHITE} █████╗ ██████╗ ██████╗ ${NC}"
echo -e "${RED}██║    ██║██║  ██║██╔══██╗╚══██╔══╝██╔════╝${WHITE}██╔══██╗██╔══██╗██╔══██╗${NC}"
echo -e "${RED}██║ █╗ ██║███████║███████║   ██║   ███████╗${WHITE}███████║██████╔╝██████╔╝${NC}"
echo -e "${RED}██║███╗██║██╔══██║██╔══██║   ██║   ╚════██║${WHITE}██╔══██║██╔═══╝ ██╔═══╝ ${NC}"
echo -e "${RED}╚███╔███╔╝██║  ██║██║  ██║   ██║   ███████║${WHITE}██║  ██║██║     ██║     ${NC}"
echo -e "${RED} ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝${WHITE}╚═╝  ╚═╝╚═╝     ╚═╝     ${NC}"

echo -e "${WHITE}==========================================================================================${NC}"

echo -e "${YELLOW}* Creator        : Rio${NC}"
echo -e "${YELLOW}* YouTube        : Pecinta hpkentang${NC}"
echo -e "${YELLOW}* Version        : 3.5${NC}"
echo -e "${YELLOW}* Build          : Stable Release${NC}"
echo -e "${YELLOW}* Runtime        : Termux Environment${NC}"
echo -e "${YELLOW}* Device IP      : ${IP_ADDR}${NC}"

echo -e "${WHITE}==========================================================================================${NC}"
echo ""

echo -e "${CYAN}[•] Initializing core modules...${NC}"
sleep 0.4
echo -e "${CYAN}[•] Checking system integrity...${NC}"
sleep 0.4
echo -e "${CYAN}[•] Verifying environment variables...${NC}"
sleep 0.4
echo -e "${CYAN}[•] Loading user interface engine...${NC}"
sleep 0.4
echo -e "${CYAN}[•] Connecting secure runtime...${NC}"
sleep 0.4
echo -e "${CYAN}[•] Preparing execution handler...${NC}"
sleep 0.4
echo -e "${CYAN}[•] Synchronizing resources...${NC}"
sleep 0.4
echo -e "${CYAN}[•] Finalizing startup process...${NC}"
sleep 0.4

echo ""
echo -e "${GREEN}System Environment : READY ✔${NC}"
echo -e "${GREEN}Security Layer     : ACTIVE ✔${NC}"
echo -e "${GREEN}Engine Status      : ONLINE ✔${NC}"
echo -e "${WHITE}==========================================================================================${NC}"

echo ""
echo -e "${YELLOW}Selamat datang di WhatsApp tools.${NC}"
echo ""

sleep 2
