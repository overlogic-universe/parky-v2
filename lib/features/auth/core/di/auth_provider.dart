import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/provider.dart';
import '../../data/datasources/local/auth_local_data_source.dart';
import '../../data/datasources/local/auth_local_data_source_impl.dart';
import '../../data/datasources/remote/auth_remote_data_source.dart';
import '../../data/datasources/remote/auth_remote_data_source_impl.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/get_user_entity_use_case.dart';
import '../../domain/usecases/login_with_email_and_password_use_case.dart';
import '../../domain/usecases/login_with_google_use_case.dart';
import '../../domain/usecases/sign_out_use_case.dart';

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

final getUserEntityUseCaseProvider = Provider<GetUserEntityUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return GetUserEntityUseCase(repository: repository);
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
