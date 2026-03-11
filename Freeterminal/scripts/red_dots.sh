#!/data/data/com.termux/files/usr/bin/bash

red='\033[1;31m'
reset='\033[0m'

echo -ne "$red"

for i in {1..10}
do
echo -n "● "
sleep 0.05
done

echo -e "$reset"
