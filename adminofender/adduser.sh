#!/bin/bash

DB="users.db"
ADMIN_PASS="admin123"

echo "=== ADMIN TAMBAH USER ==="
read -p "Password admin: " pass

if [ "$pass" != "$ADMIN_PASS" ]; then
echo "Password salah!"
exit
fi

echo
read -p "Masukkan username baru: " user
read -p "Masukkan token/voucher: " token

# cek token sudah dipakai
if grep -q ":$token$" $DB; then
echo "Token sudah dipakai!"
exit
fi

echo "$user:$token" >> $DB

TOTAL=$(wc -l < $DB)

echo
echo "User berhasil ditambahkan!"
echo "Total user sekarang: $TOTAL"
