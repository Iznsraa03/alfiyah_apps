# LAPORAN PROJECT ALFIYAH APPS

## 📋 Ringkasan

**Alfiyah Apps** adalah aplikasi mobile Flutter untuk booking layanan make up & fotografi. Aplikasi dibangun dengan GetX modular (bindings, controllers, views) serta integrasi REST API untuk autentikasi, paket layanan, booking, dan segmentasi.

---

## 🎯 Tujuan

1. Digitalisasi proses booking layanan.
2. Memudahkan pengguna melihat layanan dan melakukan booking.
3. Memberikan akses admin untuk mengelola booking dan data segmentasi.

---

## 🧰 Teknologi

- **Framework**: Flutter
- **Language**: Dart
- **State Management**: GetX (Obx, Bindings, GetPage)
- **HTTP Client**: `http`
- **Local Storage**: `shared_preferences`
- **UI Utils**: `flutter_svg`, `gap`, `device_preview`
- **Routing**: GetX named routes

**App Colors**:
- Primary: `#F875AA`
- Secondary: `#FBACCC`
- Surface: `#F1D1D0`
- Background: `#F4F9F9`

---

## 🏗️ Arsitektur

Struktur modular GetX:

```
lib/
  app/
    modules/
      <feature>/{bindings, controllers, views}
    components/
    data/services/
    routes/
    Utils/
```

---

## 🔌 Integrasi API (Configured)

Base URL: `http://localhost:8000`

Endpoints utama:
- `POST /auth/login`
- `POST /auth/register`
- `GET /auth/me` (profile)
- `PATCH /auth/me` (update profile)
- `GET /services/packages`
- `GET /bookings/` (admin)
- `GET /bookings/me`
- `POST /bookings/`
- `PATCH /bookings/{id}`
- `GET /segments/`

---

## ✅ Fitur Customer

1. **Welcome & Auth**
   - Login
   - Register
   - Session tersimpan di local storage

2. **Dashboard**
   - Tab Home, Services, Booking

3. **Home**
   - Quick access ke Booking/Services/Profile
   - Search untuk quick access

4. **Services**
   - List paket layanan (dari API)
   - Search by nama/deskripsi

5. **Service Detail & Booking**
   - Pilih tanggal acara
   - Input jumlah client
   - Buat booking ke API

6. **Booking**
   - List booking user (dari API)

7. **Profile & Edit Profile**
   - Lihat data user
   - Update profile via API

---

## ✅ Fitur Admin

1. **Admin Home**
   - List semua booking
   - Filter by priority segment / vip / all
   - Statistik ringkas (total, high/medium/low, vip, pending)

2. **Admin Booking Detail**
   - Detail booking + user info
   - Update status booking

3. **Admin Segments**
   - List segmentasi dari API

4. **Admin Services (Local Data)**
   - Add package & service type (masih local, ada TODO API)

---

## 🧩 Komponen Reusable

- `bookingCard`
- `mainCard`
- `priorityBadge`
- `quickAccessCard`
- `servicePackageCard`
- `serviceTypeCard`

---

## 📈 Status Implementasi

**Selesai & berjalan:**
- Auth flow (login/register)
- Services list
- Booking create & list
- Profile & update profile
- Admin booking list + detail + update status
- Segments list
- Dashboard tab

**Catatan:**
- Admin Services masih menggunakan data lokal (belum call API).

---

## 📝 Penutup

Project telah mengimplementasikan alur utama booking berbasis GetX dan REST API dengan struktur modular. Fitur customer dan admin sudah tersedia, dengan catatan pengelolaan layanan oleh admin masih perlu integrasi API agar full end-to-end.

---

<div align="center">
  <p><strong>Laporan Project Alfiyah Apps</strong></p>
  <p>Dibuat dengan Flutter & GetX</p>
  <p>© 2026</p>
</div>
