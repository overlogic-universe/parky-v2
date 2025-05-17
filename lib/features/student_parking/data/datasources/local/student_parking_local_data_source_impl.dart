import 'package:sqflite/sqflite.dart';

import '../../../../parking_lot/data/models/parking_lot_model.dart';
import '../../../../student_parking/core/constant/failures/student_parking_exception_message_constant.dart';
import '../../../../student_parking/core/failures/student_parking_exception.dart';
import '../../../../student_parking/core/failures/student_parking_failure_type.dart';
import '../../../../student_parking/data/datasources/local/student_parking_local_data_source.dart';
import '../../models/parking_history_model.dart';
import '../../models/vehicle_model.dart';

class StudentParkingLocalDataSourceImpl implements StudentParkingLocalDataSource {
  final Database sqfliteDatabase;

  const StudentParkingLocalDataSourceImpl({required this.sqfliteDatabase});

  static const String _parkingHistoryTable = "parking_histories";
  static const String _vehicleTable = "vehicles";
  static const String _parkingLotTable = "parking_lots";
  static const String _notFoundMessage = "Not found from database";

  @override
  Future<ParkingHistoryModel?> getParkingHistoryModel() async {
    final List<Map<String, dynamic>> result = await sqfliteDatabase.query(
      _parkingHistoryTable,
      limit: 1,
    );

    if (result.isEmpty) return null;

    final data = result.first;

    return ParkingHistoryModel.fromJson(data);
  }

  @override
  Future<VehicleModel?> getVehicleModel() async {
    final List<Map<String, dynamic>> result = await sqfliteDatabase.query(
      _vehicleTable,
      limit: 1,
    );

    if (result.isEmpty) return null;

    final data = result.first;

    return VehicleModel.fromJson(data);
  }

  @override
  Future<void> saveParkingHistoryModel(ParkingHistoryModel? parkingHistoryModel) async {
    if (parkingHistoryModel == null) {
      throw StudentParkingException(
        type: StudentParkingFailureType.parkNotFound,
      );
    }

    await sqfliteDatabase.insert(
      _parkingHistoryTable,
      parkingHistoryModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> saveVehicleModel(VehicleModel? vehicleModel) async {
    if (vehicleModel == null) {
      throw StudentParkingException(
        message: StudentParkingExceptionMessageConstant.vehicleNotFound(
          _notFoundMessage,
        ),
        type: StudentParkingFailureType.vehicleNotFound,
      );
    }

    await sqfliteDatabase.insert(
      _vehicleTable,
      vehicleModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> saveParkingLotModel(ParkingLotModel? parkingLotModel) async {
    if (parkingLotModel == null) {
      throw StudentParkingException(
        message: StudentParkingExceptionMessageConstant.parkingLotNotFound(
          _notFoundMessage,
        ),
        type: StudentParkingFailureType.paringkLotNotFound,
      );
    }

    await sqfliteDatabase.insert(
      _parkingLotTable,
      parkingLotModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<ParkingLotModel?> getParkingLotModel() async {
    final List<Map<String, dynamic>> result = await sqfliteDatabase.query(
      _parkingLotTable,
      limit: 1,
    );

    if (result.isEmpty) return null;

    final data = result.first;

    return ParkingLotModel.fromJson(data);
  }
}
