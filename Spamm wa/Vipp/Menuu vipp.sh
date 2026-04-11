#!/data/data/com.termux/files/usr/bin/bash

# =========================
# CONFIG
# =========================
VIP_FILE="vip_users.txt"
DEVICE_FILE="device_lock.txt"
VOUCHER_FILE="voucher.txt"

# warna
WHITE='\033[1;37m'
GOLD='\033[1;33m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear

# =========================
# DETEKSI DEVICE
# =========================
DEVICE=$(getprop ro.product.model)
IP=$(hostname -I | awk '{print $1}')

if [ -f $DEVICE_FILE ]; then
    LOCK=$(cat $DEVICE_FILE)
    if [ "$DEVICE" != "$LOCK" ]; then
        echo "AKSES DITOLAK! DEVICE TERKUNCI!"
        exit
    fi
else
    echo $DEVICE > $DEVICE_FILE
fi

# =========================
# USER ONLINE
# =========================
[ ! -f $VIP_FILE ] && touch $VIP_FILE
USER=$(wc -l < $VIP_FILE)

# =========================
# HEADER
# =========================
clear
echo -e "${GOLD}██████╗ ██████╗ ██╗   ██╗████████╗ █████╗ ██╗     ${NC}"
echo -e "${WHITE}        BRUTAL VIP PANEL        ${NC}"
echo ""
echo -e "${YELLOW}YouTube : Pecinta hpkentang${NC}"
echo -e "${BLUE}Status  : ONLINE${NC}"
echo -e "${BLUE}Device  : $DEVICE${NC}"
echo -e "${BLUE}IP      : $IP${NC}"
echo -e "${YELLOW}User VIP Online : $USER${NC}"
echo ""

# =========================
# MENU AWAL
# =========================
echo -e "${BLUE}=============================${NC}"
echo -e "${YELLOW}[1] AKSES VIP${NC}"
echo -e "${BLUE}=============================${NC}"

read -p "Pilih : " pilih

if [ "$pilih" = "1" ]; then
    echo ""
    read -p "Masukkan Voucher : " kode

    if grep -q "$kode" $VOUCHER_FILE; then
        echo "AKSES BERHASIL!"
        echo $DEVICE >> $VIP_FILE
        sed -i "/$kode/d" $VOUCHER_FILE
        sleep 2

        # =========================
        # MENU VIP
        # =========================
        while true; do
            clear
            echo -e "${GOLD}=========== VIP MENU ===========${NC}"
            echo -e "${BLUE}================================${NC}"
            echo -e "${YELLOW}[1] SPAM WA${NC}"
            echo -e "${YELLOW}[2] SPAM CALL${NC}"
            echo -e "${YELLOW}[0] KELUAR${NC}"
            echo -e "${BLUE}================================${NC}"

            read -p "Pilih : " v

            case $v in
                1)
                    if [ -f "spam_wa.sh" ]; then
                        bash spam_wa.sh
                    else
                        echo "File spam_wa.sh tidak ada!"
                        read -p "Enter..."
                    fi
                ;;
                2)
                    if [ -f "spam_call.sh" ]; then
                        bash spam_call.sh
                    else
                        echo "File spam_call.sh tidak ada!"
                        read -p "Enter..."
                    fi
                ;;
                0)
                    exit
                ;;
            esac
        done

    else
        echo "Voucher salah!"
    fi
fi
