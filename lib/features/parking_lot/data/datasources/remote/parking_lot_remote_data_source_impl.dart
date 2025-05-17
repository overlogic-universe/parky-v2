import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../../core/extensions/firebase_extension.dart';
import '../../models/parking_lot_model.dart';
import '../../models/parking_lots_has_parking_schedules_model.dart';
import 'parking_lot_remote_data_source.dart';

class ParkingLotRemoteDataSourceImpl implements ParkingLotRemoteDataSource {
  final FirebaseFirestore firestore;

  const ParkingLotRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<ParkingLotModel>>
  getParkingLotListByParkingLotHasParkingScheduleId(
    List<ParkingLotHasParkingScheduleModel> parkingLotHasParkingScheduleList,
  ) async {
    // TODO: Add pagination

    if (parkingLotHasParkingScheduleList.isEmpty) return [];

    try {
      final parkingLotIds =
          parkingLotHasParkingScheduleList
              .map((e) => e.parkingLotId)
              .toSet()
              .toList();

      final snapshot =
          await firestore.parkingLotsCollection
              .where(FieldPath.documentId, whereIn: parkingLotIds)
              .get();

      return snapshot.docs
          .map(
            (doc) => ParkingLotModel.fromFirestore(
              doc.data() as DocumentSnapshot<Map<String, dynamic>>,
            ).copyWith(id: doc.id),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
