#!/data/data/com.termux/files/usr/bin/bash

red='\033[1;31m'
white='\033[1;37m'
reset='\033[0m'

echo ""
echo -e "$red SYSTEM SCANNING...$reset"

for i in {1..3}
do
echo -ne "$white\r[▒▒▒▒▒▒▒▒▒▒]$red scanning..."
sleep 0.2
echo -ne "$white\r[████▒▒▒▒▒▒]$red scanning..."
sleep 0.2
echo -ne "$white\r[████████▒▒]$red scanning..."
sleep 0.2
echo -ne "$white\r[██████████]$red scanning..."
sleep 0.2
done

echo ""
echo -e "$red SCAN COMPLETE ✔$reset"
sleep 0.5
