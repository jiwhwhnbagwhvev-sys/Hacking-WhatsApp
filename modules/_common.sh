#!/data/data/com.termux/files/usr/bin/bash

# ===============================
# ROOT_RAGERS COMMON LIBRARY
# ===============================

RED="\e[1;31m"
GRN="\e[1;32m"
YEL="\e[1;33m"
BLU="\e[1;34m"
CYN="\e[1;36m"
WHT="\e[1;37m"
RST="\e[0m"

line() {
  echo -e "${CYN}--------------------------------------------${RST}"
}

pause() {
  echo
  read -p "Tekan Enter untuk kembali ke menu..."
}

spinner() {
  local pid=$!
  local spin='-\|/'
  while kill -0 $pid 2>/dev/null; do
    for i in {0..3}; do
      printf "\r${YEL}[${spin:$i:1}] Processing...${RST}"
      sleep 0.1
    done
  done
  echo
}

need_root() {
  if ! command -v tsu >/dev/null 2>&1; then
    echo -e "${RED}[!] Root (tsu) tidak ditemukan${RST}"
    echo -e "${YEL}[*] Install Magisk + tsu terlebih dahulu${RST}"
    pause
    return 1
  fi
  return 0
}

header() {
  clear
  line
  echo -e "${BLU}${1}${RST}"
  line
}
