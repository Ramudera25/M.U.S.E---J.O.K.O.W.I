# 🔀 6. Setting Port Forwarding di Termius

VNC server di VM jalan di port `5901`. Tapi HP tidak bisa langsung menjangkau port itu — perlu "diteruskan" lewat koneksi SSH Termius yang sudah ada. Itu namanya **port forwarding**.

## Caranya

1. Di Termius, **edit** host `VM Ubuntu (Root)` (`127.0.0.1:2222`).
2. Masuk ke **Port Forwarding** (atau *Local Forwarding* / *SSH Tunnel* — nama menunya mirip-mirip).
3. Tambah aturan baru:

| Kolom | Isi |
|---|---|
| Local Port | `5901` |
| Destination / Remote Host | `127.0.0.1` |
| Destination / Remote Port | `5901` |

4. **Save**.

## Analogi sederhana

> Bayangkan koneksi SSH Termius itu seperti **terowongan**. Port forwarding = membuka **cabang terowongan** khusus: setiap yang masuk ke `127.0.0.1:5901` di HP, diteruskan lewat terowongan ke `127.0.0.1:5901` di VM (tempat VNC server menunggu).

## ✅ Cek keberhasilan

- Pastikan koneksi SSH di Termius berstatus **Connected** (jangan disconnect!).
- Biarkan Termius berjalan di background.

Lanjut ke [langkah 7: Buka layar desktop di HP](07-buka-desktop.md) — bagian paling seru! 🖼️
