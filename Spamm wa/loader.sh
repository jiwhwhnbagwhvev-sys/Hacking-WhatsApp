#!/data/data/com.termux/files/usr/bin/bash
# Secure Loader for main.c.gpg

BRUTALL_DIR="$(cd "$(dirname "$0")" && pwd)"

RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear

# 🔥 Buka YouTube (opsional)
if command -v termux-open-url >/dev/null 2>&1; then
    termux-open-url "https://youtube.com/@pecinta-hpkentang?si=7zK5IZZss2Lu1gk-"
fi

# 🔥 Banner
if [ -f "$SPAMM_WA/banner_obf.sh" ]; then
    bash "$SPAMM_WA/banner_obf.sh"
fi

# Cek file terenkripsi
if [ ! -f "$BRUTALL_DIR/main.c.gpg" ]; then
    echo -e "${RED}[!] File menu.sh.gpg tidak ditemukan!${NC}"
    exit 1
fi

ATTEMPT=0
MAX_ATTEMPT=3

while [ $ATTEMPT -lt $MAX_ATTEMPT ]
do
    echo ""
    read -sp "Masukkan passphrase: " PASS
    echo ""

    TEMP_C=$(mktemp)
    TEMP_BIN=$(mktemp)

    # Decrypt tanpa expose password di process list
    echo "$PASS" | gpg --batch --yes --passphrase-fd 0 \
        -o "$TEMP_C" \
        -d "$BRUTALL_DIR/menu.sh.gpg" 2>/dev/null

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[✓] Dekripsi berhasil${NC}"
        sleep 1

        # Cek gcc
        if ! command -v gcc >/dev/null 2>&1; then
            echo -e "${RED}[!] gcc belum terinstall!${NC}"
            rm -f "$TEMP_C"
            exit 1
        fi

        # Compile
        gcc "$TEMP_C" -o "$TEMP_BIN"
        if [ $? -ne 0 ]; then
            echo -e "${RED}[!] Compile gagal!${NC}"
            rm -f "$TEMP_C" "$TEMP_BIN"
            exit 1
        fi

        echo -e "${CYAN}Menjalankan program...${NC}"
        sleep 1

        "$TEMP_BIN"

        # Bersihkan
        rm -f "$TEMP_C" "$TEMP_BIN"
        echo -e "${GREEN}[✓] Program selesai.${NC}"
        exit 0
    else
        rm -f "$TEMP_C" "$TEMP_BIN"
        ATTEMPT=$((ATTEMPT+1))
        echo -e "${RED}[!] Password salah (${ATTEMPT}/${MAX_ATTEMPT})${NC}"
        sleep 2
    fi
done

echo -e "${RED}Terlalu banyak percobaan gagal!${NC}"
exit 1
