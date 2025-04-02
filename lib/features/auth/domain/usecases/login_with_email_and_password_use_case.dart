import '../../../shared/domain/usecases/use_case.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class LoginWithEmailAndPasswordUseCase
    implements UseCase<AuthEntity, AuthEntity> {
  final AuthRepository repository;

  const LoginWithEmailAndPasswordUseCase({required this.repository});

  @override
  Future<AuthEntity> call(AuthEntity authEntity) async {
    return repository.loginWithEmailAndPassword(authEntity: authEntity);
  }
}
