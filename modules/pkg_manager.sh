#!/data/data/com.termux/files/usr/bin/bash
# ==========================================
# PACKAGE MANAGER MODULE — ROOT_RAGERS
# ==========================================

MODULE_NAME="PACKAGE MANAGER"
LOG="/data/local/tmp/root_ragers.log"
R="\e[0m"
G="\e[1;32m"
Y="\e[1;33m"
RED="\e[1;31m"
C="\e[1;36m"
B="\e[1m"

pause() { read -rp "Tekan ENTER untuk kembali..."; }
log() { echo "[$(date '+%F %T')] $MODULE_NAME : $1" >> "$LOG"; }

header() {
clear
echo -e "${C}${B}"
echo "╔══════════════════════════════════════╗"
echo "║          PACKAGE MANAGER MODULE      ║"
echo "╚══════════════════════════════════════╝"
echo -e "${R}"
}

progress() {
echo -ne "${Y}Memproses package manager"
for i in $(seq 1 40); do
  echo -ne "."
  sleep 0.05
done
echo -e "${R}"
}

check_root() {
if ! command -v su >/dev/null 2>&1; then
  echo -e "${RED}[✗] ROOT TIDAK TERDETEKSI — Beberapa fitur terbatas${R}"
  log "ROOT NOT DETECTED"
else
  echo -e "${G}[✓] ROOT TERDETEKSI — Bisa install/remove package${R}"
  log "ROOT OK"
fi
}

list_packages() {
echo -e "${Y}[*] Daftar package terpasang:${R}"
pkg list-installed | tee /data/local/tmp/package_list.log
log "Listed installed packages"
}

install_package() {
read -rp "Masukkan nama package untuk diinstall: " PKG
if [ -n "$PKG" ]; then
    su -c "pkg install -y $PKG" && echo -e "${G}[✓] Package $PKG berhasil diinstall${R}" && log "Installed package $PKG"
fi
}

remove_package() {
read -rp "Masukkan nama package untuk dihapus: " PKG
if [ -n "$PKG" ]; then
    su -c "pkg uninstall -y $PKG" && echo -e "${G}[✓] Package $PKG berhasil dihapus${R}" && log "Removed package $PKG"
fi
}

auto_test() {
echo -e "${C}${B}"
echo "╔══════════════════════════════════════╗"
echo "║         AUTO TEST PACKAGE MANAGER     ║"
echo "╚══════════════════════════════════════╝"
echo -e "${R}"

TEST_PKG="nano"
if pkg list-installed | grep -q "^$TEST_PKG"; then
    echo -e "${G}[✓] AUTO TEST SUCCESS — $TEST_PKG terdeteksi${R}"
    log "AUTO TEST OK: $TEST_PKG installed"
else
    echo -e "${Y}[!] AUTO TEST NOTICE — $TEST_PKG belum terinstall${R}"
    log "AUTO TEST NOTICE: $TEST_PKG not installed"
fi
sleep 0.5
}

main() {
header
check_root
progress
list_packages

while true; do
    echo -e "${Y}Pilih opsi:${R}"
    echo "1) Install package"
    echo "2) Remove package"
    echo "0) Kembali ke menu"
    read -rp "Pilihan: " opt
    case $opt in
        1) install_package ;;
        2) remove_package ;;
        0) break ;;
        *) echo -e "${RED}[!] Pilihan salah${R}" ;;
    esac
done

progress
auto_test
pause
}

main
