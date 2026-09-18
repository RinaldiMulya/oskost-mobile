# 🚀 Milestone Development: OsKost Flutter Tenant App (v2.0)

Dokumen ini adalah **Master Progress & Task Tracker** resmi untuk pengembangan aplikasi mobile **OsKost Tenant (Flutter Native)**. Dokumen ini dirancang sebagai acuan kerja harian (*Single Source of Truth*) untuk **Solo Developer** dan **AI Agent (Cursor / Claude Code / Windsurf)**.

---

## 📌 Panduan Status Indicator
- `[x]` = Selesai & Lolos Verifikasi (Tested)
- `[/]` = Sedang Dikerjakan (In Progress)
- `[ ]` = Belum Dimulai (Backlog)
- `[-]` = Ditunda / Opsional (On Hold)

---

## 🏗️ Technical Context & System Environment

| Parameter | Spesifikasi Teknis |
| :--- | :--- |
| **Framework & Engine** | Flutter 3.29.x / Dart 3.7.x (Material 3 Enabled) |
| **Target OS** | Android (SDK 24+ / Android 7.0+) & iOS (14.0+) |
| **Architecture Pattern** | Feature-First Clean Architecture (`lib/features/*`) |
| **State Management** | Flutter Riverpod / StateNotifier |
| **HTTP & API Layer** | Dio 5.x + Retrofit + Auto Bearer JWT Interceptor |
| **Auth Strategy** | Dual Auth: Access Token (JWT 15 m) + Refresh Token Rotation (30 d) |
| **Local Offline DB** | Drift SQLite (`lib/core/storage/drift_database.dart`) + `FlutterSecureStorage` |
| **Design System** | Wabi-Sabi Sanctuary (`AppColors`, Noto Serif + Plus Jakarta Sans) |
| **Media Upload** | `image_picker` → `flutter_image_compress` (WebP ≤ 500KB) → Supabase Signed URL |
| **Payment Gateway** | Midtrans Snap WebView (`webview_flutter`) |
| **Push Notification** | Firebase Cloud Messaging (FCM) + `flutter_local_notifications` |

---

## FASE 1: Core App Shell, Networking, & Authentication
**Target**: Menyiapkan pondasi aplikasi, sistem navigasi, tema Wabi-Sabi, dan mekanisme autentikasi JWT terpadu.

### 1.1 App Shell & Routing Architecture
- [x] Inisiasi project Flutter `oskost-mobile` dengan Dart strict mode (`analysis_options.yaml`).
- [x] Konfigurasi `lib/app/app.dart` dengan `MaterialApp.router` dan tema Wabi-Sabi `#FEF8F5`.
- [x] Implementasi `lib/app/router/app_router.dart` menggunakan `GoRouter` (ShellRoute + Stack Routes).
- [x] Implementasi `lib/app/router/auth_guard.dart` (`ChangeNotifier`) untuk pengawal sesi user.
- [x] Implementasi `lib/app/shell/app_shell.dart` untuk Bottom Navigation Dock (Home, Tagihan, Laporan, Profil).

### 1.2 Design System Tokens & Core Reusable Widgets
- [x] Implementasi `lib/core/constants/app_colors.dart` (Wabi-Sabi Sanctuary Design Tokens).
- [x] Implementasi `lib/core/validator/validator.dart` (Format Email / WA Indonesia + Password).
- [x] Komponen `AppCardPayment` (`lib/core/widget/card/app_card_Payment.dart`).
- [x] Komponen `AppTextField` (`lib/core/widget/text_field/app_text_field.dart`).
- [x] Komponen `AppPill` badge & `AppFooter` branding.

### 1.3 Networking & Token Interceptor (Dio Layer)
- [ ] Implementasi `lib/core/network/api_endpoints.dart` (Base URL: `https://oskost.vercel.app/api/v1`).
- [ ] Implementasi `lib/core/network/dio_client.dart` dengan timeout 15 detik dan logging.
- [ ] Implementasi `lib/core/network/interceptors/auth_interceptor.dart`:
  - [ ] Auto inject `Authorization: Bearer <accessToken>` pada setiap request.
  - [ ] Catch `401 Unauthorized` → Memicu refresh token otomatis ke `POST /api/v1/auth/refresh`.
  - [ ] Mutex Lock saat refresh token berlangsung agar tidak terjadi multiple refresh bersamaan.
  - [ ] Logout & clear storage jika refresh token sudah kedaluwarsa/revoked.

