#!/data/data/com.termux/files/usr/bin/bash

clear

echo "Starting Pecinta HP Kentang Interface..."

sleep 1

bash ~/PecintaHPKentang/scripts/loading.sh
bash ~/PecintaHPKentang/scripts/boot_bar.sh
bash ~/PecintaHPKentang/scripts/scan.sh

bash ~/PecintaHPKentang/assets/skull_pro.sh

bash ~/PecintaHPKentang/ui/glow.sh
bash ~/PecintaHPKentang/ui/icons.sh
bash ~/PecintaHPKentang/scripts/red_dots.sh
bash ~/PecintaHPKentang/ui/panel.sh

bash ~/PecintaHPKentang/modules/battery.sh
bash ~/PecintaHPKentang/modules/ram.sh
bash ~/PecintaHPKentang/modules/cpu.sh

bash ~/PecintaHPKentang/extras/tutorial.sh
bash ~/PecintaHPKentang/ui/footer.sh
