import json
from core.voucher import add_user

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

def get_online_users():
    users = load_users()
    return [u for u in users if u["status"] == "online"]

def generate_user(username=None):
    """Tambah user baru untuk web hotspot"""
    user = add_user(username)
    return user

def mark_user_online(username):
    """Ubah status user menjadi online"""
    users = load_users()
    for u in users:
        if u["username"] == username:
            u["status"] = "online"
            break
    save_users(users)

def mark_user_offline(username):
    """Ubah status user menjadi offline"""
    users = load_users()
    for u in users:
        if u["username"] == username:
            u["status"] = "offline"
            break
    save_users(users)