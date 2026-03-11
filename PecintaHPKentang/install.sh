#!/data/data/com.termux/files/usr/bin/bash

clear
echo "================================"
echo " INSTALL PECINTA HP KENTANG UI"
echo "================================"

sleep 1

pkg update -y
pkg upgrade -y

pkg install figlet -y
pkg install toilet -y
pkg install ruby -y
pkg install neofetch -y
pkg install git -y

echo ""
echo "Membuat folder..."

mkdir -p $HOME/PecintaHPKentang
mkdir -p $HOME/PecintaHPKentang/ui
mkdir -p $HOME/PecintaHPKentang/core
mkdir -p $HOME/PecintaHPKentang/assets
mkdir -p $HOME/PecintaHPKentang/modules
mkdir -p $HOME/PecintaHPKentang/tools
mkdir -p $HOME/PecintaHPKentang/config
mkdir -p $HOME/PecintaHPKentang/scripts
mkdir -p $HOME/PecintaHPKentang/logs
mkdir -p $HOME/PecintaHPKentang/data

echo ""
echo "Mengaktifkan halaman utama..."

echo "bash ~/PecintaHPKentang/start.sh" >> $HOME/.bashrc

echo ""
echo "INSTALL SELESAI"
echo "Restart Termux untuk melihat hasil"

sleep 2
