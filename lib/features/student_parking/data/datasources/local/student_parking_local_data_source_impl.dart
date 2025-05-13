import 'package:sqflite/sqflite.dart';

import '../../../../student_parking/core/constant/failures/student_parking_exception_message_constant.dart';
import '../../../../student_parking/core/failures/student_parking_exception.dart';
import '../../../../student_parking/core/failures/student_parking_failure_type.dart';
import '../../models/park_model.dart';
import '../../models/vehicle_mode.dart';
import '../../../../student_parking/data/datasources/local/student_parking_local_data_source.dart';

class StudentParkingLocalDataSourceImpl
    implements StudentParkingLocalDataSource {
  final Database sqfliteDatabase;

  StudentParkingLocalDataSourceImpl({required this.sqfliteDatabase});

  static const String _parkTable = "parks";
  static const String _vehicleTable = "vehicles";
  static const String _notFoundMessage = "Not found from database";

  @override
  Future<ParkModel?> getParkModel() async {
    final List<Map<String, dynamic>> result = await sqfliteDatabase.query(
      _parkTable,
      limit: 1,
    );

    if (result.isEmpty) return null;

    final data = result.first;

    return ParkModel.fromJson(data);
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
  Future<void> saveParkModel(ParkModel? parkModel) async {
    if (parkModel == null) {
      throw StudentParkingException(
        studentId: parkModel?.studentId,
        type: StudentParkingFailureType.parkNotFound,
      );
    }
    await sqfliteDatabase.insert(
      _parkTable,
      parkModel.toJson(),
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
}
