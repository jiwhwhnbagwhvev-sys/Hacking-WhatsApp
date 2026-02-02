#!/bin/bash

DB="users.db"
ADMINPASS="Admind123"  # password admin

clear
echo "===== ADMIN PANEL ====="
echo

read -p "Password Admin: " pass
if [ "$pass" != "$ADMINPASS" ]; then
  echo "Password salah!"
  exit
fi

read -p "Username baru: " user
read -p "Token voucher: " token

# Buat file DB kalau belum ada
touch "$DB"

echo "$user:$token" >> "$DB"
echo "User berhasil ditambahkan!"
