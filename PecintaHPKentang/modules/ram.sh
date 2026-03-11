#!/data/data/com.termux/files/usr/bin/bash

green='\033[1;32m'
white='\033[1;37m'
reset='\033[0m'

used=$(free -m | awk '/Mem:/ {print $3}')
total=$(free -m | awk '/Mem:/ {print $2}')

percent=$((used*100/total))

bars=$((percent/5))

bar=""

for ((i=0;i<bars;i++))
do
bar+="█"
done

echo ""
echo -e "$white RAM Usage : $used MB / $total MB"
echo -e "$green [$bar] $percent% $reset"
echo ""
