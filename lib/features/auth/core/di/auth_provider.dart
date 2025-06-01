import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/provider.dart';
import '../../data/datasources/local/auth_local_data_source.dart';
import '../../data/datasources/local/auth_local_data_source_impl.dart';
import '../../data/datasources/remote/auth_remote_data_source.dart';
import '../../data/datasources/remote/auth_remote_data_source_impl.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/get_sttudent_entity_use_case.dart';
import '../../domain/usecases/is_login_use_case.dart';
import '../../domain/usecases/login_with_email_and_password_use_case.dart';
import '../../domain/usecases/login_with_google_use_case.dart';
import '../../domain/usecases/sign_out_use_case.dart';
import '../../domain/usecases/update_password_use_case.dart';

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  final sqfliteDatabase = ref.watch(sqfliteDatabaseProvider);

  return AuthLocalDataSourceImpl(
    sharedPreferences: sharedPreferences,
    sqfliteDatabase: sqfliteDatabase,
  );
});
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final firestore = ref.watch(firestoreProvider);
  final googleSignIn = ref.watch(googleSignInProvider);

  return AuthRemoteDataSourceImpl(
    firebaseAuth: firebaseAuth,
    firestore: firestore,
    googleSignIn: googleSignIn,
  );
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authLocalDataSource = ref.watch(authLocalDataSourceProvider);
  final authRemoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return AuthRepositoryImpl(
    localDataSource: authLocalDataSource,
    remoteDataSource: authRemoteDataSource,
    networkInfo: networkInfo,
  );
});

final getStudentEntityUseCaseProvider = Provider<GetStudentEntityUseCase>((
  ref,
) {
  final repository = ref.watch(authRepositoryProvider);
  return GetStudentEntityUseCase(repository: repository);
});

final loginWithEmailAndPasswordUseCaseProvider =
    Provider<LoginWithEmailAndPasswordUseCase>((ref) {
      final repository = ref.watch(authRepositoryProvider);
      return LoginWithEmailAndPasswordUseCase(repository: repository);
    });

final loginWithGoogleUseCaseProvider = Provider<LoginWithGoogleUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginWithGoogleUseCase(repository: repository);
});

final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignOutUseCase(repository: repository);
});

final updatePasswordUseCaseProvider = Provider<UpdatePasswordUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return UpdatePasswordUseCase(repository: repository);
});

final isLoginUseCaseProvider = Provider<IsLoginUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return IsLoginUseCase(repository: repository);
});
