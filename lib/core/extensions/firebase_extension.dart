import 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreX on FirebaseFirestore {
  CollectionReference get usersCollection => collection('users');
  CollectionReference get parksCollection => collection('parks');
  CollectionReference get vehichlesCollection => collection('vehicles');
  CollectionReference get parkingLotsHasUsersCollection => collection('parking_lots_has_users');
  CollectionReference get parkingLotsCollection => collection('parking_lots');
  CollectionReference get parkingLotsHasParkingAttendantCollection => collection('parking_lots_has_parking_attendant');
  CollectionReference get parkingAttendantCollection => collection('parking_attendant');
}

extension QueryX on Query {
  Query whereIsEqualToUserId(Object? userId) =>
      where('user_id', isEqualTo: userId);
}
