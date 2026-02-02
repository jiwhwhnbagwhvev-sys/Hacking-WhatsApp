#!/bin/bash

############################
# ROOT REGERS LOGIN SYSTEM
############################

DB="users.db"
SESSION="session.tmp"
LOG="login.log"

ADMIN_NAME="Rio pecinta hp kentang "
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

############################
# CEK DATABASE
############################

if [ ! -f "$DB" ]; then
  touch "$DB"
fi

TOTAL=$(grep -c ":" "$DB")

############################
# LOGO BESAR
############################

echo -e "$B"
echo "██████╗  ██████╗  ██████╗ "
echo "██╔══██╗██╔═══██╗██╔══██╗"
echo "██████╔╝██║   ██║██║   ██║"
echo "██╔══██╗██║   ██║██║   ██║"
echo "██║  ██║╚██████╔╝██████╔╝"
echo "╚═╝  ╚═╝ ╚═════╝ ╚═════╝"
echo -e "$C      ROOT REGERS SYSTEM$W"

echo
echo -e "${G}User aktif : $TOTAL${W}"
echo -e "${Y}Admin      : $ADMIN_NAME${W}"
echo -e "${Y}No Admin   : 085283786794${W}"
echo -e "${C}Ketik .admin untuk hubungi admin${W}"
echo

############################
# FUNGSI LOADING
############################

loading(){
for i in {1..10}
do
echo -ne "${R}█${Y}█${G}█${C}█${B}█${P}█${W}\r"
sleep 0.1
done
}

############################
# LOGIN SYSTEM
############################

try=0

while [ $try -lt $MAXTRY ]
do

echo
read -p "Username : " user
user=$(echo "$user" | xargs)

if [ "$user" = ".admin" ]; then
termux-open-url "https://wa.me/$ADMIN_NUM"
exit
fi

read -s -p "Token    : " token
echo
token=$(echo "$token" | xargs)

# VALIDASI KOSONG
if [ -z "$user" ] || [ -z "$token" ]; then
echo -e "${R}Tidak boleh kosong!${W}"
continue
fi

# CEK LOGIN
if grep -Fxq "$user:$token" "$DB"; then

echo "$(date) SUCCESS $user" >> "$LOG"
echo "$user" > "$SESSION"

echo
echo -e "${G}LOGIN BERHASIL ✔${W}"
loading
sleep 1
./main.sh
exit

else

echo "$(date) FAIL $user" >> "$LOG"
echo -e "${R}Login salah!${W}"
try=$((try+1))
echo -e "${Y}Sisa percobaan: $((MAXTRY-try))${W}"
sleep $TIMEOUT

fi

done

############################
# BLOKIR
############################

clear
echo -e "${R}AKSES DIBLOKIR!${W}"
echo -e "${R}Terlalu banyak percobaan salah!${W}"
echo "$(date) BLOCKED" >> "$LOG"
exit
