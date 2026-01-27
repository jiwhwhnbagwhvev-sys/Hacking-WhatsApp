#!/data/data/com.termux/files/usr/bin/bash
# ==========================================
# STORAGE BOOST MODULE — ROOT_RAGERS
# ==========================================

MODULE_NAME="STORAGE BOOST"
LOG="/data/local/tmp/root_ragers.log"
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
echo "║          STORAGE BOOST MODULE        ║"
echo "╚══════════════════════════════════════╝"
echo -e "${R}"
}

progress() {
echo -ne "${Y}Optimasi storage"
for i in $(seq 1 40); do
  echo -ne "."
  sleep 0.05
done
echo -e "${R}"
}

check_root() {
if ! command -v su >/dev/null 2>&1; then
  echo -e "${RED}[✗] ROOT TIDAK TERDETEKSI — Operasi terbatas${R}"
  log "ROOT NOT DETECTED"
  exit 1
else
  echo -e "${G}[✓] ROOT TERDETEKSI — Bisa optimasi storage${R}"
  log "ROOT OK"
fi
}

storage_boost() {
echo -e "${Y}[*] Menghapus cache dan temporary files...${R}"
sleep 0.3

# Hapus cache aplikasi di /data
su -c "rm -rf /data/local/tmp/* /data/local/cache/* 2>/dev/null"
log "Cleared temp files"

# Sync dan trim filesystem
su -c "sync; echo 3 > /proc/sys/vm/drop_caches 2>/dev/null"
log "Dropped caches"

echo -e "${G}[✓] Storage boost selesai${R}"
}

auto_test() {
echo -e "${C}${B}"
echo "╔══════════════════════════════════════╗"
echo "║          AUTO TEST STORAGE           ║"
echo "╚══════════════════════════════════════╝"
echo -e "${R}"

# Test apakah folder /data/local/tmp bisa dihapus
TEST_FILE="/data/local/tmp/io_test.tmp"
su -c "touch $TEST_FILE" 2>/dev/null
if [ -f "$TEST_FILE" ]; then
    su -c "rm -f $TEST_FILE"
    echo -e "${G}[✓] AUTO TEST SUCCESS — Storage dapat dihapus${R}"
    log "AUTO TEST OK: Storage deletable"
else
    echo -e "${RED}[✗] AUTO TEST FAILED — Storage write/read gagal${R}"
    log "AUTO TEST FAILED: Storage write/read"
fi
sleep 0.5
}

main() {
header
check_root
progress
storage_boost
progress
auto_test
pause
}

main
