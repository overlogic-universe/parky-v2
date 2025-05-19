import 'dart:developer';

import '../../../parking_lot/core/extensions/parking_lot_data_mapper_extension.dart';
import '../../../parking_lot/data/models/parking_lot_model.dart';
import '../../../parking_lot/domain/entities/parking_lot_entity.dart';

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
  Future<ResourceState<ParkingHistoryEntity>>
  getCurrentParkingHistoryByStudentId() {
    return NetworkBoundResource<ParkingHistoryEntity, ParkingHistoryModel?>(
      networkInfo: networkInfo,
      loadFromDB: () async {
        try {
          final model = await localDataSource.getParkingHistoryModel();

          if (model == null) return null;
          return model.toEntity();
        } catch (e) {
          if (e is StudentParkingException) {
            log("ERROR getCurrentParkingHistoryByStudentId PARK: ${e.message}");
          }
          log(
            "ERROR getCurrentParkingHistoryByStudentId PARK: ${e.toString()}",
          );
          return null;
        }
      },
      shouldFetch: (data) => data == null,
      createCall: () async {
        try {
          return await remoteDataSource.getCurrentParkingHistoryByStudentId();
        } catch (e) {
          if (e is StudentParkingException) {
            log("ERROR getCurrentParkingHistoryByStudentId Park: ${e.message}");
          }
          log(
            "ERROR getCurrentParkingHistoryByStudentId Park: ${e.toString()}",
          );

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

  @override
  Future<ResourceState<ParkingLotEntity>> getCurrentParkingLotByStudentId() {
    return NetworkBoundResource<ParkingLotEntity, ParkingLotModel?>(
      networkInfo: networkInfo,
      loadFromDB: () async {
        try {
          final model = await localDataSource.getParkingLotModel();

          if (model == null) return null;
          return model.toEntity();
        } catch (e) {
          if (e is StudentParkingException) {
            log("ERROR getCurrentParkingLotByStudentId PARK: ${e.message}");
          }
          log("ERROR getCurrentParkingLotByStudentId PARK: ${e.toString()}");
          return null;
        }
      },
      shouldFetch: (data) => data == null,
      createCall: () async {
        try {
          return await remoteDataSource.getCurrentParkingLotByStudentId();
        } catch (e) {
          if (e is StudentParkingException) {
            log("ERROR getCurrentParkingLotByStudentId Park: ${e.message}");
          }
          log("ERROR getCurrentParkingLotByStudentId Park: ${e.toString()}");

          rethrow;
        }
      },
      saveCallResult: (model) => localDataSource.saveParkingLotModel(model),
    ).fetchData();
  }
}
