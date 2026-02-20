import webbrowser

def open_youtube():
    url = "https://youtube.com/@pecinta-hpkentang?si=rk3UN2ooDra0SpVY"
    print("\nMembuka YouTube channel HP KENTANG...\n")
    try:
        webbrowser.open(url)
        print("Jika browser tidak terbuka otomatis, klik link ini:")
        print(url)
    except Exception as e:
        print(f"Gagal membuka browser: {e}")
        print("Buka link manual ini:")
        print(url)

# ===== MAIN =====
if __name__ == "__main__":
    open_youtube()