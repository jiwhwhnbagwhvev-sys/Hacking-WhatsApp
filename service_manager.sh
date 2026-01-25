#!/bin/bash
clear
echo "[*] Running Services (init)"

su -c "
service list | head
"

read -p "Enter untuk kembali"
bash main.sh