clear
echo "INSTALLING HPKENTANG TOOL..."

pkg update -y
pkg upgrade -y

pkg install neofetch -y
pkg install curl -y
pkg install figlet -y
pkg install toilet -y
pkg install lolcat -y

echo ""
echo "INSTALL SELESAI"
echo "ketik: bash menu.sh"
