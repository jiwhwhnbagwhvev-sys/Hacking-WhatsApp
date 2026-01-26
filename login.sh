#!/data/data/com.termux/files/usr/bin/bash

# ===== WARNA =====
R="\033[31m"
W="\033[97m"
B="\033[1m"
N="\033[0m"

# ===== LOGIN DATA =====
USER_OK="Rio"
PASS_OK="Root_Rage 2026"

clear

# ===== LOGO =====
echo -e "${R}${B}"
cat <<'LOGO'
██████╗  ██████╗  ██████╗ ████████╗
██╔══██╗██╔═══██╗██╔═══██╗╚══██╔══╝
██████╔╝██║   ██║██║   ██║   ██║
██╔══██╗██║   ██║██║   ██║   ██║
██║  ██║╚██████╔╝╚██████╔╝   ██║
╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝
        ROOT  RAGERS
LOGO
echo -e "${N}"

# ===== TABEL INFO =====
echo -e "${W}+--------------------------------------+${N}"
echo -e "${W}|${R}        AUTHENTICATION PANEL        ${W}|${N}"
echo -e "${W}+---------------+----------------------+${N}"
echo -e "${W}|${R} Tool Name     ${W}| Root Ragers          ${W}|${N}"
echo -e "${W}|${R} Version       ${W}| 2026                 ${W}|${N}"
echo -e "${W}|${R} Mode          ${W}| ROOT REQUIRED        ${W}|${N}"
echo -e "${W}+---------------+----------------------+${N}"
echo

# ===== INPUT LOGIN =====
read -p "$(echo -e ${R}Username${W}': ')" user
read -s -p "$(echo -e ${R}Password${W}': ')" pass
echo
echo

# ===== VALIDASI =====
if [[ "$user" == "$USER_OK" && "$pass" == "$PASS_OK" ]]; then
    echo -e "${W}[${R}✓${W}] LOGIN SUCCESS — WELCOME ${R}${USER_OK}${N}"
    sleep 1
else
    echo -e "${R}[✗] LOGIN FAILED${N}"
    sleep 2
    exit 1
fi
