#!/bin/bash
clear
echo "[*] SYSTEM INFO"
su -c "
echo 'Android Version:' \$(getprop ro.build.version.release)
echo 'SDK:' \$(getprop ro.build.version.sdk)
echo 'Device:' \$(getprop ro.product.model)
echo 'Kernel:' \$(uname -r)
mount | head
"
read -p "Enter untuk kembali"
bash ../main.sh