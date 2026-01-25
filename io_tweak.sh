#!/bin/bash
clear
echo "[*] IO Performance"
su -c "
for q in /sys/block/*/queue/scheduler; do
 echo noop > \$q
done
"
echo "[✓] IO optimized"
read; bash main.sh