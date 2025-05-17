import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/extensions/firebase_extension.dart';
import '../../../../auth/core/failures/auth_exception.dart';
import '../../../../auth/core/failures/auth_failure_type.dart';
import '../../../../student_parking/core/failures/student_parking_exception.dart';
import '../../../../student_parking/core/failures/student_parking_failure_type.dart';
import '../../models/parking_history_model.dart';
import '../../models/vehicle_model.dart';
import 'student_parking_remote_data_source.dart';

class StudentParkingRemoteDataSourceImpl
    implements StudentParkingRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  StudentParkingRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  @override
  Future<ParkingHistoryModel> getParkHistoryByStudentId() async {
    final studentId = _getstudentId();
    final query =
        await firestore.parkingActivityCollection.whereIsEqualToStudentId(
          studentId,
        ).limit(1).get();

    if (query.docs.isEmpty) {
      throw StudentParkingException(
        studentId: studentId,
        type: StudentParkingFailureType.parkNotFound,
      );
    }

    final parkingHistoryModel = ParkingHistoryModel.fromFirestore(
      query.docs.first as QueryDocumentSnapshot<Map<String, dynamic>>,
    );

    return parkingHistoryModel;
  }

  @override
  Future<VehicleModel> getVehicleByStudentId() async {
    final studentId = _getstudentId();
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

  String _getstudentId() {
    final student = firebaseAuth.currentUser;
    if (student == null) {
      throw AuthException(type: AuthFailureType.studentNotFound);
    }
    return student.uid;
  }
}
