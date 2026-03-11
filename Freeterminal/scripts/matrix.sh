#!/data/data/com.termux/files/usr/bin/bash

green='\033[1;32m'
reset='\033[0m'

clear

echo -e "$green"

for i in {1..15}
do
echo "0101010101010101010101010101010101010101"
sleep 0.05
echo "1010101010101010101010101010101010101010"
sleep 0.05
echo "0011001100110011001100110011001100110011"
sleep 0.05
done

echo -e "$reset"
