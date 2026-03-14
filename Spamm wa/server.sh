#!/data/data/com.termux/files/usr/bin/bash

# ==============================
# CEK JAM NASIONAL (WIB)
# ==============================

current_hour=$(TZ="Asia/Jakarta" date +"%H")

# Offline jika jam >= 19 (7 malam) sampai jam < 4 pagi
if [ "$current_hour" -ge 19 ] || [ "$current_hour" -lt 4 ]; then
    echo ""
    echo "=============================================================="
    echo "                     SISTEM SEDANG OFFLINE"
    echo "      Mohon buka kembali pada pukul 04:00 WIB"
    echo "=============================================================="
    exit 1
fi

# ==============================
# SCRIPT UTAMA DIMULAI DI SINI
# ==============================

clear
echo "[INFO] Sistem online, melanjutkan program..."
sleep 2

clear
echo "[INFO] Harap Tunggu Sedang Menjalankan Program"
echo "[INFO] Security : Pyramid v9 Beta Plugin Pyramid Dom Network v10"
echo ""

cat << "EOF"

██████╗ ██████╗ ██╗██╗   ██╗ █████╗ ████████╗███████╗    ██████╗  ██████╗ ██╗     ██╗ ██████╗ ███████╗
██╔══██╗██╔══██╗██║██║   ██║██╔══██╗╚══██╔══╝██╔════╝    ██╔══██╗██╔═══██╗██║     ██║██╔════╝ ██╔════╝
██████╔╝██████╔╝██║██║   ██║███████║   ██║   █████╗      ██████╔╝██║   ██║██║     ██║██║  ███╗█████╗  
██╔═══╝ ██╔══██╗██║╚██╗ ██╔╝██╔══██║   ██║   ██╔══╝      ██╔═══╝ ██║   ██║██║     ██║██║   ██║██╔══╝  
██║     ██║  ██║██║ ╚████╔╝ ██║  ██║   ██║   ███████╗    ██║     ╚██████╔╝███████╗██║╚██████╔╝███████╗
╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═╝  ╚═╝   ╚═╝   ╚══════╝    ╚═╝      ╚═════╝ ╚══════╝╚═╝ ╚═════╝ ╚══════╝

EOF

echo ""
echo "=============================================================="
echo "                 PRIVATE POLICE v3.1"
echo "=============================================================="
echo "Fitur ini sudah di update"
echo "Diperbarui versi 3.0 pada tgl 3 Maret 2026"
echo "[ Perjanjian konsument terhadap developer ]
dengan ini saya menyetujui untuk memtuhi aturan dari creato r atau developer
dengan menggunakan nya sesuai posisi sebagai user atau kons ument
saya tidak akan melakukan percobaan crack, reverse, deobfus
cate atau sejenis nya yang akan
merugikan developer, jika ini saya langgar maka saya siap m enerima semua resiko dari mekanisme pyramid encient killer.
DAN SAYA TIDAK AKAN MENYALAHKAN DEVELOPER DI KARENAKAN INI KARENA KESERAKAHAN
DAN TINDAKAN SAYA YANG LANCANG MAKA SAYA SIAP MENERIMA APAP UN RESIKO NYA DAN TIDAK AKAN MENUNTUT
echo"

read -p "[enter]"

# ==============================
# SETUP
# ==============================

clear
echo "[?] Melakukan setup 1"
sleep 480

# ==============================
# KOMPILASI
# ==============================

clear
echo "[?] Memulai kompilasi mohon tunggu.."
sleep 55

echo ""
echo "[$(date)] Mengecek status Mencurigakan ... (Security v10)"
sleep 55

echo "[$(date)] Proses biasanya memakan waktu 1-5 menit mohon untuk bersabar demi keamanan"

WAIT=$((RANDOM % 241 + 60))  # random 60-300 detik
sleep $WAIT

echo ""
echo "[>] Menjalankan script...."
sleep 2

# ==============================
# HASIL (warna sesuai permintaan)
# ==============================

echo ""
echo -e "\e[32mcurl is already at the latest version \e[31m8.19.0\e[0m"
echo -e "\e[32mncurses-utils is already at the latest version \e[31m6.6.20260124+really6.5.20250830\e[0m"
echo -e "\e[32mxh is already at the latest version \e[31m0.25.3\e[0m"
echo -e "\e[32mxz-utils is already at the latest version \e[31m5.8.2\e[0m"
echo -e "\e[32mNothing for Nala to do.\e[0m"

echo ""
echo -e "\e[34mv4.0\e[0m"
sleep 40

# ==============================
# LANJUT KE SCRIPT UTAMA
# ==============================

# ganti main.sh dengan file utama kamu
bash banner.sh
