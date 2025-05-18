import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id')
  ];

  /// No description provided for @loginGreetingTitle.
  ///
  /// In id, this message translates to:
  /// **'Selamat Datang!'**
  String get loginGreetingTitle;

  /// No description provided for @loginGreetingDesc.
  ///
  /// In id, this message translates to:
  /// **'Masuk ke akun Anda yang telah terdaftar'**
  String get loginGreetingDesc;

  /// No description provided for @email.
  ///
  /// In id, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In id, this message translates to:
  /// **'Kata Sandi'**
  String get password;

  /// No description provided for @enterYourEmail.
  ///
  /// In id, this message translates to:
  /// **'Masukkan email Anda'**
  String get enterYourEmail;

  /// No description provided for @enterYourPassword.
  ///
  /// In id, this message translates to:
  /// **'Masukkan kata sandi Anda'**
  String get enterYourPassword;

  /// No description provided for @rememberMe.
  ///
  /// In id, this message translates to:
  /// **'Ingat saya'**
  String get rememberMe;

  /// No description provided for @forgotYourPassword.
  ///
  /// In id, this message translates to:
  /// **'Lupa kata sandi?'**
  String get forgotYourPassword;

  /// No description provided for @loginWithStudentEmail.
  ///
  /// In id, this message translates to:
  /// **'Masuk dengan email mahasiswa'**
  String get loginWithStudentEmail;

  /// No description provided for @homeGreeting.
  ///
  /// In id, this message translates to:
  /// **'Selamat {time},'**
  String homeGreeting(Object time);

  /// No description provided for @parkedDate.
  ///
  /// In id, this message translates to:
  /// **'Tanggal Masuk'**
  String get parkedDate;

  /// No description provided for @exitDate.
  ///
  /// In id, this message translates to:
  /// **'Tanggal Keluar'**
  String get exitDate;

  /// No description provided for @parkedTime.
  ///
  /// In id, this message translates to:
  /// **'Waktu Masuk'**
  String get parkedTime;

  /// No description provided for @exitTime.
  ///
  /// In id, this message translates to:
  /// **'Waktu Keluar'**
  String get exitTime;

  /// No description provided for @nim.
  ///
  /// In id, this message translates to:
  /// **'NIM'**
  String get nim;

  /// No description provided for @parkingLot.
  ///
  /// In id, this message translates to:
  /// **'Tempat Parkir'**
  String get parkingLot;

  /// No description provided for @status.
  ///
  /// In id, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @plate.
  ///
  /// In id, this message translates to:
  /// **'Plat'**
  String get plate;

  /// No description provided for @scanHere.
  ///
  /// In id, this message translates to:
  /// **'PINDAI DI SINI'**
  String get scanHere;

  /// No description provided for @parked.
  ///
  /// In id, this message translates to:
  /// **'Sedang Parkir'**
  String get parked;

  /// No description provided for @exited.
  ///
  /// In id, this message translates to:
  /// **'Keluar'**
  String get exited;

  /// No description provided for @parkingInfo.
  ///
  /// In id, this message translates to:
  /// **'Informasi Parkiran'**
  String get parkingInfo;

  /// No description provided for @full.
  ///
  /// In id, this message translates to:
  /// **'Penuh'**
  String get full;

  /// No description provided for @viewLocation.
  ///
  /// In id, this message translates to:
  /// **'Lihat Lokasi'**
  String get viewLocation;

  /// No description provided for @setting.
  ///
  /// In id, this message translates to:
  /// **'Pengaturan'**
  String get setting;

  /// No description provided for @settingDesc.
  ///
  /// In id, this message translates to:
  /// **'Sesuaikan pengalamanmu dengan mudah! Pilih bahasa favorit dan atur tema sesuai kenyamananmu'**
  String get settingDesc;

  /// No description provided for @account.
  ///
  /// In id, this message translates to:
  /// **'Akun'**
  String get account;

  /// No description provided for @updatePassword.
  ///
  /// In id, this message translates to:
  /// **'Perbarui kata sandi'**
  String get updatePassword;

  /// No description provided for @personalized.
  ///
  /// In id, this message translates to:
  /// **'Personalisasi'**
  String get personalized;

  /// No description provided for @authentication.
  ///
  /// In id, this message translates to:
  /// **'Autentikasi'**
  String get authentication;

  /// No description provided for @chooseTheme.
  ///
  /// In id, this message translates to:
  /// **'Pilih tema'**
  String get chooseTheme;

  /// No description provided for @chooseThemeDesc.
  ///
  /// In id, this message translates to:
  /// **'Sesuaikan tampilan aplikasi dengan tema yang kamu suka!'**
  String get chooseThemeDesc;

  /// No description provided for @chooseLanguage.
  ///
  /// In id, this message translates to:
  /// **'Pilih bahasa'**
  String get chooseLanguage;

  /// No description provided for @chooseLanguageDesc.
  ///
  /// In id, this message translates to:
  /// **'Pilih bahasa yang paling nyaman untuk pengalaman terbaik'**
  String get chooseLanguageDesc;

  /// No description provided for @successChangeTheme.
  ///
  /// In id, this message translates to:
  /// **'Berhasil mengganti tema'**
  String get successChangeTheme;

  /// No description provided for @successChangeLanguage.
  ///
  /// In id, this message translates to:
  /// **'Berhasil mengganti bahasa'**
  String get successChangeLanguage;

  /// No description provided for @mainTheme.
  ///
  /// In id, this message translates to:
  /// **'Tema Utama'**
  String get mainTheme;

  /// No description provided for @orbTheme.
  ///
  /// In id, this message translates to:
  /// **'Tema Orb'**
  String get orbTheme;

  /// No description provided for @indonesia.
  ///
  /// In id, this message translates to:
  /// **'Bahasa Indonesia'**
  String get indonesia;

  /// No description provided for @english.
  ///
  /// In id, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @noData.
  ///
  /// In id, this message translates to:
  /// **'Belum ada data'**
  String get noData;

  /// No description provided for @login.
  ///
  /// In id, this message translates to:
  /// **'Masuk'**
  String get login;

  /// No description provided for @orLoginAs.
  ///
  /// In id, this message translates to:
  /// **'Atau masuk sebagai'**
  String get orLoginAs;

  /// No description provided for @out.
  ///
  /// In id, this message translates to:
  /// **'Keluar'**
  String get out;

  /// No description provided for @logout.
  ///
  /// In id, this message translates to:
  /// **'Keluar Akun'**
  String get logout;

  /// No description provided for @logoutModalDesc.
  ///
  /// In id, this message translates to:
  /// **'Apakah Anda yakin ingin keluar?'**
  String get logoutModalDesc;

  /// No description provided for @loginSuccess.
  ///
  /// In id, this message translates to:
  /// **'Berhasil masuk'**
  String get loginSuccess;

  /// No description provided for @logoutSuccess.
  ///
  /// In id, this message translates to:
  /// **'Berhasil keluar'**
  String get logoutSuccess;

  /// No description provided for @mustNotBeEmpty.
  ///
  /// In id, this message translates to:
  /// **'{field} tidak boleh kosong!'**
  String mustNotBeEmpty(Object field);

  /// No description provided for @mustUseStudentEmail.
  ///
  /// In id, this message translates to:
  /// **'Gunakan email mahasiswa!'**
  String get mustUseStudentEmail;

  /// No description provided for @atLeastLengthCharacters.
  ///
  /// In id, this message translates to:
  /// **'{field} minimal {length} karakter!'**
  String atLeastLengthCharacters(Object field, Object length);

  /// No description provided for @invalidFormat.
  ///
  /// In id, this message translates to:
  /// **'{field} yang anda masukkan tidak valid!'**
  String invalidFormat(Object field);

  /// No description provided for @serverError.
  ///
  /// In id, this message translates to:
  /// **'Kesalahan server'**
  String get serverError;

  /// No description provided for @networkError.
  ///
  /// In id, this message translates to:
  /// **'Jaringan tidak stabil'**
  String get networkError;

  /// No description provided for @unknownError.
  ///
  /// In id, this message translates to:
  /// **'Kesalahan tak terduga'**
  String get unknownError;

  /// No description provided for @studentNotFound.
  ///
  /// In id, this message translates to:
  /// **'Pengguna tidak ditemukan. Silakan coba lagi!'**
  String get studentNotFound;

  /// No description provided for @passwordIsNull.
  ///
  /// In id, this message translates to:
  /// **'Kata sandi tidak boleh kosong'**
  String get passwordIsNull;

  /// No description provided for @emailAlreadyRegistered.
  ///
  /// In id, this message translates to:
  /// **'Email sudah terdaftar'**
  String get emailAlreadyRegistered;

  /// No description provided for @loginWithGoogleAbortedByStudent.
  ///
  /// In id, this message translates to:
  /// **'Masuk dengan Google dibatalkan'**
  String get loginWithGoogleAbortedByStudent;

  /// No description provided for @loginWithGoogleFailed.
  ///
  /// In id, this message translates to:
  /// **'Masuk dengan Google gagal'**
  String get loginWithGoogleFailed;

  /// No description provided for @invalidCredentials.
  ///
  /// In id, this message translates to:
  /// **'Email atau kata sandi salah'**
  String get invalidCredentials;

  /// No description provided for @emailAlreadyExists.
  ///
  /// In id, this message translates to:
  /// **'Email ini sudah digunakan'**
  String get emailAlreadyExists;

  /// No description provided for @signOutFailed.
  ///
  /// In id, this message translates to:
  /// **'Gagal keluar. Silakan coba lagi!'**
  String get signOutFailed;

  /// No description provided for @loginFailed.
  ///
  /// In id, this message translates to:
  /// **'Gagal masuk. Silakan coba lagi!'**
  String get loginFailed;

  /// No description provided for @getParkFailed.
  ///
  /// In id, this message translates to:
  /// **'Gagal mendapatkan data parkir'**
  String get getParkFailed;

  /// No description provided for @getVehicleFailed.
  ///
  /// In id, this message translates to:
  /// **'Gagal mendapatkan data kendaraan'**
  String get getVehicleFailed;

  /// No description provided for @getParkingLotFailed.
  ///
  /// In id, this message translates to:
  /// **'Gagal mendapatkan data tempat parkir'**
  String get getParkingLotFailed;

  /// No description provided for @loading.
  ///
  /// In id, this message translates to:
  /// **'Memuat'**
  String get loading;

  /// No description provided for @and.
  ///
  /// In id, this message translates to:
  /// **'dan'**
  String get and;

  /// No description provided for @or.
  ///
  /// In id, this message translates to:
  /// **'atau'**
  String get or;

  /// No description provided for @confirm.
  ///
  /// In id, this message translates to:
  /// **'Konfirmasi'**
  String get confirm;

  /// No description provided for @save.
  ///
  /// In id, this message translates to:
  /// **'Simpan'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In id, this message translates to:
  /// **'Batal'**
  String get cancel;

  /// No description provided for @back.
  ///
  /// In id, this message translates to:
  /// **'Kembali'**
  String get back;

  /// No description provided for @start.
  ///
  /// In id, this message translates to:
  /// **'Mulai'**
  String get start;

  /// No description provided for @search.
  ///
  /// In id, this message translates to:
  /// **'Cari'**
  String get search;

  /// No description provided for @end.
  ///
  /// In id, this message translates to:
  /// **'Akhiri'**
  String get end;

  /// No description provided for @morning.
  ///
  /// In id, this message translates to:
  /// **'Pagi'**
  String get morning;

  /// No description provided for @afternoon.
  ///
  /// In id, this message translates to:
  /// **'Siang'**
  String get afternoon;

  /// No description provided for @evening.
  ///
  /// In id, this message translates to:
  /// **'Sore'**
  String get evening;

  /// No description provided for @night.
  ///
  /// In id, this message translates to:
  /// **'Malam'**
  String get night;

  /// No description provided for @monday.
  ///
  /// In id, this message translates to:
  /// **'Senin'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In id, this message translates to:
  /// **'Selasa'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In id, this message translates to:
  /// **'Rabu'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In id, this message translates to:
  /// **'Kamis'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In id, this message translates to:
  /// **'Jumat'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In id, this message translates to:
  /// **'Sabtu'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In id, this message translates to:
  /// **'Minggu'**
  String get sunday;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'id': return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
