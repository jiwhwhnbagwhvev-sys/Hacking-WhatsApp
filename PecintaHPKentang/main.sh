#!/data/data/com.termux/files/usr/bin/bash

# Ambil folder project otomatis
BASE="$(pwd)"

clear

# STARTUP
bash "$BASE/scripts/hacker_startup.sh"

# LOADING
bash "$BASE/scripts/loading.sh"
bash "$BASE/scripts/progress.sh"
bash "$BASE/scripts/scan.sh"

# VISUAL
bash "$BASE/assets/crown.sh"
bash "$BASE/assets/skull_pro.sh"

# PANEL
bash "$BASE/ui/glow.sh"
bash "$BASE/ui/system_panel.sh"

# SYSTEM INFO
bash "$BASE/modules/battery.sh"
bash "$BASE/modules/ram.sh"
bash "$BASE/modules/cpu.sh"

# EXTRA
bash "$BASE/scripts/matrix.sh"
bash "$BASE/ui/menu.sh"
bash "$BASE/ui/footer.sh"
