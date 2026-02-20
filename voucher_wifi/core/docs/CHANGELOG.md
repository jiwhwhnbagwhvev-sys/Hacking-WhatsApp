# CHANGELOG HP KENTANG HOTSPOT

## [v1.0.0] - 2026-02-20
### Added
- Terminal CLI utama (`Run.py`) dengan logo penguin merah
- YouTube otomatis terbuka saat start
- Login Premium (username + token)
- Perintah khusus:
  - `.admin` → buka WhatsApp admin
  - `.teleadmin` → buka Telegram admin
  - `.cekid` → cek token valid
- Web Hotspot Server (`server.py`) untuk login premium & monitoring user
- Web Voucher (`core/voucher_web.py`) untuk generate voucher via web
- Monitoring realtime terminal (`core/monitor_terminal.py`)
- Network scan lokal (`core/network_scan.py`)
- Keamanan input (`core/security.py`)
- Logging aktivitas (`core/logger.py`)
- Validasi username & token (`core/validator.py`)
- Admin login (`core/auth.py`)
- Helper utilities (`core/utils.py`)

### Changed
- Struktur folder rapi: core/, data/, docs/, assets/
- JSON database untuk users, vouchers, premium, admin
- Warna terminal & banner ASCII lebih menarik

### Fixed
- Bug input XSS / karakter aneh
- User online realtime refresh
- Token random unik untuk premium