#!/data/data/com.termux/files/usr/bin/bash
# Loader: decrypt & run menu.sh.gpg dengan password
# WhatsApp tolls
# Creator : Rio
# YouTube : Pecinta hpkentang

BRUTALL_DIR="$(cd "$(dirname "$0")" && pwd)"

PINK='\033[1;95m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
WHITE='\033[1;37m'
NC='\033[0m'

clear

# 🔥 BUKA CHANNEL YOUTUBE
if command -v termux-open-url >/dev/null 2>&1; then
    termux-open-url "https://youtube.com/@pecinta-hpkentang?si=7zK5IZZss2Lu1gk-"
fi

sleep 2

# 🔥 TAMPILKAN BANNER
if [ -f "$BRUTALL_DIR/banner.sh" ]; then
    bash "$BRUTALL_DIR/banner.sh"
else
    echo -e "${PINK}"
    echo "          /\_/\        "
    echo "         / o o \       "
    echo "        (   V   )      "
    echo "        /|     |\      "
    echo "       /_|_____|_\     "
    echo -e "${NC}"
    echo -e "${GREEN}WhatsApp tolls Loader${NC}"
    echo -e "${YELLOW}Creator : Rio${NC}"
    echo -e "${YELLOW}YouTube : Pecinta hpkentang${NC}"
fi

echo ""

# 🔐 INPUT PASSWORD
read -sp "Masukkan passphrase untuk WhatsApp tolls: " PASS
echo ""

# 🔓 DECRYPT FILE MENU
gpg --batch --yes \
--passphrase "$PASS" \
-o "$BRUTALL_DIR/menu.sh" \
-d "$BRUTALL_DIR/menu.sh.gpg"

# ❌ CEK GAGAL
if [ $? -ne 0 ]; then
    echo -e "${RED}[!] Passphrase salah atau dekripsi gagal!${NC}"
    exit 1
fi

# ✅ IZIN EKSEKUSI
chmod +x "$BRUTALL_DIR/menu.sh"

# ▶️ JALANKAN MENU
bash "$BRUTALL_DIR/menu.sh"

# 🧹 HAPUS FILE SEMENTARA
rm -f "$BRUTALL_DIR/menu.sh"

echo ""
echo -e "${GREEN}[✓] WhatsApp tolls selesai dijalankan.${NC}"
