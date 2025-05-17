import '../../../../core/utils/resource_state.dart';
import '../../../shared/domain/usecases/no_params_use_case.dart';
import '../entities/vehicle_entity.dart';
import '../../../student_parking/domain/repositories/student_parking_repository.dart';

class GetVehicleByStudentIdUseCase
    implements NoParamsUseCase<ResourceState<VehicleEntity>> {
  final StudentParkingRepository repository;

  const GetVehicleByStudentIdUseCase({required this.repository});

  @override
  Future<ResourceState<VehicleEntity>> call() async =>
      repository.getVehicleByStudentId();
}
