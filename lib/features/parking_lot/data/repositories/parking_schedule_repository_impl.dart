import '../../../../core/utils/resource_state.dart';
import '../../../shared/data/datasources/remote/network_bound_resource.dart';
import '../../../shared/data/datasources/remote/network_info.dart';
import '../../core/extensions/parking_schedule_data_mapper.dart';
import '../../domain/entities/parking_schedule_day_type.dart';
import '../../domain/entities/parking_schedule_entity.dart';
import '../../domain/repositories/parking_schedule_repository.dart';
import '../datasources/local/parking_schedule_local_data_source.dart';
import '../datasources/remote/parking_schedule_remote_data_source.dart';
import '../models/parking_schedule_model.dart';

class ParkingScheduleRepositoryImpl implements ParkingScheduleRepository {
  final ParkingScheduleLocalDataSource localDataSource;
  final ParkingScheduleRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const ParkingScheduleRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<ResourceState<List<ParkingScheduleEntity>>>
  getParkingScheduleListByDay(WeekDay day) async {
    return NetworkBoundResource<
      List<ParkingScheduleEntity>,
      List<ParkingScheduleModel>?
    >(
      networkInfo: networkInfo,

      loadFromDB: () async {
        final models = await localDataSource.getParkingScheduleModelByDay(
          day.name,
        );
        return models.map((e) => e.toEntity()).toList();
      },

      shouldFetch: (data) => data == null || data.isEmpty,

      createCall: () async {
        return await remoteDataSource.getParkingScheduleList(day.value);
      },

      saveCallResult: (models) async {
        await localDataSource.saveParkingScheduleModelList(models);
      },
    ).fetchData();
  }
}
