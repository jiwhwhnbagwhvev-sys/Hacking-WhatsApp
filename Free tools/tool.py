import os

os.system("clear")
os.system("figlet HPKentang | lolcat")

print("====================================")
print("        PECINTA HPKENTANG TOOL")
print("====================================")
print("")
print("1. Cek IP Address")
print("2. Info HP Android")
print("3. Info Jaringan")
print("0. Keluar")
print("")

menu = input("Pilih Menu : ")

if menu == "1":
    os.system("clear")
    print("IP Kamu :")
    os.system("curl ifconfig.me")
    
elif menu == "2":
    os.system("clear")
    os.system("neofetch")

elif menu == "3":
    os.system("clear")
    os.system("ip a")

elif menu == "0":
    exit()

else:
    print("Menu tidak tersedia")
