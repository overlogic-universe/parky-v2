import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/extensions/firebase_extension.dart';
import '../../../../auth/core/failures/auth_exception.dart';
import '../../../../auth/core/failures/auth_failure_type.dart';
import '../../../core/extensions/user_parking_data_mapper_extension.dart';
import '../../../core/failures/user_parking_exception.dart';
import '../../../core/failures/user_parking_failure_type.dart';
import '../../models/park_model.dart';
import '../../models/vehicle_mode.dart';
import 'user_parking_remote_data_source.dart';

class UserParkingRemoteDataSourceImpl implements UserParkingRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  UserParkingRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  @override
  Future<ParkModel> getParkByUserId() async {
    final userId = _getUserId();
    final query =
        await firestore.parksCollection
            .whereIsEqualToUserId(userId)
            .limit(1)
            .get();

    if (query.docs.isEmpty) {
      throw UserParkingException(
        userId: userId,
        type: UserParkingFailureType.parkNotFound,
      );
    }

    final parkModel = ParkModel.fromFirestore(
      query.docs.first as QueryDocumentSnapshot<Map<String, dynamic>>,
    );

    log("MODEL GET PARK: ${parkModel.toEntity().toString()}");

    return parkModel;
  }

  @override
  Future<VehicleModel> getVehicleByUserId() async {
    final userId = _getUserId();
    final query =
        await firestore.vehichlesCollection
            .whereIsEqualToUserId(userId)
            .limit(1)
            .get();

    log("MODEL GET VEHICLE: ${query.docs}");
    if (query.docs.isEmpty) {
      throw UserParkingException(
        userId: userId,
        type: UserParkingFailureType.vehicleNotFound,
      );
    }

    log("MODEL GET VEHICLE: ${query.docs.first.data()}");
    final model = VehicleModel.fromFirestore(
      query.docs.first as QueryDocumentSnapshot<Map<String, dynamic>>,
    );
    log("MODEL GET VEHICLE: ${model.toEntity().toString()}");
    return model;
  }

  String _getUserId() {
    final user = firebaseAuth.currentUser;
    if (user == null) {
      throw AuthException(type: AuthFailureType.userNotFound);
    }
    return user.uid;
  }
}
