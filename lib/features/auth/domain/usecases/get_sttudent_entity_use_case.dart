import '../../../../core/utils/resource_state.dart';
import '../../../shared/domain/usecases/no_params_use_case.dart';
import '../entities/student_entity.dart';
import '../repositories/auth_repository.dart';

class GetStudentEntityUseCase implements NoParamsUseCase<ResourceState<StudentEntity>> {
  final AuthRepository repository;

  const GetStudentEntityUseCase({required this.repository});

  @override
  Future<ResourceState<StudentEntity>> call() async => repository.getStudentEntity();
}
