import '../../../shared/domain/usecases/no_params_use_case.dart';
import '../repositories/auth_repository.dart';

class SignOutUseCase implements NoParamsUseCase<void> {
  final AuthRepository repository;

  const SignOutUseCase({required this.repository});

  @override
  Future<void> call() async => repository.signOut();
}
