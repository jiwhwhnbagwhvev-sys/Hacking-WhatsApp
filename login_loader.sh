#!/data/data/com.termux/files/usr/bin/bash

clear
echo -e "\e[36m[ SYSTEM LOGIN ]\e[0m"
sleep 1

# decrypt sementara
gpg --quiet --batch --yes -o /tmp/login_tmp.sh -d login.sh.gpg

chmod +x /tmp/login_tmp.sh
bash /tmp/login_tmp.sh

# hapus lagi
rm -f /tmp/login_tmp.sh
