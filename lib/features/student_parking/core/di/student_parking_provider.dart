import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/provider.dart';
import '../../../student_parking/data/datasources/local/student_parking_local_data_source.dart';
import '../../../student_parking/data/datasources/local/student_parking_local_data_source_impl.dart';
import '../../../student_parking/data/datasources/remote/student_parking_remote_data_source_impl.dart';
import '../../../student_parking/data/repositories/student_parking_repository_impl.dart';
import '../../../student_parking/domain/repositories/student_parking_repository.dart';
import '../../data/datasources/remote/student_parking_remote_data_source.dart';
import '../../domain/usecases/get_park_history_by_student_id_use_case.dart';
import '../../domain/usecases/get_vehicle_by_student_id.dart';

final studentParkingLocalDataSourceProvider =
    Provider<StudentParkingLocalDataSource>((ref) {
      final sqfliteDatabase = ref.watch(sqfliteDatabaseProvider);

      return StudentParkingLocalDataSourceImpl(
        sqfliteDatabase: sqfliteDatabase,
      );
    });

final studentParkingRemoteDataSourceProvider =
    Provider<StudentParkingRemoteDataSource>((ref) {
      final firebaseAuth = ref.watch(firebaseAuthProvider);
      final firestore = ref.watch(firestoreProvider);

      return StudentParkingRemoteDataSourceImpl(
        firebaseAuth: firebaseAuth,
        firestore: firestore,
      );
    });

final studentParkingRepositoryProvider = Provider<StudentParkingRepository>((
  ref,
) {
  final studentParkingLocalDataSource = ref.watch(
    studentParkingLocalDataSourceProvider,
  );
  final studentParkingRemoteDataSource = ref.watch(
    studentParkingRemoteDataSourceProvider,
  );
  final networkInfo = ref.watch(networkInfoProvider);
  return StudentParkingRepositoryImpl(
    localDataSource: studentParkingLocalDataSource,
    remoteDataSource: studentParkingRemoteDataSource,
    networkInfo: networkInfo,
  );
});

final getCurrentParkingHistoryByStudentIdUseCaseProvider =
    Provider<GetCurrentParkingHistoryByStudentIdUseCase>((ref) {
      final repository = ref.watch(studentParkingRepositoryProvider);
      return GetCurrentParkingHistoryByStudentIdUseCase(repository: repository);
    });

final getVehicleByStudentIdUseCaseProvider =
    Provider<GetVehicleByStudentIdUseCase>((ref) {
      final repository = ref.watch(studentParkingRepositoryProvider);
      return GetVehicleByStudentIdUseCase(repository: repository);
    });
