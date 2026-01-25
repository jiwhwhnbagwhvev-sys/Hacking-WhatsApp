#!/bin/bash
clear
echo "[!] WARNING: Security risk"
su -c "setenforce 0"
echo "[✓] SELinux permissive"
read; bash main.sh