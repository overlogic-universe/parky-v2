import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parky/features/user_parking/core/extensions/user_parking_data_mapper_extension.dart';

import '../../../../../core/extensions/firebase_extension.dart';
import '../../../../auth/core/constants/failures/auth_exception_message_constant.dart';
import '../../../../auth/core/failures/auth_exception.dart';
import '../../../core/constant/failures/user_parking_exception_message_constant.dart';
import '../../../core/failures/user_parking_exception.dart';
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
        message: UserParkingExceptionMessageConstant.parkNotFound(userId),
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
        message: UserParkingExceptionMessageConstant.vehicleNotFound(userId),
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
      throw AuthException(
        message: AuthExceptionMessageConstant.userNotFound,
        type: AuthFailureType.userNotFound,
      );
    }
    return user.uid;
  }
}
