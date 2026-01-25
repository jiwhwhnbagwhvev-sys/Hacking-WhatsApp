#!/bin/bash
clear
echo "[!] Disable Thermal Control"
su -c "
stop thermal-engine 2>/dev/null
stop vendor.thermal-engine 2>/dev/null
"
echo "[✓] Thermal disabled (temporary)"
read; bash main.sh