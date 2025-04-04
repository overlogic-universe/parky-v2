import '../../../shared/domain/usecases/use_case.dart';
import '../entities/user_entity.dart';
import '../entities/login_with_email_password_request.dart';
import '../repositories/auth_repository.dart';

class LoginWithEmailAndPasswordUseCase
    implements UseCase<UserEntity, LoginWithEmailPasswordRequest> {
  final AuthRepository repository;

  const LoginWithEmailAndPasswordUseCase({required this.repository});

  @override
  Future<UserEntity> call(
    LoginWithEmailPasswordRequest loginWithEmailPasswordRequest,
  ) async {
    return repository.loginWithEmailAndPassword(
      loginWithEmailPasswordRequest: loginWithEmailPasswordRequest,
    );
  }
}
