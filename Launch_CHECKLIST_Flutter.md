# 🚀 Production Launch Checklist — OsKost Flutter Tenant Mobile App (v2.0)

Dokumen ini adalah **Daftar Centang Kesiapan Produksi (Launch Readiness Checklist)** resmi untuk aplikasi mobile **OsKost Tenant (Flutter Native)**. Gunakan dokumen ini sebagai panduan verifikasi tahap demi tahap sebelum melakukan proses rilis (*build production*) ke **Google Play Store** dan **Apple App Store**.

---

## 📌 Status umum Rilis Proyek

- **Versi Aplikasi**: `2.0.0+1`
- **Target OS**: Android (API 24 / Android 7.0+) & iOS (iOS 14.0+)
- **Base Backend API**: `https://oskost.vercel.app/api/v1`
- **Database Backend**: PostgreSQL (Prisma 7 via Next.js Route Handlers)
- **Payment Gateway**: Midtrans Snap WebView Integration
- **Storage**: Supabase Storage (`Oskost-Data-Private` & `Oskost-Data-Public`)
- **Push Notification**: Firebase Cloud Messaging (FCM)

---

## 1. 🔐 Security Hardening & Authentication Audit

- [ ] **Secure Storage for Tokens**:
  - `accessToken` dan `refreshToken` disimpan menggunakan `FlutterSecureStorage` dengan dekripsi hardware-backed (Android `EncryptedSharedPreferences` & iOS `Keychain`).
  - Tidak ada token JWT yang tersimpan di `SharedPreferences` biasa, log console, atau file teks lokal.
- [ ] **JWT Refresh Token Rotation**:
  - Interceptor Dio mendeteksi HTTP `401 Unauthorized`.
  - Mutex lock berfungsi saat memanggil `POST /api/v1/auth/refresh` sehingga request beruntun tidak memicu race condition refresh token.
  - Sesi otomatis terhapus dan mengarahkan pengguna ke halaman login jika refresh token telah kadaluwarsa (30 hari) atau di-revoke server.
- [ ] **Data Isolation & Logout Purge**:
  - Tombol Logout menghapus seluruh isi `FlutterSecureStorage` dan mengosongkan tabel cache SQLite `Drift`.
- [ ] **Network Traffic Security**:
  - Seluruh komunikasi HTTP wajib menggunakan enkripsi TLS/HTTPS (`https://oskost.vercel.app`).
  - SSL Certificate Pinning / Trust evaluation terkonfigurasi.
- [ ] **Input Sanitization**:
  - Form Login & Reset Password dibatasi oleh `validator.dart` sebelum dikirim ke API backend.

---

## 2. 💳 Financial & Payment Gateway Verification (Midtrans Snap)

- [ ] **Midtrans Snap WebView Navigation Delegate**:
  - `webview_flutter` berhasil memuat `paymentUrl` dari response `POST /api/v1/invoices/:id/snap`.
  - Navigation Delegate mencegat URL callback sukses (`finish_url`), pending (`pending_url`), dan gagal (`cancel_url`).
  - Pengguna diarahkan secara mulus ke `PaymentFinishScreen` setelah transaksi.
- [ ] **Deep-Link URL Scheme (`oskost://payment-finish`)**:
  - Intent filter Android (`AndroidManifest.xml`) dan URL Scheme iOS (`Info.plist`) terkonfigurasi untuk menangani return URL dari aplikasi GoPay / ShopeePay / Bank Mandiri.
- [ ] **Penanganan Order ID Unik (Anti-Duplicate)**:
  - Request Snap menggunakan format `externalId` + Base-36 timestamp untuk menghindari error `400 Duplicate Order ID` dari Midtrans saat pengguna mengulang transaksi PENDING.
- [ ] **Manual Testing Scenario (QRIS & Virtual Account)**:
  - Test skenario pembayaran QRIS di Sandbox/Production berhasil memperbarui status tagihan menjadi `PAID` secara real-time.
  - Test skenario Virtual Account (BCA/Mandiri/BRI) berjalan dengan benar.

---

## 3. 📷 Image Compression & Supabase Media Upload Protocol

- [ ] **Client-side Image Compression (WebP ≤ 500KB)**:
  - Foto laporan kerusakan dari kamera/galeri dikompresi menggunakan `flutter_image_compress`.
  - Format dikonversi ke **WebP** dan ukuran file dipastikan **≤ 500KB** sebelum proses upload.
