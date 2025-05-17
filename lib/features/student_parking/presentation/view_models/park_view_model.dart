import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../student_parking/core/di/student_parking_provider.dart';
import '../../core/extensions/student_parking_data_mapper_extension.dart';
import '../../../student_parking/core/failures/student_parking_exception.dart';
import '../../../student_parking/core/failures/student_parking_failure_type.dart';
import '../../domain/usecases/get_park_history_by_student_id_use_case.dart';
import 'park_state.dart';

part 'park_view_model.g.dart';

@Riverpod(keepAlive: true)
class ParkViewModel extends _$ParkViewModel {
  late final GetCurrentParkingHistoryByStudentIdUseCase
  getCurrentParkingHistoryByStudentIdUseCase;

  @override
  Future<ParkState> build() async {
    getCurrentParkingHistoryByStudentIdUseCase = ref.watch(
      getCurrentParkingHistoryByStudentIdUseCaseProvider,
    );
    return const ParkState();
  }

  Future<void> fetch() async {
    state = const AsyncLoading();
    state = AsyncData(await _getParkHistoryByStudentId());
  }

  Future<ParkState> _getParkHistoryByStudentId() async {
    try {
      final result = await getCurrentParkingHistoryByStudentIdUseCase();

      final data = result.data;
      if (data == null) {
        throw StudentParkingException(
          type: StudentParkingFailureType.parkNotFound,
        );
      }
      final currentState = state.value ?? const ParkState();
      final newState = currentState.copyWith(
        parkingHistoryUiModel: data.toUiModel(),
      );

      log("PARK DATA ${data.toUiModel().toString()}");

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
