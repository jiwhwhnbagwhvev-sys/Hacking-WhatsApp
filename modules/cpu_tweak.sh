#!/data/data/com.termux/files/usr/bin/bash
# ==========================================
# CPU PERFORMANCE MODULE — ROOT_RAGERS
# ==========================================

MODULE_NAME="CPU PERFORMANCE"
LOG="/data/local/tmp/root_ragers.log"
R="\e[0m"; G="\e[1;32m"; Y="\e[1;33m"; RED="\e[1;31m"; C="\e[1;36m"; B="\e[1m"

pause() { read -rp "Tekan ENTER untuk kembali ke menu..."; }
log() { echo "[$(date '+%F %T')] $MODULE_NAME : $1" >> "$LOG"; }

header() {
    clear
    echo -e "${C}${B}"
    echo "╔══════════════════════════════════════╗"
    echo "║         CPU PERFORMANCE MODULE       ║"
    echo "╚══════════════════════════════════════╝"
    echo -e "${R}"
}

progress_bar() {
    local text="$1"
    echo -ne "${Y}$text"
    for i in $(seq 1 40); do
        echo -ne "."
        sleep 0.05
    done
    echo -e "${R}"
}

check_root() {
    if command -v su >/dev/null 2>&1; then
        echo -e "${G}[✓] ROOT TERDEKSI — Bisa tweak CPU${R}"
        log "ROOT OK"
    else
        echo -e "${RED}[✗] ROOT TIDAK TERDETEKSI — CPU tweak gagal${R}"
        log "ROOT NOT DETECTED"
        pause
        exit 1
    fi
}

cpu_tweak() {
    echo -e "${Y}[*] Mengatur CPU governor dan frekuensi maksimum...${R}"
    sleep 0.3

    for CPU in /sys/devices/system/cpu/cpu[0-9]*; do
        GOVERNOR_FILE="$CPU/cpufreq/scaling_governor"
        MAX_FREQ_FILE="$CPU/cpufreq/scaling_max_freq"
        if [ -f "$GOVERNOR_FILE" ] && [ -f "$MAX_FREQ_FILE" ]; then
            su -c "echo performance > $GOVERNOR_FILE"
            su -c "MAX=$(cat $MAX_FREQ_FILE)"
            su -c "echo $MAX > $MAX_FREQ_FILE"
            echo -e "${G}[✓] $CPU dioptimalkan${R}"
            log "$CPU optimized: governor set to performance, max freq applied"
        fi
        sleep 0.1
    done
}

auto_test() {
    echo -e "${C}${B}"
    echo "╔══════════════════════════════════════╗"
    echo "║         AUTO TEST CPU PERFORMANCE    ║"
    echo "╚══════════════════════════════════════╝"
    echo -e "${R}"
    sleep 0.3

    TEST_CPU="/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"
    if [ -f "$TEST_CPU" ] && [ "$(cat $TEST_CPU)" == "performance" ]; then
        echo -e "${G}[✓] AUTO TEST SUCCESS — CPU governor performance aktif${R}"
        log "AUTO TEST OK: CPU governor set to performance"
    else
        echo -e "${RED}[✗] AUTO TEST FAILED — CPU governor tidak diubah${R}"
        log "AUTO TEST FAILED: CPU governor not applied"
    fi
    sleep 0.3
}

main() {
    header
    check_root
    progress_bar "Mengoptimalkan CPU"
    cpu_tweak
    progress_bar "Menjalankan Auto Test"
    auto_test
    pause
}

main
