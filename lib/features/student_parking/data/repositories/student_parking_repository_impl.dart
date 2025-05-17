import 'dart:developer';

import '../../../../core/utils/resource_state.dart';
import '../../../shared/data/datasources/remote/network_bound_resource.dart';
import '../../../shared/data/datasources/remote/network_info.dart';
import '../../../student_parking/core/failures/student_parking_exception.dart';
import '../../../student_parking/data/datasources/local/student_parking_local_data_source.dart';
import '../../../student_parking/domain/repositories/student_parking_repository.dart';
import '../../core/extensions/student_parking_data_mapper_extension.dart';
import '../../domain/entities/parking_history_entity.dart';
import '../../domain/entities/vehicle_entity.dart';
import '../datasources/remote/student_parking_remote_data_source.dart';
import '../models/parking_history_model.dart';
import '../models/vehicle_model.dart';

class StudentParkingRepositoryImpl implements StudentParkingRepository {
  final StudentParkingRemoteDataSource remoteDataSource;
  final StudentParkingLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  const StudentParkingRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<ResourceState<ParkingHistoryEntity>> getCurrentParkingHistoryByStudentId() {
    return NetworkBoundResource<ParkingHistoryEntity, ParkingHistoryModel?>(
      networkInfo: networkInfo,
      loadFromDB: () async {
        try {
          final model = await localDataSource.getParkingHistoryModel();
          log("MODEL GET PARK: $model");

          if (model == null) return null;
          return model.toEntity();
        } catch (e) {
          if (e is StudentParkingException) {
            log("ERROR GET PARK: ${e.message}");
          }
          log("ERROR GET PARK: ${e.toString()}");
          return null;
        }
      },
      shouldFetch: (data) => data == null,
      createCall: () async {
        try {
          return await remoteDataSource.getCurrentParkingHistoryByStudentId();
        } catch (e) {
          if (e is StudentParkingException) {
            log("ERROR GET Park: ${e.message}");
          }
          log("ERROR GET Park: ${e.toString()}");

          rethrow;
        }
      },
      saveCallResult: (model) => localDataSource.saveParkingHistoryModel(model),
    ).fetchData();
  }

  @override
  Future<ResourceState<VehicleEntity>> getVehicleByStudentId() {
    return NetworkBoundResource<VehicleEntity, VehicleModel?>(
      networkInfo: networkInfo,
      loadFromDB: () async {
        try {
          final model = await localDataSource.getVehicleModel();
          log("MODEL GET VEHICLE: $model");

          if (model == null) return null;

          return model.toEntity();
        } catch (e) {
          if (e is StudentParkingException) {
            log("ERROR GET VEHICLE: ${e.message}");
          }
          log("ERROR GET VEHICLE: ${e.toString()}");

          return null;
        }
      },
      shouldFetch: (data) => data == null,
      createCall: () async {
        try {
          return await remoteDataSource.getVehicleByStudentId();
        } catch (e) {
          if (e is StudentParkingException) {
            log("ERROR GET VEHICLE: ${e.message}");
          }
          log("ERROR GET VEHICLE: ${e.toString()}");

          rethrow;
        }
      },
      saveCallResult: (model) => localDataSource.saveVehicleModel(model),
    ).fetchData();
  }

}