- [ ] **Supabase Storage Signed URL Protocol**:
  - Flutter App meminta Signed URL via `POST /api/v1/reports/upload-url`.
  - File binary WebP diunggah langsung ke Supabase Storage via HTTP `PUT`.
  - Respon HTTP 200 OK diterima dari Supabase sebelum payload tiket dikirim ke backend.
- [ ] **Memory Management**:
  - Penggunaan memori saat pengambilan foto dan kompresi tetap stabil (tidak memicu Crash / Out of Memory di HP Android RAM 3GB).

---

## 4. 📱 Offline Resiliency & Local Cache (Drift SQLite)

- [ ] **Offline Data Access**:
  - Saat perangkat berada di mode Pesawat (Offline), halaman Tagihan (`InvoicesScreen`) dan Laporan (`ReportsScreen`) tetap dapat menampilkan data terakhir yang tersimpan di database SQLite `Drift`.
- [ ] **Connectivity State Handling**:
  - Plugin `connectivity_plus` menampilkan indikator banner halus (*Snackbar*) saat koneksi terputus dan otomatis melakukan perataan sync (*silent refresh*) saat koneksi kembali terhubung.

---

## 5. 🔔 Firebase Cloud Messaging (FCM) Push Notifications

- [ ] **Device Token Registration**:
  - Token FCM didapatkan saat aplikasi pertama kali diinstal dan didaftarkan ke backend via `POST /api/v1/push/subscriptions`.
- [ ] **Notification Channels (Android 8.0+)**:
  - Channel `tagihan_channel` (High Importance, Custom Sound/Vibration) terkonfigurasi untuk pengingat sewa.
  - Channel `pengumuman_channel` terkonfigurasi untuk informasi dari Admin.
- [ ] **Notification Tap Payload Routing**:
  - Klik notifikasi tagihan mengarahkan pengguna langsung ke `/invoices/:id`.
  - Klik notifikasi laporan kerusakan mengarahkan pengguna langsung ke `/reports/:id`.

---

## 6. ⚡ Performance & UI Rendering Audit (Wabi-Sabi Design)

- [ ] **Frame Rate & Memory Baseline**:
  - Aplikasi berjalan stabil pada **60 FPS** tanpa lag (*jank*) pada perangkat entry-level (misal: Android RAM 3GB/4GB).
- [ ] **Safe Area & Viewport Insets**:
  - Padding layar utama konsisten di `20px` (`screen-margin-mobile`).
  - Tinggi Bottom Navigation Bar `68px` (`bottom-nav-height`) + `MediaQuery.of(context).padding.bottom` untuk mencegah tumpang tindih dengan gesture bar OS.
- [ ] **Typography & Color Token Audit**:
  - Seluruh warna menggunakan token `AppColors.*` (bebas dari hardcoded hex color `Color(0xFF...)`).
  - Teks editorial menggunakan Noto Serif, teks fungsional menggunakan Plus Jakarta Sans.

---

## 7. 📦 Play Store & App Store Build Readiness

- [ ] **App Identity**:
  - App Name: `OsKost`
  - Package Name / Bundle Identifier: `com.pulojahe.oskost`
  - App Icon & Splash Screen bertema Wabi-Sabi Warm Linen `#FEF8F5`.
- [ ] **Build Configuration & Obfuscation**:
  - Android `build.gradle`: `minSdkVersion 24`, `targetSdkVersion 34`.
  - ProGuard / R8 Obfuscation diaktifkan (`android/app/proguard-rules.pro`).
- [ ] **Runtime Permissions Audit**:
  - Camera (`android.permission.CAMERA`)
  - Read External Storage / Photos (`android.permission.READ_MEDIA_IMAGES`)
  - Internet (`android.permission.INTERNET`)
  - Post Notifications (`android.permission.POST_NOTIFICATIONS` untuk Android 13+)
- [ ] **Release Command Verification**:
  - Executed: `flutter build appbundle --release` (Android AAB, size < 25MB)
  - Executed: `flutter build ipa --release` (iOS IPA)

---

## 📅 Log Sign-off Peluncuran Rilis

| Peran | Nama / Penguji | Tanggal | Status | Catatan Verification |
| :--- | :--- | :---: | :---: | :--- |
| **Lead Developer** | AI Agent & Rinaldi | 2026-09-18 | `[/]` | Slicing UI & Router complete. Integrasi API REST `/api/v1/*` in progress. |
| **Product Owner** | Rinaldi Mulya | 2026-09-18 | `[ ]` | Pending final APK/AAB build & Play Store Submission. |
