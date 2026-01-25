#!/bin/bash
clear
echo "[*] Cleaning RAM"
su -c "
sync
echo 3 > /proc/sys/vm/drop_caches
"
echo "[✓] RAM cleaned"
read; bash main.sh