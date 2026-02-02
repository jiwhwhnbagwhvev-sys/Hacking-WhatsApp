#!/bin/bash

DB="users.db"
MAX=3
TRY=0

# ===== WARNA =====
R="\033[1;31m"
G="\033[1;32m"
Y="\033[1;33m"
B="\033[1;34m"
C="\033[1;36m"
P="\033[1;35m"
W="\033[0m"

while [ $TRY -lt $MAX ]
do

clear

echo -e "${B}"
echo "██████╗  ██████╗  ██████╗ "
echo "██╔══██╗██╔═══██╗██╔══██╗"
echo "██████╔╝██║   ██║██║   ██║"
echo "██╔══██╗██║   ██║██║   ██║"
echo "██║  ██║╚██████╔╝██████╔╝"
echo "╚═╝  ╚═╝ ╚═════╝ ╚═════╝"
echo -e "${W}"

echo -e "${C}=== LOGIN ROOT REGERS ===${W}"
echo

read -p "Username : " user
read -p "Token    : " token

# ===== VALIDASI =====
if grep -q "^$user:$token$" "$DB"; then

echo
echo -e "${G}LOGIN BERHASIL${W}"
echo

# loading rainbow
colors=($R $Y $G $C $B $P)
for i in {1..25}
do
rand=$((RANDOM % 6))
echo -ne "${colors[$rand]}█${W}"
sleep 0.05
done

echo
echo -e "${P}WELCOME $user 🚀${W}"
sleep 1

./main.sh
exit

else

TRY=$((TRY+1))
echo
echo -e "${R}LOGIN SALAH!${W}"
echo -e "${Y}Sisa percobaan: $((MAX-TRY))${W}"
sleep 2

fi

done

# ===== BLOKIR =====
clear
echo -e "${R}Terlalu banyak percobaan!${W}"
echo -e "${R}Akses diblokir!${W}"
sleep 3
exit
