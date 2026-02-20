import json
from time import sleep

USERS_FILE = "users.json"

def load_users():
    try:
        with open(USERS_FILE, "r") as f:
            return json.load(f)
    except:
        return []

def show_online_users():
    users = load_users()
    online_users = [u for u in users if u["status"] == "online"]

    print("\n=== USER ONLINE ===\n")
    if not online_users:
        print("Tidak ada user online saat ini.\n")
    else:
        for u in online_users:
            print(f"Username : {u['username']} | Voucher : {u['voucher']}")

    print(f"\nTotal Online : {len(online_users)}")
    print("\nTekan Ctrl+C untuk kembali ke menu utama...")

    try:
        while True:
            sleep(5)
            users = load_users()
            online_users = [u for u in users if u["status"] == "online"]
            print(f"\rUser Online : {len(online_users)}", end="")
    except KeyboardInterrupt:
        print("\nKembali ke menu utama...")

# ===== MAIN =====
if __name__ == "__main__":
    show_online_users()