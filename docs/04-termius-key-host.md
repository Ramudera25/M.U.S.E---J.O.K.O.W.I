# 🔑 4. Setup Kunci & Host di Termius

Di langkah ini kita daftarkan kunci `.pem` dari Muse ke Termius, lalu buat profil koneksi ke VM.

## A. Import private key ke Keychain

1. **Salin seluruh teks kunci** dari balasan Muse — mulai dari baris:
   `-----BEGIN OPENSSH PRIVATE KEY-----`
   sampai:
   `-----END OPENSSH PRIVATE KEY-----`
   (termasuk kedua baris itu, jangan ada yang kepotong!)
2. Buka **Termius** → masuk ke menu **Keychain** (ikon kunci 🔑) → tekan **+** (New Key).
3. Pilih **Paste / Private Key** → tempel teks kunci tadi.
4. **Passphrase dikosongkan saja** → tekan **Save**.

> 🔒 **Jaga kunci ini!** Siapa pun yang pegang file `.pem`-mu bisa login sebagai root ke VM-mu. Jangan upload ke forum, jangan share ke grup chat.

## B. Buat profil Host (server)

1. Di Termius buka menu **Hosts** → tekan **+** (New Host).
2. Isi seperti ini:

| Kolom | Isi |
|---|---|
| Alias | `VM Ubuntu (Root)` |
| Hostname / IP Address | `127.0.0.1` |
| Port | `2222` |
| Username | `root` |
| Key | pilih kunci yang baru kamu simpan di Keychain |

3. **Save**, lalu ketuk host tersebut.

## ✅ Cek keberhasilan

Kalau berhasil, kamu akan melihat terminal dengan prompt seperti:

```
root@htch-runtime:~#
```

🎉 **Selamat! Kamu sekarang mengendalikan VM Ubuntu langsung dari HP!**

> ❓ **Kok `127.0.0.1`? Bukannya itu alamat HP sendiri?**
> Betul! Tapi ingat: ada *reverse tunnel* yang meneruskan `127.0.0.1:2222` di HP → ke VM.
> Jadi saat Termius konek ke `127.0.0.1:2222`, sebenarnya dia "masuk ke terowongan" dan keluar di VM. Keren, kan?

Lanjut ke [langkah 5: Install desktop XFCE & VNC di VM](05-vnc-gui-vm.md) — biar ada tampilan grafisnya, nggak cuma teks. 🖥️
