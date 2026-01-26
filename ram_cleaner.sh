#!/system/bin/sh
# ==========================================
# RAM CLEANER MODULE — ROOT_RAGERS
# ==========================================

MODULE_NAME="RAM CLEANER"
LOG="/data/local/tmp/root_ragers.log"
TEST_MODE=1

# ---------- COLOR ----------
R="\e[0m"
G="\e[1;32m"
Y="\e[1;33m"
RED="\e[1;31m"
C="\e[1;36m"
B="\e[1m"

pause() { read -rp "Tekan ENTER untuk kembali..."; }
log() { echo "[$(date '+%F %T')] $MODULE_NAME : $1" >> "$LOG"; }

header() {
clear
echo -e "${C}${B}"
echo "╔══════════════════════════════════════╗"
echo "║           RAM CLEANER MODULE         ║"
echo "╚══════════════════════════════════════╝"
echo -e "${R}"
}

progress() {
echo -ne "${Y}Membersihkan RAM"
for i in $(seq 1 30); do
  echo -ne "."
  sleep 0.05
done
echo -e "${R}"
}

check_root() {
if ! su -c "id" >/dev/null 2>&1; then
  echo -e "${RED}[✗] ROOT TIDAK TERDETEKSI${R}"
  log "ROOT FAILED"
  exit 1
fi
echo -e "${G}[✓] ROOT TERDETEKSI${R}"
log "ROOT OK"
}

show_ram() {
echo -e "${Y}[*] RAM STATUS:${R}"
free -h
}

clean_ram() {
echo -e "${Y}[*] Flush cache dan drop caches...${R}"
su -c "sync"
su -c "echo 3 > /proc/sys/vm/drop_caches" 2>/dev/null
}

auto_test() {
[ "$TEST_MODE" != "1" ] && return
echo -e "${C}${B}"
echo "╔══════════════════════════════════════╗"
echo "║           AUTO TEST RAM             ║"
echo "╚══════════════════════════════════════╝"
echo -e "${R}"

BEFORE=$(free -m | grep Mem | awk '{print $4}')
echo " RAM free sebelum : ${BEFORE}MB"
sleep 1
clean_ram
sleep 1
AFTER=$(free -m | grep Mem | awk '{print $4}')
echo " RAM free setelah : ${AFTER}MB"

if [ "$AFTER" -gt "$BEFORE" ]; then
  echo -e "${G}[✓] RAM CLEAN SUCCESS${R}"
  log "RAM CLEAN SUCCESS"
else
  echo -e "${Y}[!] RAM CLEAN TIDAK BERUBAH${R}"
  log "RAM CLEAN NO CHANGE"
fi
}

main() {
header
check_root
show_ram
progress
clean_ram
progress
show_ram
auto_test
pause
}

main
