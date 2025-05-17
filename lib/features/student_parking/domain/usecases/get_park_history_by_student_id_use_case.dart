import '../../../../core/utils/resource_state.dart';
import '../../../shared/domain/usecases/no_params_use_case.dart';
import '../entities/parking_history_entity.dart';
import '../../../student_parking/domain/repositories/student_parking_repository.dart';

class GetParkHistoryByStudentIdUseCase
    implements NoParamsUseCase<ResourceState<ParkingHistoryEntity>> {
  final StudentParkingRepository repository;

  const GetParkHistoryByStudentIdUseCase({required this.repository});

  @override
  Future<ResourceState<ParkingHistoryEntity>> call() async =>
      repository.getParkHistoryByStudentId();
}
