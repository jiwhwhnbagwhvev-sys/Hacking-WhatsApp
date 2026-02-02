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
Y="\033[1;33m"
B="\033[1;94m"
C="\033[1;96m"
P="\033[1;35m"
W="\033[0m"

colors=("$R" "$G" "$Y" "$B" "$C" "$P")

clear
[ ! -f "$DB" ] && touch "$DB"
[ ! -f "$SESSION" ] && touch "$SESSION"
[ ! -f "$LOG" ] && touch "$LOG"

############################
# USER AKTIF
############################
TOTAL_ACTIVE=$(sort -u "$SESSION" | wc -l)

############################
# LOGO PRO MAX
############################

logo(){
echo "╔══════════════════════════════════════╗"
echo "║   ██████╗  ██████╗  ██████╗ ████████╗ ║"
echo "║   ██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝ ║"
echo "║   ██████╔╝██║   ██║██║   ██║   ██║    ║"
echo "║   ██╔══██╗██║   ██║██║   ██║   ██║    ║"
echo "║   ██║  ██║╚██████╔╝██████╔╝   ██║    ║"
echo "║   ╚═╝  ╚═╝ ╚═════╝ ╚═════╝    ╚═╝    ║"
echo "║        ROOT REGERS SYSTEM            ║"
echo "╚══════════════════════════════════════╝"
}

# ANIMASI WARNA
for c in "${colors[@]}"
do
clear
echo -e "$c"
logo
sleep 0.12
done

clear
echo -e "$C"
logo
echo -e "$W"

echo
echo -e "${G}User aktif sekarang : $TOTAL_ACTIVE${W}"
echo -e "${Y}Admin : $ADMIN_NAME${W}"
echo -e "${Y}No Admin : $ADMIN_NUM${W}"
echo -e "${C}Ketik .admin untuk hubungi admin${W}"
echo -e "$B======================================$W"
echo

############################
# LOADING
############################

loading(){
echo -ne "\nLoading "
for i in {1..6}
do
echo -ne "■"
sleep 0.15
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

# VALIDASI KOSONG
[ -z "$user" ] && echo "Tidak boleh kosong!" && continue

if [ "$user" = ".admin" ]; then
termux-open-url "https://wa.me/$ADMIN_NUM"
exec ./login.sh
fi

read -s -p "Token : " token
echo
token=$(echo "$token" | xargs)

[ -z "$token" ] && echo "Tidak boleh kosong!" && continue

# CEK DATABASE
if ! grep -Fxq "$user:$token" "$DB"; then
  echo -e "${R}Login salah!${W}"
  try=$((try+1))
  echo -e "${Y}Sisa percobaan: $((MAXTRY-try))${W}"
  sleep $TIMEOUT
  continue
fi

# HAPUS SESSION LAMA USER (biar gak dobel)
sed -i "/^$user$/d" "$SESSION"

# SIMPAN SESSION
echo "$user" >> "$SESSION"

############################
# SUCCESS LOGIN
############################

echo "$(date) SUCCESS $user" >> "$LOG"

ACTIVE_USERS=$(sort -u "$SESSION" | wc -l)

echo -e "${G}LOGIN BERHASIL ✔${W}"
echo -e "${C}Jumlah user aktif: $ACTIVE_USERS${W}"

loading
exec ./main.sh

done

############################
# BLOKIR
############################

echo -e "${R}AKSES DIBLOKIR!${W}"
exit
