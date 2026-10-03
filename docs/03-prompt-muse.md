# 🤖 3. Kirim Prompt ke Muse

Sekarang bagian enaknya: **kamu tidak perlu setting VM secara manual**. Cukup kirim satu pesan ke chat Muse, dia yang mengerjakan semuanya di sisi VM.

## Template pesan (siap copas)

Salin teks di bawah, **ganti semua yang di dalam `[kurung siku]`** dengan datamu, lalu kirim:

```
Halo! Mau minta tolong konfigurasikan akses root ke VM Muse ini dari HP Android saya lewat Termius dong.

Persiapan di HP saya sudah beres semua:
- Termux (F-Droid): OpenSSH sudah terinstall, sshd jalan di port 8022
- Tailscale: Sudah konek, IP Tailscale HP: [MASUKKAN IP TAILSCALE HP, contoh: 100.95.196.10]
- Username Termux: [MASUKKAN HASIL WHOAMI, contoh: u0_a261]
- Password Termux: [ISI PASSWORD JIKA ADA, ATAU KOSONGKAN]

Tolong dibantu untuk langkah-langkah berikut ya:
1. Install & konfigurasi openssh-server di VM ini (port 22 & 2222).
2. Generate SSH keypair baru, lalu kirimkan file .pem-nya biar bisa saya import ke Termius.
3. Masukkan public key-nya ke /root/.ssh/authorized_keys.
4. Buat reverse SSH tunnel dari VM ke HP saya via Tailscale (lewat proxy port 3130): forward 127.0.0.1:2222 di HP -> 127.0.0.1:2222 di VM.
5. Pasangkan supervisor loop supaya tunnel-nya bisa auto-reconnect kalau sempat terputus.

Kalau tunnel-nya sudah jalan dan dites oke, tolong infoin detail koneksinya buat di Termius (host, port, username) sama isi file key .pem-nya ya. Makasih banyak!
```

## Yang sedang kamu minta (penjelasan tiap nomor)

| # | Permintaan | Artinya buat pemula |
|---|---|---|
| 1 | Install openssh-server (port 22 & 2222) | Pasang "pintu masuk" SSH di VM. Port 2222 khusus untuk jalur dari HP. |
| 2 | Generate keypair, kirim `.pem` | Buatkan pasangan kunci digital. File `.pem` = kunci privatmu, nanti diimport ke Termius. |
| 3 | Public key ke `authorized_keys` | Daftarkan "gembok" yang cocok dengan kuncimu di VM, biar kamu bisa login sebagai `root`. |
| 4 | Reverse SSH tunnel via Tailscale | Buatkan "jembatan" dari VM ke HP (VM yang menelepon HP), supaya HP bisa masuk ke VM lewat `127.0.0.1:2222`. |
| 5 | Supervisor auto-reconnect | Pasang "penjaga" yang otomatis menyambung ulang kalau jembatan sempat putus. |

## Setelah Muse selesai

Muse akan membalas dengan:
- ✅ Konfirmasi tunnel sudah jalan & dites
- 🔑 **Isi file `.pem`** (teks kunci privat — simpan baik-baik, jangan disebar!)
- 📋 Detail koneksi Termius (host, port, username)

Kalau sudah dapat itu semua → lanjut ke [langkah 4: Setup kunci & host di Termius](04-termius-key-host.md). 🔑
