#!/bin/bash

DB="users.db"

# WARNA
R="\033[1;31m"
G="\033[1;32m"
Y="\033[1;33m"
B="\033[1;34m"
M="\033[1;35m"
C="\033[1;36m"
W="\033[0m"

ADMIN_WA="085283786794"

clear

# ===== LOGO =====
echo -e "$B"
echo "██████╗  ██████╗  ██████╗ ████████╗"
echo "██╔══██╗██╔═══██╗██╔═══██╗╚══██╔══╝"
echo "██████╔╝██║   ██║██║   ██║   ██║"
echo "██╔══██╗██║   ██║██║   ██║   ██║"
echo "██║  ██║╚██████╔╝╚██████╔╝   ██║"
echo "╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝"
echo -e "$C        ROOT REGERS$W"
echo
echo -e "${Y}Hubungi Admin untuk akses:${W}"
echo -e "${G}$ADMIN_WA${W}"
echo -e "${C}Ketik .admin untuk chat admin${W}"
echo

# CEK DB
if [ ! -f "$DB" ]; then
  echo -e "${R}Database tidak ditemukan!${W}"
  exit
fi

# INPUT USERNAME
read -p "Username : " user

# ===== FITUR ADMIN CHAT =====
if [ "$user" = ".admin" ]; then
  echo -e "${G}Membuka WhatsApp admin...${W}"
  termux-open-url "https://wa.me/6285283786794"
  exit
fi

read -p "Token    : " token

# VALIDASI LOGIN
if grep -q "^$user:$token$" "$DB"; then

  clear
  echo -e "${G}Login berhasil!${W}"
  echo

  # LOADING WARNA-WARNI
  echo -ne "${R}Loading"
  for i in 1 2 3 4 5
  do
    echo -ne "."
    sleep 0.3
  done

  echo
  for i in {1..3}
  do
    echo -e "${R}■${Y}■${G}■${C}■${B}■${M}■${W}"
    sleep 0.3
  done

  echo
  echo -e "${G}WELCOME $user${W}"
  sleep 1

  ./main.sh

else
  echo
  echo -e "${R}Username atau Token salah!${W}"
  sleep 2
  ./login.sh
fi
