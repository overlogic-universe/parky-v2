import '../../../../core/utils/resource_state.dart';
import '../../../parking_lot/domain/entities/parking_lot_entity.dart';
import '../../../shared/domain/usecases/no_params_use_case.dart';
import '../../../student_parking/domain/repositories/student_parking_repository.dart';

class GetCurrentParkingLotByStudentIdUseCase
    implements NoParamsUseCase<ResourceState<ParkingLotEntity>> {
  final StudentParkingRepository repository;

  const GetCurrentParkingLotByStudentIdUseCase({required this.repository});

  @override
  Future<ResourceState<ParkingLotEntity>> call() async =>
      repository.getCurrentParkingLotByStudentId();
}
