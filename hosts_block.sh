#!/data/data/com.termux/files/usr/bin/bash
. ./modules/_common.sh

MODUL="Hosts Adblock"
echo "[*] Menjalankan $MODUL"
loading

need_root
tsu -c "mount -o rw,remount /system || true"
tsu -c "cat > /system/etc/hosts <<EOL
127.0.0.1 localhost
0.0.0.0 ads.google.com
0.0.0.0 doubleclick.net
0.0.0.0 adservice.google.com
EOL"
echo "[✓] Hosts updated"

back
