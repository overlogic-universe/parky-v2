import 'dart:developer';

import '../../../../core/utils/resource_state.dart';
import '../../../shared/data/datasources/remote/network_bound_resource.dart';
import '../../../shared/data/datasources/remote/network_info.dart';
import '../../core/extensions/parking_lot_data_mapper_extension.dart';
import '../../core/extensions/parking_lot_has_parking_schedule_data_mapper.dart';
import '../../domain/entities/parking_lot_entity.dart';
import '../../domain/entities/parking_lot_has_parking_schedule_entity.dart';
import '../../domain/repositories/parking_lot_repository.dart';
import '../datasources/local/parking_lot_local_data_source.dart';
import '../datasources/remote/parking_lot_remote_data_source.dart';
import '../models/parking_lot_model.dart';

class ParkingLotRepositoryImpl implements ParkingLotRepository {
  final ParkingLotLocalDataSource localDataSource;
  final ParkingLotRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const ParkingLotRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<ResourceState<List<ParkingLotEntity>>>
  getParkingLotListByParkingLotHasParkingScheduleId(
    List<ParkingLotHasParkingScheduleEntity> parkingLotHasParkingScheduleList,
  ) async {
    final parkingLotHasParkingScheduleModelList =
        parkingLotHasParkingScheduleList
            .map((entity) => entity.toModel())
            .toList();
    return NetworkBoundResource<List<ParkingLotEntity>, List<ParkingLotModel>?>(
      networkInfo: networkInfo,
      loadFromDB: () async {
        try {
          final localList = await localDataSource
              .getParkingLotListByParkingLotHasParkingScheduleId(
                parkingLotHasParkingScheduleModelList,
              );

          return localList.map((e) => e.toEntity()).toList();
        } catch (e) {
          log(
            "ERROR loadFromDB getParkingLotListByParkingLotHasParkingScheduleId: ${e.toString()}",
          );
          return [];
        }
      },
      shouldFetch: (data) => data == null || data.isEmpty,
      createCall: () async {
        try {
          return await remoteDataSource
              .getParkingLotListByParkingLotHasParkingScheduleId(
                parkingLotHasParkingScheduleModelList,
              );
        } catch (e) {
          log(
            "ERROR createCall getParkingLotListByParkingLotHasParkingScheduleId: ${e.toString()}",
          );
          rethrow;
        }
      },
      saveCallResult: (remoteModels) async {
        try {
          await localDataSource.saveParkingLotModelList(remoteModels);
        } catch (e) {
          log("ERROR saveCallResult saveParkingLotModelList: ${e.toString()}");
        }
      },
    ).fetchData();
  }
}
