#!/data/data/com.termux/files/usr/bin/bash
# Secure Loader → menu.sh.gpg

SYSTEM_DIR="$(cd "$(dirname "$0")" && pwd)"

RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear

# 🔥 TAMPILKAN BANNER DULU
if [ -f "$SYSTEM_DIR/banner_obf.sh" ]; then
    bash "$SYSTEM_DIR/banner_obf.sh"
fi

# 🔍 Cek file terenkripsi
if [ ! -f "$SYSTEM_DIR/menu.sh.gpg" ]; then
    echo -e "${RED}[!] File menu.sh.gpg tidak ditemukan!${NC}"
    exit 1
fi

ATTEMPT=0
MAX_ATTEMPT=3

while [ $ATTEMPT -lt $MAX_ATTEMPT ]
do
    echo ""
    read -sp "Masukkan passphrase untuk menu.sh.gpg: " PASS
    echo ""

    TEMP_FILE=$(mktemp)

    # Decrypt aman
    echo "$PASS" | gpg --batch --yes --passphrase-fd 0 \
        -o "$TEMP_FILE" \
        -d "$SYSTEM_DIR/menu.sh.gpg" 2>/dev/null

    if [ $? -eq 0 ]; then
        chmod +x "$TEMP_FILE"

        echo -e "${GREEN}[✓] Access Granted${NC}"
        sleep 1

        # Jalankan menu
        bash "$TEMP_FILE"

        rm -f "$TEMP_FILE"
        exit 0
    else
        rm -f "$TEMP_FILE"
        ATTEMPT=$((ATTEMPT+1))
        echo -e "${RED}[!] Password salah (${ATTEMPT}/${MAX_ATTEMPT})${NC}"
        sleep 2
    fi
done

echo -e "${RED}Terlalu banyak percobaan gagal!${NC}"
exit 1
