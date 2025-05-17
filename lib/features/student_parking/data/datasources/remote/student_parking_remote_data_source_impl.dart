import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/extensions/firebase_extension.dart';
import '../../../../auth/core/failures/auth_exception.dart';
import '../../../../auth/core/failures/auth_failure_type.dart';
import '../../../../parking_lot/data/models/parking_lot_model.dart';
import '../../../../student_parking/core/failures/student_parking_exception.dart';
import '../../../../student_parking/core/failures/student_parking_failure_type.dart';
import '../../models/parking_activity_model.dart';
import '../../models/parking_history_model.dart';
import '../../models/vehicle_model.dart';
import 'student_parking_remote_data_source.dart';

class StudentParkingRemoteDataSourceImpl
    implements StudentParkingRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  const StudentParkingRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  String _getStudentId() {
    final student = firebaseAuth.currentUser;
    if (student == null) {
      throw AuthException(type: AuthFailureType.studentNotFound);
    }
    return student.uid;
  }

  Future<ParkingActivityModel> _getLatestParkingActivityByStudentId() async {
    final studentId = _getStudentId();

    final query =
        await firestore.parkingActivityCollection
            .whereIsEqualToStudentId(studentId)
            .orderByCreatedAt(descending: true)
            .limit(1)
            .get();

    if (query.docs.isEmpty) {
      throw StudentParkingException(
        studentId: studentId,
        type: StudentParkingFailureType.parkNotFound,
      );
    }

    return ParkingActivityModel.fromFirestore(query.docs.first);
  }

  @override
  Future<ParkingHistoryModel> getCurrentParkingHistoryByStudentId() async {
    final studentId = _getStudentId();
    final activity = await _getLatestParkingActivityByStudentId();

    final parkingHistoryDoc =
        await firestore.parkingHistoriesCollection
            .doc(activity.parkingHistoryId)
            .get();

    if (!parkingHistoryDoc.exists) {
      throw StudentParkingException(
        studentId: studentId,
        type: StudentParkingFailureType.parkNotFound,
      );
    }

    final parkingHistoryModel = ParkingHistoryModel.fromFirestore(
      parkingHistoryDoc as QueryDocumentSnapshot<Map<String, dynamic>>,
    );

    return parkingHistoryModel;
  }

  @override
  Future<VehicleModel> getVehicleByStudentId() async {
    final studentId = _getStudentId();
    final query =
        await firestore.vehichlesCollection
            .whereIsEqualToStudentId(studentId)
            .limit(1)
            .get();

    if (query.docs.isEmpty) {
      throw StudentParkingException(
        studentId: studentId,
        type: StudentParkingFailureType.vehicleNotFound,
      );
    }

    final model = VehicleModel.fromFirestore(
      query.docs.first as QueryDocumentSnapshot<Map<String, dynamic>>,
    );
    return model;
  }

  @override
  Future<ParkingLotModel> getCurrentParkingLotByStudentId() async {
    final studentId = _getStudentId();
    final activity = await _getLatestParkingActivityByStudentId();

    final parkingLotDoc =
        await firestore.parkingLotsCollection.doc(activity.parkingLotId).get();

    if (!parkingLotDoc.exists) {
      throw StudentParkingException(
        studentId: studentId,
        type: StudentParkingFailureType.parkNotFound,
      );
    }

    final parkingLotModel = ParkingLotModel.fromFirestore(
      parkingLotDoc as QueryDocumentSnapshot<Map<String, dynamic>>,
    );

    return parkingLotModel;
  }
}
