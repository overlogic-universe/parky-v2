import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/constant/failures/user_parking_exception_message_constant.dart';
import '../../core/di/user_parking_provider.dart';
import '../../core/extensions/user_parking_data_mapper_extension.dart';
import '../../core/failures/user_parking_exception.dart';
import '../../domain/usecases/get_vehicle_by_user_id.dart';
import 'vehicle_state.dart';

part 'vehicle_view_model.g.dart';

@Riverpod(keepAlive: true)
class VehicleViewModel extends _$VehicleViewModel {
  late final GetVehicleByUserIdUseCase getVehicleByUserIdUseCase;

  @override
  Future<VehicleState> build() async {
    getVehicleByUserIdUseCase = ref.read(getVehicleByUserIdUseCaseProvider);
    return VehicleState();
  }

  Future<void> fetch() async {
    state = const AsyncLoading();
    state = AsyncData(await _getVehicleByUserId());
  }

  Future<VehicleState> _getVehicleByUserId() async {
    try {
      final result = await getVehicleByUserIdUseCase();

      final data = result.data;
      if (data == null) {
        throw UserParkingException(
          message: UserParkingExceptionMessageConstant.vehicleNotFound(""),
          type: UserParkingFailureType.vehicleNotFound,
        );
      }
      final currentState = state.value ?? const VehicleState();
      final newState = currentState.copyWith(vehicleUiModel: data.toUiModel());

      log("VEHICLE DATA ${data.toUiModel().toString()}");

      state = AsyncData(newState);
      return newState;
    } catch (e, st) {
      state = AsyncError(e, st);
      return const VehicleState();
    }
  }
}
