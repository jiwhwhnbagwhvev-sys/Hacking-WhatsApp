#!/bin/bash
clear
echo "[*] Network Boost"
su -c "
sysctl -w net.ipv4.tcp_congestion_control=bbr
"
echo "[✓] Network boosted"
read; bash main.sh