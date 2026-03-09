#!/data/data/com.termux/files/usr/bin/bash

GREEN='\033[1;32m'
BLUE='\033[1;34m'
RED='\033[1;31m'
WHITE='\033[1;37m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear

echo -e "${YELLOW}Version : 4.0${NC}"
echo ""

echo -e "${GREEN}██╗    ██╗██╗  ██╗ █████╗ ████████╗${NC}"
echo -e "${GREEN}██║    ██║██║  ██║██╔══██╗╚══██╔══╝${NC}"
echo -e "${GREEN}██║ █╗ ██║███████║███████║   ██║   ${NC}"
echo -e "${GREEN}██║███╗██║██╔══██║██╔══██║   ██║   ${NC}"
echo -e "${GREEN}╚███╔███╔╝██║  ██║██║  ██║   ██║   ${NC}"

echo -ne "${GREEN}WHAT"
echo -e "${BLUE}SAPP${NC}"

echo ""
echo -e "${WHITE}by HP Kentang${NC}"

echo ""
echo -e "${CYAN}================================================${NC}"
echo -e "${CYAN}                LOGIN PANEL                     ${NC}"
echo -e "${CYAN}================================================${NC}"
echo ""

echo -ne "${GREEN}Username > ${NC}"
read user

echo -ne "${GREEN}Token    > ${NC}"
read token

echo ""

# animasi verifikasi
for i in {1..25}
do
printf "\r${GREEN}<------->${RED}<------->${GREEN}<------->${NC} Verifying..."
sleep 0.1
done

echo ""
echo ""

data=$(grep "$user" token.db)

if [ -z "$data" ]; then
echo -e "${RED}Token : INVALID${NC}"
exit
fi

dbuser=$(echo $data | cut -d "|" -f1)
dbtype=$(echo $data | cut -d "|" -f2)
dbtoken=$(echo $data | cut -d "|" -f3)

if [[ "$token" != "$dbtoken" ]]; then
echo -e "${RED}Token : INVALID${NC}"
exit
fi

echo -e "${WHITE}Token      : ${GREEN}VALID${NC}"

if [[ "$dbtype" == "trial" ]]; then

echo -e "${WHITE}Masa Aktif : 1 Bulan${NC}"
echo -e "${WHITE}Berakhir   : $(date -d '+30 days') 00:00 WIB${NC}"

else

echo -e "${WHITE}Masa Aktif : Seumur Hidup${NC}"

fi

echo ""
echo -e "${CYAN}System Status : ONLINE${NC}"
echo -e "${CYAN}Database User : ACTIVE${NC}"

echo ""
echo -e "${YELLOW}Ketik .admin untuk kontak admin${NC}"

read cmd

if [[ "$cmd" == ".admin" ]]
then

am start -a android.intent.action.VIEW \
-d "https://wa.me/6285283786794?text=min%20order%20berapa%20ya%20min"

fi
