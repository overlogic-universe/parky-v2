import 'dart:developer';

import 'package:sqflite/sqflite.dart';

import '../../models/parking_assignment.dart';
import '../../models/parking_schedule_model.dart';
import 'parking_lot_has_parking_schedule_local_data_source.dart';

class ParkingAssignmentLocalDataSourceImpl
    implements ParkingAssignmentLocalDataSource {
  final Database sqfliteDatabase;

  const ParkingAssignmentLocalDataSourceImpl({required this.sqfliteDatabase});

  static const String _junctionTable = "parking_assignments";

  @override
  Future<void> saveParkingAssignmentList(
    List<ParkingAssignmentModel>? models,
  ) async {
    log("MODELLL: $models");

    if (models == null) return;

    final existingRows = await sqfliteDatabase.query(_junctionTable);
    final existingIds = existingRows.map((e) => e['id'] as String).toSet();
    final incomingIds = models.map((e) => e.id).toSet();

    final batch = sqfliteDatabase.batch();

    // Hapus yang tidak ada di data baru
    final idsToDelete = existingIds.difference(incomingIds);
    if (idsToDelete.isNotEmpty) {
      batch.delete(
        _junctionTable,
        where: 'id IN (${List.filled(idsToDelete.length, '?').join(',')})',
        whereArgs: idsToDelete.toList(),
      );
    }

    // Simpan (replace) semua data baru
    for (final model in models) {
      log("MODELLL: $model");
      batch.insert(
        _junctionTable,
        model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }

  @override
  Future<List<ParkingAssignmentModel>> getParkingAssignmentListByScheduleIds(
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

    return result.map((e) => ParkingAssignmentModel.fromJson(e)).toList();
  }
}
