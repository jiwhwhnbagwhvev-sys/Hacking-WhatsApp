#!/system/bin/sh
# ==========================================
# DISABLE THERMAL MODULE — ROOT_RAGERS
# ==========================================

MODULE_NAME="DISABLE THERMAL"
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
echo "║        DISABLE THERMAL MODULE        ║"
echo "╚══════════════════════════════════════╝"
echo -e "${R}"
}

progress() {
echo -ne "${Y}Memproses Thermal"
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

detect_thermal() {
THERM_PATH="/sys/class/thermal"
if [ ! -d "$THERM_PATH" ]; then
  echo -e "${Y}[!] Thermal path tidak ditemukan${R}"
  THERM_PATH=""
else
  echo -e "${G}[✓] Thermal path: $THERM_PATH${R}"
fi
}

show_thermal_status() {
[ -z "$THERM_PATH" ] && return
echo -e "${Y}[*] Status suhu saat ini:${R}"
for t in $THERM_PATH/thermal_zone*; do
  if [ -f "$t/temp" ]; then
    ZONE=$(basename "$t")
    TEMP=$(cat "$t/temp")
    TEMP=$((TEMP/1000))
    echo " $ZONE : ${TEMP}°C"
  fi
done
}

disable_throttling() {
[ -z "$THERM_PATH" ] && return
echo -e "${Y}[*] Mencoba menonaktifkan throttling...${R}"
# SAFE: nonaktifkan trip points
for t in $THERM_PATH/thermal_zone*; do
  if [ -f "$t/mode" ]; then
    su -c "echo disabled > $t/mode" 2>/dev/null
    log "$t mode disabled"
  fi
done
}

auto_test() {
[ "$TEST_MODE" != "1" ] && return
[ -z "$THERM_PATH" ] && return

echo -e "${C}${B}"
echo "╔══════════════════════════════════════╗"
echo "║         AUTO TEST THERMAL           ║"
echo "╚══════════════════════════════════════╝"
echo -e "${R}"

TEMP_BEFORE=$(cat $THERM_PATH/thermal_zone0/temp 2>/dev/null)
TEMP_BEFORE=$((TEMP_BEFORE/1000))
echo " Suhu awal: ${TEMP_BEFORE}°C"

echo -e "${Y}[*] Sleep 3 detik untuk uji thermal...${R}"
sleep 3

TEMP_AFTER=$(cat $THERM_PATH/thermal_zone0/temp 2>/dev/null)
TEMP_AFTER=$((TEMP_AFTER/1000))
echo " Suhu setelah: ${TEMP_AFTER}°C"

if [ "$TEMP_AFTER" -le "$TEMP_BEFORE" ]; then
  echo -e "${G}[✓] AUTO TEST THERMAL SUCCESS${R}"
  log "THERMAL TEST OK"
else
  echo -e "${Y}[!] AUTO TEST THERMAL TIDAK BERUBAH${R}"
  log "THERM
