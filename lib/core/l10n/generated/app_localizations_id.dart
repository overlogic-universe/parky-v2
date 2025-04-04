// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get loginGreetingTitle => 'Selamat Datang!';

  @override
  String get loginGreetingDesc => 'Masuk ke akun Anda yang telah terdaftar';

  @override
  String get email => 'Email';

  @override
  String get password => 'Kata Sandi';

  @override
  String get enterYourEmail => 'Masukkan email Anda';

  @override
  String get enterYourPassword => 'Masukkan kata sandi Anda';

  @override
  String get rememberMe => 'Ingat saya';

  @override
  String get forgotYourPassword => 'Lupa kata sandi?';

  @override
  String get loginWithStudentEmail => 'Masuk dengan email mahasiswa';

  @override
  String homeGreeting(Object time) {
    return 'Selamat $time,';
  }

  @override
  String get entryExitTime => 'Waktu Masuk/Keluar';

  @override
  String get nim => 'NIM';

  @override
  String get status => 'Status';

  @override
  String get plate => 'Plat';

  @override
  String get scanHere => 'PINDAI DI SINI';

  @override
  String get parking => 'Sedang parkir';

  @override
  String get parked => 'Keluar';

  @override
  String get setting => 'Pengaturan';

  @override
  String get settingDesc => 'Sesuaikan pengalamanmu dengan mudah! Pilih bahasa favorit dan atur tema sesuai kenyamananmu';

  @override
  String get account => 'Akun';

  @override
  String get updatePassword => 'Perbarui kata sandi';

  @override
  String get personalized => 'Personalisasi';

  @override
  String get chooseTheme => 'Pilih tema';

  @override
  String get chooseThemeDesc => 'Sesuaikan tampilan aplikasi dengan tema yang kamu suka!';

  @override
  String get chooseLanguage => 'Pilih bahasa';

  @override
  String get chooseLanguageDesc => 'Pilih bahasa yang paling nyaman untuk pengalaman terbaik';

  @override
  String get successChangeTheme => 'Berhasil mengganti tema';

  @override
  String get successChangeLanguage => 'Berhasil mengganti bahasa';

  @override
  String get mainTheme => 'Tema Utama';

  @override
  String get orbTheme => 'Tema Orb';

  @override
  String get indonesia => 'Bahasa Indonesia';

  @override
  String get english => 'English';

  @override
  String get noData => 'Belum ada data';

  @override
  String get login => 'Masuk';

  @override
  String get orLoginAs => 'Atau masuk sebagai';

  @override
  String get out => 'Keluar';

  @override
  String get logout => 'Keluar Akun';

  @override
  String get logoutModalDesc => 'Apakah Anda yakin ingin keluar?';

  @override
  String get loginSuccess => 'Berhasil masuk';

  @override
  String get logoutSuccess => 'Berhasil keluar';

  @override
  String mustNotBeEmpty(Object field) {
    return '$field tidak boleh kosong!';
  }

  @override
  String get mustUseStudentEmail => 'Gunakan email mahasiswa!';

  @override
  String atLeastLengthCharacters(Object field, Object length) {
    return '$field minimal $length karakter!';
  }

  @override
  String invalidFormat(Object field) {
    return '$field yang anda masukkan tidak valid!';
  }

  @override
  String get serverError => 'Kesalahan server';

  @override
  String get networkError => 'Jaringan tidak stabil';

  @override
  String get unknownError => 'Kesalahan tak terduga';

  @override
  String get userNotFound => 'Pengguna tidak ditemukan. Silakan coba lagi!';

  @override
  String get passwordIsNull => 'Kata sandi tidak boleh kosong';

  @override
  String get emailAlreadyRegistered => 'Email sudah terdaftar';

  @override
  String get loginWithGoogleAbortedByUser => 'Masuk dengan Google dibatalkan';

  @override
  String get loginWithGoogleFailed => 'Masuk dengan Google gagal';

  @override
  String get invalidCredentials => 'Email atau kata sandi salah';

  @override
  String get emailAlreadyExists => 'Email ini sudah digunakan';

  @override
  String get signOutFailed => 'Gagal keluar. Silakan coba lagi!';

  @override
  String get loginFailed => 'Gagal masuk. Silakan coba lagi!';

  @override
  String get getParkFailed => 'Gagal mendapatkan data parkir';

  @override
  String get getVehicleFailed => 'Gagal mendapatkan data kendaraan';

  @override
  String get loading => 'Memuat';

  @override
  String get and => 'dan';

  @override
  String get or => 'atau';

  @override
  String get confirm => 'Konfirmasi';

  @override
  String get save => 'Simpan';

  @override
  String get cancel => 'Batal';

  @override
  String get back => 'Kembali';

  @override
  String get start => 'Mulai';

  @override
  String get search => 'Cari';

  @override
  String get end => 'Akhiri';

  @override
  String get morning => 'Pagi';

  @override
  String get afternoon => 'Siang';

  @override
  String get evening => 'Sore';

  @override
  String get night => 'Malam';

  @override
  String get january => 'Januari';

  @override
  String get february => 'Februari';

  @override
  String get march => 'Maret';

  @override
  String get april => 'April';

  @override
  String get may => 'Mei';

  @override
  String get june => 'Juni';

  @override
  String get july => 'Juli';

  @override
  String get august => 'Agustus';

  @override
  String get september => 'September';

  @override
  String get october => 'Oktober';

  @override
  String get november => 'November';

  @override
  String get december => 'Desember';
}
