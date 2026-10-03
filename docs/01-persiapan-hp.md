# 📲 1. Persiapan Aplikasi di HP Android

Di langkah ini kita install 4 aplikasi. Masing-masing punya peran — penjelasannya ada di bawah biar kamu paham kenapa butuh semuanya.

## Aplikasi yang dibutuhkan

| # | Aplikasi | Fungsi | Download dari |
|---|---|---|---|
| 1 | **Termux** | Terminal Linux di HP. Pintu masuk semua perintah. | [F-Droid](https://f-droid.org/en/packages/com.termux/) ⚠️ |
| 2 | **Tailscale** | VPN yang menghubungkan HP & VM dalam satu jaringan privat. | Google Play Store |
| 3 | **Termius** | Aplikasi SSH buat masuk ke VM dengan tampilan enak. | Google Play Store |
| 4 | **bVNC** / **AVNC** | Penampil layar desktop VM (VNC viewer). Pilih salah satu. | Play Store / F-Droid |

> ⚠️ **Penting: Termux WAJIB dari F-Droid, bukan Play Store!**
> Versi Play Store sudah lama tidak diupdate dan banyak bug (sering crash, `apt` error).
> Download F-Droid dulu dari [f-droid.org](https://f-droid.org), lalu cari "Termux" di dalamnya.

## Setelah install, cek

Buka satu per satu, pastikan tidak langsung force-close:

- [ ] Termux terbuka normal (muncul prompt `$`)
- [ ] Tailscale terbuka (minta login — lanjut ke langkah 2)
- [ ] Termius terbuka
- [ ] bVNC/AVNC terbuka

Kalau semua terbuka tanpa error → lanjut ke [langkah 2: Konfigurasi Tailscale & Termux](02-jaringan-termux.md). 🚀
