#!/data/data/com.termux/files/usr/bin/bash
. ./modules/_common.sh

MODUL="System Info"
echo "[*] Menjalankan $MODUL"
loading

echo "Model: $(getprop ro.product.model)"
echo "Android: $(getprop ro.build.version.release)"
echo "CPU: $(getprop ro.product.cpu.abi)"
echo "Uptime: $(uptime)"
free -h

back
