### Master Engineering Specification OsKost v2.0: Unified Architecture & Development Rules

#### 1\. Visi Strategis & Topografi Sistem (Decoupled Centralized Architecture)

Transisi menuju OsKost v2.0 adalah reposisi strategis untuk mengubah sistem manajemen properti dari solusi PWA monolitik menjadi arsitektur  *enterprise-grade*  yang  *decoupled* . Pemisahan total antara  **Web Admin (Next.js 16\)**  dan  **Mobile Tenant (Flutter)**  dilakukan untuk memitigasi keterbatasan performa perangkat  *entry-level*  penyewa dan memastikan skalabilitas operasional 11 pintu kost. Dengan arsitektur ini, Next.js API Routes berfungsi sebagai  *Single Source of Truth* , memungkinkan Owner mengelola data finansial secara presisi melalui dashboard desktop, sementara penyewa mendapatkan pengalaman "Sanctuary" yang  *native*  dan reliabel.

##### Topografi Sistem OsKost v2.0

Sistem ini mengadopsi model  *Stateless API-First* . Seluruh rute PWA Tenant lama pada Next.js akan di- *sunset*  (dihapus) untuk menghilangkan duplikasi pemeliharaan.

\+-----------------------------------+       \+-----------------------------------+

|      WEB 2.0 (NEXT.JS 16\)         |       |      MOBILE APP (FLUTTER)         |

| (Marketing, Admin, 360 Viewer)    |       |  (Tenant Sanctuary, FCM, Isar)    |

\+-----------------+-----------------+       \+-----------------+-----------------+

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|                                           |

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| HTTPS REST API (NextAuth Cookie)          | HTTPS REST API (JWT Bearer)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|                                           |

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;v                                           v

\+-------------------------------------------------------------------------------+

|                         BACKEND API (NEXT.JS /api/v1/\*)                       |

|           (Prisma 7 | Zod v4 | Midtrans Webhooks | Push Service)              |

\+---------------------------------------+---------------------------------------+

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\+--------------------------+--------------------------+

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|                          |                          |

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;v                          v                          v

\+------------------------+  \+-------------------------+  \+-------------------------+

|     POSTGRESQL DB      |  |    SUPABASE STORAGE     |  |    MIDTRANS PAYMENT     |

|   (Single Truth DB)    |  | \[Private\]: KTP Docs     |  | \[Unique Code: Room ID\]  |

|  (Max Connection: 10\)  |  | \[Public\]: 360 & Assets  |  | \[Split Fee 50/50\]       |

\+------------------------+  \+-------------------------+  \+-------------------------+

&nbsp;

##### Analisis Dampak "Backend-for-Frontend"

Pendekatan ini mengisolasi logika bisnis inti dari fluktuasi  *layer*  presentasi. Dengan memusatkan validasi dan kalkulasi finansial di API v1/\*, kita memitigasi risiko  *technical debt*  saat melakukan iterasi fitur. Penggunaan  *envelope*  respons yang terstandarisasi menjamin kecepatan integrasi bagi pengembang tunggal maupun agen AI, memastikan integritas sistem tetap terjaga meski skema database berkembang untuk mendukung strategi "Alumni".

#### 2\. Arsitektur Database & Skema Prisma v7

Database adalah fondasi dari strategi "Alumni" OsKost. Kita membangun repositori data jangka panjang di mana identitas penyewa tetap terjaga meskipun masa sewa telah berakhir. Integritas data pada 11 pintu ini krusial untuk otomatisasi rekonsiliasi keuangan dan fitur  *1-click check-in* .

##### Skema Prisma v7 (Enterprise-Ready)

enum Role { ADMIN; TENANT }

enum RoomStatus { AVAILABLE; OCCUPIED; MAINTENANCE }

enum LeaseStatus { ACTIVE; COMPLETED; TERMINATED }

enum InvoiceStatus { UNPAID; PENDING; PAID; OVERDUE; EXPIRED; CANCELLED }

enum ReportStatus { OPEN; IN\_PROGRESS; RESOLVED }

&nbsp;

model User {

&nbsp;&nbsp;id                String             @id @default(cuid())

&nbsp;&nbsp;email             String?            @unique

&nbsp;&nbsp;phoneNumber       String?            @unique

&nbsp;&nbsp;passwordHash      String

&nbsp;&nbsp;role              Role               @default(TENANT)

&nbsp;&nbsp;profile           TenantProfile?

&nbsp;&nbsp;leases            Lease\[\]

&nbsp;&nbsp;refreshTokens     RefreshToken\[\]

&nbsp;&nbsp;pushSubscriptions PushSubscription\[\]

}

