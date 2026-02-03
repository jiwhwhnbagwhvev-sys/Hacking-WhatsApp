#!/data/data/com.termux/files/usr/bin/bash
clear
echo -e "\e[36m[ LOADING MAIN SYSTEM ]\e[0m"
sleep 1

TMP="$HOME/.main_tmp.sh"

gpg -d main.sh.gpg > "$TMP" || exit
chmod +x "$TMP"
bash "$TMP"
rm -f "$TMP"
