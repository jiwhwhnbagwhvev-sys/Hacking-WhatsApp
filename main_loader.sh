#!/data/data/com.termux/files/usr/bin/bash

clear
echo -e "\e[32m[ LOADING MAIN SYSTEM ]\e[0m"
sleep 1

gpg --quiet --batch --yes -o /tmp/main_tmp.sh -d main.sh.gpg

chmod +x /tmp/main_tmp.sh
bash /tmp/main_tmp.sh

rm -f /tmp/main_tmp.sh
