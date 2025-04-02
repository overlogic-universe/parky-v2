import '../../../shared/domain/usecases/no_params_use_case.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class LoginWithGoogleUseCase implements NoParamsUseCase<AuthEntity> {
  final AuthRepository repository;

  const LoginWithGoogleUseCase({required this.repository});

  @override
  Future<AuthEntity> call() async => repository.loginWithGoogle();
}
