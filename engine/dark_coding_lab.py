import os, sys, time, random

def slow(text, d=0.02):
    for c in text:
        sys.stdout.write(c)
        sys.stdout.flush()
        time.sleep(d)
    print()

def hacker_scroll():
    for _ in range(18):
        print("".join(random.choice("01#@$%&") for _ in range(70)))
        time.sleep(0.04)

def logo():
    os.system("clear")
    print("""
██████╗  █████╗ ██████╗ ██╗  ██╗
██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝
██║  ██║███████║██████╔╝█████╔╝ 
██║  ██║██╔══██║██╔══██╗██╔═██╗ 
██████╔╝██║  ██║██║  ██║██║  ██╗
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝
   DARK CODING LAB
""")
    slow(">> INITIALIZING DARK KNOWLEDGE SYSTEM <<")
    hacker_scroll()

# ===== CODING FEATURES =====
def f1(): print("Hello World")
def f2(): print("Variable:", 666)
def f3(): print("Input:", input("Nama: "))
def f4(): print("IF ELSE:", "GENAP" if int(input("Angka: "))%2==0 else "GANJIL")
def f5(): [print("FOR",i) for i in range(5)]
def f6():
    i=0
    while i<5:
        print("WHILE",i); i+=1
def f7(): print([1,2,3,4])
def f8(): print({"user":"root","mode":"dark"})
def f9(): print("Function:", (lambda a,b:a+b)(5,7))
def f10():
    open("lab.txt","a").write("DARK\n")
    print("File ditulis")
def f11(): print(open("lab.txt").read())
def f12(): print(os.uname())
def f13(): os.system("df -h")
def f14(): os.system("ip addr")
def f15(): os.system("ping -c 3 8.8.8.8")
def f16(): os.system("python -m http.server 8080")
def f17(): print("Password:", "".join(random.choice("abc123!@#") for _ in range(12)))
def f18():
    os.makedirs("project", exist_ok=True)
    open("project/main.py","w").write("print('RUN')")
    print("Mini project dibuat")
def f19(): print("Belajar coding = upgrade otak")
def f20(): print("DARK CODING LAB COMPLETE")

funcs=[f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20]

def menu():
    while True:
        print("""
01 Hello World        11 File Read
02 Variable           12 System Info
03 Input              13 Disk Info
04 If Else            14 Network Info
05 Loop For           15 Ping Test
06 Loop While         16 Web Server
07 List               17 Password Gen
08 Dictionary         18 Mini Project
09 Function           19 Motivation
10 File Write         20 Exit
""")
        c=input(">> ")
        if c=="20": break
        if c.isdigit() and 1<=int(c)<=19:
            funcs[int(c)-1]()
        input("\nENTER...")

if __name__=="__main__":
    logo()
    menu()
