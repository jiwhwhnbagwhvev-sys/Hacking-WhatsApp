#!/data/data/com.termux/files/usr/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m'

animate() {
for i in {1..8}
do
    clear

    if [ $((i%2)) -eq 0 ]; then
        OFFSET="   "
        EYE="o   o"
    else
        OFFSET=" "
        EYE="-   -"
    fi

    echo -e "${RED}"
    echo "${OFFSET}        /\_/\ "
    echo "${OFFSET}       (  $EYE  )"
    echo "${OFFSET}        >   ^   <"
    echo "${OFFSET}       /  \_____/  \ "
    echo "${OFFSET}      /____/       \____\ "
    echo -e "${NC}"

    echo -e "${GREEN}        DARK DEVIL SYSTEM${NC}"
    echo "----------------------------------------"
    echo -e "${YELLOW}* Creator : Pecinta Rio${NC}"
    echo -e "${YELLOW}* YouTube : hp kentang${NC}"
    echo -e "${CYAN}* GitHub  : jiwhwhnbagwhvev-sys${NC}"
    echo "----------------------------------------"

    sleep 0.25
done
}

animate

echo -e "${RED}Memuat sistem...${NC}"

for i in {1..30}
do
    printf "${RED}█${NC}"
    sleep 0.04
done

echo ""
sleep 1

gpg -d menu.sh.gpg | bash
