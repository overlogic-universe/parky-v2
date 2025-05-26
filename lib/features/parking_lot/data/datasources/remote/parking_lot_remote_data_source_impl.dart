import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../../core/extensions/firebase_extension.dart';
import '../../models/parking_lot_model.dart';
import '../../models/parking_assignment.dart';
import 'parking_lot_remote_data_source.dart';

class ParkingLotRemoteDataSourceImpl implements ParkingLotRemoteDataSource {
  final FirebaseFirestore firestore;

  const ParkingLotRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<ParkingLotModel>> getParkingLotListByParkingAssignmentId(
    List<ParkingAssignmentModel> parkingAssignmentList,
  ) async {
    if (parkingAssignmentList.isEmpty) return [];

    try {
      final parkingLotIds =
          parkingAssignmentList.map((e) => e.parkingLotId).toSet().toList();

      // Ambil semua data parking lot
      final snapshot =
          await firestore.parkingLotsCollection
              .where(FieldPath.documentId, whereIn: parkingLotIds)
              .get();

      final parkingLotModels =
          snapshot.docs
              .map(
                (doc) => ParkingLotModel.fromFirestore(
                  doc as DocumentSnapshot<Map<String, dynamic>>,
                ).copyWith(id: doc.id),
              )
              .toList();

      // Ambil parking_activities terbaru untuk setiap parking_lot
      final List<Future<({String parkingLotId, int vehicleInCount})>> futures =
          [];

      for (final parkingLot in parkingLotModels) {
        final future = firestore.parkingActivitiesCollection
            .whereIsEqualToParkingLotId(parkingLot.id)
            .orderByUpdatedAt(descending: true)
            .limit(1)
            .get()
            .then((snap) {
              if (snap.docs.isNotEmpty) {
                final doc = snap.docs.first.data() as Map<String, dynamic>;
                final raw = doc['vehicle_in_count'];
                final count =
                    raw is int ? raw : int.tryParse(raw.toString()) ?? 0;
                return (parkingLotId: parkingLot.id, vehicleInCount: count);
              } else {
                return (parkingLotId: parkingLot.id, vehicleInCount: 0);
              }
            });

        futures.add(future);
      }

      final activityResults = await Future.wait(futures);

      final countMap = {
        for (var e in activityResults) e.parkingLotId: e.vehicleInCount,
      };

      final updatedList =
          parkingLotModels
              .map((lot) => lot.copyWith(vehicleInCount: countMap[lot.id] ?? 0))
              .toList();

      return updatedList;
    } catch (e) {
      rethrow;
    }
  }
}
