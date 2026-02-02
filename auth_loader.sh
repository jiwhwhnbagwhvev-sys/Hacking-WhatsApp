#!/bin/bash
if [ ! -f auth_system.sh ]; then
  echo "[*] Unlocking..."
  gpg --quiet --batch --yes --decrypt auth_system.sh.gpg > auth_system.sh
fi

chmod +x auth_system.sh
./auth_system.sh