### 1.4 Auth Feature (`lib/features/auth/`)
- [x] Slicing UI `LoginScreen` (`/loginOskost`) dengan tombol toggle visibility password.
- [x] Slicing UI `ForgotPasswordScreen` (`/forgot-password`).
- [x] Slicing UI `ForceResetPasswordScreen` (`/force-reset`).
- [ ] Integrasi API `POST /api/v1/auth/token` (Login email/phone + password).
- [ ] Simpan `accessToken` & `refreshToken` ke `FlutterSecureStorage` secara aman.
- [ ] Integrasi API `POST /api/v1/auth/logout` (Revoke refresh token di server & hapus local storage).

---

## FASE 2: Personal Dashboard & Profile Module
**Target**: Menampilkan informasi kamar, status kontrak aktif, dan pengelolaan akun penghuni.

### 2.1 Home Feature (`lib/features/home/`)
- [x] Slicing UI `HomePage` (`/home`) dengan Wabi-Sabi header & sapaan editorial (Noto Serif).
- [x] Widget `TenantGreeting` dengan badge nomor kamar (contoh: *Kamar 005*).
- [x] Widget `LeaseStatusCard` (Sisa hari sewa & periode kontrak).
- [x] Widget `DueBillingWidget` (Status tagihan bulan berjalan: Lunas / Belum Lunas).
- [x] Widget `QuickActionShortcuts` (Akses cepat ke Bayar, Lapor, dan Bantuan).
- [ ] Integrasi API `GET /api/v1/me` (Fetch profil user, lease aktif, kamar, dan invoice terbaru).

### 2.2 Profile Feature (`lib/features/profile/`)
- [x] Slicing UI `ProfileScreen` (`/profile`).
- [x] Slicing UI `ChangePasswordScreen` (`/profile/change-password`).
- [ ] Integrasi data profil dari `GET /api/v1/me` (Nama lengkap, No KTP, Kontak darurat).
- [ ] Integrasi fitur Ganti Password via API `PUT /api/v1/me/password`.
- [ ] Fitur Logout: Hapus `FlutterSecureStorage`, bersihkan database `Drift`, dan redirect ke `/loginOskost`.
- [ ] Dukungan **Alumni Mode** (Mantan penyewa yang checkout tetap bisa login dalam mode Read-Only).

---

## FASE 3: Billing & Payment Gateway Module (Midtrans Snap)
**Target**: Transparansi rincian tagihan dan proses pembayaran online via Midtrans WebView.

### 3.1 Billing Feature (`lib/features/billing/`)
- [x] Slicing UI `InvoicesScreen` (`/invoices`) dengan tab filter (Semua, Belum Bayar, Lunas).
- [x] Slicing UI `InvoiceDetailScreen` (`/invoices/:id`) rincian sewa, listrik, dan biaya admin.
- [x] Slicing UI `InvoicePayScreen` (`/invoices/:id/pay`) integrasi `webview_flutter`.
- [x] Slicing UI `PaymentFinishScreen` (`/payment-finish`) pasca pembayaran Midtrans.
- [ ] Integrasi API `GET /api/v1/invoices` (Fetch daftar tagihan tenant + pagination).
- [ ] Integrasi API `GET /api/v1/invoices/:id` (Fetch detail tagihan).
- [ ] Integrasi API `POST /api/v1/invoices/:id/snap`:
  - [ ] Mengirimkan request Snap Token & `paymentUrl` ke Backend.
  - [ ] Backend memproses kalkulasi split-fee admin server-side.
- [ ] WebView Navigation Interceptor (`webview_flutter`):
  - [ ] Deteksi URL redirect callback Midtrans (`finish_url`, `pending_url`, `cancel_url`).
  - [ ] Redirect otomatis ke `PaymentFinishScreen` saat pembayaran selesai/pending.
  - [ ] Penanganan deep-link `oskost://payment-finish`.

---

## FASE 4: Maintenance Ticket & Photo Upload Module (Report)
**Target**: Pelaporan kerusakan fasilitas kost dengan bukti foto terkompresi.

