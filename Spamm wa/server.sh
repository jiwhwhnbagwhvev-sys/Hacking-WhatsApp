#!/data/data/com.termux/files/usr/bin/bash

clear
echo "[INFO] Harap Tunggu Sedang Menjalankan Program"
echo "[INFO] Security : Pyramid v10 Beta Plugin Pyramid Dom Network v14"
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
echo "                 PRIVATE POLICE v4.0"
echo "=============================================================="
echo "Fitur ini sudah di update"
echo "Diperbarui versi 4.0 pada tgl 10 Maret 2026"
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
sleep 100

# ==============================
# KOMPILASI
# ==============================

clear
echo "[?] Memulai kompilasi mohon tunggu.."
sleep 55

echo ""
echo "[$(date)] Mengecek status Mencurigakan ... (Security v14)"
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
echo -e "\e[34mv4.0\e[0m"
sleep 40

# ==============================
# PERINGATAN DENGAN EFEK
# ==============================

clear
tput civis  # sembunyikan cursor

# Teks peringatan panjang
PERINGATAN="⚠️ PERINGATAN ⚠️
Gunakan software ini dengan bijak.
Segala akibat dari penyalahgunaan menjadi tanggung jawab pengguna.
Jangan melakukan crack, reverse, atau eksploitasi.
Patuhi aturan developer untuk keamanan dan kenyamanan semua pihak."

# Fungsi untuk menampilkan teks satu per satu dengan suara ketik
type_writer() {
    TEXT="$1"
    for ((i=0; i<${#TEXT}; i++)); do
        echo -n "${TEXT:$i:1}"
        printf "\a"  # bunyi 'beep' (tergantung terminal)
        sleep 0.05  # jeda per karakter
    done
    echo ""
}

# Menampilkan teks peringatan
echo ""
for LINE in $(echo "$PERINGATAN" | sed 's/\\n/ /g'); do
    type_writer "$LINE"
done

# ==============================
# TABEL PERINGKAT MELAYANG
# ==============================

# Fungsi untuk menampilkan tabel di tengah layar
show_table() {
    clear
    ROWS=$(tput lines)
    COLS=$(tput cols)
    
    TABLE=(
        "┌───────────────┐"
        "│   RANKING TOP │"
        "├───────────────┤"
        "│ 1. Admin      │"
        "│ 2. User1      │"
        "│ 3. User2      │"
        "│ 4. Guest      │"
        "└───────────────┘"
    )

    START_ROW=$((ROWS/2 - ${#TABLE[@]}/2))
    for i in "${!TABLE[@]}"; do
        tput cup $((START_ROW + i)) $(( (COLS - ${#TABLE[$i]}) / 2 ))
        echo "${TABLE[$i]}"
    done
}

# Tampilkan tabel 5 detik
show_table
sleep 5

tput cnorm  # tampilkan cursor kembali
clear

# ==============================
# LANJUT KE SCRIPT UTAMA
# ==============================

# ganti main.sh dengan file utama kamu
bash banner.sh
