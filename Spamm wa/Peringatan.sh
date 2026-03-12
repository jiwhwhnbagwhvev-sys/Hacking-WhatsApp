#!/data/data/com.termux/files/usr/bin/bash

# ==============================
#           BANNER
# ==============================

RED='\033[1;31m'
WHITE='\033[1;37m'
NC='\033[0m'

clear

echo -e "${RED}"
echo "██████╗ ███████╗ ██████╗██╗███╗   ██╗████████╗ █████╗ "
echo "██╔══██╗██╔════╝██╔════╝██║████╗  ██║╚══██╔══╝██╔══██╗"
echo "██████╔╝█████╗  ██║     ██║██╔██╗ ██║   ██║   ███████║"
echo "██╔═══╝ ██╔══╝  ██║     ██║██║╚██╗██║   ██║   ██╔══██║"
echo "██║     ███████╗╚██████╗██║██║ ╚████║   ██║   ██║  ██║"
echo "╚═╝     ╚══════╝ ╚═════╝╚═╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝"
echo -e "${WHITE}"
echo "        ██████╗ ██╗  ██╗██████╗ ███████╗███╗   ██╗████████╗ █████╗ ███╗   ██╗ ██████╗ "
echo "        ██╔══██╗██║ ██╔╝██╔══██╗██╔════╝████╗  ██║╚══██╔══╝██╔══██╗████╗  ██║██╔════╝ "
echo "        ██████╔╝█████╔╝ ██████╔╝█████╗  ██╔██╗ ██║   ██║   ███████║██╔██╗ ██║██║  ███╗"
echo "        ██╔═══╝ ██╔═██╗ ██╔═══╝ ██╔══╝  ██║╚██╗██║   ██║   ██╔══██║██║╚██╗██║██║   ██║"
echo "        ██║     ██║  ██╗██║     ███████╗██║ ╚████║   ██║   ██║  ██║██║ ╚████║╚██████╔╝"
echo "        ╚═╝     ╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ "
echo -e "${NC}"
echo ""
echo "          Tool By Pecinta hpkentang"
echo ""

sleep 2

# ==============================
#        TIME LOCK SYSTEM
# ==============================

current_hour=$(date +"%H")

# Jika sebelum jam 04:00
if [ "$current_hour" -lt 4 ]; then
    echo ""
    echo "======================================"
    echo "   FITUR BELUM BISA DIGUNAKAN"
    echo "   Tool online mulai jam 04:00"
    echo "   Silakan tunggu sampai subuh."
    echo "======================================"
    echo ""
    exit 1
fi

# Jika setelah jam 19:00
if [ "$current_hour" -ge 19 ]; then
    echo ""
    echo "======================================"
    echo "   ERROR : Fitur sedang offline"
    echo "   Waktu penggunaan hanya sampai 19:00"
    echo "   Silakan gunakan kembali besok."
    echo "======================================"
    echo ""
    exit 1
fi

echo "Tool siap digunakan..."
