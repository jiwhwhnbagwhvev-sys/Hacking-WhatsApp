#!/bin/bash

############################
# CONFIG
############################

USERNAME="Rio2026"
PASSWORD="Root_Rage2026"

ADMIN_NUM="6285283786794"

ACTIVE_DB="active_users.db"

MAXTRY=5
COOLDOWN=30

touch "$ACTIVE_DB"

############################
# WARNA
############################

RED="\033[1;31m"
BLUE="\033[1;96m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
WHITE="\033[0m"

############################
# LOGO
############################

logo(){
echo "██████╗  ██████╗  ██████╗ ████████╗"
echo "██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝"
echo "██████╔╝██║   ██║██║   ██║   ██║"
echo "██╔══██╗██║   ██║██║   ██║   ██║"
echo "██║  ██║╚██████╔╝██████╔╝   ██║"
echo "╚═╝  ╚═╝ ╚═════╝ ╚═════╝    ╚═╝"
echo "  ROOT REGERS SYSTEM"
}

# Animasi biru-merah
for i in {1..3}
do
clear
echo -e "$BLUE"; logo
sleep 0.2
clear
echo -e "$RED"; logo
sleep 0.2
done

############################
# LOADING ANIMATION
############################

loading(){
echo
echo -ne "Loading "
for i in {1..10}
do
  echo -ne "■"
  sleep 0.15
done
echo
}

############################
# COOLDOWN
############################

cooldown(){
echo -e "${RED}Terlalu banyak salah!${WHITE}"
for ((i=$COOLDOWN;i>0;i--))
do
  echo -ne "\r${YELLOW}Coba lagi dalam $i detik...${WHITE}"
  sleep 1
done
echo
}

############################
# USER AKTIF
############################

show_active(){
TOTAL=$(sort -u "$ACTIVE_DB" | wc -l)
echo -e "${GREEN}User aktif: $TOTAL${WHITE}"
}

############################
# LOGIN LOOP
############################

try=0

while true
do

clear
echo -e "$BLUE"
logo
echo -e "$WHITE"

show_active
echo
echo "Ketik .admin untuk hubungi admin"
echo

if [ $try -ge $MAXTRY ]; then
  cooldown
  try=0
fi

read -p "Username : " user

# COMMAND ADMIN
if [ "$user" = ".admin" ]; then
  termux-open-url "https://wa.me/$ADMIN_NUM"
  continue
fi

read -s -p "Password : " pass
echo

############################
# CEK LOGIN
############################

if [[ "$user" == "$USERNAME" && "$pass" == "$PASSWORD" ]]; then

  echo -e "${GREEN}LOGIN BERHASIL ✔${WHITE}"

  # simpan user aktif
  sed -i "/^$user$/d" "$ACTIVE_DB"
  echo "$user" >> "$ACTIVE_DB"

  loading

  clear
  echo -e "${GREEN}"
  echo "=================================="
  echo "        W E L C O M E 🎉"
  echo "          $user"
  echo "=================================="
  echo -e "${WHITE}"

  sleep 2

  exec ./main.sh

else
  echo -e "${RED}Login salah!${WHITE}"
  try=$((try+1))
  sleep 2
fi

done
