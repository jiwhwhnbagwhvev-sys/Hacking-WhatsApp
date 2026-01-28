    #!/data/data/com.termux/files/usr/bin/bash
# ==========================================
# GAME ACCOUNT SECURITY MODULE
# ==========================================

ENGINE="engine/game_account_security_engine.py"

clear
echo "======================================="
echo "   GAME ACCOUNT SECURITY PRO MODULE    "
echo "======================================="

if [ ! -f "$ENGINE" ]; then
    echo "[!] Engine tidak ditemukan!"
    echo "Pastikan file engine ada di folder engine/"
    read -p "ENTER..."
    exit 1
fi

if ! command -v python >/dev/null 2>&1; then
    echo "[!] Python belum terinstall"
    echo "Install dengan: pkg install python -y"
    read -p "ENTER..."
    exit 1
fi

chmod +x "$ENGINE"
python "$ENGINE"

echo
read -p "Tekan ENTER untuk kembali ke menu..."
