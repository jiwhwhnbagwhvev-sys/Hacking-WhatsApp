#!/bin/bash

DB="users.db"
SESSION="session.tmp"
ADMIN_WA="6285283786794"

# WARNA
R="\033[1;31m"
G="\033[1;32m"
Y="\033[1;33m"
B="\033[1;34m"
M="\033[1;35m"
C="\033[1;36m"
W="\033[0m"

clear

# ===== CEK SESSION =====
if [ -f "$SESSION" ]; then
  user=$(cut -d: -f1 "$SESSION")
  token=$(cut -d: -f2 "$SESSION")
  if grep -q "^$user:$token$" "$DB"; then
    echo -e "${G}Session aktif! Masuk langsung ke menu${W}"
    sleep 1
    ./main.sh
    exit
  else
    rm -f "$SESSION"
  fi
fi

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
echo -e "${Y}Hubungi Admin:${W} ${G}085283786794${W}"
echo -e "${C}Ketik .admin untuk chat admin${W}"
echo

# CEK DATABASE
if [ ! -f "$DB" ]; then
  echo -e "${R}users.db tidak ditemukan!${W}"
  exit
fi

# INPUT USERNAME
read -p "Username : " user

# ===== FITUR ADMIN =====
if [ "$user" = ".admin" ]; then
  termux-open-url "https://wa.me/$ADMIN_WA"
  exit
fi

read -p "Token    : " token

# VALIDASI
if grep -q "^$user:$token$" "$DB"; then

  # SIMPAN SESSION
  echo "$user:$token" > "$SESSION"

  clear
  echo -e "${G}Login berhasil!${W}"

  # LOADING WARNA WARNI
  echo -ne "${R}Loading"
  for i in 1 2 3 4 5; do echo -ne "."; sleep 0.3; done
  echo
  for i in {1..3}; do echo -e "${R}■${Y}■${G}■${C}■${B}■${M}■${W}"; sleep 0.2; done
  echo -e "${G}WELCOME $user${W}"
  sleep 1

  ./main.sh

else
  echo
  echo -e "${R}Username atau Token salah!${W}"
  sleep 2
  ./login.sh
fi
