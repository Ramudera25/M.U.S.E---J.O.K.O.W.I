#!/data/data/com.termux/files/usr/bin/bash
# ============================================================
#  setup-termux.sh — Setup otomatis Termux untuk M.U.S.E-J.O.K.O.W.I
#  Jalankan sekali di Termux:  bash setup-termux.sh
# ============================================================
set -e

echo "==> [1/4] Update paket & install OpenSSH + Termux:API..."
pkg update -y
pkg install -y openssh termux-api

echo "==> [2/4] Siapkan folder SSH..."
mkdir -p ~/.ssh
chmod 700 ~/.ssh

echo "==> [3/4] Nyalakan sshd (port 8022)..."
# hentikan dulu kalau sudah jalan, biar bersih
pkill -f "sshd" 2>/dev/null || true
sshd
echo "    sshd aktif."

echo "==> [4/4] Aktifkan wake-lock (cegah Termux dimatikan Android)..."
termux-wake-lock
echo "    wake-lock aktif."

echo ""
echo "==================== SELESAI ===================="
echo "Username Termux : $(whoami)"
TS_IP=$(ip -o -4 addr show tailscale0 2>/dev/null | awk '{print $4}' | cut -d/ -f1)
if [ -n "$TS_IP" ]; then
    echo "IP Tailscale    : $TS_IP"
else
    echo "IP Tailscale    : (tidak terdeteksi — pastikan Tailscale sudah Connect)"
fi
echo "SSH HP          : port 8022"
echo "================================================="
echo "Catat IP Tailscale & username di atas,"
echo "lalu lanjut ke langkah 3 di README (kirim prompt ke Muse)."
