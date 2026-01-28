#!/data/data/com.termux/files/usr/bin/bash
# ==========================================
# DNS BENCHMARK MODULE
# ==========================================

clear
echo "======================================"
echo "        DNS BENCHMARK MODULE           "
echo "======================================"
echo
echo "[*] Menjalankan DNS Benchmark Engine..."
sleep 0.5

python engine/dns_benchmark.py

echo
read -rp "Tekan ENTER untuk kembali ke menu..."
