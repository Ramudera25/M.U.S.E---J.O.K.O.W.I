# 🛠️ 8. Troubleshooting & FAQ

Error itu wajar, apalagi pertama kali. Cari pesan errormu di bawah — kemungkinan besar solusinya sudah ada.

## ❌ Connection Refused di port 2222 (Termius)

**Penyebab paling umum:** VM di-reset/replace otomatis oleh runtime Muse. Semua setting di VM hilang.

**Solusi:** Kirim pesan singkat ke chat Muse:

> "VM sepertinya ter-replace. Tolong tegakkan ulang reverse SSH tunnel ke IP Tailscale HP saya ([IP TAILSCALE HP]) port 8022 ya."

Muse akan membangun ulang semuanya. Key `.pem`-mu tetap sama — tidak perlu import ulang.

---

## ❌ `Couldn't find "tigervncpasswd"` saat `vncpasswd`

**Solusi:** install paket pendukungnya:

```bash
apt install -y tigervnc-tools
```

Lalu ulangi `vncpasswd`.

---

## ❌ EOFException / disconnect tiba-tiba di bVNC

**Kemungkinan penyebab:**
1. VNC server di VM mati/crash.
2. Koneksi SSH Termius terputus (port forwarding ikut mati).

**Solusi:**
1. Di Termius, cek `vncserver -list`. Kalau kosong → jalankan ulang:
   ```bash
   vncserver :1 -geometry 1280x720 -depth 24
   ```
2. Pastikan Termius masih **Connected**. Kalau putus, konek ulang.

---

## ❌ Layar hitam / blank setelah Connect VNC

**Penyebab:** file `~/.vnc/xstartup` tidak executable atau isinya salah.

**Solusi** (di Termius):

```bash
chmod +x ~/.vnc/xstartup
vncserver -kill :1; rm -f /tmp/.X1-lock /tmp/.X11-unix/X1
vncserver :1 -geometry 1280x720 -depth 24
```

---

## ❌ `sshd: command not found` di Termux

**Penyebab:** paket OpenSSH belum terinstall.

**Solusi:**

```bash
pkg update -y && pkg install -y openssh
sshd
```

---

## ❌ Termux mati sendiri saat layar HP dikunci

**Penyebab:** Android mematikan aplikasi background untuk hemat baterai.

**Solusi:**
1. Jalankan `termux-wake-lock` setiap buka Termux (atau pasang di `~/.bashrc` biar otomatis).
2. Di Pengaturan HP → Baterai → cari Termux → set ke **"Tidak dioptimasi" / "Unrestricted"**.

---

## ❓ FAQ

**Q: Apakah ini aman?**
A: Ya. Tailscale mengenkripsi semua trafik (WireGuard), SSH memakai keypair (bukan password yang bisa ditebak), dan VM hanya menerima koneksi dari localhost. Satu catatan: **jaga file `.pem`-mu** — itu kunci root VM.

**Q: IP Tailscale saya berubah-ubah?**
A: Tidak, selama pakai akun Tailscale yang sama. IP `100.x.x.x` itu tetap milik perangkatmu.

**Q: Perlu bayar?**
A: Tidak. Tailscale gratis untuk personal, Termux gratis, Termius & bVNC ada versi gratis yang cukup, VNC & XFCE open-source.

**Q: Bisa dipakai di iPhone?**
A: Panduan ini khusus Android (butuh Termux). Untuk iPhone alurnya beda.

**Q: Muse bisa bantu kalau saya mentok?**
A: Bisa banget. Salin **pesan error / log terminal** kamu, kirim ke chat Muse beserta penjelasan "saya lagi di langkah X". Makin lengkap info yang kamu kasih, makin tepat bantuannya.

---

Masih buntu? Buka [issue baru](https://github.com/Ramudera25/M.U.S.E---J.O.K.O.W.I/issues) di repo ini — sertakan langkah ke berapa dan pesan errornya. 👍
