#!/bin/bash
# ============================================================
#  setup-vnc-vm.sh — Setup otomatis XFCE + VNC di VM Ubuntu
#  Jalankan sebagai root di VM (via Termius):
#    bash setup-vnc-vm.sh
#  Catatan: password VNC tetap di-set manual via 'vncpasswd'
#           demi keamanan (tidak di-hardcode di script).
# ============================================================
set -e

if [ "$(id -u)" -ne 0 ]; then
    echo "ERROR: jalankan sebagai root (atau pakai sudo)." >&2
    exit 1
fi

echo "==> [1/4] Install XFCE + VNC + tools pendukung..."
apt update
apt install -y xfce4 xfce4-goodies tightvncserver tigervnc-tools \
    dbus-x11 x11-xserver-utils nano

echo "==> [2/4] Tulis konfigurasi startup (~/.vnc/xstartup)..."
mkdir -p ~/.vnc
cat > ~/.vnc/xstartup <<'EOF'
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
export XKL_XMODMAP_DISABLE=1
exec startxfce4
EOF
chmod +x ~/.vnc/xstartup

echo "==> [3/4] Bersihkan lock file lama (kalau ada)..."
vncserver -kill :1 2>/dev/null || true
rm -f /tmp/.X1-lock /tmp/.X11-unix/X1

echo ""
echo "==================== SELESAI ===================="
echo "Langkah terakhir (manual, 1 menit):"
echo "  1) vncpasswd            # buat password VNC"
echo "  2) vncserver :1 -geometry 1280x720 -depth 24"
echo "  3) vncserver -list      # pastikan :1 aktif"
echo "================================================="
