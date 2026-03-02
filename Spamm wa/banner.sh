#!/data/data/com.termux/files/usr/bin/bash
# ==========================================================
#              WhatsApp Tools Banner v3.1
# ==========================================================

GREEN='\033[1;32m'
YELLOW='\033[1;33m'
PINK='\033[1;95m'
WHITE='\033[1;37m'
CYAN='\033[1;36m'
RED='\033[1;31m'
BLUE='\033[1;34m'
NC='\033[0m'

clear

# ===== RAINBOW LOADING FUNCTION =====
rainbow_loading() {
colors=("$RED" "$YELLOW" "$GREEN" "$CYAN" "$BLUE" "$PINK")
echo -ne "["
for i in {1..30}; do
    c=${colors[$((i % ${#colors[@]}))]}
    echo -ne "${c}#${NC}"
    sleep 0.03
done
echo -e "] ✔"
}

# ===== OPEN YOUTUBE =====
echo -e "${CYAN}[•] Opening channel Pecinta hpkentang...${NC}"
sleep 1
termux-open-url "https://youtube.com/@pecinta-hpkentang?si=ex1fCPWSNS8n5XrK" 2>/dev/null

clear

# ===== HALF RED HALF WHITE LOGO =====
echo -e "${RED}"
echo "██╗    ██╗██╗  ██╗ █████╗ "
echo "██║    ██║██║  ██║██╔══██╗"
echo -e "${WHITE}"
echo "██║ █╗ ██║███████║███████║"
echo "██║███╗██║██╔══██║██╔══██║"
echo -e "${RED}"
echo "╚███╔███╔╝██║  ██║██║  ██║"
echo -e "${WHITE}"
echo " ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝"
echo -e "${NC}"

echo -e "${CYAN}          WhatsApp Tools v3.1${NC}"
echo -e "${WHITE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

echo -e "${YELLOW} Creator     : Rio${NC}"
echo -e "${YELLOW} Channel     : Pecinta hpkentang${NC}"
echo -e "${YELLOW} Version     : 3.1 Rainbow Edition${NC}"

echo -e "${WHITE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# ===== COLORFUL LOADING =====
echo -e "${CYAN}[•] Initializing modules...${NC}"
rainbow_loading

echo -e "${CYAN}[•] Checking system integrity...${NC}"
rainbow_loading

echo -e "${CYAN}[•] Loading user interface...${NC}"
rainbow_loading

echo -e "${CYAN}[•] Preparing menu system...${NC}"
rainbow_loading

echo ""
echo -e "${GREEN}✔ System Ready${NC}"
echo -e "${GREEN}✔ Security Active${NC}"
echo -e "${GREEN}✔ Engine Online${NC}"

echo -e "${WHITE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# ===== RAINBOW ENTER MENU EFFECT =====
echo -e "${PINK}[•] Entering main menu...${NC}"
for c in $RED $YELLOW $GREEN $CYAN $BLUE $PINK; do
    echo -ne "${c}>>> LOADING MENU <<<\r${NC}"
    sleep 0.15
done
echo ""

sleep 1
