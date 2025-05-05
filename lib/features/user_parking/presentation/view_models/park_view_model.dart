import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/di/user_parking_provider.dart';
import '../../core/extensions/user_parking_data_mapper_extension.dart';
import '../../core/failures/user_parking_exception.dart';
import '../../core/failures/user_parking_failure_type.dart';
import '../../domain/usecases/get_park_by_user_id_use_case.dart';
import 'park_state.dart';

part 'park_view_model.g.dart';

@Riverpod(keepAlive: true)
class ParkViewModel extends _$ParkViewModel {
  late final GetParkByUserIdUseCase getParkByUserIdUseCase;

  @override
  Future<ParkState> build() async {
    getParkByUserIdUseCase = ref.read(getParkByUserIdUseCaseProvider);
    return const ParkState();
  }

  Future<void> fetch() async {
    state = const AsyncLoading();
    state = AsyncData(await _getParkByUserId());
  }

  Future<ParkState> _getParkByUserId() async {
    try {
      final result = await getParkByUserIdUseCase();

      final data = result.data;
      if (data == null) {
        throw UserParkingException(type: UserParkingFailureType.parkNotFound);
      }
      final currentState = state.value ?? const ParkState();
      final newState = currentState.copyWith(parkUiModel: data.toUiModel());

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
    state = AsyncData(await _getParkByUserId());
  }
}
