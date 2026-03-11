#!/data/data/com.termux/files/usr/bin/bash

clear

# STARTUP
bash scripts/hacker_startup.sh

# LOADING
bash scripts/loading.sh
bash scripts/progress.sh
bash scripts/scan.sh

# VISUAL
bash assets/crown.sh
bash assets/skull_pro.sh

# PANEL
bash ui/glow.sh
bash ui/system_panel.sh

# SYSTEM INFO
bash modules/battery.sh
bash modules/ram.sh
bash modules/cpu.sh

# EXTRA
bash scripts/matrix.sh
bash ui/menu.sh
bash ui/footer.sh
