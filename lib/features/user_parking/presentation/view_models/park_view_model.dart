import 'package:parky/features/user_parking/core/di/user_parking_provider.dart';
import 'package:parky/features/user_parking/domain/usecases/get_park_by_user_id_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/resource_state.dart';
import '../../domain/entities/park_entity.dart';
import 'park_state.dart';

part 'park_view_model.g.dart';

@Riverpod(keepAlive: true)
class ParkViewModel extends _$ParkViewModel {
  late final GetParkByUserIdUseCase getParkByUserIdUseCase;
  @override
  ParkState build() =>ParkState();
  // Future<ParkState> build() => _getParkByUserId();

  // Future<ParkState> _getParkByUserId() {
  //   final Future<ResourceState<ParkEntity>> data =
  //       ref.read(getParkByUserIdUseCaseProvider).call();
  //   // data.whenComplete(() => ,);
  // }
}
