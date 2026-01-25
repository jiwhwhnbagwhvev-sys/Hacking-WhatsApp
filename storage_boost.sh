#!/bin/bash
clear
echo "[*] Storage Boost & Cache Cleaner"
su -c "
echo 3 > /proc/sys/vm/drop_caches
sync
rm -rf /data/local/tmp/*
"
echo "[✓] RAM & cache cleaned"
df -h
read -p "Enter untuk kembali"
bash ../main.sh