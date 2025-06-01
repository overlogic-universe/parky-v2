import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/failures/common_failure_type.dart';
import '../../../../core/failures/exception.dart';
import '../../../../core/utils/resource_state.dart';
import '../../../shared/data/datasources/remote/network_bound_resource.dart';
import '../../../shared/data/datasources/remote/network_info.dart';
import '../../core/extensions/auth_data_mapper_extension.dart';
import '../../core/failures/auth_exception.dart';
import '../../core/failures/auth_failure_type.dart';
import '../../domain/entities/login_with_email_password_request.dart';
import '../../domain/entities/student_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/local/auth_local_data_source.dart';
import '../datasources/remote/auth_remote_data_source.dart';
import '../models/student_model.dart';

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
  Future<StudentEntity> loginWithEmailAndPassword({
    required LoginWithEmailPasswordRequest loginWithEmailPasswordRequest,
  }) async {
    return networkInfo.safeNetworkRequest(
      result: () async {
        try {
          final student = await remoteDataSource.loginWithEmailAndPassword(
            loginWithEmailPasswordRequest: loginWithEmailPasswordRequest,
          );
          await localDataSource.saveAuthToken(student.id);
          return student.toEntity();
        } on FirebaseAuthException catch (e) {
          log("loginWithEmailAndPassword FAILED: ${e.message}");
          log("loginWithEmailAndPassword FAILED code: ${e.code}");
          if (e.code == 'wrong-password') {
            throw AuthException(type: AuthFailureType.invalidCredentials);
          } else if (e.code == 'invalid-credential') {
            throw AuthException(type: AuthFailureType.invalidCredentials);
          } else if (e.code == 'Student-not-found') {
            throw AuthException(type: AuthFailureType.studentNotFound);
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
  Future<StudentEntity> loginWithGoogle() async {
    return networkInfo.safeNetworkRequest(
      result: () async {
        try {
          final student = await remoteDataSource.loginWithGoogle();
          await localDataSource.saveAuthToken(student.id);
          return student.toEntity();
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
          await localDataSource.deleteAllStudents();
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
  Future<ResourceState<StudentEntity>> getStudentEntity() {
    return NetworkBoundResource<StudentEntity, StudentModel?>(
      networkInfo: networkInfo,
      loadFromDB: () async {
        try {
          final model = await localDataSource.getStudentModel();
          return model.toEntity();
        } catch (_) {
          return null;
        }
      },
      shouldFetch: (data) => data == null,
      createCall: () => remoteDataSource.getStudentModel(),
      saveCallResult: (model) => localDataSource.saveStudentModel(model),
    ).fetchData();
  }

  @override
  Future<String?> isLogin() async => localDataSource.getAuthToken();

  @override
  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    await networkInfo.safeNetworkRequest(
      result: () async {
        try {
          await remoteDataSource.updatePassword(
            oldPassword: oldPassword,
            newPassword: newPassword,
          );
        } on FirebaseAuthException catch (e) {
          switch (e.code) {
            case 'wrong-password':
              throw AuthException(type: AuthFailureType.wrongOldPassword);
            case 'requires-recent-login':
              throw AuthException(type: AuthFailureType.requiresRecentLogin);
            case 'user-not-found':
              throw AuthException(type: AuthFailureType.studentNotFound);
            case 'invalid-credential':
              throw AuthException(type: AuthFailureType.wrongOldPassword);
            default:
              throw AuthException(type: AuthFailureType.updatePasswordFailed);
          }
        } catch (_) {
          throw AuthException(type: AuthFailureType.updatePasswordFailed);
        }
      },
    );
  }
}
