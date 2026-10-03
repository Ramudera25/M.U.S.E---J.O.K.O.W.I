# M.U.S.E---J.O.K.O.W.I
< Mobile Ubuntu Server Environment - 
Jaringan Operasi Koneksi OpenSSH Web Interface​ >

Deskripsi: Panduan eksekutif untuk menghubungkan VM Muse ke HP Android secara cepat, praktis, dan langsung kerja-kerja-kerja 
# 🚀 Android to Ubuntu VM: Panduan Akses Terminal & GUI Desktop

Dokumentasi ini berisi panduan praktis dan lengkap untuk mengakses Virtual Machine (VM) Ubuntu dari HP Android. Didesain secara khusus agar mudah diikuti oleh pengguna dari berbagai tingkat keahlian (termasuk pemula/awam).
Melalui panduan ini, kamu akan mempelajari cara membangun jembatan jaringan aman via Tailscale, menyiapkan reverse SSH tunnel menggunakan Termux dan Muse, mengelola terminal via Termius, hingga mengalirkan tampilan visual desktop (XFCE4 GUI) secara interaktif melalui VNC Server.
✨ Fitur Utama Panduan:
 * 📲 Full Android Setup: Mengontrol VM sepenuhnya cukup dari smartphone.
 * 🔒 Akses Aman: Koneksi terenkripsi menggunakan Tailscale VPN & SSH Keypair.
 * 🖥️ Layar Visual (GUI): Pemasangan desktop environment XFCE4 yang ringan dan responsif.
 * 📑 Ready-to-Copy Prompts & Commands: Semua perintah terminal dan template prompt sudah siap salin-tempel.
 * 🗺️ Visual Workflow: Dilengkapi dengan Diagram Pohon Kerangka dan Flowchart Mermaid.
 
🌳 Diagram Pohon Kerangka Dokumentasi
📁 Repository: setup-vm-android-vnc
│
├── 📌 1. Pendahuluan & Konsep
│   ├── Konsep Alat (Tailscale, Termux, Muse, Termius, VNC)
│   └── Diagram Alur Koneksi (Flowchart Visual)
│
├── 📲 2. Persiapan Aplikasi di HP Android
│   └── 4 Aplikasi Wajib (Termux, Tailscale, Termius, bVNC/AVNC)
│
├── 🌐 3. Konfigurasi Jaringan & Termux
│   ├── Aktifkan VPN Tailscale
│   └── Jalankan SSHD & Wake-Lock di Termux
│
├── 🤖 4. Kirim Prompt ke Muse
│   └── Prompt Siap Copas (Versi Santai & Rapi)
│
├── 🔑 5. Setup Kunci & Host di Termius
│   ├── Import Private Key (.pem)
│   └── Buat Profile Host (127.0.0.1:2222)
│
├── 🖥️ 6. Pemasangan GUI Desktop & VNC Server
│   ├── Install XFCE4, VNC, & Tools
│   ├── Set Password VNC (vncpasswd)
│   ├── Script Startup GUI (~/.vnc/xstartup)
│   └── Jalankan VNC Server (:1 / Port 5901)
│
├── 🔀 7. Setting Port Forwarding di Termius
│   └── Forwarding Port 5901 (HP ↔️ VM)
│
├── 🖼️ 8. Membuka Layar Desktop di HP
│   └── Koneksi via bVNC / AVNC Viewer
│
├── 🎨 9. Bonus: Logo Ubuntu & Spek (Neofetch)
│
└── 🛠️ 10. Troubleshooting
    ├── Connection Refused / VM Replace
    ├── Missing tigervnc-tools
    └── EOFException / VNC Crash

