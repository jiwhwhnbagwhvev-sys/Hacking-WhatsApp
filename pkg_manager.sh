#!/bin/bash
clear
echo "1. Install APK dari path"
echo "2. Uninstall Package"
read -p "Pilih: " opt
case $opt in
1)
  read -p "Path APK: " path
  su -c "pm install -r $path"
  ;;
2)
  read -p "Package name: " pkg
  su -c "pm uninstall $pkg"
  ;;
*)
  echo "Invalid"
  ;;
esac
read -p "Enter untuk kembali"
bash ../main.sh