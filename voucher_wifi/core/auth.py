import json
import getpass

ADMIN_FILE = "data/admin.json"

def load_admins():
    try:
        with open(ADMIN_FILE, "r") as f:
            return json.load(f)
    except:
        return []

def login():
    admins = load_admins()
    username = input("Username admin: ").strip()
    password = getpass.getpass("Password: ").strip()

    for admin in admins:
        if admin["username"] == username and admin["password"] == password:
            print(f"\nSelamat datang, {username}!\n")
            return True
    print("\nLogin gagal! Username atau password salah.\n")
    return False