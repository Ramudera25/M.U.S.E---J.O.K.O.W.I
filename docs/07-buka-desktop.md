# 🖼️ 7. Membuka Layar Desktop di HP

Semua persiapan beres. Saatnya melihat hasilnya!

## Caranya

1. Pastikan **Termius masih Connected** (biarkan jalan di background — jangan di-swipe tutup!).
2. Buka **bVNC** (atau AVNC Viewer).
3. Tambah koneksi baru:

| Kolom | Isi |
|---|---|
| Address / Host | `127.0.0.1` |
| Port | `5901` |
| Name | `Ubuntu Desktop` (bebas) |
| Security / Encryption | `VNC Auth` / `Standard VNC` |

4. Tekan **Connect**.
5. Masukkan **password VNC** yang kamu buat di [langkah 5](05-vnc-gui-vm.md).

## 🎉 Hasilnya

Layar desktop **Ubuntu XFCE** tampil di HP-mu! Kamu bisa:
- Buka terminal, file manager, browser
- Jalankan aplikasi Linux langsung dari HP
- Cubit-zoom & gesture sentuh seperti biasa (bVNC mendukung touchscreen)

## Tips pemakaian

- **Resolusi kekecilan/kegedean?** Matikan VNC (`vncserver -kill :1` di Termius), lalu jalankan lagi dengan geometry lain, mis. `vncserver :1 -geometry 1920x1080 -depth 24`.
- **Keyboard HP menutupi layar?** Di bVNC ada tombol keyboard virtual di toolbar atas.
- **Mau putus?** Cukup disconnect bVNC. VNC server di VM tetap jalan — lain waktu tinggal Connect lagi.

## 🎨 Bonus: tampilkan info spek VM

Di terminal Termius, jalankan:

```bash
apt install -y neofetch && neofetch
```

Muncul logo Ubuntu + info spek VM. Cocok buat pamer screenshot. 😎

---

Ada error? → [Troubleshooting & FAQ](08-troubleshooting.md) 🛠️
