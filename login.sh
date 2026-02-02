#!/bin/bash

############################
# CONFIG
############################

USERNAME="Rio2026"
PASSWORD="Root_Rage2026"

ADMIN_NUM="085283786794"
MAIN="./main.sh"

############################
# WARNA
############################

BLUE="\033[1;96m"
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
WHITE="\033[0m"

############################
# LOGO BIRU MUDA
############################

logo(){
echo -e "${BLUE}"
echo "╔══════════════════════════════╗"
echo "║   ██████╗ ██████╗  ██████╗   ║"
echo "║   ██╔══██╗██╔══██╗██╔═══██╗  ║"
echo "║   ██████╔╝██████╔╝██║   ██║  ║"
echo "║   ██╔══██╗██╔══██╗██║   ██║  ║"
echo "║   ██║  ██║██║  ██║╚██████╔╝  ║"
echo "║   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ║"
echo "║      ROOT REGERS SYSTEM      ║"
echo "╚══════════════════════════════╝"
echo -e "${WHITE}"
}

############################
# LOADING
############################

loading(){
echo -ne "${YELLOW}Loading "
for i in {1..5}
do
 echo -ne "■"
 sleep 0.3
done
echo -e "${WHITE}"
}

############################
# LOGIN LOOP
############################

while true
do

clear
logo

echo "Ketik .admin untuk hubungi admin"
echo

read -p "Username : " user

# COMMAND ADMIN
if [ "$user" = ".admin" ]; then
    termux-open-url "https://wa.me/$ADMIN_NUM"
    continue
fi

read -s -p "Password : " pass
echo

if [[ "$user" == "$USERNAME" && "$pass" == "$PASSWORD" ]]; then

    echo -e "${GREEN}LOGIN BERHASIL ✔${WHITE}"
    loading
    echo -e "${GREEN}Welcome $user!${WHITE}"
    sleep 1

    if [ -f "$MAIN" ]; then
        chmod +x "$MAIN"
        exec "$MAIN"
    else
        echo -e "${RED}main.sh tidak ditemukan!${WHITE}"
        exit
    fi

else
    echo -e "${RED}Login salah!${WHITE}"
    sleep 2
fi

done
