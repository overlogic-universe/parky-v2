import 'dart:developer';

import '../../../../core/utils/resource_state.dart';
import '../../../shared/data/datasources/remote/network_bound_resource.dart';
import '../../../shared/data/datasources/remote/network_info.dart';
import '../../core/extensions/parking_lot_has_parking_schedule_data_mapper.dart';
import '../../core/extensions/parking_schedule_data_mapper.dart';
import '../../domain/entities/parking_lot_has_parking_schedule_entity.dart';
import '../../domain/entities/parking_schedule_entity.dart';
import '../../domain/repositories/parking_lot_has_parking_schedule_repository.dart';
import '../datasources/local/parking_lot_has_parking_schedule_local_data_source.dart';
import '../datasources/remote/parking_lot_has_parking_schedule_remote_data_source.dart';
import '../models/parking_lots_has_parking_schedules_model.dart';

class ParkingLotHasParkingScheduleRepositoryImpl
    implements ParkingLotHasParkingScheduleRepository {
  final ParkingLotHasParkingScheduleLocalDataSource localDataSource;
  final ParkingLotHasParkingScheduleRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const ParkingLotHasParkingScheduleRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<ResourceState<List<ParkingLotHasParkingScheduleEntity>>>
  getParkingLotHasParkingScheduleListByScheduleIds(
    List<ParkingScheduleEntity> parkingScheduleList,
  ) async {
    final parkingScheduleModelList =
        parkingScheduleList.map((entity) => entity.toModel()).toList();

    return NetworkBoundResource<
      List<ParkingLotHasParkingScheduleEntity>,
      List<ParkingLotHasParkingScheduleModel>?
    >(
      networkInfo: networkInfo,
      loadFromDB: () async {
        try {
          final localList = await localDataSource
              .getParkingLotHasParkingScheduleListByScheduleIds(
                parkingScheduleModelList,
              );

          return localList.map((e) => e.toEntity()).toList();
        } catch (e) {
          log("ERROR loadFromDB: ${e.toString()}");
          return null;
        }
      },
      shouldFetch: (data) => data == null || data.isEmpty,
      createCall: () async {
        try {
          return await remoteDataSource
              .getParkingLotHasParkingScheduleListByScheduleIds(
                parkingScheduleModelList,
              );
        } catch (e) {
          log("ERROR createCall: ${e.toString()}");
          rethrow;
        }
      },
      saveCallResult:
          (remoteList) => localDataSource
              .saveParkingLotHasParkingScheduleModelList(remoteList),
    ).fetchData();
  }
}
