import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../parking_lot/data/datasources/local/db/schema/parking_lot_schema.dart';
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
        await db.execute(StudentParkingSchema.createStudentsTable);
        await db.execute(StudentParkingSchema.createParkingHistoriesTable);
        await db.execute(StudentParkingSchema.createVehiclesTable);
        await db.execute(ParkingLotSchema.createParkingLotsHasParkingSchedulesTable);
        await db.execute(ParkingLotSchema.createParkingLotsTable);
        await db.execute(ParkingLotSchema.createParkingSchedulesTable);
      },
    );

    return _instance!;
  }
}
