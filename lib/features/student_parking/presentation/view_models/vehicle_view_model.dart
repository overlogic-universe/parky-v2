import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../student_parking/core/di/student_parking_provider.dart';
import '../../../student_parking/core/failures/student_parking_exception.dart';
import '../../../student_parking/core/failures/student_parking_failure_type.dart';
import '../../domain/usecases/get_vehicle_by_student_id.dart';
import 'vehicle_state.dart';

part 'vehicle_view_model.g.dart';

@Riverpod(keepAlive: true)
class VehicleViewModel extends _$VehicleViewModel {
  late final GetVehicleByStudentIdUseCase getVehicleByStudentIdUseCase;

  @override
  Future<VehicleState> build() async {
    getVehicleByStudentIdUseCase = ref.watch(
      getVehicleByStudentIdUseCaseProvider,
    );
    return VehicleState();
  }

  Future<VehicleState> _getVehicleByStudentId() async {
    try {
      final result = await getVehicleByStudentIdUseCase();

      final data = result.data;
      if (data == null) {
        throw StudentParkingException(
          type: StudentParkingFailureType.vehicleNotFound,
        );
      }
      final currentState = state.value ?? const VehicleState();
      final newState = currentState.copyWith(vehicle: data);

      state = AsyncData(newState);
      return newState;
    } catch (e, st) {
      state = AsyncError(e, st);
      return const VehicleState();
    }
  }
  
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _getVehicleByStudentId());
  }
}
