#!/bin/bash
# ==========================================
# ===== VIEW CHATTING WA — ROOT RAGERS =====
# ==========================================

clear

# ===== WARNA =====
R='\033[1;31m'
G='\033[1;32m'
Y='\033[1;33m'
C='\033[1;36m'
W='\033[0m'

# ===== LOGO BESAR =====
echo -e "${R}"
echo "██╗   ██╗██╗███████╗██╗    ██╗"
echo "██║   ██║██║██╔════╝██║    ██║"
echo "██║   ██║██║█████╗  ██║ █╗ ██║"
echo "╚██╗ ██╔╝██║██╔══╝  ██║███╗██║"
echo " ╚████╔╝ ██║███████╗╚███╔███╔╝"
echo "  ╚═══╝  ╚═╝╚══════╝ ╚══╝╚══╝ "
echo -e "${G}CHAT MONITORING SYSTEM${W}"
sleep 1

# ===== ANIMASI HACKER =====
chars="01#@$%&"
echo -e "${G}"
for i in {1..12}
do
  line=""
  for j in {1..60}
  do
    rand=$((RANDOM % 6))
    line="$line${chars:$rand:1}"
  done
  echo "$line"
  sleep 0.05
done

echo -e "${W}"

# ===== INFO SYSTEM =====
echo -e "${C}━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "STATUS  : READY"
echo -e "MODE    : LIVE CHAT VIEW"
echo -e "ENGINE  : NODE + BAILEYS"
echo -e "UPTIME  : 24 JAM"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━${W}"

echo
echo -e "${Y}Tekan ENTER untuk mulai melihat chatting...${W}"
read

# ===== CEK NODE =====
if ! command -v node &> /dev/null
then
    echo -e "${R}[✗] Node.js belum terinstall!${W}"
    exit
fi

# ===== CEK FILE BOT =====
if [ ! -f "bot.js" ]; then
    echo -e "${R}[✗] bot.js tidak ditemukan di folder ini!${W}"
    exit
fi

# ===== LOADING BAR =====
echo -e "${G}Memulai sistem...${W}"
for i in {1..20}
do
  echo -ne "${G}▓${W}"
  sleep 0.05
done
echo

sleep 1
clear

# ===== START BOT =====
echo -e "${C}[✓] Sistem aktif..."
echo -e "[✓] Monitoring chatting berjalan..."
echo -e "[✓] Menunggu pesan masuk...${W}"
echo

node bot.js

# ===== AUTO RESTART =====
while [ $? -ne 0 ]; do
  echo -e "${R}[!] Sistem terputus! Restart 5 detik...${W}"
  sleep 5
  node bot.js
done