🔄 Diagram Alur Koneksi (Flowchart)
Diagram ini menggambarkan alur kerja jembatan koneksi dari HP kamu sampai layar desktop VM terbuka:
flowchart TD
    subgraph PERANGKAT_ANDROID ["📱 HP Android"]
        A[1. Buka Tailscale] -->|Status Connected| B[2. Buka Termux]
        B -->|Jalankan sshd & wake-lock| C[3. Dapatkan IP Tailscale & Username]
        C -->|Kirim Prompt| D[4. Chat dengan Muse]
        E[5. Termius SSH Client] -->|Import Key .pem| F[Host: 127.0.0.1 Port: 2222]
        H[7. bVNC / AVNC Viewer] -->|Konek 127.0.0.1:5901| I[🖥️ Layar Desktop Ubuntu XFCE Muncul]
    end

    subgraph CLOUD_VM ["☁️ VM Muse (Ubuntu)"]
        D -->|Muse Menyiapkan| G[Reverse SSH Tunnel]
        F -->|Terhubung via Tunnel| G
        G -->|Install & Run| VNC[VNC Server Port: 5901]
    end

    subgraph PORT_FORWARD ["🔀 Termius Port Forwarding"]
        F -.->|Port Forwarding 5901| H
    end

📲 1. Persiapan Aplikasi di HP Android
Install 4 aplikasi berikut di HP Android kamu:
 * Termux (Disarankan versi F-Droid agar stabil dan bebas bug)
 * Tailscale (Google Play Store)
 * Termius (Google Play Store)
 * bVNC / AVNC Viewer (Google Play Store atau F-Droid)
🌐 2. Konfigurasi Jaringan & Termux
A. Aktifkan Tailscale
 * Buka aplikasi Tailscale di HP.
 * Tekan Connect hingga muncul indikator VPN di bar status atas HP.
 * Catat IP Tailscale HP milikmu (contoh: 100.95.196.10).
B. Aktifkan Service di Termux
Buka aplikasi Termux, lalu salin dan jalankan perintah ini satu per satu:
sshd
termux-wake-lock

(Perintah sshd mengaktifkan server SSH di HP pada port 8022, dan termux-wake-lock mencegah Android mematikan Termux di background).
Cek username Termux milikmu:
whoami

Catat hasilnya (contoh output: u0_a572).
🤖 3. Kirim Prompt Pertama ke Muse
Salin (copy) pesan di bawah ini, ganti teks di dalam kurung siku [...] sesuai data HP-mu, lalu kirimkan ke chat Muse:
Halo! Mau minta tolong konfigurasikan akses root ke VM Muse ini dari HP Android saya lewat Termius dong.

Persiapan di HP saya sudah beres semua:
- Termux (F-Droid): OpenSSH sudah terinstall, sshd jalan di port 8022
- Tailscale: Sudah konek, IP Tailscale HP: [MASUKKAN IP TAILSCALE HP, contoh: 100.95.196.10]
- Username Termux: [MASUKKAN HASIL WHOAMI, contoh: u0_a572]
- Password Termux: [ISI PASSWORD JIKA ADA, ATAU KOSONGKAN]

Tolong dibantu untuk langkah-langkah berikut ya:
1. Install & konfigurasi openssh-server di VM ini (port 22 & 2222).
2. Generate SSH keypair baru, lalu kirimkan file .pem-nya biar bisa saya import ke Termius.
3. Masukkan public key-nya ke /root/.ssh/authorized_keys.
4. Buat reverse SSH tunnel dari VM ke HP saya via Tailscale (lewat proxy port 3130): forward 127.0.0.1:2222 di HP -> 127.0.0.1:2222 di VM.
5. Pasangkan supervisor loop supaya tunnel-nya bisa auto-reconnect kalau sempat terputus.

Kalau tunnel-nya sudah jalan dan dites oke, tolong infoin detail koneksinya buat di Termius (host, port, username) sama isi file key .pem-nya ya. Makasih banyak!

🔑 4. Setup Kunci & Host di Termius
Setelah Muse membalas dan memberikan isi Private Key (.pem):
 * Import Private Key ke Keychain:
   * Salin seluruh teks kunci (mulai dari -----BEGIN OPENSSH PRIVATE KEY----- sampai -----END OPENSSH PRIVATE KEY-----).
   * Buka Termius \rightarrow masuk ke menu Keychain (ikon kunci) \rightarrow tekan + (New Key).
   * Pilih Paste / Private Key \rightarrow Tempel teks kunci tadi \rightarrow Kosongkan Passphrase \rightarrow Simpan.
 * Buat Profil Server (Host) di Termius:
   * Buka menu Hosts di Termius \rightarrow tekan + (New Host).
   * Alias: VM Ubuntu (Root)
   * Hostname / IP Address: 127.0.0.1
   * Port: 2222
   * Username: root
   * Key: Pilih kunci yang sudah disimpan di Keychain tadi.
   * Simpan, lalu ketuk host tersebut untuk masuk ke terminal VM!
