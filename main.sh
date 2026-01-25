#!/data/data/com.termux/files/usr/bin/bash
# Root Power Toolkit Installer Auto-Fix
# Version: 1.0
# Author: Fathir

clear
echo -e "\e[1;31m[*] ROOT POWER TOOLKIT INSTALLER\e[0m"
echo -e "\e[1;37m[*] Membuat folder modules...\e[0m"

# Buat folder modules
mkdir -p modules

echo -e "\e[1;37m[*] Membuat file modul...\e[0m"

# Array nama modul
modules=(
"root_check"
"system_info"
"mount_rw"
"hosts_block"
"cpu_tweak"
"gpu_tweak"
"ram_cleaner"
"thermal_off"
"app_freezer"
"app_unfreeze"
"battery_saver"
"io_tweak"
"network_boost"
"selinux_status"
"selinux_permissive"
"hide_root_basic"
"service_manager"
"reboot_menu"
"storage_boost"
"pkg_manager"
"logcat_monitor"
"kernel_tweak"
"backup_apps"
)

# Loop untuk bikin file modul
for m in "${modules[@]}"; do
  file="modules/$m.sh"
  if [ ! -f "$file" ]; then
    echo "#!/bin/bash
clear
echo \"[*] $m running...\"
read -p \"Enter untuk kembali\"
bash ../main.sh" > "$file"
  fi
done

echo -e "\e[1;37m[*] Membuat main.sh dengan logo hacker merah-putih...\e[0m"

# Main menu dengan logo animasi merah-putih
cat > main.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
clear

red="\e[1;31m"
white="\e[1;37m"
bold="\e[1m"
reset="\e[0m"

logo_animation() {
  frames=(
"$red$bold
  ____  ____  ____  ____  ____  ____  ____  ____  ____ 
 ||R ||||O ||||O ||||T ||||P ||||O ||||W ||||E ||||R ||
 ||__||||__||||__||||__||||__||||__||||__||||__||||__||
 |/__\||/__\||/__\||/__\||/__\||/__\||/__\||/__\||/__\|$reset"
"$white$bold
  ____  ____  ____  ____  ____  ____  ____  ____  ____ 
 ||R ||||O ||||O ||||T ||||P ||||O ||||W ||||E ||||R ||
 ||__||||__||||__||||__||||__||||__||||__||||__||||__||
 |/__\||/__\||/__\||/__\||/__\||/__\||/__\||/__\||/__\|$reset"
  )
  for i in {1..3}; do
    for frame in "${frames[@]}"; do
      clear
      echo -e "$frame"
      sleep 0.3
    done
  done
}

logo_animation

echo -e "${red}${bold}ROOT POWER TOOLKIT ☠${reset}"
echo "======================================="
echo -e "${white}1  Root Check"
echo "2  System Info"
echo "3  Mount System RW"
echo "4  Hosts Adblock"
echo "5  CPU Performance"
echo "6  GPU Boost"
echo "7  RAM Cleaner"
echo "8  Disable Thermal"
echo "9  Freeze App"
echo "10 Unfreeze App"
echo "11 Battery Saver"
echo "12 IO Tweak"
echo "13 Network Boost"
echo "14 SELinux Status"
echo "15 SELinux Permissive"
echo "16 Basic Root Hide"
echo "17 Service Manager"
echo "18 Reboot Menu"
echo "19 Storage Boost"
echo "20 Package Manager"
echo "21 Logcat Monitor"
echo "22 Kernel Tweak"
echo "23 Backup Apps"
echo "0  Exit"
echo "======================================="
read -p "Pilih: " p

case $p in
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
0) exit ;;
*) bash main.sh ;;
esac
EOF

echo -e "\e[1;37m[*] Memberi izin eksekusi ke semua script...\e[0m"
chmod +x main.sh modules/*.sh

echo -e "\e[1;32m[✓] Instalasi selesai! Jalankan dengan ./main.sh\e[0m"
