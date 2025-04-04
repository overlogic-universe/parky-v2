class UserParkingException implements Exception {
  final String message;
  final UserParkingFailureType type;

  const UserParkingException({required this.message, required this.type});
}

enum UserParkingFailureType { parkNotFound, vehicleNotFound }
