import '../../../shared/domain/usecases/no_params_use_case.dart';
import '../entities/student_entity.dart';
import '../repositories/auth_repository.dart';

class LoginWithGoogleUseCase implements NoParamsUseCase<StudentEntity> {
  final AuthRepository repository;

  const LoginWithGoogleUseCase({required this.repository});

  @override
  Future<StudentEntity> call() async => repository.loginWithGoogle();
}
