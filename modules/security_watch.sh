#!/data/data/com.termux/files/usr/bin/bash
# ==========================================
# SECURITY WATCH MODULE
# ==========================================

clear
echo "======================================"
echo "        SECURITY WATCH SYSTEM          "
echo "======================================"
echo

# cek file utama
if [ ! -f "../security_watch.py" ]; then
    echo "[✗] security_watch.py tidak ditemukan!"
    read -rp "ENTER untuk kembali..."
    exit 1
fi

echo "[*] Menjalankan Security Watch..."
sleep 0.5

python ../security_watch.py

echo
read -rp "ENTER untuk kembali ke menu..."
