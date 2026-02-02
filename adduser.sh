#!/bin/bash

########################
# ROOT REGERS ADMIN PANEL PRO+
########################

DB="users.db"
ADMIN_HP="085283786794"

# WARNA
R="\033[1;31m"
G="\033[1;32m"
Y="\033[1;33m"
B="\033[1;96m"
C="\033[1;36m"
W="\033[0m"

clear
[ ! -f "$DB" ] && touch "$DB"

########################
# LOGIN ADMIN
########################

read -p "No HP Admin : " hp

if [ "$hp" != "$ADMIN_HP" ]; then
  echo -e "${R}AKSES DITOLAK!${W}"
  exit
fi

echo -e "${G}ADMIN TERVERIFIKASI ✔${W}"
sleep 1

########################
# MENU ADMIN
########################

while true
do
clear

TOTAL=$(grep -c ":" "$DB")

echo -e "$B===== ADMIN PANEL =====$W"
echo -e "${G}Total user: $TOTAL${W}"
echo
echo "1. Tambah User"
echo "2. Lihat User"
echo "3. Hapus User"
echo "4. Keluar"
echo

read -p "Pilih menu: " pilih

########################
# TAMBAH USER
########################
if [ "$pilih" = "1" ]; then

read -p "Username : " user
read -p "Token : " token

if [ -z "$user" ] || [ -z "$token" ]; then
echo -e "${R}Tidak boleh kosong!${W}"
sleep 2
continue
fi

if grep -Fxq "$user:$token" "$DB"; then
echo -e "${R}User+Token sudah ada!${W}"
sleep 2
continue
fi

echo "$user:$token" >> "$DB"

echo -e "${G}USER BERHASIL DITAMBAHKAN ✔${W}"
sleep 2
fi

########################
# LIHAT USER
########################
if [ "$pilih" = "2" ]; then
echo
echo -e "$C=== DAFTAR USER ===$W"
cat "$DB"
echo
read -p "Enter untuk kembali..."
fi

########################
# HAPUS USER
########################
if [ "$pilih" = "3" ]; then

read -p "Masukkan username: " udel

grep -v "^$udel:" "$DB" > temp.db
mv temp.db "$DB"

echo -e "${G}User dihapus ✔${W}"
sleep 2
fi

########################
# KELUAR
########################
if [ "$pilih" = "4" ]; then
exit
fi

done
