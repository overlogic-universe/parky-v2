class StudentParkingExceptionMessageConstant {
  const StudentParkingExceptionMessageConstant._();

  static String parkNotFound(String studentId) =>
      "park not found for studentId: $studentId.";
  static String vehicleNotFound(String studentId) =>
      "vehicle not found for studentId: $studentId.";
  static String parkingLotNotFound(String studentId) =>
      "parking lot not found for studentId: $studentId.";
}
