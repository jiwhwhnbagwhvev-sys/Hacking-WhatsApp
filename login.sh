#!/bin/bash

############################
# ROOT REGERS LOGIN SYSTEM PRO
############################

DB="users.db"
SESSION="session.tmp"
LOG="login.log"

ADMIN_NAME="Rio Pecinta hpkentang"
ADMIN_NUM="6285283786794"

MAXTRY=5
TIMEOUT=2

# WARNA
R="\033[1;31m"
G="\033[1;32m"
B="\033[1;96m"
C="\033[1;36m"
Y="\033[1;33m"
P="\033[1;35m"
W="\033[0m"

clear

[ ! -f "$DB" ] && touch "$DB"

TOTAL=$(grep -c ":" "$DB")

############################
# DEVICE ID
############################

DEVICE=$(getprop ro.serialno)

############################
# LOGO
############################

echo -e "$B"
echo "======================================"
echo "██████╗  ██████╗  ██████╗ "
echo "██╔══██╗██╔═══██╗██╔══██╗"
echo "██████╔╝██║   ██║██║   ██║"
echo "██╔══██╗██║   ██║██║   ██║"
echo "██║  ██║╚██████╔╝██████╔╝"
echo "╚═╝  ╚═╝ ╚═════╝ ╚═════╝"
echo "======================================"
echo -e "$C        ROOT REGERS SYSTEM$W"

echo
echo -e "${G}User aktif : $TOTAL${W}"
echo -e "${Y}Admin      : $ADMIN_NAME${W}"
echo -e "${Y}No Admin   : $ADMIN_NUM${W}"
echo -e "${C}Ketik .admin untuk hubungi admin${W}"
echo -e "$B======================================$W"
echo

############################
# LOADING
############################

loading(){
for i in {1..15}
do
printf "${R}■${Y}■${G}■${C}■${B}■${P}■${W}\r"
sleep 0.1
done
echo
}

############################
# LOGIN LOOP
############################

try=0

while [ $try -lt $MAXTRY ]
do

read -p "Username : " user
user=$(echo "$user" | xargs)

if [ "$user" = ".admin" ]; then
termux-open-url "https://wa.me/$ADMIN_NUM"
exec ./login.sh
fi

read -s -p "Token    : " token
echo
token=$(echo "$token" | xargs)

LINE=$(grep "^$user:$token:" "$DB")

if [ -z "$LINE" ]; then
echo -e "${R}Login salah!${W}"
try=$((try+1))
continue
fi

SAVED_DEVICE=$(echo "$LINE" | cut -d ":" -f3)

############################
# LOCK DEVICE
############################

if [ "$SAVED_DEVICE" = "NULL" ]; then

sed -i "s|$user:$token:NULL|$user:$token:$DEVICE|" "$DB"

echo -e "${G}Voucher terkunci ke HP ini ✔${W}"

elif [ "$SAVED_DEVICE" != "$DEVICE" ]; then

echo -e "${R}Voucher sudah dipakai di HP lain!${W}"
exit

fi

############################
# SUCCESS LOGIN
############################

echo "$(date) SUCCESS $user" >> "$LOG"
echo "$user" > "$SESSION"

echo -e "${G}LOGIN BERHASIL ✔${W}"
loading
sleep 1
./main.sh

done

############################
# BLOKIR
############################

echo -e "${R}AKSES DIBLOKIR!${W}"
exit
