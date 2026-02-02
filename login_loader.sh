#!/data/data/com.termux/files/usr/bin/bash

clear
echo -e "\e[36m[ SYSTEM LOGIN ]\e[0m"
sleep 1

TMP="$HOME/.login_tmp.sh"

# decrypt sementara ke HOME (bukan /tmp)
gpg --quiet --batch --yes -o "$TMP" -d login.sh.gpg

if [ ! -f "$TMP" ]; then
    echo "Decryption failed!"
    exit 1
fi

chmod +x "$TMP"
bash "$TMP"

# hapus lagi
rm -f "$TMP"
