#!/system/bin/sh
# ==========================================
# CPU PERFORMANCE MODULE — ROOT_RAGERS
# ==========================================

MODULE_NAME="CPU PERFORMANCE"
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
echo "║        CPU PERFORMANCE MODULE       ║"
echo "╚══════════════════════════════════════╝"
echo -e "${R}"
}

progress() {
echo -ne "${Y}Memproses CPU"
for i in $(seq 1 25); do
  echo -ne "."
  sleep 0.08
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

list_cores() {
echo -e "${Y}[*] Mendeteksi core CPU...${R}"
CPU_PATH="/sys/devices/system/cpu"
CORES=$(ls -d $CPU_PATH/cpu[0-9]* 2>/dev/null)
NUM_CORES=$(echo "$CORES" | wc -l)
echo "[✓] Total CPU cores: $NUM_CORES"
for cpu in $CORES; do
  MIN_FREQ=$(cat $cpu/cpufreq/cpuinfo_min_freq 2>/dev/null)
  MAX_FREQ=$(cat $cpu/cpufreq/cpuinfo_max_freq 2>/dev/null)
  GOV=$(cat $cpu/cpufreq/scaling_governor 2>/dev/null)
  echo "  $cpu → Min: $MIN_FREQ, Max: $MAX_FREQ, Governor: $GOV"
done
}

set_governor() {
echo -e "${Y}[*] Pilih governor:${R}"
echo "1. performance (maksimal)"
echo "2. powersave (hemat)"
echo "3. interactive (default)"
echo "0. Batal"
read -r -p "Pilihan: " choice

case "$choice" in
  1) GOV="performance" ;;
  2) GOV="powersave" ;;
  3) GOV="interactive" ;;
  0) pause; exit ;;
  *) echo -e "${RED}[!] Pilihan salah${R}"; pause; exit ;;
esac

echo -e "${Y}[*] Menerapkan governor $GOV ke semua core...${R}"
for cpu in $CORES; do
  su -c "echo $GOV > $cpu/cpufreq/scaling_governor" 2>/dev/null
done
}

auto_test() {
[ "$TEST_MODE" != "1" ] && return
echo -e "${C}${B}"
echo "╔══════════════════════════════════════╗"
echo "║           AUTO TEST CPU             ║"
echo "╚══════════════════════════════════════╝"
echo -e "${R}"

TEMP_PATH="/sys/class/thermal/thermal_zone0/temp"
[ ! -f "$TEMP_PATH" ] && { echo -e "${Y}[!] Sensor suhu tidak tersedia${R}"; return; }

TEMP_BEFORE=$(cat "$TEMP_PATH")
TEMP_BEFORE=$((TEMP_BEFORE / 1000))
echo " Suhu awal: ${TEMP_BEFORE}°C"
echo -e "${Y}[*] Stress test ringan...${R}"

# SAFE STRESS: loop kecil 2 detik per core
for cpu in $CORES; do
  yes > /dev/null &
done
sleep 5
killall yes 2>/dev/null

TEMP_AFTER=$(cat "$TEMP_PATH")
TEMP_AFTER=$((TEMP_AFTER / 1000))
echo " Suhu akhir: ${TEMP_AFTER}°C"

if [ "$TEMP_AFTER" -gt "$TEMP_BEFORE" ]; then
  echo -e "${G}[✓] AUTO TEST PANAS BERHASIL${R}"
  log "AUTO TEST OK"
else
  echo -e "${Y}[!] AUTO TEST TIDAK TERDETEKSI${R}"
  log "AUTO TEST NO CHANGE"
fi
}

show_final_status() {
echo -e "${G}[✓] Semua core sudah memakai governor: $GOV${R}"
log "Governor set to $GOV"
}

main() {
header
check_root
progress
list_cores
set_governor
progress
auto_test
show_final_status
pause
}

main
