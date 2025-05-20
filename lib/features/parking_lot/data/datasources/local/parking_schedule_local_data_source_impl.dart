import 'dart:developer';

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
    log("MODELLL: $modelList");

    if (modelList == null) return;

    final existingRows = await sqfliteDatabase.query(_parkingScheduleTable);
    log("MODELLL: existingRows $existingRows");
    final existingIds = existingRows.map((e) => e['id'] as String).toSet();
    log("MODELLL: existingIds $existingIds");
    final incomingIds = modelList.map((e) => e.id).toSet();
    log("MODELLL: incomingIds $incomingIds");

    final batch = sqfliteDatabase.batch();
    log("MODELLL: batch $batch");

    // Hapus data yang tidak ada di data baru
    final idsToDelete = existingIds.difference(incomingIds);
    log("MODELLL: idsToDelete $idsToDelete");
    if (idsToDelete.isNotEmpty) {
      batch.delete(
        _parkingScheduleTable,
        where: 'id IN (${List.filled(idsToDelete.length, '?').join(',')})',
        whereArgs: idsToDelete.toList(),
      );
    }

    // Replace semua data baru
    for (final model in modelList) {
      log("MODELLL MENNN: $model");

      batch.insert(
        _parkingScheduleTable,
        model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }
}
