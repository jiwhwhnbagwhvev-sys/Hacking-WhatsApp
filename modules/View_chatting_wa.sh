#!/bin/bash

clear

# ===== WARNA =====
G="\033[1;32m"
R="\033[1;31m"
C="\033[1;36m"
Y="\033[1;33m"
W="\033[0m"

# ===== LOGO =====
echo -e "${R}"
echo "██╗   ██╗██╗███████╗██╗    ██╗"
echo "██║   ██║██║██╔════╝██║    ██║"
echo "██║   ██║██║█████╗  ██║ █╗ ██║"
echo "╚██╗ ██╔╝██║██╔══╝  ██║███╗██║"
echo " ╚████╔╝ ██║███████╗╚███╔███╔╝"
echo "  ╚═══╝  ╚═╝╚══════╝ ╚══╝╚══╝"
echo -e "${W}"

echo -e "${G}>>> VIEW CHATTING WA <<<${W}"
echo

# ===== INFO PANEL =====
echo -e "${C}STATUS : READY${W}"
echo -e "${C}MODE   : LIVE VIEW${W}"
echo -e "${C}ENGINE : BAILEYS${W}"
echo -e "${C}NODE   : $(node -v)${W}"
echo

# ===== MATRIX EFFECT =====
chars="01@#$%&"
for i in {1..8}
do
line=""
for j in {1..60}
do
rand=$((RANDOM % 6))
line+="${chars:$rand:1}"
done
echo -e "${G}$line${W}"
sleep 0.05
done

echo
echo -e "${Y}[1] Jalankan VIEW WA${W}"
echo -e "${Y}[2] Cek Node Version${W}"
echo -e "${Y}[3] Keluar${W}"
echo

read -p "Pilih menu : " pilih

if [ "$pilih" = "1" ]; then
  echo -e "${G}Menjalankan VIEW WA...${W}"
  sleep 1
  node viewwa-pro.js

elif [ "$pilih" = "2" ]; then
  node -v

else
  echo -e "${R}Keluar...${W}"
  exit
fi
