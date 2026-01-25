#!/bin/bash
clear
echo "[*] Checking root..."
if su -c "id" | grep -q root; then
  echo "[✓] ROOT ACCESS GRANTED"
else
  echo "[✗] ROOT NOT FOUND"
fi
read -p "Enter untuk kembali"
bash ../main.sh