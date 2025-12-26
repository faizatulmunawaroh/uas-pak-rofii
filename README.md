# CeLOE - Learning Management System

Aplikasi Learning Management System (LMS) berbasis Flutter untuk Telkom University.

## 📱 Fitur Utama

### Halaman Utama
- ✅ **Splash Screen** - Tampilan awal dengan logo CeLOE
- ✅ **Login** - Autentikasi dengan validasi form lengkap
- ✅ **Home Dashboard** - Ringkasan tugas, pengumuman, dan progress kelas
- ✅ **Kelas Saya** - Daftar semua mata kuliah dengan search
- ✅ **Notifikasi** - Notifikasi interaktif dengan mark as read & delete
- ✅ **Profile** - Informasi mahasiswa dan logout

### Halaman Detail
- ✅ **Detail Kelas** - Modul pembelajaran, progress, dan daftar tugas
- ✅ **Detail Tugas** - Deskripsi lengkap, deadline, dan form upload
- ✅ **Pengumuman** - Daftar pengumuman dengan filter kategori
- ✅ **Bantuan** - FAQ, kontak support, dan tutorial

### Fitur Teknis
- ✅ **State Management** - Provider untuk reactive state
- ✅ **Form Validation** - Validasi email dan password
- ✅ **Persistence** - SharedPreferences untuk menyimpan session
- ✅ **Interactive UI** - Tap, swipe, dan navigasi lengkap
- ✅ **Responsive Design** - UI yang menarik dan modern

## 🚀 Teknologi

- **Framework**: Flutter 3.9+
- **State Management**: Provider ^6.1.1
- **Local Storage**: SharedPreferences ^2.2.2
- **Date Formatting**: Intl ^0.19.0
- **Fonts**: Google Fonts ^6.3.3

## 📦 Instalasi

1. Clone repository:
```bash
git clone https://github.com/faizatulmunawaroh/uas-pak-rofii.git
cd celoe
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run aplikasi:
```bash
flutter run
```

## 🏗️ Build

### Web Build
```bash
flutter build web --release
```

### Android Build
```bash
flutter build apk --release
```

### iOS Build
```bash
flutter build ios --release
```

## 📖 Dokumentasi

- [Implementation Plan](C:\Users\USER\.gemini\antigravity\brain\f3da65b1-37fa-4daf-a8f4-72004ecb058f\implementation_plan.md) - Rencana implementasi lengkap
- [Walkthrough](C:\Users\USER\.gemini\antigravity\brain\f3da65b1-37fa-4daf-a8f4-72004ecb058f\walkthrough.md) - Dokumentasi semua fitur
- [Task List](C:\Users\USER\.gemini\antigravity\brain\f3da65b1-37fa-4daf-a8f4-72004ecb058f\task.md) - Task breakdown dan progress

## 📁 Struktur Proyek

```
lib/
├── main.dart                 # Entry point aplikasi
├── theme.dart               # Theme dan styling
├── models/                  # Data models
│   ├── assignment.dart
│   ├── course.dart
│   ├── module.dart
│   ├── notification_model.dart
│   └── announcement.dart
├── providers/               # State management
│   └── app_state.dart
└── screens/                 # UI screens
    ├── splash_screen.dart
    ├── login_screen.dart
    ├── home_screen.dart
    ├── my_classes_screen.dart
    ├── notification_screen.dart
    ├── profile_screen.dart
    ├── course_detail_screen.dart
    ├── assignment_detail_screen.dart
    ├── announcements_screen.dart
    └── help_screen.dart
```

## 🎨 Screenshots

### Login & Home
- Login dengan validasi form
- Dashboard dengan tugas dan pengumuman
- Progress kelas

### Detail Pages
- Detail kelas dengan modul pembelajaran
- Detail tugas dengan form upload
- Pengumuman dengan filter kategori

### Interactive Features
- Notifikasi dengan tap to mark as read
- Swipe to delete notifikasi
- Search dan filter kelas

## 🔐 Login Credentials

Untuk testing, gunakan email dan password apapun dengan minimal:
- Email harus mengandung '@'
- Password minimal 6 karakter

## 👥 Author

**Faizatul Munawaroh**
- NIM: 6701213031
- Program Studi: D3 Sistem Informasi Akuntansi
- Fakultas: Ilmu Terapan

## 📝 License

Project ini dibuat untuk keperluan UAS.

## 🙏 Acknowledgments

- Telkom University
- Flutter Team
- Provider Package Contributors
