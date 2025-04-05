// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../auth/data/datasources/local/db/schema/user_table_schema.dart';
import '../../../../user_parking/data/datasources/local/db/schema/user_parking_shema.dart';

class AppDatabase {
  static Database? _instance;

  static Future<Database> getInstance() async {
    if (_instance != null) return _instance!;

    final path = join(await getDatabasesPath(), 'parky_database.db');

    _instance = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(UserTableSchema.createTable);
        await db.execute(UserParkingShema.createParkTable);
        await db.execute(UserParkingShema.createVehicleTable);
      },
    
    );

    return _instance!;
  }
}
