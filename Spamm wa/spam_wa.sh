#!/data/data/com.termux/files/usr/bin/bash

#!/data/data/com.termux/files/usr/bin/bash

# ===============================
# LOGIN + DETEKSI TANGGAL
# ===============================
# <-- KODE PERTAMA DI TEMPATKAN DI SINI
TOKEN_VALID="BsbuebenjeueiejnBctwuwvvwwtgwbwysbbBctwunwbehwkmsooiqjnqnwhwjnwne/iwjmwiNhhwbwbnw"

FILE_LOGIN="$HOME/.login_spam"
FILE_TRIAL="$HOME/.trial_spam"

# LOGIN TOKEN
if [ -f "$FILE_LOGIN" ]; then
    status_login="VALID"
else
    clear
    echo "=============================="
    echo "        LOGIN LICENSE"
    echo "=============================="
    echo ""
    read -p "Masukkan Token: " input_token

    if [ "$input_token" = "$TOKEN_VALID" ]; then
        echo "✔ Token diterima"
        echo "AKTIF" > "$FILE_LOGIN"
        sleep 2
        status_login="VALID"
    else
        echo "❌ Token salah!"
        exit
    fi
fi

# DETEKSI TANGGAL OTOMATIS
today=$(date +"%Y-%m-%d")   # contoh: 2026-04-07

if [ ! -f "$FILE_TRIAL" ]; then
    echo "$today" > "$FILE_TRIAL"
fi

first_date=$(cat "$FILE_TRIAL")
first_sec=$(date -d "$first_date" +%s)
now_sec=$(date +%s)
selisih_hari=$(( (now_sec - first_sec) / 86400 ))

# ===============================
# KODE KEDUA (STATUS VALID / EXPIRED)
# ===============================
# <-- KODE INI DI TEMPATKAN DI BAWAHNYA

# ===============================
# TAMPILAN STATUS PRO
# ===============================

clear

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

echo -e "${WHITE}╔════════════════════════════════════╗"
echo -e "║          SYSTEM LICENSE           ║"
echo -e "╠════════════════════════════════════╣"

if [ "$selisih_hari" -lt 2 ]; then

    echo -e "║ Status   : ${GREEN}VALID ✔${WHITE}             ║"
    echo -e "║ Login    : ${CYAN}$status_login${WHITE}        ║"
    echo -e "║ Hari ke  : ${YELLOW}$selisih_hari${WHITE}                ║"
    echo -e "║ Akses    : ${CYAN}TRIAL AKTIF${WHITE}        ║"
    echo -e "╠════════════════════════════════════╣"
    echo -e "║ System   : ${GREEN}RUNNING${WHITE}            ║"
    echo -e "╚════════════════════════════════════╝"
    echo ""

else

    echo -e "║ Status   : ${RED}EXPIRED ✖${WHITE}           ║"
    echo -e "║ Login    : ${RED}INVALID${WHITE}            ║"
    echo -e "║ Hari ke  : ${YELLOW}$selisih_hari${WHITE}                ║"
    echo -e "║ Akses    : ${RED}DITOLAK${WHITE}            ║"
    echo -e "╠════════════════════════════════════╣"
    echo -e "║ System   : ${RED}STOPPED${WHITE}            ║"
    echo -e "╚════════════════════════════════════╝"
    echo ""

    echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${RED}        ⚠ TOKEN EXPIRED ⚠${NC}"
    echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo -e "${YELLOW}❌ Masa aktif sudah habis"
    echo -e "🔒 Sistem dikunci otomatis"
    echo ""
    echo -e "${CYAN}🔥 Beli versi PREMIUM"
    echo -e "📲 Hubungi Admin untuk akses penuh"
    echo ""

    exit
fi

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
echo "              Sepamm Chat WhatsApp v6.0     "
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
echo -e "${CYAN}⚠ gunakan dengan bijak jangan salah gunakan ⚠${NC}"
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

# ===============================
# STATUS SERVER
# ===============================

if [ "$jam" -ge 20 ] || [ "$jam" -lt 16 ]; then

  echo -e "${WHITE}| Status : ${RED}OFFLINE${NC}"
  echo -e "${WHITE}==============================${NC}"
  echo -e "${YELLOW}Waktu : ${WHITE}$waktu${NC}"
  echo ""

  echo -e "${RED}Server sedang offline.${NC}"
  echo -e "${CYAN}Silakan gunakan kembali jam 16:00.${NC}"

  exit

