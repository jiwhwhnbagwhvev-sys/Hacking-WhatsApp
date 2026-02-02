  #!/bin/bash
DB="users.db"
SESSION="session.tmp"
LOG="login.log"
ADMIN_NAME="Rio hp kentang barus"
ADMIN_NUM="6285283786794"
MAXTRY=5
TIMEOUT=2

# Warna
R="\033[1;31m"; G="\033[1;32m"; Y="\033[1;33m"; B="\033[1;94m"; C="\033[1;96m"; P="\033[1;35m"; W="\033[0m"
colors=("$R" "$G" "$Y" "$C" "$P")

# Siapkan file
touch "$DB" "$SESSION" "$LOG"

# Hitung user aktif unik
TOTAL_ACTIVE=$(sort -u "$SESSION" | grep -v '^$' | wc -l)

# Logo biru terang
logo(){
echo -e "${B}╔══════════════════════════════════════╗"
echo -e "${B}║   ██████╗  ██████╗  ██████╗ ████████╗ ║"
echo -e "${B}║   ██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝ ║"
echo -e "${B}║   ██████╔╝██║   ██║██║   ██║   ██║    ║"
echo -e "${B}║   ██╔══██╗██║   ██║██║   ██║   ██║    ║"
echo -e "${B}║   ██║  ██║╚██████╔╝██████╔╝   ██║    ║"
echo -e "${B}║   ╚═╝  ╚═╝ ╚═════╝ ╚═════╝    ╚═╝    ║"
echo -e "${B}║        ROOT REGERS SYSTEM            ║"
echo -e "${B}╚══════════════════════════════════════╝${W}"
}

# Animasi logo
for c in "${colors[@]}"; do
  clear; echo -e "$c"; logo; sleep 0.12
done

clear; logo; echo -e "$W"

echo -e "${G}User aktif sekarang : $TOTAL_ACTIVE${W}"
echo -e "${Y}Admin : $ADMIN_NAME${W}"
echo -e "${Y}No Admin : $ADMIN_NUM${W}"
echo -e "${C}Ketik .admin untuk hubungi admin${W}"
echo -e "$B======================================$W"
echo

# Loading sederhana
loading(){ echo -ne "\nLoading "; for i in {1..6}; do echo -ne "■"; sleep 0.15; done; echo ""; }

# LOGIN LOOP
try=0
while [ $try -lt $MAXTRY ]; do
  read -p "Username : " user; user=$(echo "$user" | xargs)
  [ -z "$user" ] && echo -e "${R}Username tidak boleh kosong!${W}" && continue
  if [ "$user" = ".admin" ]; then termux-open-url "https://wa.me/$ADMIN_NUM"; continue; fi

  read -s -p "Token : " token; echo; token=$(echo "$token" | xargs)
  [ -z "$token" ] && echo -e "${R}Token tidak boleh kosong!${W}" && continue

  # Cek database
  if grep -Fxq "$user:$token" "$DB"; then
    sed -i "/^$user$/d" "$SESSION"  # hapus session lama
    echo "$user" >> "$SESSION"      # simpan session baru
    echo "$(date) SUCCESS $user" >> "$LOG"
    ACTIVE_USERS=$(sort -u "$SESSION" | wc -l)
    echo -e "${G}LOGIN BERHASIL ✔${W}"
    echo -e "${C}Jumlah user aktif: $ACTIVE_USERS${W}"
    loading
    exec ./main.sh
    exit
  else
    echo -e "${R}Login salah!${W}"
    try=$((try+1))
    echo -e "${Y}Sisa percobaan: $((MAXTRY-try))${W}"
    sleep $TIMEOUT
  fi
done

echo -e "${R}AKSES DIBLOKIR!${W}"
exit
