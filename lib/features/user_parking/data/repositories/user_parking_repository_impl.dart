import '../../../../core/utils/resource_state.dart';
import '../../../shared/data/remote/network_bound_resource.dart';
import '../../../shared/data/remote/network_info.dart';
import '../../core/extensions/user_parking_data_mapper_extension.dart';
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
          return model.toEntity();
        } catch (_) {
          return null;
        }
      },
      shouldFetch: (data) => data == null,
      createCall: () => remoteDataSource.getParkByUserId(),
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
          return model.toEntity();
        } catch (_) {
          return null;
        }
      },
      shouldFetch: (data) => data == null,
      createCall: () => remoteDataSource.getVehicleByUserId(),
      saveCallResult: (model) => localDataSource.saveVehicleModel(model),
    ).fetchData();
  }
}
