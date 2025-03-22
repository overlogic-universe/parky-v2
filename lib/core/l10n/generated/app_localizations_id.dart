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
  String mustNotBeEmpty(Object field) {
    return '$field tidak boleh kosong!';
  }

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
  String get unexpectedError => 'Kesalahan tak terduga';

  @override
  String get loginError => 'Login gagal. Mohon coba lagi!';

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
  String get start => 'Mulai';

  @override
  String get search => 'Cari';

  @override
  String get end => 'Akhiri';

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
