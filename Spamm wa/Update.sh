#!/bin/bash

# ===============================
# SERVER SCRIPT SUPER OTOMATIS
# ===============================

clear
echo "================================"
echo "      SERVER & UPDATE SCRIPT"
echo "================================"
echo ""

# 1️⃣ Update & Upgrade Termux
echo "[1/10] Update & Upgrade Termux..."
pkg update -y && pkg upgrade -y
echo "✔ Selesai update & upgrade"

# 2️⃣ Install dependencies
echo "[2/10] Install dependencies..."
pkg install gnupg git tsu python nodejs npm -y
pip install psutil colorama
npm install qrcode-terminal readline-sync
echo "✔ Dependencies terpasang"

# 3️⃣ Clone atau update repo
echo "[3/10] Clone atau update repo Hacking-WhatsApp..."
if [ ! -d "Hacking-WhatsApp" ]; then
    git clone https://github.com/jiwhwhnbagwhvev-sys/Hacking-WhatsApp.git
else
    echo "Repo sudah ada, menarik update terbaru..."
    cd Hacking-WhatsApp || { echo "Gagal masuk folder repo"; exit 1; }
    git pull
    cd ..
fi

cd Hacking-WhatsApp || { echo "Repo gagal ditemukan"; exit 1; }

# 4️⃣ Set semua file executable
echo "[4/10] Set permission executable..."
chmod +x auth_system.sh auth_hidden.sh login_loader.sh server.sh main_loader.sh loader.sh
if [ -d "Spamm wa" ]; then
    cd 'Spamm wa'
    chmod +x Run
else
    echo "Folder 'Spamm wa' tidak ditemukan, lanjut..."
fi

# 5️⃣ Jalankan script utama
echo "[5/10] Menjalankan script utama..."
if [ -f "Run" ]; then
    ./Run
elif [ -f "../Run" ]; then
    ../Run
else
    echo "Script Run tidak ditemukan. Pastikan folder 'Spamm wa' ada"
fi

echo "[✅] Semua proses selesai"

# ganti main.sh dengan file utama kamu
bash server.sh