### 4.1 Report Feature (`lib/features/report/`)
- [x] Slicing UI `ReportsScreen` (`/reports`) dengan list tiket & status badge (OPEN / RESOLVED).
- [x] Slicing UI `ReportNewScreen` (`/reports/new`) form judul, deskripsi, & picker foto.
- [x] Slicing UI `ReportDetailScreen` (`/reports/:id`) detail penanganan & catatan perbaikan.
- [x] Implementasi 15 sub-widget khusus laporan kerusakan (`AttachmentPhotoFrame`, dll).
- [ ] Integrasi `image_picker` untuk mengambil foto dari Kamera / Galeri.
- [ ] Implementasi kompresi foto client-side (`flutter_image_compress`):
  - [ ] Konversi otomatis gambar ke format **WebP**.
  - [ ] Batasi ukuran berkas maksimal **500KB** sebelum di-upload.
- [ ] Integrasi Alur Upload Gambar Supabase Signed URL:
  1. Request Signed URL ke Backend: `POST /api/v1/reports/upload-url`.
  2. Upload file binary WebP langsung ke Supabase Storage via HTTP `PUT`.
  3. Kirim payload laporan beserta URL gambar ke `POST /api/v1/reports`.
- [ ] Integrasi API `GET /api/v1/reports` & `GET /api/v1/reports/:id`.

---

## FASE 5: Offline Sync & Push Notifications (FCM)
**Target**: Keandalan aplikasi di area sinyal lemah dan notifikasi real-time.

### 5.1 Local Storage & Offline Cache (`Drift`)
- [ ] Konfigurasi `Drift` SQLite schema di `lib/core/storage/drift_database.dart`.
- [ ] Buat tabel lokal `CachedInvoices` dan `CachedReports`.
- [ ] Implementasi repository pattern offline-first:
  - [ ] Tampilkan data lokal dari `Drift` jika koneksi terputus.
  - [ ] Deteksi koneksi via `connectivity_plus` untuk auto-sync saat online kembali.

### 5.2 Firebase Cloud Messaging (FCM)
- [ ] Setup Firebase Project & `google-services.json` (Android) / `GoogleService-Info.plist` (iOS).
- [ ] Implementasi `lib/core/network/fcm_service.dart`:
  - [ ] Request izin notifikasi pada Android 13+ & iOS.
  - [ ] Ambil FCM Device Token dan daftarkan ke Backend: `POST /api/v1/push/subscriptions`.
  - [ ] Setup Notification Channel Android (`tagihan_channel` & `pengumuman_channel`).
  - [ ] Handle notification click event:
    - [ ] Tagihan → Navigate ke `/invoices/:id`.
    - [ ] Laporan → Navigate ke `/reports/:id`.

---

## FASE 6: Hardening, Testing, & Production Release
**Target**: Memastikan stabilitas, performa, dan kesiapan rilis di Google Play Store / App Store.

### 6.1 Code Audit & Performance Testing
- [ ] Jalankan `flutter analyze` — Wajib **0 errors & 0 warnings**.
- [ ] Audit kebocoran memori pada widget gambar dan controller Dio.
- [ ] Verifikasi penggunaan `const` constructor di seluruh widget tree.
- [ ] Verifikasi performa rendering minimal 60 FPS pada Android RAM 3GB/4GB.

### 6.2 Testing Suite
- [ ] Unit Test untuk `Validator` (`test/core/validator_test.dart`).
- [ ] Unit Test untuk `AuthInterceptor` (`test/core/network/auth_interceptor_test.dart`).
- [ ] Widget Test untuk komponen Wabi-Sabi UI (`test/widget/app_card_payment_test.dart`).
- [ ] Integration Test alur Login → Dashboard → Bayar Tagihan (`test/integration/app_flow_test.dart`).

---

## 📅 Log Daily Progress Updates (AI Agent)

| Tanggal | Fitur / Task | Status | Ringkasan Perubahan & File Terkait |
| :--- | :--- | :---: | :--- |
| **2026-09-18** | Slicing UI & Router Setup | `[x]` | Selesai slicing UI Flutter (Auth, Home, Billing, Report, Profile) & Wabi-Sabi theme (`lib/core/constants/app_colors.dart`). |
| *YYYY-MM-DD* | *Nama Fitur* | `[ ]` | *Catatan perubahan file oleh AI Agent...* |
