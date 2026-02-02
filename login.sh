#!/bin/bash

DB="users.db"
SESSION="session.tmp"
ADMIN="6285283786794"

# WARNA
R="\033[1;31m"
G="\033[1;32m"
B="\033[1;96m"   # BIRU MUDA TERANG
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

# ===== CEK DATABASE =====
if [ ! -f "$DB" ]; then
  echo -e "${R}Database users.db belum ada!${W}"
  echo "Buat user dulu lewat ./adduser.sh"
  exit
fi

# ===== INPUT LOGIN =====
read -p "Masukkan Username : " user
user=$(echo "$user" | xargs)  # hapus spasi

# ADMIN CHAT
if [ "$user" = ".admin" ]; then
  termux-open-url "https://wa.me/$ADMIN"
  exit
fi

read -p "Masukkan Token Voucher : " token
token=$(echo "$token" | xargs)  # hapus spasi

# ===== VALIDASI LOGIN =====
if grep -Fxq "$user:$token" "$DB"; then

  echo "$user:$token" > "$SESSION"

  echo
  echo -e "${G}LOGIN BERHASIL ✔${W}"
  
  # ===== LOADING WARNA-WARNI =====
  for i in {1..5}
  do
    echo -e "${R}■${Y}■${G}■${C}■${B}■${W}"
    sleep 0.2
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
