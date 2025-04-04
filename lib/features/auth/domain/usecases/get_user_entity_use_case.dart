import '../../../../core/utils/resource_state.dart';
import '../../../shared/domain/usecases/no_params_use_case.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class GetUserEntityUseCase implements NoParamsUseCase<ResourceState<UserEntity>> {
  final AuthRepository repository;

  const GetUserEntityUseCase({required this.repository});

  @override
  Future<ResourceState<UserEntity>> call() async => repository.getUserEntity();
}
