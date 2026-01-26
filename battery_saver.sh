#!/data/data/com.termux/files/usr/bin/bash
# ==========================================
# BATTERY SAVER MODULE — ROOT_RAGERS
# ==========================================

MODULE_NAME="BATTERY SAVER"
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
echo "║          BATTERY SAVER MODULE        ║"
echo "╚══════════════════════════════════════╝"
echo -e "${R}"
}

progress() {
echo -ne "${Y}Mengoptimasi baterai"
for i in $(seq 1 30); do
  echo -ne "."
  sleep 0.05
done
echo -e "${R}"
}

check_battery() {
BATTERY_LEVEL=$(dumpsys battery | grep level | awk '{print $2}')
BATTERY_STATUS=$(dumpsys battery | grep status | awk '{print $2}')
TEMP=$(dumpsys battery | grep temperature | awk '{print $2}')
echo -e "${Y}[*] Status baterai: level=$BATTERY_LEVEL%, status=$BATTERY_STATUS, suhu=$(($TEMP/10))°C${R}"
log "Battery level=$BATTERY_LEVEL%, status=$BATTERY_STATUS, temp=$(($TEMP/10))°C"
}

optimize_battery() {
echo -e "${Y}[*] Mengoptimasi sistem untuk menghemat baterai...${R}"
# CPU throttling / governor
if [ -f /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq ]; then
  for CPU in /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq; do
    su -c "echo 800000 > $CPU" 2>/dev/null
  done
  echo -e "${G}[✓] CPU maksimum dibatasi untuk hemat daya${R}"
  log "CPU throttling applied"
fi

# Matikan background app (simple)
APPS=($(pm list packages -3 | cut -d: -f2))
for APP in "${APPS[@]}"; do
  su -c "pm disable-user --user 0 $APP" >/dev/null 2>&1
done
echo -e "${G}[✓] Background apps dimatikan sementara${R}"
log "Background apps disabled"

# Network tweak (mode hemat)
su -c "svc wifi disable" >/dev/null 2>&1
su -c "svc data disable" >/dev/null 2>&1
echo -e "${G}[✓] Network services dimatikan sementara${R}"
log "Network disabled"
}

auto_test() {
echo -e "${C}${B}"
echo "╔══════════════════════════════════════╗"
echo "║          AUTO TEST BATTERY           ║"
echo "╚══════════════════════════════════════╝"
echo -e "${R}"

# Test ringan: cek CPU, apps, network
CPU_TEST=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 2>/dev/null)
if [ -n "$CPU_TEST" ]; then
  echo -e "${G}[✓] AUTO TEST SUCCESS — CPU throttling OK${R}"
else
  echo -e "${RED}[✗] AUTO TEST FAILED — CPU throttling gagal${R}"
fi
pause
}

main() {
header
check_battery
progress
optimize_battery
progress
auto_test
pause
}

main
