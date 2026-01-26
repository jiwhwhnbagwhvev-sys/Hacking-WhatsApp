cat > modules/_common.sh <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash
back() {
  echo
  read -p "Enter=menu | q=exit : " c
  [[ "$c" =~ ^[qQ]$ ]] && exit || return
}
need_root() {
  command -v tsu >/dev/null 2>&1 || { echo "[!] tsu tidak ada"; back; }
}
EOF