else

  echo -e "${WHITE}| Status : ${GREEN}ONLINE${NC}"
  echo -e "${WHITE}==============================${NC}"
  echo -e "${YELLOW}Waktu : ${WHITE}$waktu${NC}"
  echo ""

  echo -e "${GREEN}Server sedang online.${NC}"

  # Tambahan ucapan Idul Fitri tanggal 21-25
  if [ "$tgl" -ge 21 ] && [ "$tgl" -le 25 ]; then
    echo ""
    echo -e "${MAGENTA}Selamat Hari Raya Idul Fitri 1447 H${NC}"
    echo -e "${CYAN}Taqabbalallahu minna wa minkum${NC}"
    echo -e "${YELLOW}Mohon maaf lahir dan batin 🙏${NC}"
  fi

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
echo -e "${CYAN}SPAM CHAT WHATSAPP - FITUR 2${NC}"
echo ""

# warna
WHITE='\033[1;37m'
DIM='\033[2;37m'
GREEN='\033[1;32m'
NC='\033[0m'

hint="812xxxxxxxx"
input=""

echo -ne "${WHITE}Masukkan Nomor Target : ${DIM}$hint${NC}"

while IFS= read -rsn1 char; do
    # ENTER = selesai
    if [[ $char == "" ]]; then
        break
    fi

    # BACKSPACE (ASCII 127)
    if [[ $char == $'\x7f' ]]; then
        input="${input%?}"
    else
        # hanya angka
        if [[ $char =~ [0-9] ]]; then
            input+="$char"
        fi
    fi

    # ambil sisa hint
    sisa="${hint:${#input}}"

    # render ulang baris
    echo -ne "\r${WHITE}Masukkan Nomor Target : ${WHITE}$input${DIM}$sisa${NC} "
done

echo ""

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
printf "\r${WHITE}[%s] %d%%${NC}" "$bar" "$((i*7))"
sleep 0.15
done

echo ""
sleep 1

# pesan WhatsApp RAPAT TANPA JARAK
TEXT="versi v6.0 | Menu Spamm Chat Fitur 2 | Nomor Target: $nomor"

ENCODE=$(echo "$TEXT" | sed 's/ /%20/g')

echo -e "${CYAN}Membuka WhatsApp Admin...${NC}"

am start -a android.intent.action.VIEW \
-d "https://wa.me/$ADMIN?text=$ENCODE"

sleep 6

logo

echo -e "${WHITE}Menu   : Spamm Chat WhatsApp${NC}"
echo -e "${WHITE}Target : $nomor${NC}"
echo ""

# ===============================
# DETEKSI DEVICE & LOKASI
# ===============================

device="$(getprop ro.product.model 2>/dev/null)"
brand="$(getprop ro.product.brand 2>/dev/null)"
android="$(getprop ro.build.version.release 2>/dev/null)"

lokasi="$(TZ=Asia/Jakarta date +"%Z")"

# fallback biar gak error
[ -z "$device" ] && device="Unknown Device"
[ -z "$brand" ] && brand="Unknown Brand"
[ -z "$android" ] && android="?"

# ===============================
# INFO TAMBAHAN
# ===============================

operator="$(deteksi_operator "$nomor")"

echo -e "${RED}•${WHITE} Carrier   : ${YELLOW}$operator${NC}"
echo -e "${RED}•${WHITE} Device    : ${GREEN}$brand $device${NC}"
echo -e "${RED}•${WHITE} Android   : ${GREEN}$android${NC}"
echo -e "${RED}•${WHITE} Region    : ${GREEN}$lokasi${NC}"
echo -e "${RED}•${WHITE} Waktu     : ${YELLOW}$salam${NC}"
echo -e "${RED}•${WHITE} psn admin : ${RED}jangan pakai lebih dari 1 sesi ${YELLOW}:v${NC}"
echo -e "${RED}•${WHITE} psn admin : ${YELLOW}Tunggu 5-10 menit ya ka baru masuk spamm nya ${RED}:v${NC}"
echo -e "${RED}•${WHITE} note      : ${RED}Exit ${YELLOW}--> ${RED}Ctrl z${NC}"
echo ""

# ===============================

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
