import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/failures/common_failure_type.dart';
import '../../../../core/failures/exception.dart';
import '../../../../core/utils/resource_state.dart';
import '../../../shared/data/remote/network_bound_resource.dart';
import '../../../shared/data/remote/network_info.dart';
import '../../core/extensions/auth_data_mapper_extension.dart';
import '../../core/failures/auth_exception.dart';
import '../../core/failures/auth_failure_type.dart';
import '../../domain/entities/login_with_email_password_request.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/local/auth_local_data_source.dart';
import '../datasources/remote/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<UserEntity> loginWithEmailAndPassword({
    required LoginWithEmailPasswordRequest loginWithEmailPasswordRequest,
  }) async {
    return networkInfo.safeNetworkRequest(
      result: () async {
        try {
          final userModel = await remoteDataSource.loginWithEmailAndPassword(
            loginWithEmailPasswordRequest: loginWithEmailPasswordRequest,
          );
          await localDataSource.saveAuthToken(userModel.id);
          return userModel.toEntity();
        } on FirebaseAuthException catch (e) {
          log("loginWithEmailAndPassword FAILED: ${e.message}");
          log("loginWithEmailAndPassword FAILED code: ${e.code}");
          if (e.code == 'wrong-password') {
            throw AuthException(type: AuthFailureType.invalidCredentials);
          } else if (e.code == 'invalid-credential') {
            throw AuthException(type: AuthFailureType.invalidCredentials);
          } else if (e.code == 'user-not-found') {
            throw AuthException(type: AuthFailureType.userNotFound);
          }
          throw CommonException(type: CommonFailureType.unknownError);
        } catch (e) {
          if (e is AuthException) {
            log("loginWithEmailAndPassword FAILED: ${e.message}");
            rethrow;
          } else {
            log("loginWithEmailAndPassword FAILED: ${e.toString()}");
            throw AuthException(type: AuthFailureType.loginFailed);
          }
        }
      },
    );
  }

  @override
  Future<UserEntity> loginWithGoogle() async {
    return networkInfo.safeNetworkRequest(
      result: () async {
        try {
          final userModel = await remoteDataSource.loginWithGoogle();
          await localDataSource.saveAuthToken(userModel.id);
          return userModel.toEntity();
        } catch (e) {
          if (e is AuthException) {
            log("loginWithGoogle FAILED: ${e.message}");
            rethrow;
          } else {
            log("loginWithGoogle FAILED: ${e.toString()}");
            throw AuthException(type: AuthFailureType.loginWithGoogleFailed);
          }
        }
      },
    );
  }

  @override
  Future<void> signOut() async {
    return networkInfo.safeNetworkRequest(
      result: () async {
        try {
          await remoteDataSource.signOut();
          await localDataSource.clearAuthToken();
        } catch (e) {
          if (e is AuthException) {
            rethrow;
          } else {
            throw AuthException(type: AuthFailureType.signOutFailed);
          }
        }
      },
    );
  }

  @override
  Future<ResourceState<UserEntity>> getUserEntity() {
    return NetworkBoundResource<UserEntity, UserModel?>(
      networkInfo: networkInfo,
      loadFromDB: () async {
        try {
          final model = await localDataSource.getUserModel();
          return model.toEntity();
        } catch (_) {
          return null;
        }
      },
      shouldFetch: (data) => data == null,
      createCall: () => remoteDataSource.getUserModel(),
      saveCallResult: (model) => localDataSource.saveUserModel(model),
    ).fetchData();
  }

  @override
  Future<String?> isLogin() async => localDataSource.getAuthToken();
}
