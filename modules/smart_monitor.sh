#!/data/data/com.termux/files/usr/bin/bash
# ==========================================
# SMART MONITOR MODULE
# ==========================================

clear
echo "======================================"
echo "        SMART SYSTEM MONITOR           "
echo "======================================"
echo

# cek file python ada atau tidak
if [ ! -f "../smart_monitor.py" ]; then
    echo "[✗] smart_monitor.py tidak ditemukan!"
    read -rp "ENTER untuk kembali..."
    exit 1
fi

echo "[*] Menjalankan Smart Monitor..."
sleep 0.5

python ../smart_monitor.py

echo
read -rp "ENTER untuk kembali ke menu..."
