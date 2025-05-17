// ignore: depend_on_referenced_packages
import 'package:parky/features/parking_lot/data/datasources/local/db/schema/parking_lot_schema.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../auth/data/datasources/local/db/schema/user_table_schema.dart';
import '../../../../../student_parking/data/datasources/local/db/schema/student_parking_shema.dart';

class AppDatabase {
  static Database? _instance;

  static Future<Database> getInstance() async {
    if (_instance != null) return _instance!;

    final path = join(await getDatabasesPath(), 'parky_database.db');

    _instance = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(StudentTableSchema.createTable);
        await db.execute(StudentParkingSchema.createParkingHistoryTable);
        await db.execute(StudentParkingSchema.createVehicleTable);
        await db.execute(ParkingLotSchema.createParkingLotsHasParkingSchedulesTable);
        await db.execute(ParkingLotSchema.createParkingLotsTable);
        await db.execute(ParkingLotSchema.createParkingSchedulesTable);
      },
    );

    return _instance!;
  }
}
