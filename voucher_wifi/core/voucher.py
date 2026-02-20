import json
import random
import string

USERS_FILE = "users.json"

def load_users():
    try:
        with open(USERS_FILE, "r") as f:
            return json.load(f)
    except:
        return []

def save_users(users):
    with open(USERS_FILE, "w") as f:
        json.dump(users, f, indent=4)

def generate_voucher_code(length=6):
    return ''.join(random.choices(string.ascii_uppercase + string.digits, k=length))

def add_user(username=None):
    users = load_users()
    if username is None:
        username = f"user{len(users)+1}"
    voucher = generate_voucher_code()
    user_data = {
        "username": username,
        "voucher": voucher,
        "status": "offline"
    }
    users.append(user_data)
    save_users(users)
    print(f"\nUser baru berhasil dibuat:")
    print(f"Username : {username}")
    print(f"Voucher  : {voucher}")
    return user_data

# ===== MAIN FUNCTION =====
if __name__ == "__main__":
    print("=== Generate Voucher Baru ===")
    username = input("Masukkan username (kosong untuk default) > ").strip()
    if username == "":
        username = None
    add_user(username)