import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/provider.dart';
import '../../data/datasources/local/parking_lot_has_parking_schedule_local_data_source.dart';
import '../../data/datasources/local/parking_lot_has_parking_schedule_local_data_source_impl.dart';
import '../../data/datasources/local/parking_lot_local_data_source.dart';
import '../../data/datasources/local/parking_lot_local_data_source_impl.dart';
import '../../data/datasources/local/parking_schedule_local_data_source.dart';
import '../../data/datasources/local/parking_schedule_local_data_source_impl.dart';
import '../../data/datasources/remote/parking_lot_has_parking_schedule_remote_data_source.dart';
import '../../data/datasources/remote/parking_lot_has_parking_schedule_remote_data_source_impl.dart';
import '../../data/datasources/remote/parking_lot_remote_data_source.dart';
import '../../data/datasources/remote/parking_lot_remote_data_source_impl.dart';
import '../../data/datasources/remote/parking_schedule_remote_data_source.dart';
import '../../data/datasources/remote/parking_schedule_remote_data_source_impl.dart';
import '../../data/repositories/parking_lot_has_parking_schedule_repository_impl.dart';
import '../../data/repositories/parking_lot_repository_impl.dart';
import '../../data/repositories/parking_schedule_repository_impl.dart';
import '../../domain/repositories/parking_lot_has_parking_schedule_repository.dart';
import '../../domain/repositories/parking_lot_repository.dart';
import '../../domain/repositories/parking_schedule_repository.dart';
import '../../domain/usecases/get_parking_schedule_list_use_case.dart';

final parkingLotLocalDataSourceProvider = Provider<ParkingLotLocalDataSource>((
  ref,
) {
  final sqfliteDatabase = ref.watch(sqfliteDatabaseProvider);

  return ParkingLotLocalDataSourceImpl(sqfliteDatabase: sqfliteDatabase);
});

final parkingScheduleLocalDataSourceProvider =
    Provider<ParkingScheduleLocalDataSource>((ref) {
      final sqfliteDatabase = ref.watch(sqfliteDatabaseProvider);

      return ParkingScheduleLocalDataSourceImpl(
        sqfliteDatabase: sqfliteDatabase,
      );
    });

final parkingLotHasParkingScheduleLocalDataSourceProvider =
    Provider<ParkingLotHasParkingScheduleLocalDataSource>((ref) {
      final sqfliteDatabase = ref.watch(sqfliteDatabaseProvider);

      return ParkingLotHasParkingScheduleLocalDataSourceImpl(
        sqfliteDatabase: sqfliteDatabase,
      );
    });

final parkingLotRemoteDataSourceProvider = Provider<ParkingLotRemoteDataSource>(
  (ref) {
    final firestore = ref.watch(firestoreProvider);
    return ParkingLotRemoteDataSourceImpl(firestore: firestore);
  },
);

final parkingScheduleRemoteDataSourceProvider =
    Provider<ParkingScheduleRemoteDataSource>((ref) {
      final firestore = ref.watch(firestoreProvider);
      return ParkingScheduleRemoteDataSourceImpl(firestore: firestore);
    });

final parkingLotHasParkingScheduleRemoteDataSourceProvider =
    Provider<ParkingLotHasParkingScheduleRemoteDataSource>((ref) {
      final firestore = ref.watch(firestoreProvider);
      return ParkingLotHasParkingScheduleRemoteDataSourceImpl(
        firestore: firestore,
      );
    });

final parkingLotRepositoryProvider = Provider<ParkingLotRepository>((ref) {
  final parkingLotLocalDataSource = ref.watch(
    parkingLotLocalDataSourceProvider,
  );
  final parkingLotRemoteDataSource = ref.watch(
    parkingLotRemoteDataSourceProvider,
  );
  final networkInfo = ref.watch(networkInfoProvider);
  return ParkingLotRepositoryImpl(
    localDataSource: parkingLotLocalDataSource,
    remoteDataSource: parkingLotRemoteDataSource,
    networkInfo: networkInfo,
  );
});

final parkingScheduleRepositoryProvider = Provider<ParkingScheduleRepository>((
  ref,
) {
  final parkingScheduleLocalDataSource = ref.watch(
    parkingScheduleLocalDataSourceProvider,
  );
  final parkingScheduleRemoteDataSource = ref.watch(
    parkingScheduleRemoteDataSourceProvider,
  );
  final networkInfo = ref.watch(networkInfoProvider);
  return ParkingScheduleRepositoryImpl(
    localDataSource: parkingScheduleLocalDataSource,
    remoteDataSource: parkingScheduleRemoteDataSource,
    networkInfo: networkInfo,
  );
});

final parkingLotHasParkingScheduleRepositoryProvider =
    Provider<ParkingLotHasParkingScheduleRepository>((ref) {
      final parkingLotHasParkingScheduleLocalDataSource = ref.watch(
        parkingLotHasParkingScheduleLocalDataSourceProvider,
      );
      final parkingLotHasParkingScheduleRemoteDataSource = ref.watch(
        parkingLotHasParkingScheduleRemoteDataSourceProvider,
      );
      final networkInfo = ref.watch(networkInfoProvider);
      return ParkingLotHasParkingScheduleRepositoryImpl(
        localDataSource: parkingLotHasParkingScheduleLocalDataSource,
        remoteDataSource: parkingLotHasParkingScheduleRemoteDataSource,
        networkInfo: networkInfo,
      );
    });

final getParkingScheduleListByDayUseCaseProvider =
    Provider<GetParkingScheduleListByDayUseCase>((ref) {
      final parkingLotRepository = ref.watch(parkingLotRepositoryProvider);
      final parkingScheduleRepository = ref.watch(
        parkingScheduleRepositoryProvider,
      );
      final parkingLotHasParkingScheduleRepository = ref.watch(
        parkingLotHasParkingScheduleRepositoryProvider,
      );
      return GetParkingScheduleListByDayUseCase(
        parkingLotRepository: parkingLotRepository,
        parkingScheduleRepository: parkingScheduleRepository,
        parkingLotHasParkingScheduleRepository:
            parkingLotHasParkingScheduleRepository,
      );
    });
