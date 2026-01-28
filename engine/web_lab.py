#!/usr/bin/env python3
# ==========================================
# LOCAL WEB LAB SYSTEM
# ==========================================

from http.server import SimpleHTTPRequestHandler, HTTPServer
import os
import re

WEB_DIR = "web"
PORT = 8080

def banner():
    os.system("clear")
    print("""
██╗    ██╗███████╗██████╗     ██╗      █████╗ ██████╗ 
██║    ██║██╔════╝██╔══██╗    ██║     ██╔══██╗██╔══██╗
██║ █╗ ██║█████╗  ██████╔╝    ██║     ███████║██████╔╝
██║███╗██║██╔══╝  ██╔══██╗    ██║     ██╔══██║██╔══██╗
╚███╔███╔╝███████╗██████╔╝    ███████╗██║  ██║██████╔╝
 ╚══╝╚══╝ ╚══════╝╚═════╝     ╚══════╝╚═╝  ╚═╝╚═════╝ 

LOCAL WEB LAB — TERMUX ONLY
""")

def ensure_files():
    os.makedirs(WEB_DIR, exist_ok=True)

    index = f"{WEB_DIR}/index.html"
    template = f"{WEB_DIR}/template.html"

    if not os.path.exists(index):
        with open(index, "w") as f:
            f.write("""<!DOCTYPE html>
<html>
<head>
<title>My Termux Website</title>
</head>
<body>
<h1>Website Aktif</h1>
<p>Dijalankan dari Termux</p>
</body>
</html>""")

    if not os.path.exists(template):
        with open(template, "w") as f:
            f.write("""<!-- TEMPLATE WEBSITE -->
<h1>Judul</h1>
<p>Isi konten</p>
<a href="#">Link</a>
""")

def check_security():
    index = f"{WEB_DIR}/index.html"
    issues = []

    with open(index) as f:
        html = f.read().lower()

    if "<script>" in html:
        issues.append("Script terdeteksi (XSS risk)")

    if "http://" in html:
        issues.append("Link HTTP tidak aman")

    if not re.search("<meta.*charset", html):
        issues.append("Meta charset tidak ditemukan")

    return issues

def start_server():
    os.chdir(WEB_DIR)
    server = HTTPServer(("0.0.0.0", PORT), SimpleHTTPRequestHandler)
    print(f"[✓] Website aktif di:")
    print(f"    http://127.0.0.1:{PORT}")
    print("\nCTRL+C untuk stop server\n")
    server.serve_forever()

def main():
    banner()
    ensure_files()

    while True:
        print("""
1. Jalankan Website
2. Edit index.html
3. Lihat Template HTML
4. Cek Keamanan Website
0. Keluar
""")
        c = input("Pilih: ")

        if c == "1":
            start_server()
        elif c == "2":
            os.system("nano web/index.html")
        elif c == "3":
            os.system("nano web/template.html")
        elif c == "4":
            issues = check_security()
            print("\n=== HASIL CEK ===")
            if not issues:
                print("[✓] Website relatif aman")
            else:
                for i in issues:
                    print("[!] " + i)
            input("\nENTER...")
        elif c == "0":
            break

if __name__ == "__main__":
    main()
