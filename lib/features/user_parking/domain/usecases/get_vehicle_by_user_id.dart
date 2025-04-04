import '../../../../core/utils/resource_state.dart';
import '../../../shared/domain/usecases/no_params_use_case.dart';
import '../entities/vehicle_entity.dart';
import '../repositories/user_parking_repository.dart';

class GetVehicleByUserIdUseCase
    implements NoParamsUseCase<ResourceState<VehicleEntity>> {
  final UserParkingRepository repository;

  const GetVehicleByUserIdUseCase({required this.repository});

  @override
  Future<ResourceState<VehicleEntity>> call() async =>
      repository.getVehicleByUserId();
}
