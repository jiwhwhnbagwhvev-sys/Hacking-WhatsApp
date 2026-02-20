#!/data/data/com.termux/files/usr/bin/bash

DIR="$(cd "$(dirname "$0")" && pwd)"

RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
NC='\033[0m'

clear

echo -e "${CYAN}Secure Menu Loader${NC}"
echo "----------------------------------"

# Cek file ada
if [ ! -f "$DIR/menu.sh.gpg" ]; then
    echo -e "${RED}[!] menu.sh.gpg tidak ditemukan!${NC}"
    exit 1
fi

# Minta password (hidden)
read -sp "Masukkan passphrase: " PASS
echo

# Decrypt & langsung jalankan TANPA simpan file
gpg --quiet --batch --yes --passphrase "$PASS" \
    -d "$DIR/menu.sh.gpg" | bash

if [ $? -ne 0 ]; then
    echo -e "${RED}[!] Password salah atau gagal dekripsi!${NC}"
    exit 1
fi

echo -e "${GREEN}[✓] Program selesai.${NC}"
