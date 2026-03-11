#!/data/data/com.termux/files/usr/bin/bash

green='\033[1;32m'
white='\033[1;37m'
reset='\033[0m'

cpu=$(top -bn1 | grep "%Cpu" | awk '{print 100 - $8}')
cpu=${cpu%.*}

bars=$((cpu/5))

bar=""

for ((i=0;i<bars;i++))
do
bar+="█"
done

echo ""
echo -e "$white CPU Usage : $cpu%"
echo -e "$green [$bar] $reset"
echo ""
