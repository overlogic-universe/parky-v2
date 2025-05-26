import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../../core/extensions/firebase_extension.dart';
import '../../../../../core/extensions/list_extension.dart';
import '../../models/parking_assignment.dart';
import '../../models/parking_schedule_model.dart';
import 'parking_lot_has_parking_schedule_remote_data_source.dart';

class ParkingAssignmentRemoteDataSourceImpl
    implements ParkingAssignmentRemoteDataSource {
  final FirebaseFirestore firestore;

  const ParkingAssignmentRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<ParkingAssignmentModel>> getParkingAssignmentListByScheduleIds(
    List<ParkingScheduleModel> parkingScheduleList,
  ) async {
    // TODO: Add pagination

    if (parkingScheduleList.isEmpty) return [];

    final scheduleIds = parkingScheduleList.map((e) => e.id).toList();

    final chunks = scheduleIds.chunked(10);
    List<QueryDocumentSnapshot> allDocs = [];

    for (final chunk in chunks) {
      final snapshot =
          await firestore.parkingAssignmentsCollection
              .whereParkingScheduleIdIn(chunk)
              .get();
      allDocs.addAll(snapshot.docs);
    }

    final data =
        allDocs
            .map(
              (doc) => ParkingAssignmentModel.fromFirestore(
                doc as DocumentSnapshot<Map<String, dynamic>>,
              ).copyWith(id: doc.id),
            )
            .toList();

    log("ParkingAssignment $data");
    return data;
  }
}
