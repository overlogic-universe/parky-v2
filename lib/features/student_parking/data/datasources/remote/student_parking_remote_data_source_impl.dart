import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/extensions/firebase_extension.dart';
import '../../../../auth/core/failures/auth_exception.dart';
import '../../../../auth/core/failures/auth_failure_type.dart';
import '../../../../student_parking/core/failures/student_parking_exception.dart';
import '../../../../student_parking/core/failures/student_parking_failure_type.dart';
import '../../../core/extensions/student_parking_data_mapper_extension.dart';
import '../../models/park_model.dart';
import '../../models/vehicle_mode.dart';
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
  Future<ParkModel> getParkBystudentId() async {
    final studentId = _getstudentId();
    final query =
        await firestore.parksCollection
            .whereIsEqualToStudentId(studentId)
            .limit(1)
            .get();

    if (query.docs.isEmpty) {
      throw StudentParkingException(
        studentId: studentId,
        type: StudentParkingFailureType.parkNotFound,
      );
    }

    final parkModel = ParkModel.fromFirestore(
      query.docs.first as QueryDocumentSnapshot<Map<String, dynamic>>,
    );

    log("MODEL GET PARK: ${parkModel.toEntity().toString()}");

    return parkModel;
  }

  @override
  Future<VehicleModel> getVehicleBystudentId() async {
    final studentId = _getstudentId();
    final query =
        await firestore.vehichlesCollection
            .whereIsEqualToStudentId(studentId)
            .limit(1)
            .get();

    log("MODEL GET VEHICLE: ${query.docs}");
    if (query.docs.isEmpty) {
      throw StudentParkingException(
        studentId: studentId,
        type: StudentParkingFailureType.vehicleNotFound,
      );
    }

    log("MODEL GET VEHICLE: ${query.docs.first.data()}");
    final model = VehicleModel.fromFirestore(
      query.docs.first as QueryDocumentSnapshot<Map<String, dynamic>>,
    );
    log("MODEL GET VEHICLE: ${model.toEntity().toString()}");
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
