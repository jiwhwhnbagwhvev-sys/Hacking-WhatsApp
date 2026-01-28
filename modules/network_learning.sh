#!/data/data/com.termux/files/usr/bin/bash
# ==========================================
# NETWORK LEARNING MODULE — ROOT_RAGERS
# REAL NETWORK ANALYSIS (SAFE)
# ==========================================

MODULE_NAME="NETWORK LEARNING"
LOG="/data/local/tmp/root_ragers.log"

R="\e[0m"; G="\e[1;32m"; Y="\e[1;33m"
RED="\e[1;31m"; C="\e[1;36m"; B="\e[1m"

pause() { read -rp "ENTER untuk kembali..."; }
log() { echo "[$(date '+%F %T')] $MODULE_NAME : $1" >> "$LOG"; }

header() {
clear
echo -e "${C}${B}"
echo "╔══════════════════════════════════════╗"
echo "║        NETWORK LEARNING MODULE       ║"
echo "║     Belajar Kualitas Jaringan        ║"
echo "╚══════════════════════════════════════╝"
echo -e "${R}"
}

progress() {
echo -ne "${Y}Menganalisa jaringan"
for i in $(seq 1 35); do
  echo -ne "."
  sleep 0.04
done
echo -e "${R}"
}

show_basic_info() {
echo -e "${Y}[*] Informasi jaringan dasar${R}"
ip route | head -n 3
ss -tun | wc -l | awk '{print "Total koneksi aktif:",$1}'
}

latency_test() {
TARGET="8.8.8.8"
echo -e "${Y}[*] Test latency ke $TARGET${R}"

PING=$(ping -c 10 $TARGET 2>/dev/null)
LOSS=$(echo "$PING" | grep -oP '\d+(?=% packet loss)')
AVG=$(echo "$PING" | grep rtt | awk -F'/' '{print $5}')

echo "Packet loss : $LOSS%"
echo "Average ping: ${AVG} ms"

log "Latency $AVG ms, Loss $LOSS%"

LAT="$AVG"
}

jitter_test() {
echo -e "${Y}[*] Menghitung jitter (stabilitas)${R}"
JITTER=$(ping -c 20 8.8.8.8 | tail -1 | awk -F'/' '{print $7}')
echo "Jitter : ${JITTER} ms"
log "Jitter $JITTER ms"
}

bandwidth_hint() {
echo -e "${Y}[*] Analisa bottleneck${R}"

if [ "$(ss -tun | wc -l)" -gt 100 ]; then
  echo -e "${RED}[!] Banyak koneksi aktif → kemungkinan bandwidth penuh${R}"
else
  echo -e "${G}[✓] Jumlah koneksi normal${R}"
fi
}

recommendation() {
echo
echo -e "${C}${B}=== REKOMENDASI ===${R}"

if [ "${LAT%.*}" -gt 100 ]; then
  echo "- Ping tinggi → ganti DNS / pindah WiFi"
fi

if [ "${LOSS}" -gt 5 ]; then
  echo "- Packet loss tinggi → sinyal lemah / interferensi"
fi

if [ "${JITTER%.*}" -gt 20 ]; then
  echo "- Jitter tinggi → jaringan tidak stabil"
fi

echo "- Matikan aplikasi berat (torrent, streaming)"
echo "- Gunakan WiFi 5GHz jika tersedia"
echo "- Dekatkan ke router"
}

auto_test() {
echo
echo -e "${C}${B}"
echo "╔══════════════════════════════════════╗"
echo "║        AUTO TEST NETWORK OK          ║"
echo "╚══════════════════════════════════════╝"
echo -e "${R}"

if command -v ping >/dev/null; then
  echo -e "${G}[✓] Tool network tersedia${R}"
else
  echo -e "${RED}[✗] Tool network tidak lengkap${R}"
fi
}

main() {
header
progress
show_basic_info
progress
latency_test
jitter_test
bandwidth_hint
recommendation
auto_test
pause
}

main
