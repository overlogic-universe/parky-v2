import 'package:sqflite/sqflite.dart';

import '../../models/parking_lots_has_parking_schedules_model.dart';
import '../../models/parking_schedule_model.dart';
import 'parking_lot_has_parking_schedule_local_data_source.dart';

class ParkingLotHasParkingScheduleLocalDataSourceImpl
    implements ParkingLotHasParkingScheduleLocalDataSource {
  final Database sqfliteDatabase;

  const ParkingLotHasParkingScheduleLocalDataSourceImpl({
    required this.sqfliteDatabase,
  });

  static const String _junctionTable = "parking_lots_has_parking_schedules";

  @override
  Future<void> saveParkingLotHasParkingScheduleModelList(
    List<ParkingLotHasParkingScheduleModel>? models,
  ) async {
    if (models == null) {
      // TODO: ADD EXCEPTION
      return;
    }
    final batch = sqfliteDatabase.batch();

    for (final model in models) {
      batch.insert(
        _junctionTable,
        model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }

  @override
  Future<List<ParkingLotHasParkingScheduleModel>>
  getParkingLotHasParkingScheduleListByScheduleIds(
    List<ParkingScheduleModel> scheduleList,
  ) async {
    if (scheduleList.isEmpty) return [];

    final scheduleIds = scheduleList.map((e) => e.id).toSet().toList();

    final result = await sqfliteDatabase.query(
      _junctionTable,
      where:
          'parking_schedule_id IN (${List.filled(scheduleIds.length, '?').join(',')})',
      whereArgs: scheduleIds,
    );

    return result
        .map((e) => ParkingLotHasParkingScheduleModel.fromJson(e))
        .toList();
  }
}
