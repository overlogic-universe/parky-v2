import '../../../shared/domain/usecases/use_case.dart';
import '../entities/login_with_email_password_request.dart';
import '../entities/student_entity.dart';
import '../repositories/auth_repository.dart';

class LoginWithEmailAndPasswordUseCase
    implements UseCase<StudentEntity, LoginWithEmailPasswordRequest> {
  final AuthRepository repository;

  const LoginWithEmailAndPasswordUseCase({required this.repository});

  @override
  Future<StudentEntity> call({
    required LoginWithEmailPasswordRequest params,
  }) async {
    return repository.loginWithEmailAndPassword(
      loginWithEmailPasswordRequest: params,
    );
  }
}
