cat > modules/root_check.sh <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash
. ./modules/_common.sh
echo "[*] Root Check"
need_root
tsu -c "id"
back
EOF