&nbsp;

model TenantProfile {

&nbsp;&nbsp;userId               String @unique

&nbsp;&nbsp;fullName             String

&nbsp;&nbsp;ktpNumber            String

&nbsp;&nbsp;address              String

&nbsp;&nbsp;emergencyContactName String

&nbsp;&nbsp;emergencyContactNo   String

&nbsp;&nbsp;user                 User   @relation(fields: \[userId\], references: \[id\])

}

&nbsp;

model Property {

&nbsp;&nbsp;id       String @id @default(cuid())

&nbsp;&nbsp;name     String

&nbsp;&nbsp;address  String

&nbsp;&nbsp;mapsLink String?

&nbsp;&nbsp;rooms    Room\[\]

}

&nbsp;

model Room {

&nbsp;&nbsp;id             String      @id @default(cuid())

&nbsp;&nbsp;number         String      @unique // E.g., "12"

&nbsp;&nbsp;price          Int

&nbsp;&nbsp;status         RoomStatus  @default(AVAILABLE)

&nbsp;&nbsp;panoramaConfig Json?       // Metadata for Photo Sphere Viewer

&nbsp;&nbsp;propertyId     String

&nbsp;&nbsp;property       Property    @relation(fields: \[propertyId\], references: \[id\])

&nbsp;&nbsp;leases         Lease\[\]

}

&nbsp;

model Lease {

&nbsp;&nbsp;id        String      @id @default(cuid())

&nbsp;&nbsp;userId    String

&nbsp;&nbsp;roomId    String

&nbsp;&nbsp;startDate DateTime

&nbsp;&nbsp;endDate   DateTime

&nbsp;&nbsp;status    LeaseStatus @default(ACTIVE)

&nbsp;&nbsp;user      User        @relation(fields: \[userId\], references: \[id\])

&nbsp;&nbsp;room      Room        @relation(fields: \[roomId\], references: \[id\])

&nbsp;&nbsp;invoices  Invoice\[\]

&nbsp;&nbsp;reports   Report\[\]

}

&nbsp;

model Invoice {

&nbsp;&nbsp;id             String        @id @default(cuid())

&nbsp;&nbsp;externalId     String        @unique // INV-{leaseId}-{YYYY-MM}

&nbsp;&nbsp;rentAmount     Int

&nbsp;&nbsp;utilityAmount  Int           @default(0)

&nbsp;&nbsp;adminFee       Int           @default(4000) // Default VA Fee

&nbsp;&nbsp;totalAmount    Int           // (rent \+ utility \+ (adminFee / 2))

&nbsp;&nbsp;status         InvoiceStatus @default(UNPAID)

&nbsp;&nbsp;leaseId        String

&nbsp;&nbsp;lease          Lease         @relation(fields: \[leaseId\], references: \[id\])

&nbsp;&nbsp;discountClaims DiscountClaim\[\]

}

&nbsp;

model RefreshToken {

&nbsp;&nbsp;id        String   @id @default(cuid())

&nbsp;&nbsp;tokenHash String

&nbsp;&nbsp;userId    String

&nbsp;&nbsp;expiresAt DateTime

&nbsp;&nbsp;revokedAt DateTime?

&nbsp;&nbsp;user      User     @relation(fields: \[userId\], references: \[id\])

}

&nbsp;

model DiscountClaim {

&nbsp;&nbsp;id        String @id @default(cuid())

&nbsp;&nbsp;invoiceId String

&nbsp;&nbsp;type      String // e.g., "GOOGLE\_REVIEW"

&nbsp;&nbsp;proofUrl  String

&nbsp;&nbsp;status    String // PENDING, APPROVED, REJECTED

&nbsp;&nbsp;invoice   Invoice @relation(fields: \[invoiceId\], references: \[id\])

}

&nbsp;

model Report {

&nbsp;&nbsp;id          String       @id @default(cuid())

&nbsp;&nbsp;title       String

&nbsp;&nbsp;description String

&nbsp;&nbsp;status      ReportStatus @default(OPEN)

&nbsp;&nbsp;photos      String\[\]     // Array of Supabase URLs

&nbsp;&nbsp;leaseId     String

&nbsp;&nbsp;lease       Lease         @relation(fields: \[leaseId\], references: \[id\])

}