🖥️ 5. Pemasangan GUI Desktop & VNC Server di VM
Setelah berhasil masuk ke terminal VM via Termius (root@htch-runtime:~#), salin dan jalankan perintah berikut secara berurutan:
Step 1: Install Package Desktop & Tools Pendukung
apt update && apt install -y xfce4 xfce4-goodies tightvncserver tigervnc-tools dbus-x11 x11-xserver-utils nano

Step 2: Set Password VNC
vncpasswd

 * Masukkan password VNC baru (minimal 6 karakter) \rightarrow Enter.
 * Masukkan ulang password \rightarrow Enter.
 * Jika ditanya Would you like to enter a view-only password (y/n)?, ketik n lalu Enter.
Step 3: Konfigurasi Script Startup XFCE
cat << 'EOF' > ~/.vnc/xstartup
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
export XKL_XMODMAP_DISABLE=1
exec startxfce4
EOF

Step 4: Atur Izin Executable & Bersihkan Lock File
chmod +x ~/.vnc/xstartup && vncserver -kill :1 2>/dev/null; rm -f /tmp/.X1-lock /tmp/.X11-unix/X1

Step 5: Jalankan VNC Server
vncserver :1 -geometry 1280x720 -depth 24

(Verifikasi dengan perintah vncserver -list, pastikan layar :1 sudah aktif dan memiliki Process ID).
🔀 6. Setting Port Forwarding di Termius
Agar layar desktop VM di port 5901 bisa dialirkan ke HP:
 * Di Termius, buka/edit pengaturan Host 127.0.0.1:2222.
 * Masuk ke Port Forwarding / Local Forwarding \rightarrow Tambah aturan baru:
   * Local Port: 5901
   * Destination / Remote Host: 127.0.0.1
   * Destination Port / Remote Port: 5901
 * Simpan dan pastikan koneksi SSH di Termius tetap terhubung (Connected).
🖼️ 7. Membuka Layar Desktop di HP (bVNC / AVNC)
 * Biarkan Termius tetap aktif berjalan di background.
 * Buka aplikasi bVNC atau AVNC Viewer di HP.
 * Tambahkan koneksi baru:
   * Address / Host: 127.0.0.1
   * Port: 5901
   * Name: Ubuntu Desktop
   * Security Type / Encryption: VNC Auth / Standard VNC
 * Tekan Connect, masukkan password VNC yang sudah kamu buat.
 * Selamat! Layar desktop Ubuntu XFCE sudah tampil visual di HP-mu! 🚀
🎨 8. Bonus: Tampilkan Logo Ubuntu & Spesifikasi VM
Buka terminal Termius, lalu jalankan perintah ini:
apt install -y neofetch

Panggil dengan perintah:
neofetch

🛠️ 9. Troubleshooting (Penyelesaian Masalah)
1. Error Connection Refused di Port 2222 (Termius)
 * Penyebab: VM di-reset/replace otomatis oleh runtime.
 * Solusi: Kirim pesan singkat ke Muse:
   > "VM sepertinya ter-replace. Tolong tegakkan ulang reverse SSH tunnel ke IP Tailscale HP saya ([IP TAILSCALE HP]) port 8022 ya."
   > 
2. Error Couldn't find "tigervncpasswd" saat menjalankan VNC
 * Solusi: Install paket pendukungnya di VM: apt install -y tigervnc-tools.
3. Error EOFException / Disconnect di bVNC
 * Penyebab: VNC Server di VM mati/crash atau masalah enkripsi bVNC.
 * Solusi: Cek dengan vncserver -list. Jika kosong, jalankan kembali perintah pada Langkah 5 (Step 4 & Step 5).
4. Masih bingung? cukup salin link github ini terus minta gemini/claude dan sejenisnya untuk menjabarkan lebih detail
5. alamak masih bingung juga? ikuti dulu aja arahan diatas kalo mentok copy-paste log terminal kalian lalu minta AI jelaskan

Btw Hidup Jokowi ✊️
