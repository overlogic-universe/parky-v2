import 'package:sqflite/sqflite.dart';

import '../../models/parking_lot_model.dart';
import '../../models/parking_lots_has_parking_schedules_model.dart';
import 'parking_lot_local_data_source.dart';

class ParkingLotLocalDataSourceImpl implements ParkingLotLocalDataSource {
  final Database sqfliteDatabase;

  const ParkingLotLocalDataSourceImpl({required this.sqfliteDatabase});

  static const String _parkingLotTable = "parking_lots";

  @override
  Future<void> saveParkingLotModelList(List<ParkingLotModel>? models) async {
    if (models == null) return;

    final existingRows = await sqfliteDatabase.query(_parkingLotTable);
    final existingIds = existingRows.map((e) => e['id'] as String).toSet();
    final incomingIds = models.map((e) => e.id).toSet();

    final batch = sqfliteDatabase.batch();

    // Hapus data yang ada di database tapi tidak ada di data baru
    final idsToDelete = existingIds.difference(incomingIds);
    if (idsToDelete.isNotEmpty) {
      batch.delete(
        _parkingLotTable,
        where: 'id IN (${List.filled(idsToDelete.length, '?').join(',')})',
        whereArgs: idsToDelete.toList(),
      );
    }

    // Simpan (replace) semua data baru
    for (final model in models) {
      batch.insert(
        _parkingLotTable,
        model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }

  @override
  Future<List<ParkingLotModel>>
  getParkingLotListByParkingLotHasParkingScheduleId(
    List<ParkingLotHasParkingScheduleModel> parkingLotHasParkingScheduleList,
  ) async {
    if (parkingLotHasParkingScheduleList.isEmpty) return [];

    final parkingLotIds =
        parkingLotHasParkingScheduleList
            .map((e) => e.parkingLotId)
            .toSet()
            .toList();

    final result = await sqfliteDatabase.query(
      _parkingLotTable,
      where: 'id IN (${List.filled(parkingLotIds.length, '?').join(',')})',
      whereArgs: parkingLotIds,
    );

    return result.map((e) => ParkingLotModel.fromJson(e)).toList();
  }
}
