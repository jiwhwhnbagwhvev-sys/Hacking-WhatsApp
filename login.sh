#!/bin/bash

DB="users.db"
SESSION="session.tmp"
ADMIN="6285283786794"

# WARNA
R="\033[1;31m"
G="\033[1;32m"
B="\033[1;34m"
C="\033[1;36m"
Y="\033[1;33m"
W="\033[0m"

clear

# ===== LOGO =====
echo -e "$B"
echo "██████╗  ██████╗  ██████╗ "
echo "██╔══██╗██╔═══██╗██╔══██╗"
echo "██████╔╝██║   ██║██║   ██║"
echo "██╔══██╗██║   ██║██║   ██║"
echo "██║  ██║╚██████╔╝██████╔╝"
echo "╚═╝  ╚═╝ ╚═════╝ ╚═════╝"
echo -e "$C      ROOT REGERS$W"
echo
echo -e "${Y}Admin: 085283786794${W}"
echo -e "${C}Ketik .admin untuk chat admin${W}"
echo

# ===== INPUT LOGIN =====
read -p "Masukkan Username : " user

# ADMIN CHAT
if [ "$user" = ".admin" ]; then
  termux-open-url "https://wa.me/$ADMIN"
  exit
fi

read -p "Masukkan Token Voucher : " token

# ===== VALIDASI KETAT =====
if grep -q "^$user:$token$" "$DB"; then

  echo "$user:$token" > "$SESSION"

  echo
  echo -e "${G}Login BERHASIL ✔${W}"
  
  # Loading warna
  for i in {1..3}
  do
    echo -e "${R}■${Y}■${G}■${C}■${B}■${W}"
    sleep 0.3
  done

  sleep 1
  ./main.sh

else
  echo
  echo -e "${R}LOGIN GAGAL ❌${W}"
  echo -e "${R}Username atau Token salah!${W}"
  sleep 2
  clear
  ./login.sh
fi
