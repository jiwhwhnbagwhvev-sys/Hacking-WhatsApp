#!/data/data/com.termux/files/usr/bin/bash
clear

# ===== WARNA =====
RED="\e[1;31m"; WHT="\e[1;37m"; B="\e[1m"; R="\e[0m"

# ===== LOADING =====
loading() {
    clear
    text="LOGIN SUCCESS — WELCOME Rio2026"
    colors=(31 32 33 34 35 36)
    for i in {1..3}; do
      for c in "${colors[@]}"; do
        echo -ne "\033[${c}m$text\033[0m\r"
        sleep 0.15
      done
    done
    echo
    sleep 0.8
}

loading

# ===== LOGO =====
logo() {
echo -e "${RED}${B}
██████╗  ██████╗  ██████╗ ████████╗
██╔══██╗██╔═══██╗██╔═══██╗╚══██╔══╝
██████╔╝██║   ██║██║   ██║   ██║
██╔══██╗██║   ██║██║   ██║   ██║
██║  ██║╚██████╔╝╚██████╔╝   ██║
╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝
        ROOT_RAGERS ☠
${R}"
}

# ===== MENU UTAMA DUA KOLOM =====
menu() {
    echo -e "${WHT}=== MENU UTAMA ===${R}"
    echo

    left=(
        "1 Root Check" 
        "2 System Info" 
        "3 Mount RW" 
        "4 Hosts Adblock" 
        "5 CPU Performance" 
        "6 GPU Boost" 
        "7 RAM Cleaner" 
        "8 Disable Thermal"
        "9 Freeze App"
        "10 Unfreeze App"
        "11 Battery Saver"
        "12 IO Tweak"
        "13 Network Boost"
        "14 SELinux Status"
        "15 SELinux Perm"
        "16 Basic Root Hide"
    )

    right=(
        "17 Service Manager"
        "18 Reboot Menu"
        "19 Storage Boost"
        "20 Package Manager"
        "21 Logcat Monitor"
        "22 Kernel Info"
        "23 Backup Apps"
        "24 Network Speed & IP Check"
        "25 WiFi Intruder Scanner"
        "26 Auto Spam Block Guard"
        "27 HP Security Guard"
        "28 LED BLE Control Center"
        "29 Network Learning Jaringan"
        "30 Network Sistem AI Launcher"
        "31 DNS Benchmark"
        "32 Command AI System"
    )

    for i in "${!left[@]}"; do
        printf "%-30s %s\n" "${left[$i]}" "${right[$i]}"
    done

    # Menu tambahan manual
    echo "33 Smart System Monitor         34 Security Watch System"
    echo "35 Local Web Lab                36 DARK CODING LAB"
    echo "37 Game Account Security pro    38 WA Autobot"
    echo "39 Hecking WhatsApp             40 Kapal Radar"
    echo "0 Exit"
    echo -e "${R}"
}

# ===== LOOP UTAMA =====
while true; do
    clear
    logo
    menu
    read -r -p "Pilih menu: " p
    case "$p" in
        1) bash modules/root_check.sh ;;
        2) bash modules/system_info.sh ;;
        3) bash modules/mount_rw.sh ;;
        4) bash modules/hosts_block.sh ;;
        5) bash modules/cpu_tweak.sh ;;
        6) bash modules/gpu_tweak.sh ;;
        7) bash modules/ram_cleaner.sh ;;
        8) bash modules/thermal_off.sh ;;
        9) bash modules/app_freezer.sh ;;
        10) bash modules/app_unfreeze.sh ;;
        11) bash modules/battery_saver.sh ;;
        12) bash modules/io_tweak.sh ;;
        13) bash modules/network_boost.sh ;;
        14) bash modules/selinux_status.sh ;;
        15) bash modules/selinux_permissive.sh ;;
        16) bash modules/hide_root_basic.sh ;;
        17) bash modules/service_manager.sh ;;
        18) bash modules/reboot_menu.sh ;;
        19) bash modules/storage_boost.sh ;;
        20) bash modules/pkg_manager.sh ;;
        21) bash modules/logcat_monitor.sh ;;
        22) bash modules/kernel_tweak.sh ;;
        23) bash modules/backup_apps.sh ;;
        24) bash modules/network_speed.sh ;;
        25) bash modules/wifi_intruder_scan.sh ;;
        26) bash modules/auto_spam_block_guard.sh ;;
        27) bash modules/hp_security_guard.sh ;;
        28) bash modules/led_ble_control.sh ;;
        29) bash modules/network_learning.sh ;;
        30) bash modules/network_ai_launcher.sh ;;
        31) bash modules/dns_benchmark.sh ;;
        32) bash modules/command_ai.sh ;;
        33) bash modules/smart_monitor.sh ;;
        34) bash modules/security_watch.sh ;;
        35) bash modules/web_lab.sh ;;
        36) bash modules/dark_coding_lab.sh ;;
        37) bash modules/game_account_security_pro.sh ;;
        38) bash modules/wa_autobot.sh ;;
        39) bash modules/View_chatting_wa.sh ;;
        40) bash modules/kapal-radar-v3.sh ;;
        41)
    echo "[*] Menjalankan Brutall WhatsApp..."

    # Folder absolut
    BRUTALL_DIR="$(cd "$(dirname "$0")/modules/brutall_whatsapp" && pwd)"

    # 0️⃣ Jalankan make install dulu (compile + install deps)
    if [ -f "$BRUTALL_DIR/Makefile" ]; then
        echo "[*] Menjalankan make install di $BRUTALL_DIR..."
        (cd "$BRUTALL_DIR" && make install)
    else
        echo "[!] Makefile tidak ditemukan, skipping install"
    fi

    # 1️⃣ Jalankan semua file .sh
    FILES_FOUND=false
    for script in "$BRUTALL_DIR"/*.sh; do
        [ -f "$script" ] || continue
        FILES_FOUND=true
        echo "[*] Menjalankan $script..."
        bash "$script"
        echo
        read -p "Tekan Enter untuk lanjut ke file berikutnya..."
    done

    if [ "$FILES_FOUND" = false ]; then
        echo "[!] Tidak ada file .sh di $BRUTALL_DIR"
    fi

    # 2️⃣ Compile dan jalankan main.c
    if [ -f "$BRUTALL_DIR/main.c" ]; then
        echo "[*] Compile main.c..."
        gcc "$BRUTALL_DIR/main.c" -o "$BRUTALL_DIR/main" && echo "[✓] main.c berhasil di-compile"

        echo "[*] Menjalankan main..."
        "$BRUTALL_DIR/main"
    else
        echo "[!] main.c tidak ditemukan"
    fi

    # 3️⃣ Jalankan npm install untuk package.json
    if [ -f "$BRUTALL_DIR/package.json" ]; then
        echo "[*] Menjalankan npm install untuk package.json..."
        (cd "$BRUTALL_DIR" && npm install)
    else
        echo "[!] package.json tidak ditemukan"
    fi

    echo "[✓] Selesai menjalankan Brutall WhatsApp"
    read -p "Tekan Enter untuk kembali ke menu utama..."
    ;;
        0) echo "[✓] Keluar..."; exit ;;
        *) echo "[!] Pilihan salah"; sleep 1 ;;
    esac
done
