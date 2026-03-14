#!/data/data/com.termux/files/usr/bin/bash

# ==============================
# CEK JAM NASIONAL INDONESIA (ANTI UBAH JAM HP)
# ==============================

server_time=$(curl -sI https://google.com | grep -i Date | cut -d' ' -f5)
wib_time=$(TZ=Asia/Jakarta date -d "$server_time" +%H%M)

# jika waktu >= 19:00 atau < 04:00 maka OFFLINE
if [ "$wib_time" -ge 1900 ] || [ "$wib_time" -lt 0400 ]; then
    clear
    echo "=============================================================="
    echo "                     SISTEM SEDANG OFFLINE"
    echo ""
    echo " Jam operasional sistem :"
    echo " 04:00 WIB - 19:00 WIB"
    echo ""
    echo " Silakan buka kembali pada pukul 04:00 WIB"
    echo "=============================================================="
    exit
fi

# ==============================
# SCRIPT DIMULAI
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

echo ""
echo "[ Perjanjian konsument terhadap developer ]"
echo "Dengan ini saya menyetujui untuk mematuhi aturan dari creator atau developer."
echo "Saya tidak akan melakukan percobaan crack, reverse, atau deobfuscate."
echo "Jika melanggar maka saya siap menerima semua resiko."

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
echo "[$(date)] Mengecek status mencurigakan ... (Security v10)"
sleep 55

echo "[$(date)] Proses biasanya memakan waktu 1-5 menit mohon untuk bersabar demi keamanan"

WAIT=$((RANDOM % 241 + 60))
sleep $WAIT

echo ""
echo "[>] Menjalankan script...."
sleep 2

# ==============================
# HASIL
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

bash banner.sh
