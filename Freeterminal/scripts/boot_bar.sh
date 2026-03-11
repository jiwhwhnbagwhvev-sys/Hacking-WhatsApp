#!/data/data/com.termux/files/usr/bin/bash

green='\033[1;32m'
white='\033[1;37m'
reset='\033[0m'

echo ""
echo -e "$white Booting System...$reset"

bar=""

for i in {1..20}
do
bar="${bar}█"
echo -ne "\r$green[$bar]$reset"
sleep 0.05
done

echo ""
echo -e "$green System Loaded ✔$reset"
sleep 0.5
