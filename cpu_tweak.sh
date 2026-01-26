#!/data/data/com.termux/files/usr/bin/bash
. ./modules/_common.sh

MODUL="CPU Performance"
echo "[*] Menjalankan $MODUL"
loading

need_root
tsu -c 'for c in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do echo performance > $c 2>/dev/null; done'
echo "[✓] CPU di-set ke performance"

back
