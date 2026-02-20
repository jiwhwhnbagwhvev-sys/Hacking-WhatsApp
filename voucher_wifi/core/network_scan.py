import subprocess
import re

def scan_network():
    """
    Scan jaringan lokal menggunakan arp-scan (Linux/Termux)
    Pastikan arp-scan terinstal:
    pkg install arp-scan
    """
    try:
        print("Memindai perangkat di jaringan lokal...\n")
        result = subprocess.check_output(["arp-scan", "-l"], universal_newlines=True)
        devices = []
        lines = result.split("\n")
        for line in lines:
            if re.match(r"\d+\.\d+\.\d+\.\d+", line):
                parts = line.split("\t")
                ip = parts[0]
                mac = parts[1] if len(parts) > 1 else "Unknown"
                devices.append({"ip": ip, "mac": mac})
        return devices
    except FileNotFoundError:
        print("arp-scan tidak ditemukan, install dulu dengan: pkg install arp-scan")
        return []
    except Exception as e:
        print(f"Gagal scan: {e}")
        return []

def show_devices():
    devices = scan_network()
    if not devices:
        print("Tidak ada perangkat terdeteksi.")
        return
    print("\n=== Perangkat Terhubung ===\n")
    for d in devices:
        print(f"IP: {d['ip']} | MAC: {d['mac']}")