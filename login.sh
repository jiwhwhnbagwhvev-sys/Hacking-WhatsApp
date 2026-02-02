#!/bin/bash

DB="users.db"
ACTIVE="active.db"
LOG="login.log"

ADMIN_NAME="Rio hp kentang barus"
ADMIN_NUM="6285283786794"

MAXTRY=5
TIMEOUT=2

# WARNA
R="\033[1;31m"
G="\033[1;32m"
Y="\033[1;33m"
B="\033[1;94m"
C="\033[1;96m"
W="\033[0m"

clear

[ ! -f "$DB" ] && touch "$DB"
[ ! -f "$ACTIVE" ] && touch "$ACTIVE"

############################
# HITUNG DATA
############################
TOTAL_USERS=$(grep -c ":" "$DB")
TOTAL_ACTIVE=$(wc -l < "$ACTIVE")

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
echo -e "$C ROOT REGERS SYSTEM$W"

echo
echo -e "${G}Total user terdaftar : $TOTAL_USERS${W}"
echo -e "${G}User aktif login : $TOTAL_ACTIVE${W}"
echo -e "${Y}Admin : $ADMIN_NAME${W}"
echo -e "${Y}No Admin : $ADMIN_NUM${W}"
echo -e "$B======================================$W"
echo

############################
# LOADING
############################
loading(){
echo -ne "Loading "
for i in {1..5}; do
echo -ne "■"
sleep 0.2
done
echo ""
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

read -s -p "Token : " token
echo
token=$(echo "$token" | xargs)

############################
# VALIDASI LOGIN
############################

if ! grep -Fxq "$user:$token" "$DB"; then
  echo -e "${R}Login salah!${W}"
  try=$((try+1))
  sleep $TIMEOUT
  continue
fi

############################
# LOGIN SUKSES
############################

echo "$(date) SUCCESS $user" >> "$LOG"

# Tambah ke active.db jika belum ada
if ! grep -Fxq "$user" "$ACTIVE"; then
echo "$user" >> "$ACTIVE"
fi

echo -e "${G}LOGIN BERHASIL ✔${W}"
loading

exec ./main.sh

done

echo -e "${R}AKSES DIBLOKIR!${W}"
exit
