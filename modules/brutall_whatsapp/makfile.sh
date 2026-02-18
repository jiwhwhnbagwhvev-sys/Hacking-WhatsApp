# ===== Makefile =====
# Author: Hacking-WhatsApp
# Deskripsi: Install dependencies, compile main.c, jalankan main.sh dari modules, dan handle data/package.json

.PHONY: install update run reset

# ===== Install dependencies =====
install:
	@echo "[*] Update repository..."
	@git pull
	@clear

	@echo "[*] Menginstall paket sistem..."
	@apt-get update && apt-get install -y bash curl wget jq python python-pip nano clang ncurses-utils bc xh pv ossp-uuid nodejs openssl-tool nodejs-lts

	@echo "[*] Menginstall Python dependencies dari lib/requirements.txt..."
	@python -m pip install --no-cache-dir -r lib/requirements.txt || true

	@echo "[*] Menginstall NodeJS dependencies dari package.json..."
	@npm install -g chalk chalk-animation
	@npm install

	@echo "[*] Compile main.c..."
	@gcc main.c -o main

	@clear
	@printf "\n\033[37m[\033[32m✓\033[37m] Semua package & module berhasil diinstall\n"
	@printf "\033[37m[\033[32m✓\033[37m] Jalankan script dengan ketik \033[1;30m'make run'\033[0m atau \033[1;30m'./main'\033[0m\n\n"

# ===== Update repository =====
update:
	@echo "[*] Menarik update terbaru dari GitHub..."
	@git pull

# ===== Run main script =====
run:
	@echo "[*] Menjalankan menu utama dari modules/main.sh..."
	@bash modules/main.sh

# ===== Reset =====
reset:
	@echo "[*] Menghapus file main..."
	@rm -f main
	@echo "[✓] Selesai"
