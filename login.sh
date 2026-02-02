#!/bin/bash

# ===== WARNA =====
B="\033[1;34m"
G="\033[1;32m"
R="\033[1;31m"
Y="\033[1;33m"
C="\033[1;36m"
M="\033[1;35m"
W="\033[0m"

DB="users.db"

# ===== AUTO BUAT DATABASE =====
if [ ! -f $DB ]; then
echo "user1:12345" > $DB
echo "user2:54321" >> $DB
fi

clear

# ===== LOGO ROOT REGERS =====
echo -e "$B"
echo "██████╗  ██████╗  ██████╗ ████████╗"
echo "██╔══██╗██╔═══██╗██╔═══██╗╚══██╔══╝"
echo "██████╔╝██║   ██║██║   ██║   ██║   "
echo "██╔══██╗██║   ██║██║   ██║   ██║   "
echo "██║  ██║╚██████╔╝╚██████╔╝   ██║   "
echo "╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝   "
echo
echo "██████╗ ███████╗ ██████╗ ███████╗██████╗ ███████╗"
echo "██╔══██╗██╔════╝██╔════╝ ██╔════╝██╔══██╗██╔════╝"
echo "██████╔╝█████╗  ██║  ███╗█████╗  ██████╔╝███████╗"
echo "██╔══██╗██╔══╝  ██║   ██║██╔══╝  ██╔══██╗╚════██║"
echo "██║  ██║███████╗╚██████╔╝███████╗██║  ██║███████║"
echo "╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝"
echo -e "$W"

echo -e "${C}════ ROOT REGERS LOGIN ════${W}"
echo -e "${Y}.admin WA: 085283786794${W}"
echo

# ===== INFO USER =====
TOTAL=$(wc -l < $DB)
echo -e "${G}User terdaftar:${W} $TOTAL"
echo -e "${G}Token aktif:${W} $TOTAL"
echo

# ===== INPUT LOGIN =====
read -p "Username: " user
read -p "Token: " token

# ===== VALIDASI =====
if grep -q "$user:$token" $DB; then

echo
echo -e "${G}Login valid!${W}"

# ===== LOADING WARNA =====
for i in {1..6}
do
echo -e "${R}■${Y}■${G}■${C}■${M}■${B}■${W} Loading..."
sleep 0.3
done

echo
echo -e "${C}✨ WELCOME $user ✨${W}"
sleep 1

# ===== MASUK MENU =====
./main.sh

else

echo -e "${R}Login gagal!${W}"
sleep 2
fi
