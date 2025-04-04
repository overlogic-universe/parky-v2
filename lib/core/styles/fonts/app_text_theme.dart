import 'package:flutter/material.dart';
import 'package:parky/core/styles/fonts/theme_font.dart';

import 'app_font.dart';

class AppTextTheme {
  const AppTextTheme._();

  static TextTheme of(BuildContext context, ThemeFont themeFont) =>
      TextTheme(
            // headlineSmall: Biasanya digunakan untuk heading kecil, seperti subjudul atau bagian dalam kartu kecil.
            headlineSmall: themeFont.text14.semiBold,

            // headlineMedium: Digunakan untuk heading dengan ukuran sedang, seperti judul di halaman kecil.
            headlineMedium: themeFont.text16.semiBold,

            // headlineLarge: Untuk heading besar, biasanya digunakan untuk judul utama di halaman atau bagian besar.
            headlineLarge: themeFont.text24.semiBold,

            // titleSmall: Digunakan untuk teks judul kecil, seperti bagian deskripsi singkat atau label item kecil.
            titleSmall: themeFont.text14.bold,

            // titleMedium: Digunakan untuk judul dengan ukuran sedang, misalnya nama elemen atau menu utama.
            titleMedium: themeFont.text16.bold,

            // titleLarge: Untuk judul besar, seperti heading utama atau nama produk/halaman penting.
            titleLarge: themeFont.text20.bold,

            // bodySmall: Untuk teks body kecil, biasanya digunakan untuk catatan atau teks tambahan.
            bodySmall: themeFont.text10,

            // bodyMedium: Digunakan untuk teks body standar, seperti paragraf utama atau konten umum.
            bodyMedium: themeFont.text14,

            // bodyLarge: Untuk teks body besar, seperti paragraf yang ingin lebih menonjol atau teks penting.
            bodyLarge: themeFont.text16,

            // displayLarge: Biasanya digunakan untuk teks tampilan besar, seperti angka besar atau heading yang sangat menonjol.
            displayLarge: themeFont.text32.semiBold,

            // displayMedium: Digunakan untuk teks tampilan sedang, bisa untuk heading sekunder yang cukup besar.
            displayMedium: themeFont.text28.semiBold,

            // displaySmall: Untuk teks tampilan kecil, seperti subheading di halaman dengan desain besar.
            displaySmall: themeFont.text24.semiBold,

            // labelLarge: Biasanya digunakan untuk label tombol besar atau label yang menonjol.
            labelLarge: themeFont.text15.regular,

            // labelMedium: Digunakan untuk label standar, seperti label tombol dengan ukuran default.
            labelMedium: themeFont.text13.regular,

            // labelSmall: Untuk label kecil, misalnya teks kecil di bawah elemen interaktif.
            labelSmall: themeFont.text11.regular,
          );

  // TODO: menginisialisasi class tema text
}
