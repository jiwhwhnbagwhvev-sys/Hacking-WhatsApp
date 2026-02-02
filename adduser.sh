#!/bin/bash

DB="users.db"
ADMIN_HP="085283786794"

# WARNA
R="\033[1;31m"
G="\033[1;32m"
Y="\033[1;33m"
B="\033[1;96m"
P="\033[1;35m"
C="\033[1;36m"
W="\033[0m"

colors=("$R" "$G" "$Y" "$B" "$P" "$C")

########################
# LOGO GARUDA ASCII
########################

logo_ascii() {
echo "         ${B}           ,_         "
echo "         ${B}        ,/|  \        "
echo "         ${B}      ,/  |   \       "
echo "         ${B}    ,/    |    \      "
echo "         ${B}   /      |     \     "
echo "         ${B}  /       |      \    "
echo "         ${B} |        |       |   "
echo "         ${B} |        |       |   "
echo "         ${B} |        |       |   "
echo "         ${B} |        |       |   "
echo "         ${B}  \      / \     /    "
echo "         ${B}   \    /   \   /     "
echo "         ${B}    \  /     \ /      "
echo "         ${B}     \/       \/       "
echo -e "${W}"
}

# Animasi warna
for c in "${colors[@]}"
do
clear
echo -e "$c"
logo_ascii
echo -e "$c======================================$W"
echo -e "$c         ROOT REGERS ADMIN PANEL$W"
echo -e "$c======================================$W"
sleep 0.2
done

########################
# VERIFIKASI ADMIN
########################

echo
read -p "No HP Admin : " hp

if [ "$hp" != "$ADMIN_HP" ]; then
  echo -e "${R}================================${W}"
  echo -e "${R}      AKSES DITOLAK!${W}"
  echo -e "${R}================================${W}"
  exit
fi

echo -e "${G}================================${W}"
echo -e "${G}   ADMIN TERVERIFIKASI ✔${W}"
echo -e "${G}================================${W}"
sleep 1

########################
# TAMBAH USER
########################

# Buat DB kalau belum ada
[ ! -f "$DB" ] && touch "$DB"

echo
echo -e "${C}========== TAMBAH USER ==========${W}"
read -p "Username baru : " user
read -p "Token voucher : " token

# VALIDASI
if [ -z "$user" ] || [ -z "$token" ]; then
  echo -e "${R}Tidak boleh kosong!${W}"
  exit
fi

# CEK DUPLIKAT
if grep -q "^$user:" "$DB"; then
  echo -e "${R}User sudah ada!${W}"
  exit
fi

# DAPATKAN DEVICE ID HP PERTAMA (LOCK)
DEVICE=$(getprop ro.serialno || echo "NULL")

# SIMPAN FORMAT: user:token:device
echo "$user:$token:NULL" >> "$DB"

echo
echo -e "${G}================================${W}"
echo -e "${G} USER BERHASIL DITAMBAHKAN ✔${W}"
echo -e "${G}================================${W}"
echo -e "${Y}Device ID akan dikunci saat login pertama${W}"
sleep 1
