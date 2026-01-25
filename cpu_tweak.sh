#!/bin/bash
clear
echo "[*] CPU Governor tweak"

su -c "
for gov in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
  echo performance > \$gov
done
"

echo "[✓] CPU set to performance"
read -p "Enter untuk kembali"
bash main.sh