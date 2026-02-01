#!/data/data/com.termux/files/usr/bin/bash

# ===== WARNA =====
R="\e[31m"
G="\e[32m"
GR="\e[1;32m"
RR="\e[1;31m"
Y="\e[33m"
C="\e[36m"
W="\e[97m"
B="\e[1m"
N="\e[0m"

clear

# ===== LOGO =====
echo -e "${GR}${B}"
echo "██████╗  ██████╗  ██████╗ ████████╗"
echo "██╔══██╗██╔═══██╗██╔════╝ ╚══██╔══╝"
echo "██████╔╝██║   ██║██║         ██║"
echo "██╔══██╗██║   ██║██║         ██║"
echo "██║  ██║╚██████╔╝╚██████╗    ██║"
echo "╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝"
echo -e "${RR}     WHATSAPP AUTO BOT SYSTEM"
echo -e "${GR}         ROOT RAGERS${N}"
echo
sleep 1

# ===== ANIMASI LOADING =====
echo -ne "${G}Starting system "
for i in {1..20}; do
    echo -ne "${GR}█${N}"
    sleep 0.05
done
echo
sleep 1

# ===== CEK NODEJS =====
if ! command -v node >/dev/null 2>&1; then
    echo -e "${R}[!] NodeJS belum ada${N}"
    echo -e "${Y}Menginstall NodeJS...${N}"
    pkg install nodejs -y
fi

# ===== CEK FOLDER BOT =====
if [ ! -f "bot.js" ]; then
    echo -e "${R}[!] bot.js tidak ditemukan${N}"
    echo -e "${Y}Pastikan file bot.js ada di folder utama${N}"
    read -p "ENTER..."
    exit
fi

# ===== CEK BAILEYS =====
if [ ! -d "node_modules/@whiskeysockets" ]; then
    echo -e "${Y}[+] Install Baileys...${N}"
    npm install @whiskeysockets/baileys
fi

clear

echo -e "${GR}${B}"
echo "╔════════════════════════════╗"
echo "║   WHATSAPP AUTO REPLY BOT  ║"
echo "╚════════════════════════════╝"
echo -e "${N}"

echo -e "${G}Status:${N} READY"
echo -e "${G}Mode:${N} AUTO REPLY"
echo -e "${G}Engine:${N} Baileys"
echo

echo -e "${C}Bot akan berjalan 24 jam"
echo "Scan QR jika diminta"
echo

read -p "Tekan ENTER untuk menjalankan bot..."

# ===== JALANKAN BOT =====
node bot.js

echo
echo -e "${R}Bot berhenti...${N}"
