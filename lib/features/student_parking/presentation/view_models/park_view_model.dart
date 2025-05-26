import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../student_parking/core/di/student_parking_provider.dart';
import '../../../student_parking/core/failures/student_parking_exception.dart';
import '../../../student_parking/core/failures/student_parking_failure_type.dart';
import '../../core/extensions/student_parking_data_mapper_extension.dart';
import '../../domain/usecases/get_current_park_history_by_student_id_use_case.dart';
import '../../domain/usecases/get_current_parking_lot_by_student_id_use_case.dart';
import 'park_state.dart';

part 'park_view_model.g.dart';

@Riverpod(keepAlive: true)
class ParkViewModel extends _$ParkViewModel {
  late final GetCurrentParkingHistoryByStudentIdUseCase
  getCurrentParkingHistoryByStudentIdUseCase;
  late final GetCurrentParkingLotByStudentIdUseCase
  getCurrentParkingLotByStudentIdUseCase;

  @override
  Future<ParkState> build() async {
    getCurrentParkingHistoryByStudentIdUseCase = ref.watch(
      getCurrentParkingHistoryByStudentIdUseCaseProvider,
    );
    getCurrentParkingLotByStudentIdUseCase = ref.watch(
      getCurrentParkingLotByStudentIdUseCaseProvider,
    );
    return const ParkState();
  }

  Future<ParkState> _getParkHistoryByStudentId() async {
    try {
      final currentParkingHistoryResult =
          await getCurrentParkingHistoryByStudentIdUseCase();
      final currentParkingLotResult =
          await getCurrentParkingLotByStudentIdUseCase();

      final currentParkingHistoryData = currentParkingHistoryResult.data;
      final currentParkingLotData = currentParkingLotResult.data;
      if (currentParkingHistoryData == null) {
        throw StudentParkingException(
          type: StudentParkingFailureType.parkNotFound,
        );
      }
      if (currentParkingLotData == null) {
        throw StudentParkingException(
          type: StudentParkingFailureType.paringkLotNotFound,
        );
      }

      final currentState = state.value ?? const ParkState();
      final newState = currentState.copyWith(
        currentParkingHistory: currentParkingHistoryData.toUiModel(),
        currentParkingLot: currentParkingLotData,
      );

      state = AsyncData(newState);
      return newState;
    } catch (e, st) {
      state = AsyncError(e, st);
      return const ParkState();
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _getParkHistoryByStudentId());
  }
}
