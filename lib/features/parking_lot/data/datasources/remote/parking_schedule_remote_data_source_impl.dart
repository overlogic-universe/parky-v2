import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../../core/extensions/firebase_extension.dart';
import '../../models/parking_schedule_model.dart';
import 'parking_schedule_remote_data_source.dart';

class ParkingScheduleRemoteDataSourceImpl
    implements ParkingScheduleRemoteDataSource {
  final FirebaseFirestore firestore;

  const ParkingScheduleRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<ParkingScheduleModel>> getParkingScheduleList(String day) async {
    // TODO: Add pagination

    final scheduleSnapshot =
        await firestore.parkingSchedulesCollection
            .whereIsEqualToDayOfWeek(day).whereIsNotClosed()
            .get();

    return scheduleSnapshot.docs
        .map(
          (snapshot) => ParkingScheduleModel.fromFirestore(
            snapshot as DocumentSnapshot<Map<String, dynamic>>,
          ),
        )
        .toList();
  }
}
