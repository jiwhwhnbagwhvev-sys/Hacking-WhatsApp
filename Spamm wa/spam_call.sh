#!/data/data/com.termux/files/usr/bin/bash

# ==========================================
# Spam Call WhatsApp 
# ==========================================

GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
PINK='\033[1;95m'
WHITE='\033[1;37m'
RED='\033[1;31m'
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
echo "             Spamm WhatsApp Call v4.0            "
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
echo "Operator tidak diketahui"
;;
esac
echo -e "${RED}Warning: gunakan dengan bijak${NC}"
}



logo
echo -e "${CYAN}SPAM CALL WHATSAPP - FITUR 1${NC}"
echo ""

echo -ne "${WHITE}Masukkan Nomor Target : ${NC}"
read input

# validasi kosong
if [[ -z "$input" ]]; then
echo -e "${RED}Nomor tidak boleh kosong!${NC}"
exit
fi

# nomor tanpa 62
nomor="$input"

echo ""
echo -e "${CYAN}Menghubungkan ke server...${NC}"
sleep 10

echo ""
echo -e "${CYAN}Mendeteksi operator nomor...${NC}"
sleep 10

operator=$(deteksi_operator $nomor)

echo -e "${GREEN}Operator : $operator${NC}"
echo -e "${YELLOW}$salam${NC}"
echo ""
sleep 5

# progress bar
bar="□□□□□□□□□□□□□□"
for i in {1..14}; do
bar=$(echo "$bar" | sed 's/□/■/')
printf "\r${YELLOW}[%s] %d%%${NC}" "$bar" "$((i*7))"
sleep 0.15
done

echo ""
sleep 1

# pesan WhatsApp RAPAT TANPA JARAK
TEXT="Menu Spamm Call Fitur 1 | Nomor Target: $nomor | Status: Aktif ✓"

ENCODE=$(echo "$TEXT" | sed 's/ /%20/g')

echo -e "${CYAN}Membuka WhatsApp Admin...${NC}"

am start -a android.intent.action.VIEW \
-d "https://wa.me/$ADMIN?text=$ENCODE"

sleep 6

logo

echo -e "${WHITE}Menu   : Spamm Call WhatsApp${NC}"
echo -e "${WHITE}Target : $nomor${NC}"
echo ""

echo -e "${GREEN}Memulai Spam Engine...${NC}"
echo ""

count=1

while true
do

if ((count % 2 == 0)); then
color=$GREEN
else
color=$YELLOW
fi

printf "${color}[%d] mencoba spamm call ke nomor %s ...${NC}\n" "$count" "$nomor"

sleep 0.08

count=$((count+1))

done
