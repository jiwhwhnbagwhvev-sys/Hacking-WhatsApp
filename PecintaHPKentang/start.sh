#!/data/data/com.termux/files/usr/bin/bash

clear

# WARNA
red='\033[1;31m'
yellow='\033[1;33m'
green='\033[1;32m'
cyan='\033[1;36m'
magenta='\033[1;35m'
white='\033[1;37m'
reset='\033[0m'

# INFO SISTEM
android=$(getprop ro.build.version.release)
device=$(getprop ro.product.model)
cpu=$(cat /proc/cpuinfo | grep -m1 Hardware)
kernel=$(uname -r)
user=$(whoami)
memory=$(free -h | awk 'NR==2{print $3 "/" $2}')

# =======================
# ASCII TENGKORAK + MAHKOTA
# =======================
echo -e "$red        👑  "
echo -e "$red        .-''''''-."
echo -e "$red      .'          '."
echo -e "$red     /   O      O   \\  $yellow SYSTEM INFO"
echo -e "$red    :      \033[1;33m👑\033[1;31m       :  $green Android : $android"
echo -e "$red    |   \`-.__.-'    |  $green Device  : $device"
echo -e "$red    :                :  $green CPU     : $cpu"
echo -e "$red     \\              /  $green Kernel  : $kernel"
echo -e "$red      '.          .'   $green User    : $user"
echo -e "$red        '-......-'    $cyan Memory  : $memory$reset"

# =======================
# LOGO YOUTUBE
# =======================
echo -e "$red   ╔════════════════╗   $white▶ YouTube$reset"
echo -e "$red   ║                ║"
echo -e "$red   ╚════════════════╝$reset"

# =======================
# JUDUL “PECINTA HP KENTANG” BESAR & KEREN
# =======================
echo ""
echo -e "$red ██████╗ ███████╗ ██████╗██╗████████╗ █████╗ "
echo -e "$yellow ██╔══██╗██╔════╝██╔════╝██║╚══██╔══╝██╔══██╗"
echo -e "$green ██████╔╝█████╗  ██║     ██║   ██║   ███████║"
echo -e "$cyan ██╔═══╝ ██╔══╝  ██║     ██║   ██║   ██╔══██║"
echo -e "$magenta ██║     ███████╗╚██████╗██║   ██║   ██║  ██║"
echo -e "$white ╚═╝     ╚══════╝ ╚═════╝╚═╝   ╚═╝   ╚═╝  ╚═╝$reset"

# =======================
# FOOTER
# =======================
echo -e "$cyan===============================================$reset"
echo -e "$yellow           Pecinta HP Kentang Terminal Ready 🔥$reset"
echo ""
