TELEGRAM_ADMIN = "https://t.me/YourTelegramID"  # ganti dengan ID Telegram kamu

def open_telegram_admin():
    print("\nMembuka Telegram admin...\n")
    try:
        import webbrowser
        webbrowser.open(TELEGRAM_ADMIN)
    except:
        print(f"Buka manual: {TELEGRAM_ADMIN}")

def check_user(username):
    """Cek username dan token terdaftar"""
    premium = load_premium()
    for p in premium:
        if p["username"] == username:
            return True, p["token"]
    return False, None

# ===== MAIN (update) =====
if __name__ == "__main__":
    print("==== LOGIN PREMIUM ====")
    username = input("Masukkan Username > ").strip()
    if username.startswith(".admin"):
        open_admin_wa()
    elif username.startswith(".teleadmin"):
        open_telegram_admin()
    elif username.startswith(".cekid"):
        user_check = input("Masukkan Username untuk dicek > ").strip()
        valid, token = check_user(user_check)
        if valid:
            print(f"Username terdaftar!\nToken: {token}")
        else:
            print("Username tidak terdaftar.")
    else:
        token, new = register_user(username)
        if new:
            print(f"\nUser baru terdaftar!\nUsername: {username}\nToken: {token}")
        else:
            print(f"\nUser sudah terdaftar!\nUsername: {username}\nToken: {token}")