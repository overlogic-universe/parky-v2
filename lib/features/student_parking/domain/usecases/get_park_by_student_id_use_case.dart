import '../../../../core/utils/resource_state.dart';
import '../../../shared/domain/usecases/no_params_use_case.dart';
import '../entities/park_entity.dart';
import '../../../student_parking/domain/repositories/student_parking_repository.dart';

class GetParkByStudentIdUseCase
    implements NoParamsUseCase<ResourceState<ParkEntity>> {
  final StudentParkingRepository repository;

  const GetParkByStudentIdUseCase({required this.repository});

  @override
  Future<ResourceState<ParkEntity>> call() async =>
      repository.getParkBystudentId();
}
