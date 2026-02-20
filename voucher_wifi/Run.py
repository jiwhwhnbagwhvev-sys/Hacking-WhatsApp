import os
import sys
import json
import webbrowser
import time

# ===== COLOR =====
WHITE = "\033[97m"
RED = "\033[91m"
RESET = "\033[0m"

# ===== CLEAR SCREEN =====
def clear():
    os.system("clear")

# ===== PENGUIN MERAH =====
def red_penguin():
    print(RED + r"""
        █████████████
     ████             ████
   ███                     ███
  ██      ███         ███      ██
 ██      ███████     ███████      ██
 ██         █████       █████        ██
 ██           ███         ███          ██
  ██                                         ██
   ██                                       ██
     ██                                   ██
       ███                               ███
          ████████           ████████
               ██             ██
               ██             ██

              HP KENTANG
    """ + RESET)

# ===== HITUNG USER ONLINE =====
def get_online_users():
    try:
        with open("users.json", "r") as f:
            data = json.load(f)
            return len([u for u in data if u["status"] == "online"])
    except:
        return 0

# ===== HEADER =====
def header():
    print(WHITE + "██████  HP KENTANG HOTSPOT")
    print("--------------------------------")
    print("Creator : Sanz")
    print("Youtube : HP KENTANG")
    print("Github  : https://github.com/jiwhwhnbagwhvev-sys")
    print("--------------------------------" + RESET)

# ===== MENU =====
def menu():
    print(WHITE + "[1] Start Server")
    print("[2] Generate Voucher")
    print("[3] Lihat User Aktif")
    print("[4] Monitoring")
    print("[5] Exit" + RESET)

    print(WHITE + f"\nUser Online : {get_online_users()}" + RESET)

# ===== BUKA YOUTUBE OTOMATIS =====
def open_youtube():
    url = "https://youtube.com/@pecinta-hpkentang?si=rk3UN2ooDra0SpVY"
    print("\nMembuka YouTube HP KENTANG...\n")
    try:
        webbrowser.open(url)
    except:
        print(f"Buka manual: {url}")

# ===== MAIN =====
def main():
    clear()
    red_penguin()
    header()
    open_youtube()
    time.sleep(2)  # beri delay sebentar sebelum menu muncul

    while True:
        menu()
        choice = input("\n[Pilih] > ").strip()
        if choice == "1":
            os.system("python server.py")
        elif choice == "2":
            os.system("python -m core.voucher")
        elif choice == "3":
            os.system("python -m core.monitor")
        elif choice == "4":
            print("Monitoring akan ditambahkan selanjutnya...")
            input("Tekan Enter...")
        elif choice == "5":
            sys.exit()
        else:
            input("Pilihan salah, tekan Enter untuk kembali...")

if __name__ == "__main__":
    main()
