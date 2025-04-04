import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/di/provider.dart';
import 'firebase_options.dart';
import 'global.dart';
import 'my_app.dart';

// dart run build_runner watch -d build --delete-conflicting-outputs

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final global = await Global.init();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(global.sharedPreferences),
        sqfliteDatabaseProvider.overrideWithValue(global.database),
      ],
      child: MyApp(),
    ),
  );
}
