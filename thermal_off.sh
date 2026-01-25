#!/system/bin/sh
su -c "stop thermal-engine" 2>/dev/null
su -c "stop vendor.thermal-engine" 2>/dev/null
echo "[✓] THERMAL OFF"
read -p "Enter..."
exec ../main.sh
