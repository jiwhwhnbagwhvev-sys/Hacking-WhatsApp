#!/usr/bin/env python3
# ==================================================
#              SECURITY SYSTEM MODULE
# ==================================================

import hashlib
import sys
import os


# Simpan hash asli file penting
EXPECTED_HASHES = {
    "config.json": "PLACE_CONFIG_HASH",
    "menu.sh": "PLACE_MENU_HASH"
}


def calculate_hash(filename):
    try:
        with open(filename, "rb") as f:
            file_hash = hashlib.sha256(f.read()).hexdigest()
        return file_hash
    except FileNotFoundError:
        return None


def verify_files():
    for file, expected_hash in EXPECTED_HASHES.items():
        current_hash = calculate_hash(file)

        if current_hash is None:
            print(f"[SECURITY] File missing: {file}")
            sys.exit(1)

        if expected_hash != current_hash:
            print(f"[SECURITY] File modified: {file}")
            sys.exit(1)

    print("[SECURITY] All files verified successfully.")


if __name__ == "__main__":
    verify_files()
