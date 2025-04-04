import '../../../shared/domain/usecases/no_params_use_case.dart';
import '../repositories/auth_repository.dart';

class IsLoginUseCase implements NoParamsUseCase<String?> {
  final AuthRepository repository;

  const IsLoginUseCase({required this.repository});

  @override
  Future<String?> call() async => repository.isLogin();
}
