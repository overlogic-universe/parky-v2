import 'dart:developer';

import '../../../../core/utils/resource_state.dart';
import '../../../shared/data/remote/network_bound_resource.dart';
import '../../../shared/data/remote/network_info.dart';
import '../../core/extensions/user_parking_data_mapper_extension.dart';
import '../../core/failures/user_parking_exception.dart';
import '../../domain/entities/park_entity.dart';
import '../../domain/entities/vehicle_entity.dart';
import '../../domain/repositories/user_parking_repository.dart';
import '../datasources/local/user_parking_local_data_source.dart';
import '../datasources/remote/user_parking_remote_data_source.dart';
import '../models/park_model.dart';
import '../models/vehicle_mode.dart';

class UserParkingRepositoryImpl implements UserParkingRepository {
  final UserParkingRemoteDataSource remoteDataSource;
  final UserParkingLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserParkingRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<ResourceState<ParkEntity>> getParkByUserId() {
    return NetworkBoundResource<ParkEntity, ParkModel?>(
      networkInfo: networkInfo,
      loadFromDB: () async {
        try {
          final model = await localDataSource.getParkModel();
          log("MODEL GET PARK: ${model}");

          if (model == null) return null;
          return model.toEntity();
        } catch (e) {
          if (e is UserParkingException) {
            log("ERROR GET PARK: ${e.message}");
          }
          log("ERROR GET PARK: ${e.toString()}");
          return null;
        }
      },
      shouldFetch: (data) => data == null,
      createCall: () async{
          try {
          return await remoteDataSource.getParkByUserId();
        } catch (e) {
           if (e is UserParkingException) {
            log("ERROR GET Park: ${e.message}");
          }
          log("ERROR GET Park: ${e.toString()}");

          rethrow;
        }
      },
      saveCallResult: (model) => localDataSource.saveParkModel(model),
    ).fetchData();
  }

  @override
  Future<ResourceState<VehicleEntity>> getVehicleByUserId() {
    return NetworkBoundResource<VehicleEntity, VehicleModel?>(
      networkInfo: networkInfo,
      loadFromDB: () async {
        try {
          final model = await localDataSource.getVehicleModel();
          log("MODEL GET VEHICLE: ${model}");

          if (model == null) return null;

          return model.toEntity();
        } catch (e) {
          if (e is UserParkingException) {
            log("ERROR GET VEHICLE: ${e.message}");
          }
          log("ERROR GET VEHICLE: ${e.toString()}");

          return null;
        }
      },
      shouldFetch: (data) => data == null,
      createCall: () async{
        try {
          return await remoteDataSource.getVehicleByUserId();
        } catch (e) {
          if (e is UserParkingException) {
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
