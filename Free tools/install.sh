clear
echo "INSTALLING TOOL..."

pkg update -y
pkg upgrade -y

pkg install figlet -y
pkg install lolcat -y
pkg install neofetch -y
pkg install curl -y

echo ""
echo "INSTALL SELESAI"
echo "jalankan dengan: bash logo.sh"
