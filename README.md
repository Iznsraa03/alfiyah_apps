<div align="center">
  <h1>✨ Alfiyah Apps</h1>
  <p><strong>Beautiful Makeup & Photography Booking Management System</strong></p>
  
  <p>
    <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
    <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" />
    <img src="https://img.shields.io/badge/GetX-8A2BE2?style=for-the-badge" alt="GetX" />
  </p>
</div>

---

## 📱 About The Project

**Alfiyah Apps** adalah aplikasi mobile untuk manajemen booking layanan makeup dan fotografi profesional. Aplikasi ini menyediakan platform lengkap untuk customer booking layanan dan admin mengelola pesanan dengan sistem prioritas berbasis RFM (Recency, Frequency, Monetary) Analysis.

### ✨ Key Features

#### 🎨 **Customer Features**
- 🔐 **Authentication** - Login & Register dengan JWT Token
- 📦 **Service Catalog** - Browse paket makeup & fotografi (Party, Wisuda, Lamaran, Wedding)
- 🔍 **Smart Search** - Cari layanan berdasarkan nama atau deskripsi
- 📋 **Service Detail** - Info lengkap layanan dengan harga dan deskripsi
- 📅 **Easy Booking** - Pilih tanggal acara dan jumlah client
- 📊 **Booking History** - Lihat semua booking dengan status real-time
- 👤 **Profile Management** - Update data pribadi (nama, email, phone, alamat)

#### 🛡️ **Admin Features**
- 📈 **Dashboard** - Overview stats (Total, Pending, High Priority, VIP)
- 🎯 **Priority Management** - Sistem booking terurut by priority score (RFM-based)
- 🏷️ **Smart Filtering** - Filter by priority segment (High, Medium, Low, VIP)
- 📋 **Booking Detail** - Info lengkap customer & layanan
- ✅ **Status Management** - Update status booking (Pending → Confirmed → Completed)
- 🔖 **Priority Badges** - Visual indicators untuk urgency, monetary level, priority segment
- 🎨 **Service Management** - Kelola packages & service types

---

## 🏗️ Architecture

Project ini dibangun dengan **Clean Architecture** menggunakan **GetX** state management pattern.

```
lib/
├── app/
│   ├── components/          # Reusable UI widgets
│   │   ├── bookingCard.dart
│   │   ├── priorityBadge.dart
│   │   ├── quickAccessCard.dart
│   │   └── serviceTypeCard.dart
│   ├── data/
│   │   ├── models/          # Data models
│   │   └── services/        # API services
│   │       ├── api_config.dart
│   │       ├── auth_service.dart
│   │       ├── booking_service.dart
│   │       ├── service_service.dart
│   │       └── storage_service.dart
│   ├── modules/             # Feature modules (GetX MVC)
│   │   ├── admin_booking_detail/
│   │   ├── admin_home/
│   │   ├── admin_services/
│   │   ├── booking/
│   │   ├── dashboard/
│   │   ├── edit_profile/
│   │   ├── home/
│   │   ├── login/
│   │   ├── profile/
│   │   ├── register/
│   │   ├── service_detail/
│   │   ├── services/
│   │   └── welcome/
│   ├── routes/              # Navigation
│   │   ├── app_pages.dart
│   │   └── app_routes.dart
│   └── Utils/
│       └── app_colors.dart  # Design system colors
└── main.dart
```

### 🎯 GetX Pattern (MVC)
Setiap module mengikuti struktur:
- **Controller** - Business logic & state management
- **Binding** - Dependency injection
- **View** - UI layer (reactive dengan `Obx`)

---

## 🎨 Design System

### Color Palette
```dart
- Primary: Color(0xFF1D1B20)
- Secondary: Color(0xFFE6E0E9)
- Surface: Colors.white
- Background: Color(0xFFFFFBFF)
```

### UI/UX Principles
- ✅ **Clean & Modern** - Minimalist design dengan fokus content
- ✅ **Consistent Spacing** - Border radius 12-24px
- ✅ **Readable Typography** - Clear hierarchy dengan font weights
- ✅ **Smooth Interactions** - Material ripple effects
- ✅ **Responsive Layout** - Adaptive untuk berbagai screen sizes

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code
- Backend API running (check `API_Documentation.md`)

### Installation

1. **Clone repository**
```bash
git clone https://github.com/Iznsraa03/alfiyah_apps.git
cd alfiyah_apps
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Configure API Base URL**
Edit `lib/app/data/services/api_config.dart`:
```dart
static const String baseUrl = 'rahasia;
```

4. **Run the app**
```bash
flutter run
```

---

## 🔌 API Integration

Aplikasi ini terintegrasi dengan REST API backend. Dokumentasi lengkap ada di `API_Documentation.md`.

### Key Endpoints
- `POST /auth/login` - User authentication
- `POST /auth/register` - User registration
- `GET /auth/me` - Get current user
- `PATCH /auth/me` - Update profile
- `GET /services/packages` - Get all service packages
- `GET /bookings/me` - Get user bookings (customer)
- `GET /bookings/` - Get all bookings (admin)
- `POST /bookings/` - Create new booking
- `PATCH /bookings/{id}` - Update booking status (admin)

### Features
- 🔐 **JWT Authentication** - Token-based dengan auto-refresh
- 💾 **Local Storage** - Cache user data dengan `shared_preferences`
- 📝 **Comprehensive Logging** - Debug-friendly dengan `dart:developer`
- 🔄 **Auto Retry** - Handle network errors gracefully

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.7.3                 # State management & routing
  http: ^1.2.2                # HTTP client
  shared_preferences: ^2.3.3  # Local storage
  gap: ^3.0.1                 # Spacing widget
  flutter_svg: ^2.0.10+1      # SVG support
```

---

## 🎯 Key Features Implementation

### 🔐 Role-Based Access Control
```dart
// Auto routing based on user role
if (role == 'admin') {
  Get.offAllNamed(Routes.ADMIN_HOME);
} else {
  Get.offAllNamed(Routes.DASHBOARD);
}
```

### 🎨 Priority System (RFM-Based)
Backend menghitung priority score berdasarkan:
- **Recency** - Seberapa baru customer terakhir booking
- **Frequency** - Seberapa sering customer booking
- **Monetary** - Total nilai transaksi customer

Hasil:
- Priority Score (0-100)
- Priority Segment (high/medium/low)
- Urgency Level (urgent/soon/upcoming)
- Monetary Level (vip/premium/regular)

### 📱 Reactive UI dengan GetX
```dart
Obx(() => Text(controller.userName.value))
```

### 🔍 Smart Search & Filter
```dart
// Filter by search query
List<Map<String, dynamic>> get filteredPackages {
  final query = searchQuery.value.toLowerCase();
  return packages.where((p) => 
    p['name'].toLowerCase().contains(query)
  ).toList();
}
```

---

## 📸 Screenshots

> *Coming soon - Add your app screenshots here*

---

## 🧪 Testing

```bash
# Run tests
flutter test

# Run with coverage
flutter test --coverage
```

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Your Name**
- GitHub: [@Iznsraa03](https://github.com/Iznsraa03)
- Email: waisalqarni1712@gmail.com

---

## 🙏 Acknowledgments

- Flutter Team for the amazing framework
- GetX for powerful state management
- Backend API team for solid integration

---

<div align="center">
  <p>Made with ❤️ using Flutter</p>
  <p>⭐ Star this repo if you find it helpful!</p>
</div>
