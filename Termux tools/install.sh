#!/data/data/com.termux/files/usr/bin/bash

clear

echo "=============================="
echo " INSTALL TERMUX TOOLS"
echo "=============================="

pkg update -y
pkg upgrade -y

pkg install git -y
pkg install neofetch -y

echo "Setup Auto Start Termux..."

# Setup auto start
if ! grep -q "Hacking-WhatsApp" ~/.bashrc; then
echo "cd ~/Hacking-WhatsApp" >> ~/.bashrc
echo "bash banner.sh" >> ~/.bashrc
fi

echo "Install selesai!"
echo "Restart Termux kamu"
