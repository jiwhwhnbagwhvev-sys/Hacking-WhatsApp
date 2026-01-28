#!/usr/bin/env python3
# ==========================================
# COMMAND AI ENGINE — ROOT_REGERS
# Offline Intent → Action System
# ==========================================

import os
import subprocess
import sys
from datetime import datetime

LOG = "/data/local/tmp/command_ai.log"

def log(msg):
    with open(LOG, "a") as f:
        f.write(f"[{datetime.now()}] {msg}\n")

def run(cmd):
    try:
        subprocess.call(cmd, shell=True)
        log(f"EXEC: {cmd}")
    except Exception as e:
        log(f"ERROR: {e}")

def banner():
    os.system("clear")
    print("""
█████╗ ██╗    █████╗ ██╗
██╔══██╗██║   ██╔══██╗██║
███████║██║   ███████║██║
██╔══██║██║   ██╔══██║██║
██║  ██║█████╗██║  ██║██║
╚═╝  ╚═╝╚════╝╚═╝  ╚═╝╚═╝
COMMAND AI SYSTEM
""")

def help_menu():
    print("""
Contoh perintah:
- cek root
- bersihin ram
- info sistem
- cek ip
- cek storage
- keluar
""")

def intent_parser(text):
    t = text.lower()

    if "root" in t:
        return "root_check"
    if "ram" in t:
        return "ram_clean"
    if "sistem" in t or "system" in t:
        return "system_info"
    if "ip" in t:
        return "ip_check"
    if "storage" in t or "memori" in t:
        return "storage"
    if "keluar" in t or "exit" in t:
        return "exit"
    return "unknown"

def execute(intent):
    if intent == "root_check":
        run("su -c id || echo 'ROOT TIDAK ADA'")
    elif intent == "ram_clean":
        run("sync; echo 3 > /proc/sys/vm/drop_caches")
    elif intent == "system_info":
        run("uname -a; getprop ro.product.model")
    elif intent == "ip_check":
        run("ip a || ifconfig")
    elif intent == "storage":
        run("df -h")
    elif intent == "exit":
        print("Keluar dari AI...")
        sys.exit(0)
    else:
        print("Perintah tidak dikenali.")

def main():
    banner()
    help_menu()

    while True:
        try:
            user = input("\nAI > ")
            intent = intent_parser(user)
            execute(intent)
        except KeyboardInterrupt:
            print("\nCTRL+C terdeteksi, keluar.")
            break

if __name__ == "__main__":
    main()
