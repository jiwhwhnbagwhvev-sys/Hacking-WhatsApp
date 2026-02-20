import json
import time
import os
from core.validator import sanitize_input

USERS_FILE = "users.json"

def load_users():
    try:
        with open(USERS_FILE, "r") as f:
            return json.load(f)
    except:
        return []

def show_online_users():
    os.system("clear")
    print("=== USER ONLINE HP KENTANG ===\n")
    try:
        while True:
            users = load_users()
            online_users = [u for u in users if u["status"] == "online"]
            os.system("clear")
            print("=== USER ONLINE HP KENTANG ===\n")
            if not online_users:
                print("Tidak ada user online saat ini.\n")
            else:
                for u in online_users:
                    username = sanitize_input(u["username"])
                    voucher = sanitize_input(u["voucher"])
                    print(f"Username: {username} | Voucher: {voucher}")
                print(f"\nTotal Online: {len(online_users)}")
            time.sleep(5)
    except KeyboardInterrupt:
        print("\nKembali ke menu utama...")