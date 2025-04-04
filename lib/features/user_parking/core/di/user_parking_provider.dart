import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/provider.dart';
import '../../data/datasources/local/user_parking_local_data_source.dart';
import '../../data/datasources/local/user_parking_local_data_source_impl.dart';
import '../../data/datasources/remote/user_parking_remote_data_source.dart';
import '../../data/datasources/remote/user_parking_remote_data_source_impl.dart';
import '../../data/repositories/user_parking_repository_impl.dart';
import '../../domain/repositories/user_parking_repository.dart';
import '../../domain/usecases/get_park_by_user_id_use_case.dart';
import '../../domain/usecases/get_vehicle_by_user_id.dart';


final userParkingLocalDataSourceProvider = Provider<UserParkingLocalDataSource>((ref) {
  final sqfliteDatabase = ref.watch(sqfliteDatabaseProvider);

  return UserParkingLocalDataSourceImpl(
    sqfliteDatabase: sqfliteDatabase,
  );
});

final userParkingRemoteDataSourceProvider = Provider<UserParkingRemoteDataSource>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final firestore = ref.watch(firestoreProvider);

  return UserParkingRemoteDataSourceImpl(
    firebaseAuth: firebaseAuth,
    firestore: firestore,

  );
});

final userParkingRepositoryProvider = Provider<UserParkingRepository>((ref) {
  final userParkingLocalDataSource = ref.watch(userParkingLocalDataSourceProvider);
  final userParkingRemoteDataSource = ref.watch(userParkingRemoteDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return UserParkingRepositoryImpl(
    localDataSource: userParkingLocalDataSource,
    remoteDataSource: userParkingRemoteDataSource,
    networkInfo: networkInfo,
  );
});

final getParkByUserIdUseCaseProvider = Provider<GetParkByUserIdUseCase>((ref) {
  final repository = ref.watch(userParkingRepositoryProvider);
  return GetParkByUserIdUseCase(repository: repository);
});

final getVehicleByUserIdUseCaseProvider = Provider<GetVehicleByUserIdUseCase>((ref) {
  final repository = ref.watch(userParkingRepositoryProvider);
  return GetVehicleByUserIdUseCase(repository: repository);
});

