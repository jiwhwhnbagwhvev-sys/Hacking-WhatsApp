#!/data/data/com.termux/files/usr/bin/bash
# ==========================================
# SYSTEM INFO MODULE — ROOT_RAGERS
# ==========================================

MODULE_NAME="SYSTEM INFO"
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
echo "║           SYSTEM INFO MODULE         ║"
echo "╚══════════════════════════════════════╝"
echo -e "${R}"
}

progress() {
echo -ne "${Y}Mengambil informasi"
for i in $(seq 1 30); do
  echo -ne "."
  sleep 0.05
done
echo -e "${R}"
}

check_root() {
if command -v tsu >/dev/null 2>&1 || command -v su >/dev/null 2>&1; then
  echo -e "${G}[✓] ROOT TERDETEKSI${R}"
  log "ROOT DETECTED"
else
  echo -e "${Y}[!] ROOT TIDAK TERDETEKSI — Beberapa info mungkin terbatas${R}"
  log "ROOT NOT DETECTED"
fi
}

get_system_info() {
echo -e "${Y}[*] Informasi perangkat:${R}"

# OS & Kernel
echo " OS : $(uname -o 2>/dev/null || echo Unknown)"
echo " Kernel : $(uname -r 2>/dev/null || echo Unknown)"
echo " Architecture : $(uname -m 2>/dev/null || echo Unknown)"

# CPU
if [ -f /proc/cpuinfo ]; then
  echo " CPU : $(grep -m1 'model name' /proc/cpuinfo | cut -d: -f2 | xargs)"
  echo " CPU Cores : $(grep -c '^processor' /proc/cpuinfo)"
fi

# RAM
if [ -f /proc/meminfo ]; then
  TOTAL=$(grep MemTotal /proc/meminfo | awk '{print $2/1024 " MB"}')
  FREE=$(grep MemFree /proc/meminfo | awk '{print $2/1024 " MB"}')
  echo " RAM Total : $TOTAL"
  echo " RAM Free : $FREE"
fi

# Storage
STORAGE=$(df -h /data | tail -1 | awk '{print $2 " total, " $4 " free"}')
echo " Storage /data : $STORAGE"
}

auto_test() {
[ "$TEST_MODE" != "1" ] && return

echo -e "${C}${B}"
echo "╔══════════════════════════════════════╗"
echo "║           AUTO TEST SYSTEM           ║"
echo "╚══════════════════════════════════════╝"
echo -e "${R}"

# Test ringan: cek CPU, RAM, Storage
CPU_TEST=$(grep -c '^processor' /proc/cpuinfo 2>/dev/null)
RAM_TEST=$(grep MemTotal /proc/meminfo 2>/dev/null)
STORAGE_TEST=$(df -h /data | tail -1 | awk '{print $2}')

if [ -n "$CPU_TEST" ] && [ -n "$RAM_TEST" ] && [ -n "$STORAGE_TEST" ]; then
  echo -e "${G}[✓] AUTO TEST SYSTEM SUCCESS — semua info terbaca${R}"
  log "SYSTEM INFO AUTO TEST OK"
else
  echo -e "${RED}[✗] AUTO TEST SYSTEM FAILED — info tidak lengkap${R}"
  log "SYSTEM INFO AUTO TEST FAILED"
fi
}

main() {
header
check_root
progress
get_system_info
progress
auto_test
pause
}

main
