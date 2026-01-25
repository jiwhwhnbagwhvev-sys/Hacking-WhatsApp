#!/bin/bash
clear
echo "[*] Installing simple adblock (hosts)"

su -c "
mount -o rw,remount /system
echo '127.0.0.1 ads.google.com' >> /system/etc/hosts
"

echo "[✓] Hosts updated"
read -p "Enter untuk kembali"
bash main.sh