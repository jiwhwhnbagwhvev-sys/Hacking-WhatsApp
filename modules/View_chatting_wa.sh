#!/bin/bash

clear

# ===== WARNA =====
G="\033[1;32m"
R="\033[1;31m"
C="\033[1;36m"
Y="\033[1;33m"
W="\033[0m"

# ===== LOGO =====
echo -e "${G}"
echo "██╗   ██╗██╗███████╗██╗    ██╗"
echo "██║   ██║██║██╔════╝██║    ██║"
echo "██║   ██║██║█████╗  ██║ █╗ ██║"
echo "╚██╗ ██╔╝██║██╔══╝  ██║███╗██║"
echo " ╚████╔╝ ██║███████╗╚███╔███╔╝"
echo "  ╚═══╝  ╚═╝╚══════╝ ╚══╝╚══╝ "
echo -e "${W}"

echo -e "${C}>>> VIEW WA TERMINAL <<<${W}"
echo

echo -e "${Y}Status : READY${W}"
echo -e "${Y}Engine : Baileys MD${W}"
echo -e "${Y}Mode   : Live Chat${W}"
echo

# ===== MATRIX EFFECT =====
chars="01@#$%&"
for i in {1..10}
do
  line=""
  for j in {1..60}
  do
    rand=$((RANDOM % 6))
    line+="${chars:$rand:1}"
  done
  echo -e "${G}$line${W}"
  sleep 0.04
done

echo
echo -e "${G}[✓] Engine Siap${W}"
echo -e "${G}[✓] Monitoring Aktif${W}"
echo

# ===== MENU =====
echo "1. Jalankan View WA"
echo "2. Cek Node"
echo "3. Keluar"
echo

read -p "Pilih: " pilih

if [ "$pilih" = "1" ]; then
  if [ ! -f "view-wa.js" ]; then
    echo -e "${R}File view-wa.js tidak ada!${W}"
    exit
  fi
  
  echo -e "${G}Menjalankan engine WA...${W}"
  node view-wa.js
elif [ "$pilih" = "2" ]; then
  node -v
else
  exit
fi
