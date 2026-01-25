#!/system/bin/sh
su -c "fstrim -v /data" >/dev/null
echo "[✓] STORAGE TRIM"
read -p "Enter..."
exec ../main.sh
