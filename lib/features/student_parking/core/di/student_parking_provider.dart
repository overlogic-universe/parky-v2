import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/provider.dart';
import '../../../student_parking/data/datasources/local/student_parking_local_data_source.dart';
import '../../../student_parking/data/datasources/local/student_parking_local_data_source_impl.dart';
import '../../data/datasources/remote/student_parking_remote_data_source.dart';
import '../../../student_parking/data/datasources/remote/student_parking_remote_data_source_impl.dart';
import '../../../student_parking/data/repositories/student_parking_repository_impl.dart';
import '../../../student_parking/domain/repositories/student_parking_repository.dart';
import '../../domain/usecases/get_park_by_student_id_use_case.dart';
import '../../domain/usecases/get_vehicle_by_student_id.dart';

final StudentParkingLocalDataSourceProvider =
    Provider<StudentParkingLocalDataSource>((ref) {
      final sqfliteDatabase = ref.watch(sqfliteDatabaseProvider);

      return StudentParkingLocalDataSourceImpl(
        sqfliteDatabase: sqfliteDatabase,
      );
    });

final StudentParkingRemoteDataSourceProvider =
    Provider<StudentParkingRemoteDataSource>((ref) {
      final firebaseAuth = ref.watch(firebaseAuthProvider);
      final firestore = ref.watch(firestoreProvider);

      return StudentParkingRemoteDataSourceImpl(
        firebaseAuth: firebaseAuth,
        firestore: firestore,
      );
    });

final StudentParkingRepositoryProvider = Provider<StudentParkingRepository>((
  ref,
) {
  final StudentParkingLocalDataSource = ref.watch(
    StudentParkingLocalDataSourceProvider,
  );
  final StudentParkingRemoteDataSource = ref.watch(
    StudentParkingRemoteDataSourceProvider,
  );
  final networkInfo = ref.watch(networkInfoProvider);
  return StudentParkingRepositoryImpl(
    localDataSource: StudentParkingLocalDataSource,
    remoteDataSource: StudentParkingRemoteDataSource,
    networkInfo: networkInfo,
  );
});

final getParkByStudentIdUseCaseProvider = Provider<GetParkByStudentIdUseCase>((
  ref,
) {
  final repository = ref.watch(StudentParkingRepositoryProvider);
  return GetParkByStudentIdUseCase(repository: repository);
});

final getVehicleByStudentIdUseCaseProvider =
    Provider<GetVehicleByStudentIdUseCase>((ref) {
      final repository = ref.watch(StudentParkingRepositoryProvider);
      return GetVehicleByStudentIdUseCase(repository: repository);
    });
