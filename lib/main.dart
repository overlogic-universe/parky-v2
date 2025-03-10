import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'my_app.dart';

// TODO: Jalankan flutter config --explicit-package-dependencies
// KETERANGAN: untuk l10n

void main() {
  runApp(const ProviderScope(child: MyApp()));
}
