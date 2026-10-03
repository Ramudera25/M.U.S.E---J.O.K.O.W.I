# 🖥️ 5. Install Desktop XFCE & VNC Server di VM

Sampai sini kamu sudah bisa perintah VM lewat teks (terminal). Sekarang kita pasang **tampilan desktop grafis** (GUI) biar bisa diklik-klik seperti komputer biasa, lalu alirkan layarnya ke HP via VNC.

> 💡 **Kenapa XFCE?** Desktop Linux yang ringan — VM tidak lemot dan hemat resource.

Pastikan kamu sudah di terminal VM via Termius (`root@htch-runtime:~#`).

## Cara cepat ⚡

Jalankan [script otomatis](../scripts/setup-vnc-vm.sh):

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Ramudera25/M.U.S.E---J.O.K.O.W.I/main/scripts/setup-vnc-vm.sh)
```

Lalu lanjut ke **Step 2** di bawah (set password VNC tetap manual demi keamanan).

## Cara manual (biar paham tiap langkahnya)

### Step 1 — Install paket desktop & tools

```bash
apt update && apt install -y xfce4 xfce4-goodies tightvncserver tigervnc-tools dbus-x11 x11-xserver-utils nano
```

| Paket | Fungsi |
|---|---|
| `xfce4` + `xfce4-goodies` | Desktop environment yang ringan + aplikasi pelengkap |
| `tightvncserver` | Server VNC (yang mengalirkan layar) |
| `tigervnc-tools` | Tools pendukung VNC (termasuk `vncpasswd`) |
| `dbus-x11`, `x11-xserver-utils` | Komponen sistem grafis X11 |
| `nano` | Text editor sederhana di terminal |

⏳ Install bisa makan waktu beberapa menit. Tunggu sampai prompt `root@...` muncul lagi.

### Step 2 — Set password VNC

```bash
vncpasswd
```

- Masukkan password baru (minimal 6 karakter) → Enter
- Ulangi password → Enter
- `Would you like to enter a view-only password?` → ketik `n` → Enter

> Password ini yang nanti diminta saat buka desktop dari HP. Jangan sampai lupa!

### Step 3 — Konfigurasi startup desktop

Perintah ini membuat file yang memberi tahu VNC "tampilkan desktop XFCE saat dinyalakan":

```bash
cat << 'EOF' > ~/.vnc/xstartup
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
export XKL_XMODMAP_DISABLE=1
exec startxfce4
EOF
chmod +x ~/.vnc/xstartup
```

### Step 4 — Bersihkan sisa lock (kalau ada)

```bash
vncserver -kill :1 2>/dev/null; rm -f /tmp/.X1-lock /tmp/.X11-unix/X1
```

> File "lock" kadang tertinggal kalau VNC pernah crash — perintah ini membersihkannya biar bisa start fresh.

### Step 5 — Jalankan VNC server

```bash
vncserver :1 -geometry 1280x720 -depth 24
```

- `:1` = layar nomor 1 (nanti diakses via port `5901`)
- `-geometry 1280x720` = resolusi layar (pas buat HP landscape)
- `-depth 24` = kedalaman warna

Verifikasi:

```bash
vncserver -list
```

Pastikan ada baris `:1` dengan Process ID (PID). Kalau ada → VNC jalan! ✅

Lanjut ke [langkah 6: Port forwarding di Termius](06-port-forwarding.md). 🔀
