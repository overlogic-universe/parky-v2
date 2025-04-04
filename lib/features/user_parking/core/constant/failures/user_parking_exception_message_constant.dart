class UserParkingExceptionMessageConstant {
  const UserParkingExceptionMessageConstant._();

  static String parkNotFound(String userId) =>
      "park not found for userID: $userId.";
  static String vehicleNotFound(String userId) =>
      "vehichle not found for userID: $userId.";
}
