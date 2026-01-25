#!/bin/bash
clear
echo "[*] GPU BOOST"
su -c "
for g in /sys/class/kgsl/kgsl-3d0/devfreq/governor; do
 echo performance > \$g
done
"
echo "[✓] GPU performance enabled"
read; bash main.sh