import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'vehicle_state.dart';

part 'vehicle_view_model.g.dart';

@Riverpod(keepAlive: true)
class VehicleViewModel extends _$VehicleViewModel {
  @override
  VehicleState build() => VehicleState();
}
