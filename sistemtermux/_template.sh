#!/system/bin/sh
# ==========================================
# MODULE TEMPLATE — ROOT_RAGERS
# ==========================================

MODULE_NAME="MODULE_NAME_HERE"
LOG="/data/local/tmp/root_ragers.log"
TEST_MODE=1   # 1 = aktif, 0 = mati

# ---------- COLOR ----------
R="\e[0m"; G="\e[1;32m"; Y="\e[1;33m"; RED="\e[1;31m"; C="\e[1;36m"

# ---------- BASIC ----------
pause() { read -rp "Tekan ENTER..."; }
log() { echo "[$(date '+%H:%M:%S')] $1" >> "$LOG"; }

header() {
clear
echo -e "${C}╔════════════════════════════════════╗"
echo -e "║  $MODULE_NAME"
echo -e "╚════════════════════════════════════╝${R}"
}

check_root() {
if ! su -c "id" >/dev/null 2>&1; then
  echo -e "${RED}[✗] ROOT TIDAK TERDETEKSI${R}"
  log "$MODULE_NAME : ROOT FAILED"
  exit 1
fi
echo -e "${G}[✓] ROOT TERDETEKSI${R}"
}

progress() {
for i in $(seq 1 100); do
  echo -ne " Progress: $i% \r"
  sleep 0.02
done
echo
}

success() {
echo -e "${G}[SUCCESS] $1${R}"
log "$MODULE_NAME : SUCCESS"
}

failed() {
echo -e "${RED}[FAILED] $1${R}"
log "$MODULE_NAME : FAILED"
}

# ---------- TEST ----------
auto_test() {
[ "$TEST_MODE" != "1" ] && return

echo -e "${Y}[*] Menjalankan AUTO TEST...${R}"
sleep 1

TEMP_BEFORE=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null)
TEMP_BEFORE=$((TEMP_BEFORE/1000))

# SAFE STRESS
for i in {1..3}; do
  yes > /dev/null &
done
sleep 5
killall yes 2>/dev/null

TEMP_AFTER=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null)
TEMP_AFTER=$((TEMP_AFTER/1000))

echo " Suhu awal : ${TEMP_BEFORE}°C"
echo " Suhu akhir: ${TEMP_AFTER}°C"

if [ "$TEMP_AFTER" -gt "$TEMP_BEFORE" ]; then
  success "AUTO TEST PANAS BERHASIL"
else
  failed "AUTO TEST TIDAK TERDETEKSI"
fi
}

# ---------- MAIN ----------
main() {
header
check_root
progress
auto_test
pause
}

main