&nbsp;

##### Aturan Bisnis & Idempotensi

* **Unique Payment Code (Physical Verification):**  Setiap tagihan nominal transfer wajib ditambahkan 3 digit terakhir dari  **Room Number**  (Contoh: Kamar 12, Tagihan Rp1.000.000 \-\> Rp1.000.012). Ini memudahkan Owner melakukan verifikasi mutasi bank secara visual.  
* **Idempotency:**  Kolom externalId dengan format INV-{leaseId}-{YYYY-MM} wajib unik di level database untuk mencegah penagihan ganda pada bulan yang sama.  
* **Split Fee Logic:**  Biaya admin Virtual Account (misal Rp4.000) dibagi 50/50 antara Owner dan Tenant untuk menjaga psikologi transaksi pengguna.

##### Analisis Strategi "Alumni"

Relasi  *One-to-Many*  antara User dan Lease memungkinkan sistem menyimpan profil permanen. Saat penyewa kembali, sistem melakukan  *lookup*  pada TenantProfile yang sudah ada, memicu alur  *1-click check-in* . Hal ini mengurangi friksi administrasi dan memperkuat retensi penyewa dalam ekosistem OsKost.

#### 3\. Kontrak Backend API & Protokol Autentikasi Ganda

API OsKost v2.0 dirancang sebagai layanan  *stateless*  terpusat yang melayani Web Admin dan Mobile App dengan protokol keamanan yang berbeda namun terintegrasi.

##### Matriks Autentikasi

Dimensi,Web Admin (NextAuth v5),Mobile Tenant (JWT Bearer)

Mekanisme,Cookie-based (HttpOnly),JWT \+ Refresh Token Rotation

Durasi Sesi,365 Hari (Persisten),15 Menit (Access) / 30 Hari (Refresh)

Penyimpanan,Server-side Session,flutter\_secure\_storage

Security,CSRF Protection,JWT Revocation List

##### Spesifikasi Endpoint (/api/v1/\*)

Seluruh respons wajib menggunakan  *standard envelope* : { data: T, meta: { timestamp, requestId }, error: { code, message } }.

* **Auth:**  POST /auth/token (Login), POST /auth/refresh (Rotasi Token).  
* **Me:**  GET /me (Profil & Kontrak Aktif).  
* **Billing:**  GET /invoices (Daftar Tagihan), POST /invoices/:id/snap (Get Midtrans Token dengan kalkulasi  *unique code*  berbasis Room ID).  
* **Reports:**  POST /reports (Submit Keluhan), POST /reports/:id/photos (Signed URL untuk upload langsung ke Supabase Private Bucket).**Analisis:**  Pemisahan ini memungkinkan Owner tetap login secara persisten di desktop untuk pantauan cepat, sementara aplikasi mobile menerapkan rotasi token yang ketat untuk mengamankan data di perangkat yang berpindah-pindah jaringan.

#### 4\. Rekayasa Web Next.js 16 (Admin & Marketing)

Fokus utama  *layer*  web adalah produktivitas Admin dan optimasi SEO Landing Page menggunakan  **Tailwind CSS v4**  dan  **React 19** .

##### Arsitektur: Feature-Sliced Design (FSD)

Struktur di src/features/ mengisolasi domain bisnis:

* **services/** : Operasi Prisma murni dengan anotasi server-only.  
* **actions.ts** : Titik masuk mutasi data. Wajib memanggil revalidateTag dari lib/cache-tags.ts.  
* **components/** : UI spesifik fitur (e.g., Room360Viewer menggunakan @photo-sphere-viewer/core).

##### Kebijakan Caching & Kompresi

* **Caching:**  Gunakan unstable\_cache untuk data fetching. Tag harus sentral di src/lib/cache-tags.ts.  
* **Kompresi Gambar:**  Setiap upload dari Web wajib dikompresi menggunakan browser-image-compression menjadi format  **WebP ≤ 500KB** .  
* **Performance:**  Minimalisir "use client" untuk mencapai FCP \< 1.5s.**Analisis:**  Penggunaan Server Components secara default memastikan  *bundle size*  minimal, memberikan kesan aplikasi instan bagi Owner yang sering mengakses dashboard melalui jaringan seluler saat di lapangan.

#### 5\. Arsitektur Mobile Flutter (Tenant Sanctuary)

Aplikasi mobile adalah ruang digital tenang (Sanctuary) bagi penghuni, dibangun dengan pola  *Feature-First*  untuk enkapsulasi domain yang bersih.

##### Tech Stack Mobile

Teknologi,Kegunaan

Dio \+ Retrofit,HTTP Client dengan JWT Interceptor & Refresh logic.

Riverpod,State management reaktif untuk sinkronisasi data instan.

Drift (SQLite),Sinkronisasi data  offline-first  untuk akses tagihan tanpa sinyal.

firebase\_messaging,Push notifications (FCM) untuk pengingat tagihan.

webview\_flutter,Integrasi Midtrans Snap untuk pembayaran dalam aplikasi.

##### Data Flow & Optimasi Native

Alur data mengikuti:  **UI → Provider → Repository → DataSource** .  **Aturan Kompresi:**  Wajib menggunakan flutter\_image\_compress untuk mengubah foto laporan menjadi  **WebP ≤ 500KB**  di sisi klien sebelum dikirim ke Supabase Private Bucket via Signed URL.**Analisis:**  Strategi  *offline-first*  menggunakan Drift memberikan rasa aman. Penyewa dapat membuka bukti lunas atau detail laporan kerusakan kapan saja, bahkan saat berada di dalam area pabrik dengan sinyal terbatas.

#### 6\. Sistem Desain: "Wabi-Sabi Sanctuary"

Desain ini bertujuan memanusiakan aplikasi manajemen, mengubahnya dari alat transaksi yang dingin menjadi ruang yang hangat dan tenang.

##### Design Tokens

Kategori,Nama,Kode Hex,Filosofi Psikologis

Surface,Canvas,\#F7F4EE,Menghindari putih murni untuk mengurangi  eye strain .

Text,Sumi Ink,\#2B2927,Hitam arang yang lebih lembut dibanding hitam murni.

Primary,Terracotta,\#8C6239,Warna tanah liat yang membangkitkan rasa stabil/aman.

Success,Koke Moss,\#5D6654,Hijau lumut tenang untuk status lunas.

##### Layout & Komponen

* **Ma (Negative Space):**  Menggunakan spasi 32px antar seksi. Hal ini bukan pemborosan ruang, melainkan "Ma" untuk menurunkan beban kognitif pekerja pabrik setelah jadwal kerja yang padat.  
* **The Whisper Border:**  Border tipis rgba(43, 41, 39, 0.07) memberikan definisi struktur tanpa kebisingan visual.  
* **360° Integration:**  Integrasi @photo-sphere-viewer/core pada detail kamar memberikan transparansi penuh bagi calon penyewa, mengurangi beban survei fisik.

#### 7\. Matriks Aturan AI Agent & Protokol Eksekusi

Dokumen ini adalah  *ground truth*  absolut bagi AI (Cursor/Claude). AI wajib mengikuti protokol ini untuk menjaga integritas arsitektural.

##### Protokol MCP Tools

Sebelum melakukan modifikasi file, AI Agent  **WAJIB**  menjalankan code-review-graph dengan langkah:

1. **get\_impact\_radius** : Menganalisis seberapa jauh dampak perubahan pada modul Billing/Invoice.  
2. **get\_affected\_flows** : Memastikan alur validasi unik (Unique Code) tidak terputus.

##### Matriks Anti-Halusinasi (Don'ts)

Larangan (Don'ts),Konsekuensi

Membuat  cache tags  ad-hoc.,Inkoherensi data antara Admin dan Tenant.

Melewati validasi Zod di  service layer .,Kerusakan integritas database (Data kotor).

Menggunakan force-dynamic tanpa izin.,Penurunan drastis performa SSR dan efisiensi Vercel.

Menggunakan warna murni (\#000 atau \#FFF).,"Melanggar filosofi visual ""Wabi-Sabi Sanctuary""."

##### Protokol Konklusi

Setiap fitur yang selesai wajib ditandai x pada milestone.md. Setiap keputusan arsitektural yang diambil oleh AI di luar dokumen ini wajib dicatat secara detail dalam AI-Decisions.md untuk proses audit teknis di masa depan. Kepatuhan terhadap protokol ini menjamin sistem dual-platform tetap sinkron dan stabil di bawah kendali pengembang tunggal.

&nbsp;