#!/data/data/com.termux/files/usr/bin/bash
# Loader: decrypt & run main.c.gpg dengan password

BRUTALL_DIR="$(cd "$(dirname "$0")" && pwd)"

# 🔥 TAMPILKAN BANNER
if [ -f "$BRUTALL_DIR/banner.sh" ]; then
    bash "$BRUTALL_DIR/banner.sh"
fi

# Minta password user
read -sp "Masukkan passphrase untuk main.c.gpg: " PASS
echo

# Decrypt file sementara
gpg --batch --yes --passphrase "$PASS" -o "$BRUTALL_DIR/main.c" -d "$BRUTALL_DIR/main.c.gpg"
if [ $? -ne 0 ]; then
    echo "[!] Passphrase salah atau dekripsi gagal!"
    exit 1
fi

# Compile main.c
gcc "$BRUTALL_DIR/main.c" -o "$BRUTALL_DIR/main"
if [ $? -ne 0 ]; then
    echo "[!] Compile gagal!"
    exit 1
fi

# Jalankan program
"$BRUTALL_DIR/main"

# Hapus file sementara
rm -f "$BRUTALL_DIR/main.c" "$BRUTALL_DIR/main"

echo "[✓] Selesai menjalankan program."
