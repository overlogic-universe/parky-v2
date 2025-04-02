import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/constants/failures/exception_message_constant.dart';
import '../../../../core/failures/exception.dart';
import '../../../shared/data/remote/network_info.dart';
import '../../core/constants/failures/auth_exception_message_constant.dart';
import '../../core/extensions/auth_data_mapper_extension.dart';
import '../../core/failures/auth_exception.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/local/auth_local_data_source.dart';
import '../datasources/remote/auth_remote_data_source.dart';

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
  Future<AuthEntity> loginWithEmailAndPassword({
    required AuthEntity authEntity,
  }) async {
    return networkInfo.safeNetworkRequest(
      result: () async {
        try {
          if (authEntity.password == null) {
            throw Exception(AuthExceptionMessageConstant.passwordIsNull);
          }

          final authModel = await remoteDataSource.loginWithEmailAndPassword(
            authModel: authEntity.toModel(),
          );
          await localDataSource.saveAuthToken(authModel.id);
          return authModel.toEntity();
        } on FirebaseAuthException catch (e) {
          if (e.code == 'wrong-password') {
            throw AuthException(
              message: AuthExceptionMessageConstant.invalidCredentials,
              type: AuthFailureType.invalidCredentials,
            );
          } else if (e.code == 'user-not-found') {
            throw AuthException(
              message: AuthExceptionMessageConstant.userNotFound,
              type: AuthFailureType.userNotFound,
            );
          }
          throw CommonException(
            message: ExceptionMessageConstant.unknownError,
            type: CommonFailureType.unknownError,
          );
        } catch (e) {
          if (e is AuthException) {
            rethrow;
          } else {
            throw AuthException(
              message: AuthExceptionMessageConstant.loginFailed,
              type: AuthFailureType.loginFailed,
            );
          }
        }
      },
    );
  }

  @override
  Future<AuthEntity> loginWithGoogle() async {
    try {
      final authModel = await remoteDataSource.loginWithGoogle();
      await localDataSource.saveAuthToken(authModel.id);
      return authModel.toEntity();
    } catch (e) {
      if (e is AuthException) {
        rethrow;
      } else {
        throw AuthException(
          message: AuthExceptionMessageConstant.loginWithGoogleFailed,
          type: AuthFailureType.loginWithGoogleFailed,
        );
      }
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await remoteDataSource.signOut();
      await localDataSource.clearAuthToken();
    } catch (e) {
      if (e is AuthException) {
        rethrow;
      } else {
        throw AuthException(
          message: AuthExceptionMessageConstant.signOutFailed,
          type: AuthFailureType.signOutFailed,
        );
      }
    }
  }
}
