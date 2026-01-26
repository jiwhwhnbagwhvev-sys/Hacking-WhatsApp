#!/data/data/com.termux/files/usr/bin/bash
. ./modules/_common.sh

header "RAM CLEANER & MEMORY CONTROL"

need_root || exit

echo "[*] Status RAM sebelum pembersihan:"
free -h
line

echo "Pilih metode pembersihan:"
echo "1. Drop page cache"
echo "2. Drop dentries & inode"
echo "3. Drop ALL cache (recommended)"
echo "0. Batal"
read -p "Pilihan: " opt

case $opt in
  1) DROP=1 ;;
  2) DROP=2 ;;
  3) DROP=3 ;;
  0) pause; exit ;;
  *) echo "[!] Pilihan tidak valid"; pause; exit ;;
esac

echo
echo "[*] Sinkronisasi filesystem..."
$ROOTCMD -c sync & spinner

echo "[*] Menjalankan drop_caches = $DROP"
$ROOTCMD -c "echo $DROP > /proc/sys/vm/drop_caches"

sleep 0.5
line
echo "[*] Status RAM setelah pembersihan:"
free -h

line
echo -e "${GRN}[✓] RAM CLEANER SELESAI — MODE $DROP${RST}"
pause
