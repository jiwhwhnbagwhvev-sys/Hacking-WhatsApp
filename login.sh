#!/bin/bash

############################
# ROOT REGERS LOGIN SYSTEM PRO
############################

DB="users.db"
SESSION="session.tmp"
LOG="login.log"

ADMIN_NAME="Rio hp kentang barus"
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

############################
# USER AKTIF
############################
TOTAL_ACTIVE=$(ps aux | grep "[m]ain.sh" | wc -l)

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
echo -e "${G}User aktif sekarang : $TOTAL_ACTIVE${W}"
echo -e "${Y}Admin      : $ADMIN_NAME${W}"
echo -e "${Y}No Admin   : $ADMIN_NUM${W}"
echo -e "${C}Ketik .admin untuk hubungi admin${W}"
echo -e "$B======================================$W"
echo

############################
# LOADING
############################

loading(){
for i in {1..12}
do
printf "${R}■${Y}■${G}■${C}■${B}■${P}■${W}\r"
sleep 0.08
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

# CEK LOGIN DI DATABASE
if ! grep -Fxq "$user:$token" "$DB"; then
  echo -e "${R}Login salah!${W}"
  try=$((try+1))
  echo -e "${Y}Sisa percobaan: $((MAXTRY-try))${W}"
  sleep $TIMEOUT
  continue
fi

# SIMPAN SESSION
echo "$user:$token" >> "$SESSION"

############################
# SUCCESS LOGIN
############################

echo "$(date) SUCCESS $user" >> "$LOG"

# UPDATE USER AKTIF
ACTIVE_USERS=$(cat "$SESSION" | wc -l)

echo -e "${G}LOGIN BERHASIL ✔${W}"
echo -e "${C}Jumlah user aktif sekarang: $ACTIVE_USERS${W}"
loading

# MASUK MENU UTAMA
exec ./main.sh

done

############################
# BLOKIR
############################

echo -e "${R}AKSES DIBLOKIR!${W}"
exit
