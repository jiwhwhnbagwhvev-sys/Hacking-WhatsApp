#!/data/data/com.termux/files/usr/bin/bash

green='\033[1;32m'
yellow='\033[1;33m'
red='\033[1;31m'
reset='\033[0m'

battery=$(termux-battery-status 2>/dev/null | grep percentage | cut -d ":" -f2 | tr -d " ,")

if [ -z "$battery" ]; then
battery="Unknown"
fi

echo ""
echo -e "$green🔋 Battery : $battery %$reset"
echo ""
