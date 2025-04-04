import '../../../shared/domain/usecases/no_params_use_case.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginWithGoogleUseCase implements NoParamsUseCase<UserEntity> {
  final AuthRepository repository;

  const LoginWithGoogleUseCase({required this.repository});

  @override
  Future<UserEntity> call() async => repository.loginWithGoogle();
}
