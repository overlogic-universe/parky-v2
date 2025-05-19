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
  if (models == null) {
    // TODO: ADD CUSTOM EXCEPTION

      return;
      // throw StudentParkingException(
      //   message: StudentParkingExceptionMessageConstant.parkingLotHasScheduleNotFound(
      //     _notFoundMessage,
      //   ),
      //   type: StudentParkingFailureType.parkingLotHasScheduleNotFound,
      // );
    }
    final batch = sqfliteDatabase.batch();
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
  Future<List<ParkingLotModel>> getParkingLotListByParkingLotHasParkingScheduleId(
    List<ParkingLotHasParkingScheduleModel> parkingLotHasParkingScheduleList,
  ) async {
    if (parkingLotHasParkingScheduleList.isEmpty) return [];

    final parkingLotIds = parkingLotHasParkingScheduleList
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
