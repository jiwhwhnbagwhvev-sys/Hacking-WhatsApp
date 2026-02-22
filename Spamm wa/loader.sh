#!/data/data/com.termux/files/usr/bin/bash
# ==================================================
# Loader WhatsApp tolls
# ==================================================

RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
NC='\033[0m'

TOOLS_DIR="$(cd "$(dirname "$0")" && pwd)"

# ==============================
# TAMPILKAN BANNER
# ==============================

if [ -f "$TOOLS_DIR/banner.sh" ]; then
    bash "$TOOLS_DIR/banner.sh"
fi

# ==============================
# CEK FILE TERENKRIPSI
# ==============================

if [ ! -f "$TOOLS_DIR/menu.sh.gpg" ]; then
    echo -e "${RED}[!] File menu.sh.gpg tidak ditemukan!${NC}"
    exit 1
fi

# ==============================
# INPUT PASSWORD
# ==============================

echo ""
read -sp "Masukkan passphrase WhatsApp tolls : " PASS
echo ""
echo ""

# ==============================
# DECRYPT FILE
# ==============================

gpg --batch --yes \
--passphrase "$PASS" \
-o "$TOOLS_DIR/menu.sh" \
-d "$TOOLS_DIR/menu.sh.gpg" 2>/dev/null

if [ $? -ne 0 ]; then
    echo -e "${RED}[!] Password salah!${NC}"
    sleep 2
    exit 1
fi

chmod +x "$TOOLS_DIR/menu.sh"

# ==============================
# LOADING
# ==============================

echo -e "${GREEN}Membuka menu...${NC}"
for i in {1..40}
do
    printf "${GREEN}█${NC}"
    sleep 0.02
done

echo ""
sleep 0.5

# ==============================
# JALANKAN MENU
# ==============================

bash "$TOOLS_DIR/menu.sh"

# ==============================
# HAPUS FILE SEMENTARA
# ==============================

rm -f "$TOOLS_DIR/menu.sh"
