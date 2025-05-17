import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'features/shared/data/datasources/local/db/app_database.dart';

class Global {
  final SharedPreferences sharedPreferences;
  final Database database;

  Global({required this.sharedPreferences, required this.database});

  static Future<Global> init() async {
    final prefs = await SharedPreferences.getInstance();

    final db = await AppDatabase.getInstance();

    return Global(sharedPreferences: prefs, database: db);
  }
}
