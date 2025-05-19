import 'package:sqflite/sqflite.dart';

import '../../models/parking_schedule_model.dart';
import 'parking_schedule_local_data_source.dart';

class ParkingScheduleLocalDataSourceImpl
    implements ParkingScheduleLocalDataSource {
  final Database sqfliteDatabase;

  const ParkingScheduleLocalDataSourceImpl({required this.sqfliteDatabase});

  static const String _parkingScheduleTable = "parking_schedules";

  @override
  Future<List<ParkingScheduleModel>> getParkingScheduleModelByDay(
    String day,
  ) async {
    final result = await sqfliteDatabase.query(
      _parkingScheduleTable,
      where: 'day_of_week = ?',
      whereArgs: [day],
    );

    return result.map((row) => ParkingScheduleModel.fromJson(row)).toList();
  }

  @override
  Future<void> saveParkingScheduleModelList(
    List<ParkingScheduleModel>? modelList,
  ) async {
    final batch = sqfliteDatabase.batch();
    if (modelList == null) {
      // TODO: ADD EXCEPTION
      return;
    }

    for (final model in modelList) {
      batch.insert(
        _parkingScheduleTable,
        model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }
}
