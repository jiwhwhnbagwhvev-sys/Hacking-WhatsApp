#!/data/data/com.termux/files/usr/bin/bash

# ==============================
#           BANNER
# ==============================

bash banner.sh

# ==============================
#        TIME LOCK SYSTEM
# ==============================

hour=$(TZ=Asia/Jakarta date +"%H")
time=$(TZ=Asia/Jakarta date +"%H:%M")

# jika jam 19:00 - 04:00
if [ "$hour" -ge 19 ] || [ "$hour" -lt 4 ]; then

    echo ""
    echo "======================================"
    echo "        PECINTA HP KENTANG"
    echo "======================================"
    echo ""
    echo "            🔒 FITUR TERKUNCI"
    echo ""
    echo "   Waktu Indonesia : $time WIB"
    echo "   (Sabang sampai Merauke)"
    echo ""
    echo "   Fitur hanya aktif pada:"
    echo "   04:00 Subuh - 19:00 Malam"
    echo ""
    echo "======================================"
    echo ""

    exit 1
fi

echo ""
echo "======================================"
echo "        STATUS fitur : ONLINE"
echo "======================================"
echo ""
