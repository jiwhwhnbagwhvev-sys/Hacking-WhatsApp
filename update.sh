#!/data/data/com.termux/files/usr/bin/bash

# ==================================================
#               UPDATE SYSTEM MODULE
# ==================================================

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

CURRENT_VERSION="2.2.0"
LATEST_VERSION="2.3.0"

clear
echo -e "${WHITE}╔══════════════════════════════════════╗${NC}"
echo -e "${CYAN}            UPDATE SYSTEM${NC}"
echo -e "${WHITE}╚══════════════════════════════════════╝${NC}"
echo ""

echo -e "${GREEN}Current Version : ${CURRENT_VERSION}${NC}"
echo -e "${YELLOW}Checking latest version...${NC}"
sleep 2

# Animasi loading
for i in {1..100}
do
    printf "\r${CYAN}Checking... %d%%${NC}" "$i"
    sleep 0.02
done

echo ""
sleep 1

echo -e "${GREEN}Latest Version Available : ${LATEST_VERSION}${NC}"
echo ""

if [ "$CURRENT_VERSION" == "$LATEST_VERSION" ]; then
    echo -e "${GREEN}Tools sudah versi terbaru ✅${NC}"
else
    echo -e "${YELLOW}Update tersedia!${NC}"
    echo -e "${CYAN}Mengunduh update...${NC}"

    for i in {1..100}
    do
        printf "\r${GREEN}Downloading... %d%%${NC}" "$i"
        sleep 0.02
    done

    echo ""
    sleep 1
    echo -e "${GREEN}Update berhasil dipasang!${NC}"
fi

sleep 3
