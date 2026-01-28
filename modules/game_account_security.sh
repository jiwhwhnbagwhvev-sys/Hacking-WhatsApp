#!/data/data/com.termux/files/usr/bin/bash
# ==========================================
# GAME ACCOUNT SECURITY MODULE
# ==========================================

ENGINE="engine/game_account_security_pro.py"

clear
echo -e "\e[1;31m"
echo "╔════════════════════════════════════╗"
echo "║  GAME ACCOUNT SECURITY PRO MODULE  ║"
echo "╚════════════════════════════════════╝"
echo -e "\e[0m"

# cek python
if ! command -v python >/dev/null 2>&1; then
    echo "[!] Python belum terinstall"
    echo "[*] Install python dulu..."
    pkg install python -y
fi

# cek engine
if [ ! -f "$ENGINE" ]; then
    echo "[!] Engine tidak ditemukan!"
    echo "Pastikan file ada di: $ENGINE"
    read -rp "ENTER untuk kembali..."
    exit 1
fi

echo "[✓] Engine ditemukan"
echo "[*] Menjalankan Game Account Security Pro..."
sleep 1

python "$ENGINE"

echo
read -rp "Tekan ENTER untuk kembali ke menu..."
