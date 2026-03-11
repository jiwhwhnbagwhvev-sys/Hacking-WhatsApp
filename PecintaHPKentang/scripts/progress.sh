#!/data/data/com.termux/files/usr/bin/bash

red='\033[1;31m'
white='\033[1;37m'
yellow='\033[1;33m'
reset='\033[0m'

echo ""
echo -e "$yellow SYSTEM BOOTING...$reset"

for i in {1..20}
do
echo -ne "$white\r["
for ((j=1;j<=i;j++))
do
echo -ne "#"
done
for ((k=i;k<20;k++))
do
echo -ne "-"
done
echo -ne "] $((i*5))%"
sleep 0.1
done

echo ""
echo -e "$red BOOT COMPLETE ✔$reset"
