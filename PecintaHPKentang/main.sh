#!/data/data/com.termux/files/usr/bin/bash

clear

BASE="$(pwd)"

bash $BASE/scripts/hacker_startup.sh
bash $BASE/scripts/loading.sh
bash $BASE/scripts/progress.sh
bash $BASE/scripts/scan.sh

bash $BASE/assets/crown.sh
bash $BASE/assets/skull_pro.sh

bash $BASE/ui/glow.sh
bash $BASE/ui/system_panel.sh

bash $BASE/modules/battery.sh
bash $BASE/modules/ram.sh
bash $BASE/modules/cpu.sh

bash $BASE/scripts/matrix.sh

bash $BASE/ui/menu.sh
bash $BASE/ui/footer.sh
