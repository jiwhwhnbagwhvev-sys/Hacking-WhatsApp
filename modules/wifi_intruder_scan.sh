#!/data/data/com.termux/files/usr/bin/bash
# =================================================
# WIFI INTRUDER SCANNER — ROOT_RAGERS
# =================================================

MODULE_NAME="WIFI INTRUDER SCANNER"
LOG="/data/local/tmp/root_ragers.log"

R="\e[0m"
G="\e[1;32m"
RED="\e[1;31m"
Y="\e[1;33m"
C="\e[1;36m"
B="\e[1m"
M="\e[1;35m"

pause(){ read -rp "Tekan ENTER untuk kembali ke menu..."; }
log(){ echo "[$(date '+%F %T')] $MODULE_NAME : $1" >> "$LOG"; }

hacker_screen() {
clear
echo -e "${G}"
for i in {1..15}; do
  cat <<EOF
01001001 01001110 01010100 01010010 01010101 01000100 01000101 01010010
ACCESSING ROUTER MEMORY [$((RANDOM%99))%]
SNIFFING PACKETS.............
EOF
  sleep 0.08
done
echo -e "${R}"
}

header(){
clear
echo -e "${M}${B}"
echo "╔══════════════════════════════════════╗"
echo "║        WIFI INTRUDER SCANNER         ║"
echo "╚══════════════════════════════════════╝"
echo -e "${R}"
}

check_network(){
if ! ip route | grep -q wlan; then
  echo -e "${RED}[✗] Tidak terhubung ke WiFi${R}"
  exit 1
fi
}

scan_lan(){
echo -e "${Y}[*] Melakukan scan jaringan lokal...${R}"

NET=$(ip route | grep wlan | awk '{print $1}')
BASE=$(echo $NET | cut -d'.' -f1-3)

echo -e "${C}[i] Network Detected: $NET${R}"
echo -e "${C}[i] Scanning IP: $BASE.1 - $BASE.254${R}"
sleep 1

for i in {1..254}; do
  ping -c 1 -W 1 $BASE.$i >/dev/null 2>&1 &
done
wait
}

show_devices(){
clear
header
echo -e "${G}${B}"
printf "%-18s %-22s %-10s\n" "IP ADDRESS" "MAC ADDRESS" "STATUS"
echo "----------------------------------------------------------"
echo -e "${R}"

ip neigh | grep wlan | while read line; do
  IP=$(echo $line | awk '{print $1}')
  MAC=$(echo $line | awk '{print $5}')
  STATE=$(echo $line | awk '{print $6}')
  echo -e "${G}$IP${R}      ${Y}$MAC${R}      ${C}$STATE${R}"
  log "Device detected: $IP | $MAC | $STATE"
done
}

auto_test(){
echo
echo -e "${C}${B}"
echo "╔══════════════════════════════════════╗"
echo "║        AUTO TEST RESULT              ║"
echo "╚══════════════════════════════════════╝"
echo -e "${R}"

COUNT=$(ip neigh | grep wlan | wc -l)
if [ "$COUNT" -gt 0 ]; then
  echo -e "${G}[✓] $COUNT device terdeteksi di WiFi${R}"
  log "AUTO TEST OK: $COUNT devices found"
else
  echo -e "${RED}[✗] Tidak ada device terdeteksi${R}"
  log "AUTO TEST FAILED: No device"
fi
}

main(){
header
check_network
hacker_screen
scan_lan
show_devices
auto_test
pause
}

main
