#!/bin/bash
if [ ! -f login.sh ]; then
  echo "[*] Unlocking login..."
  gpg --quiet --batch --yes --decrypt login.sh.gpg > login.sh
fi

chmod +x login.sh
./login.sh
