# 🌐 2. Konfigurasi Tailscale & Termux

Tujuan langkah ini: **HP dan VM bisa saling terhubung** lewat jaringan privat Tailscale, dan Termux siap menerima koneksi SSH.

## A. Aktifkan Tailscale

1. Buka aplikasi **Tailscale**.
2. Login (bisa pakai akun Google / GitHub / Microsoft — gratis).
3. Tekan tombol **Connect** sampai muncul ikon VPN di bar status atas HP.
4. Setelah konek, catat **IP Tailscale** HP-mu:
   - Di aplikasi Tailscale, IP biasanya tampil di halaman utama (format `100.x.x.x`).
   - Contoh: `100.95.196.10`

> 📝 **Catat IP ini!** Nanti dipakai di prompt ke Muse dan tidak berubah-ubah selama akun Tailscale-mu sama.

## B. Siapkan Termux (cara cepat ⚡)

Buka Termux, salin-tempel perintah ini (atau jalankan [script otomatis](../scripts/setup-termux.sh)):

```bash
pkg update -y && pkg install -y openssh termux-api
sshd
termux-wake-lock
```

**Penjelasan per perintah** (biar nggak asal copas):

| Perintah | Artinya |
|---|---|
| `pkg update -y && pkg install -y openssh termux-api` | Update daftar paket, lalu install OpenSSH (biar Termux bisa jadi server SSH) dan Termux:API (fitur tambahan HP). |
| `sshd` | Menyalakan **server SSH** di HP pada port `8022`. Ini yang nanti dihubungi VM. |
| `termux-wake-lock` | Mencegah Android "menidurkan" Termux saat layar mati. Tanpa ini, koneksi bisa putus sendiri. |

## C. Catat username Termux

Jalankan di Termux:

```bash
whoami
```

Contoh output: `u0_a261`. **Catat hasilnya** — ini username untuk koneksi SSH ke HP.

## ✅ Cek keberhasilan

- [ ] Ikon VPN Tailscale muncul di status bar
- [ ] IP Tailscale tercatat (format `100.x.x.x`)
- [ ] `sshd` jalan tanpa error
- [ ] Username Termux tercatat

**Data yang sudah kamu kumpulkan:** IP Tailscale + username Termux.
Lanjut ke [langkah 3: Kirim prompt ke Muse](03-prompt-muse.md) 🤖
