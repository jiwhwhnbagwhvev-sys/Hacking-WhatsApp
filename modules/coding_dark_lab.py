#!/usr/bin/env python3
import os, sys, time, random, socket, platform, subprocess
from datetime import datetime

# ================== EFFECT ==================
GREEN = "\033[1;32m"
RED   = "\033[1;31m"
CYAN  = "\033[1;36m"
RESET = "\033[0m"

def slow(text, d=0.02):
    for c in text:
        sys.stdout.write(c); sys.stdout.flush(); time.sleep(d)
    print()

def hacker_rain(lines=18, width=64):
    for _ in range(lines):
        print(GREEN + "".join(random.choice("01#$@%&") for _ in range(width)))
        time.sleep(0.05)
    print(RESET)

def logo():
    os.system("clear")
    print(RED + r"""
 ██████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ 
██╔════╝██╔═══██╗██╔══██╗██║████╗  ██║██╔════╝ 
██║     ██║   ██║██║  ██║██║██╔██╗ ██║██║  ███╗
██║     ██║   ██║██║  ██║██║██║╚██╗██║██║   ██║
╚██████╗╚██████╔╝██████╔╝██║██║ ╚████║╚██████╔╝
 ╚═════╝ ╚═════╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ 
""" + RESET)
    slow(GREEN + ">>> DARK CODING LAB ONLINE <<<")
    hacker_rain()

def pause():
    input(CYAN + "\n[ENTER] kembali..." + RESET)

# ================== UTIL ==================
def write_file(path, content):
    with open(path, "w") as f: f.write(content)

# ================== MENU FUNCTIONS ==================
def m01_hello():
    print("Hello World — Python jalan!")

def m02_variable():
    x = 1337
    print("Variabel x =", x)

def m03_input():
    n = input("Nama kamu: ")
    print("Halo,", n)

def m04_ifelse():
    n = int(input("Angka: "))
    print("GENAP" if n % 2 == 0 else "GANJIL")

def m05_loop_for():
    for i in range(5): print("for:", i)

def m06_loop_while():
    i=0
    while i<5:
        print("while:", i); i+=1

def m07_list():
    a=[1,2,3,4]
    print("List:", a)

def m08_dict():
    d={"user":"root","mode":"dark"}
    print("Dict:", d)

def m09_function():
    def add(a,b): return a+b
    print("add(5,7) =", add(5,7))

def m10_file_write():
    write_file("demo.txt", "File berhasil ditulis\n")
    print("demo.txt dibuat")

def m11_file_read():
    if os.path.exists("demo.txt"):
        print(open("demo.txt").read())
    else:
        print("demo.txt belum ada")

def m12_system_info():
    print("OS:", platform.system())
    print("Release:", platform.release())
    print("Machine:", platform.machine())

def m13_time_log():
    print("Waktu:", datetime.now())

def m14_ip_local():
    try:
        print("IP:", socket.gethostbyname(socket.gethostname()))
    except:
        print("Gagal ambil IP")

def m15_ping():
    cmd = "ping -c 3 8.8.8.8" if os.name!="nt" else "ping 8.8.8.8"
    os.system(cmd)

def m16_web_check():
    h=input("Domain (contoh google.com): ")
    try:
        socket.gethostbyname(h)
        print("Website hidup")
    except:
        print("Website tidak terjangkau")

def m17_web_server():
    print("Server di http://127.0.0.1:8080")
    subprocess.call([sys.executable, "-m", "http.server", "8080"])

def m18_password_gen():
    p="".join(random.choice("abcdef1234567890") for _ in range(14))
    print("Password:", p)

def m19_project_scaffold():
    os.makedirs("project", exist_ok=True)
    write_file("project/main.py", "print('Project jalan')\n")
    print("Folder project dibuat")

def m20_auto_script():
    write_file("auto.sh", "#!/bin/bash\necho 'Auto script jalan'\n")
    os.chmod("auto.sh", 0o755)
    print("auto.sh siap dijalankan")

# ================== MENU ==================
ACTIONS = {
 "01":m01_hello, "02":m02_variable, "03":m03_input, "04":m04_ifelse,
 "05":m05_loop_for, "06":m06_loop_while, "07":m07_list, "08":m08_dict,
 "09":m09_function, "10":m10_file_write, "11":m11_file_read,
 "12":m12_system_info, "13":m13_time_log, "14":m14_ip_local,
 "15":m15_ping, "16":m16_web_check, "17":m17_web_server,
 "18":m18_password_gen, "19":m19_project_scaffold, "20":m20_auto_script
}

def menu():
    while True:
        print(CYAN + """
01 Hello World
02 Variabel
03 Input User
04 If Else
05 Loop For
06 Loop While
07 List
08 Dictionary
09 Function
10 File Write
11 File Read
12 System Info
13 Time Log
14 IP Local
15 Ping Test
16 Website Check
17 Web Server
18 Password Generator
19 Project Scaffold
20 Auto Script
00 Exit
""" + RESET)
        c=input("Pilih >> ").zfill(2)
        if c=="00": break
        if c in ACTIONS:
            ACTIONS[c]()
        else:
            print("Menu salah")
        pause()

if __name__ == "__main__":
    logo()
    menu()
