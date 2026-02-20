#!/data/data/com.termux/files/usr/bin/bash

# ==================================================
#              WHATSAPP TOOLS INSTALLER
# ==================================================

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

clear
echo -e "${WHITE}╔══════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}        INSTALLER - WHATSAPP TOOLS${NC}"
echo -e "${WHITE}╚══════════════════════════════════════════════╝${NC}"
echo ""

echo -e "${YELLOW}Checking dependencies...${NC}"
sleep 1

# Install python jika belum ada
pkg install python -y > /dev/null 2>&1

echo -e "${GREEN}Python ready ✅${NC}"
sleep 1

echo -e "${YELLOW}Setting permissions...${NC}"

chmod +x loader.sh 2>/dev/null
chmod +x menu.sh 2>/dev/null
chmod +x spamm_wa.sh 2>/dev/null
chmod +x spamm_call.sh 2>/dev/null
chmod +x update.sh 2>/dev/null
chmod +x info.sh 2>/dev/null
chmod +x logger.py 2>/dev/null
chmod +x security.py 2>/dev/null

sleep 1
echo -e "${GREEN}Permissions set successfully ✅${NC}"

# Buat log file jika belum ada
if [ ! -f activity.log ]; then
    touch activity.log
fi

sleep 1
echo -e "${GREEN}Log system ready ✅${NC}"

echo ""
echo -e "${WHITE}Installation Completed Successfully.${NC}"
echo -e "${CYAN}You can now run:${NC} ${GREEN}bash loader.sh${NC}"
echo ""
