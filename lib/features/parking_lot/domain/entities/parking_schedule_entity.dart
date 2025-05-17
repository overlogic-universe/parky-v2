import 'package:cloud_firestore/cloud_firestore.dart';

class ParkingScheduleEnity {
  final String id;
  final String dayOfWeek;
  final Timestamp openTime;
  final Timestamp closedTime;
  final bool isClosed;

  const ParkingScheduleEnity({
    required this.id,
    required this.dayOfWeek,
    required this.openTime,
    required this.closedTime,
    required this.isClosed,
  });
}
