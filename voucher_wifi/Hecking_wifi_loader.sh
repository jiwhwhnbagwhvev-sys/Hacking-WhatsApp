#!/bin/bash

# Loader HP KENTANG HOTSPOT dengan peringatan awal

# Clear screen
clear

# Banner awal
echo "=============================="
echo "   HP KENTANG HOTSPOT LOADER  "
echo "=============================="
echo ""

# Peringatan awal (warna kuning)
YELLOW='\033[1;33m'
RESET='\033[0m'
echo -e "${YELLOW}PERINGATAN!${RESET}"
echo -e "${YELLOW}Jangan hina sembarang, resiko ditanggung penghuni.${RESET}"
echo -e "${YELLOW}Tunggu 1 sampai 5 menit sebelum masuk menu utama...${RESET}"

# Delay 1 sampai 5 menit (acak)
DELAY=$((60 + RANDOM % 241))  # 60s + 0-240s = 1–5 menit
echo -e "${YELLOW}Menunggu selama $((DELAY/60)) menit dan $((DELAY%60)) detik...${RESET}"
sleep $DELAY

# Clear screen setelah delay
clear

# Banner sebelum masuk menu utama
echo "=============================="
echo "      MEMASUKI MENU UTAMA      "
echo "=============================="
echo ""

# Jalankan Run.py (terminal CLI utama)
echo "[*] Menjalankan Run.py..."
python3 Run.py

# Opsional jalankan server web di background
# python3 server.py &
# python3 -m core.voucher_web &
