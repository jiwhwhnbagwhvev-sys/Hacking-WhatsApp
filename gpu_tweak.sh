#!/data/data/com.termux/files/usr/bin/bash
. ./modules/_common.sh

MODUL="GPU Boost"
echo "[*] Menjalankan $MODUL"
loading

need_root
tsu -c 'for f in /sys/class/kgsl/kgsl-3d0/*freq*; do cat $f 2>/dev/null; done'
echo "[i] GPU boost tergantung kernel"

back
