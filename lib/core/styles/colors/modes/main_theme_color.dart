part of '../theme_color.dart';

class MainThemeColor implements ThemeColor {
  @override
  Brightness get brightness => Brightness.light;

  // ========= Primary colors
  @override
  Color get primary => const Color(0xFF5D87FF); // Warna utama aplikasi (sering digunakan di AppBar atau tombol utama)

  @override
  Color get onPrimary => brightnessColor; // Warna teks atau ikon di atas warna primary

  @override
  Color get primaryContainer => brightnessColor; // Warna elemen pendukung (misalnya card atau container sekunder)

  @override
  Color get onPrimaryContainer => onBrightnessColor; // Warna teks atau ikon di atas elemen primaryContainer

  @override
  Color get primaryFixed => const Color(0xFF74AFFF); // Variasi tetap dari primary untuk konsistensi di area tertentu

  @override
  Color get primaryFixedDim => const Color.fromARGB(255, 230, 238, 255); // Versi redup dari primaryFixed

  @override
  Color get inversePrimary => brightnessColor; // Warna kontras dengan primary (biasanya terang)

  // ========= Secondary colors
  @override
  Color get secondary => const Color(0xFFEAEAEA); // Warna sekunder untuk elemen pendukung (misalnya chip)

  @override
  Color get onSecondary => const Color(0xFF5E5E5E); // Warna teks atau ikon di atas warna secondary

  @override
  Color get secondaryContainer => const Color(0xFFEDF4DE); // Warna container untuk elemen sekunder

  @override
  Color get onSecondaryContainer => onBrightnessColor; // Warna teks atau ikon di atas secondaryContainer

  @override
  Color get secondaryFixed => secondaryContainer; // Variasi tetap dari secondary

  @override
  Color get secondaryFixedDim => secondaryContainer.withValues(alpha: 0.8); // Versi redup dari secondaryFixed

  // ========= Tertiary colors
  @override
  Color get tertiary => const Color(0xFF717375); // Warna tersier untuk elemen dekoratif

  @override
  Color get onTertiary => brightnessColor; // Warna teks atau ikon di atas warna tertiary

  @override
  Color get tertiaryContainer => const Color(0xFF717375); // Warna container untuk elemen tersier

  @override
  Color get onTertiaryContainer => brightnessColor; // Warna teks atau ikon di atas container tersier

  @override
  Color get tertiaryFixed => tertiaryContainer; // Variasi tetap dari tertiary

  @override
  Color get tertiaryFixedDim => tertiaryContainer.withValues(alpha: 0.8); // Versi redup dari tertiaryFixed

  // ========= Surface colors
  @override
  Color get surface => brightnessColor; // Warna latar belakang utama

  @override
  Color get onSurface => onBrightnessColor; // Warna teks atau ikon di atas latar belakang utama

  @override
  Color get surfaceBright => brightnessColor; // Warna terang untuk elemen seperti kartu

  @override
  Color get surfaceDim => surface.withValues(alpha: 0.9); // Warna redup untuk elemen seperti dialog

  @override
  Color get surfaceContainer => brightnessColor; // Warna latar belakang container kecil

  @override
  Color get surfaceContainerLow => const Color(0xFFAABEC8); // Warna terang untuk container

  @override
  Color get surfaceContainerHigh => const Color(0xFF717375); // Warna lebih gelap untuk container

  @override
  Color get surfaceContainerHighest => grey; // Warna paling gelap untuk container

  @override
  Color get surfaceContainerLowest => surface.withValues(alpha: 0.1); // Warna paling terang untuk container

  @override
  Color get surfaceTint => primary; // Warna aksen pada elemen surface

  @override
  Color get inverseSurface => success; // Warna kontras dengan surface

  @override
  Color get onInverseSurface => onSuccess; // Warna teks atau ikon di atas inverseSurface

  // ========= Error colors
  @override
  Color get error => const Color(0xFFFA896B); // Warna untuk status error

  @override
  Color get onError => brightnessColor; // Warna teks atau ikon di atas warna error

  @override
  Color get errorContainer => Color(0xFFF5D8D6); // Warna container untuk status error

  @override
  Color get onErrorContainer => brightnessColor; // Warna teks atau ikon di atas errorContainer

  // ========= Success colors
  @override
  Color get success => const Color.fromARGB(255, 19, 222, 131); // Warna untuk status success

  @override
  Color get onSuccess => brightnessColor; // Warna teks atau ikon di atas warna success

  // ========= Outline and shadow
  @override
  Color get outline => const Color(0xFFAABEC8); // Warna garis batas elemen

  @override
  Color get outlineVariant => lightGrey; // Varian garis batas untuk elemen tertentu

  @override
  Color get shadow => Colors.grey.shade300;

  @override
  Color get scrim => Colors.grey.shade100; // Warna overlay semi-transparan, contoh: background dialog

  // ========= Background and neutral colors
  @override
  Color get lightGrey => const Color(0xFFEDEDED); // Warna abu-abu terang untuk elemen netral

  @override
  Color get grey => const Color(0xFF1F1F1F); // Warna abu-abu gelap untuk elemen netral

  @override
  Color get brightnessColor => const Color(0xFFF3F2F7); // Warna putih umum

  @override
  Color get onBrightnessColor => const Color(0xFF1D1D1F); // Warna hitam umum

  @override
  Color get text => onBrightnessColor;
}
