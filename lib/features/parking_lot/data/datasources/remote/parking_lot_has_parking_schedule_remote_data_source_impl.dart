import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../../core/extensions/firebase_extension.dart';
import '../../models/parking_lots_has_parking_schedules_model.dart';
import '../../models/parking_schedule_model.dart';
import 'parking_lot_has_parking_schedule_remote_data_source.dart';

class ParkingLotHasParkingScheduleRemoteDataSourceImpl
    implements ParkingLotHasParkingScheduleRemoteDataSource {
  final FirebaseFirestore firestore;

  const ParkingLotHasParkingScheduleRemoteDataSourceImpl({
    required this.firestore,
  });

  @override
  Future<List<ParkingLotHasParkingScheduleModel>>
  getParkingLotHasParkingScheduleListByScheduleIds(
    List<ParkingScheduleModel> parkingScheduleList,
  ) async {
    // TODO: Add pagination

    if (parkingScheduleList.isEmpty) return [];

    final scheduleIds = parkingScheduleList.map((e) => e.id).toList();

    final snapshot =
        await firestore.parkingLotsHasParkingSchedulesCollection
            .whereIsEqualToParkingScheduleId(scheduleIds)
            .get();

    return snapshot.docs
        .map(
          (doc) => ParkingLotHasParkingScheduleModel.fromFirestore(
            doc.data() as DocumentSnapshot<Map<String, dynamic>>,
          ).copyWith(id: doc.id),
        )
        .toList();
  }
}
