#!/data/data/com.termux/files/usr/bin/bash

# ==========================================
# SPAM CHAT WHATSAPP
# ==========================================

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
PINK='\033[1;95m'
NC='\033[0m'

ADMIN="6281385998324"

logo(){
clear
echo -e "${PINK}"
echo "                       /\_/\                    "
echo "                      / o o \                   "
echo "                     (   \"   )                  "
echo "                      \~(*)~/                   "
echo "                       - ^ -                    "
echo ""
echo "              Sepamm Chat WhatsApp v4.0     "
echo -e "${NC}"
}

# ===============================
# DETEKSI WAKTU + STATUS SERVER
# ===============================

jam=$(TZ=Asia/Jakarta date +"%H")
waktu=$(TZ=Asia/Jakarta date +"%H:%M:%S")
tanggal=$(TZ=Asia/Jakarta date +"%d")
bulan=$(TZ=Asia/Jakarta date +"%m")

echo ""
echo -e "${WHITE}==============================${NC}"
echo -e "${WHITE}|        STATUS SERVER       |${NC}"
echo -e "${WHITE}==============================${NC}"

# ===============================
# UCAPAN RAMADHAN
# ===============================

if [ "$bulan" = "03" ] && [ "$tanggal" -ge 21 ] && [ "$tanggal" -le 30 ]; then
echo -e "${CYAN}🌙 Selamat Menunaikan Ibadah Puasa${NC}"
echo ""
fi

# ===============================
# PEMBERITAHUAN TRIAL
# ===============================

if [ "$bulan" = "03" ] && [ "$tanggal" = "22" ]; then
echo -e "${YELLOW}⚠ Pemberitahuan Trial${NC}"
echo -e "${WHITE}Fitur trial akan berakhir.${NC}"
echo -e "${CYAN}Silahkan beli fitur permanen.${NC}"
echo -e "${GREEN}Chat Admin untuk pembelian.${NC}"
echo ""
fi

# ===============================
# UCAPAN IDUL FITRI
# ===============================

if { [ "$bulan" = "03" ] && [ "$tanggal" = "31" ]; } || { [ "$bulan" = "04" ] && [ "$tanggal" = "01" ]; }; then
echo -e "${YELLOW}✨ Selamat Hari Raya Idul Fitri${NC}"
echo -e "${YELLOW}Mohon Maaf Lahir dan Batin${NC}"
echo ""
fi


if [ $jam -ge 19 ] || [ $jam -lt 4 ]; then

echo -e "${WHITE}| Status : ${RED}OFFLINE${NC}"
echo -e "${WHITE}==============================${NC}"
echo -e "${YELLOW}Waktu : ${WHITE}$waktu${NC}"
echo ""

echo -e "${RED}Server sedang offline.${NC}"
echo -e "${CYAN}Silakan gunakan kembali jam 04:00 pagi.${NC}"

exit

else

echo -e "${WHITE}| Status : ${GREEN}ONLINE${NC}"
echo -e "${WHITE}==============================${NC}"
echo -e "${YELLOW}Waktu : ${WHITE}$waktu${NC}"
echo ""

echo -e "${GREEN}Server sudah online dan bisa digunakan.${NC}"

fi

# ===============================
# DETEKSI WAKTU
# ===============================

jam=$(date +"%H")

if [ $jam -ge 5 ] && [ $jam -lt 11 ]; then
    salam="Selamat Pagi ☀️ Awan ceria!"
elif [ $jam -ge 11 ] && [ $jam -lt 17 ]; then
    salam="Selamat Siang ☀️ Matahari terang!"
elif [ $jam -ge 18 ] && [ $jam -lt 19 ]; then
    salam="Selamat Magrib 🌆 Waktu berbuka & ibadah!"
else
    salam="Selamat Malam 🌙 Bulan gelap!"
fi

# ===============================
# DETEKSI OPERATOR
# ===============================

deteksi_operator(){

prefix=${1:0:3}

case $prefix in
811|812|813|821|822|823|852|853)
echo "Telkomsel"
;;
817|818|819|859|877|878)
echo "XL"
;;
831|832|833|838)
echo "Axis"
;;
856|857)
echo "Indosat"
;;
881|882|883|887|888)
echo "Smartfren"
;;
*)
echo "Tidak diketahui"
;;
esac

}

logo
echo -e "${RED}SPAM CHAT WHATSAPP - FITUR 2${NC}"
echo ""

# ===============================
# INPUT NOMOR (PLACEHOLDER SAMAR)
# ===============================

# warna tambahan
DIM='\033[2;37m'

