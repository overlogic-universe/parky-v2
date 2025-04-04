import '../../../../core/utils/resource_state.dart';
import '../../../shared/domain/usecases/no_params_use_case.dart';
import '../entities/park_entity.dart';
import '../repositories/user_parking_repository.dart';

class GetParkByUserIdUseCase
    implements NoParamsUseCase<ResourceState<ParkEntity>> {
  final UserParkingRepository repository;

  const GetParkByUserIdUseCase({required this.repository});

  @override
  Future<ResourceState<ParkEntity>> call() async =>
      repository.getParkByUserId();
}
