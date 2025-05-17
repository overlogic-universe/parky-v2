import 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreX on FirebaseFirestore {
  CollectionReference get studentsCollection => collection('students');
  CollectionReference get parkingHistoriesCollection => collection('parking_histories');
  CollectionReference get vehichlesCollection => collection('vehicles');
  CollectionReference get parkingActivityCollection => collection('parking_activity');
  CollectionReference get parkingLotsCollection => collection('parking_lots');
  CollectionReference get parkingSchedulesCollection => collection('parking_schedules');
  CollectionReference get parkingLotsHasParkingSchedulesCollection => collection('parking_lots_has_parking_schedules');
  CollectionReference get parkingLotsHasParkingAttendantsCollection => collection('parking_lots_has_parking_attendants');
  CollectionReference get parkingAttendantsCollection => collection('parking_attendants');
}

extension QueryX on Query {
  Query whereIsEqualToStudentId(Object? studentId) => where('student_id', isEqualTo: studentId);
  Query whereIsEqualToParkingHistoryId(Object? parkingHistoryId) =>where('parking_history_id', isEqualTo: parkingHistoryId);
  Query whereIsEqualToParkingLotId(Object? parkingLotId) =>where('parking_lot_id', isEqualTo: parkingLotId);
  Query whereIsEqualToParkingScheduleId(Object? parkingScheduleId) =>where('parking_schedule_id', isEqualTo: parkingScheduleId);
  Query whereIsEqualToDayOfWeek(Object? dayOfWeek) =>where('day_of_week', isEqualTo: dayOfWeek);
}