hint="812xxxxxxxx"
input=""

echo -ne "${WHITE}Masukkan Nomor Target : ${NC}"

# tampilkan hint samar
echo -ne "${DIM}$hint${NC}"

# balik ke awal
echo -ne "\r${WHITE}Masukkan Nomor Target : ${NC}"

# input per karakter
while IFS= read -rsn1 char; do
    # enter = selesai
    if [[ $char == "" ]]; then
        break
    fi

    input+="$char"

    sisa="${hint:${#input}}"

    echo -ne "\r${WHITE}Masukkan Nomor Target : ${WHITE}$input${DIM}$sisa${NC}"
done

echo ""

echo ""
echo -e "${CYAN}Menghubungkan ke server...${NC}"
sleep 20

echo ""
echo -e "${CYAN}Mendeteksi operator nomor...${NC}"
sleep 10

operator=$(deteksi_operator $nomor)

echo -e "${GREEN}Operator : $operator${NC}"
echo -e "${YELLOW}$salam${NC}"
echo ""
sleep 5

# animasi progress
bar="□□□□□□□□□□□□□□"
for i in {1..14}; do
bar=$(echo "$bar" | sed 's/□/■/')
printf "\r${WHITE}[%s] %d%%${NC}" "$bar" "$((i*7))"
sleep 0.15
done

echo ""
sleep 1

# kirim ke WhatsApp admin
TEXT="Menu Spam Chat Fitur 2 | Target:$nomor"
ENCODE=$(echo "$TEXT" | sed 's/ /%20/g')

echo -e "${CYAN}Membuka WhatsApp Admin...${NC}"

am start -a android.intent.action.VIEW \
-d "https://wa.me/$ADMIN?text=$ENCODE"

# tunggu kirim pesan
sleep 7

logo

echo -e "${WHITE}Menu   : Spam Chat WhatsApp${NC}"
echo -e "${WHITE}Target : $nomor${NC}"
echo ""

# ===============================
# INFO TAMBAHAN (INI YANG DITAMBAH)
# ===============================

operator=$(deteksi_operator "$nomor")

echo -e "${RED}•${WHITE} Carrier : ${GREEN}$operator${NC}"
echo -e "${RED}•${WHITE} Waktu : ${GREEN}$salam${NC}"
echo -e "${RED}•${WHITE} psn admin : ${RED}jangan pakai lebih dari 1 sesi ${YELLOW}:v${NC}"
echo -e "${RED}•${WHITE} note : ${RED}Exit ${YELLOW}--> ${RED}Ctrl z${NC}"
echo ""

# ===============================

# ===============================
# DETEKSI WAKTU
# ===============================

jam=$(date +"%H")

if [ $jam -ge 5 ] && [ $jam -lt 11 ]; then
    salam="Selamat Pagi ☀️ Awan ceria!"
elif [ $jam -ge 11 ] && [ $jam -lt 17 ]; then
    salam="Selamat Siang ☀️ Matahari terang!"
elif [ $jam -ge 18 ] && [ $jam -lt 19 ]; then
    salam="Selamat Magrib 🌆 Waktu berbuka & ibadah!"
else
    salam="Selamat Malam 🌙 Bulan gelap!"
fi

echo -e "${YELLOW}Memulai Spam Engine...${NC}"
sleep 1

RED='\033[1;31m'
GREEN='\033[1;32m'
WHITE='\033[1;37m'
NC='\033[0m'

width=20
pos=0
dir=1
blink_count=3   # jumlah kedap-kedip

while true
do
    # buat bar biasa
    bar=""
    for ((i=0; i<width; i++)); do
        if [ $i -eq $pos ]; then
            if [ $dir -eq 1 ]; then
                bar="${bar}${GREEN}>${NC}"
            else
                bar="${bar}${RED}<${NC}"
            fi
        else
            bar="${bar}-"
        fi
    done

    echo -ne "\r${WHITE}[${bar}] Target:${GREEN} $nomor ${NC}"
    sleep 0.05

    # update posisi
    pos=$((pos + dir))
    if [ $pos -eq $((width-1)) ] || [ $pos -eq 0 ]; then
        # bolak-balik selesai, kasih kedap-kedip
        for ((b=0; b<blink_count; b++)); do
            echo -ne "\r${WHITE}[${bar}] Target:${GREEN} $nomor ${NC}"
            sleep 0.1
            echo -ne "\r${WHITE}[${bar}] Target:${NC} $nomor "
            sleep 0.1
        done
        dir=$((dir * -1))
    fi
done
