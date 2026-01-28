#!/data/data/com.termux/files/usr/bin/bash
# GAME ACCOUNT SECURITY 

ENGINE="engine/game_account_security_ai.py"

clear
echo -e "\e[1;31m"
echo "╔════════════════════════════════════╗"
echo "║  GAME ACCOUNT SECURITY    ║"
echo "╚════════════════════════════════════╝"
echo -e "\e[0m"

if ! command -v python >/dev/null; then
    echo "[*] Install python..."
    pkg install python -y
fi

if [ ! -f "$ENGINE" ]; then
    echo "[!] Engine tidak ditemukan!"
    read -rp "ENTER..."
    exit 1
fi

python "$ENGINE"
read -rp "ENTER untuk kembali..."
