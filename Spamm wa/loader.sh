#!/bin/bash

clear

# Warna
ungu='\033[1;35m'
hijau='\033[1;32m'
kuning='\033[1;33m'
putih='\033[1;37m'
reset='\033[0m'

# Logo kiri + Judul kanan
echo -e "${ungu}\
      /\_/\              ${hijau}██     ██ ██   ██  █████  ███████ ███████  █████  ██████${reset}
${ungu}     ( o.o )             ${hijau}██     ██ ██   ██ ██   ██    ███  ██      ██   ██ ██   ██${reset}
${ungu}      >  ^  <             ${hijau}██  █  ██ ███████ ███████   ███   █████   ███████ ██████${reset}
${ungu}     /       \            ${hijau}██ ███ ██ ██   ██ ██   ██  ███    ██      ██   ██ ██${reset}
${ungu}    /|       |\           ${hijau} ███ ███  ██   ██ ██   ██ ███████ ███████ ██   ██ ██${reset}
${ungu}   /_|_______|_\${reset}"

echo -e "${putih}--------------------------------------------------${reset}"

# Tulisan kuning di bawah
echo -e "${kuning}* Creator  : Rio"
echo "* Creator  : hpkentang"
echo "* admin    : 085283786794"
echo "* Youtube  : Pecinta hpkentang${reset}"

# Tulisan hijau
echo -e "${hijau}* Github   : github.com/username"
echo "* Support  : supportkamu.com${reset}"

echo ""
echo -e "${kuning}Gunakan dengan bijak, resiko ditanggung pengguna.${reset}"
echo ""
sleep 2

# Jalankan menu terenkripsi
gpg -d menu_aman.gpg | bash
