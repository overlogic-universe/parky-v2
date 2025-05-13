class StudentParkingExceptionMessageConstant {
  const StudentParkingExceptionMessageConstant._();

  static String parkNotFound(String studentId) =>
      "park not found for studentId: $studentId.";
  static String vehicleNotFound(String studentId) =>
      "vehichle not found for studentId: $studentId.";
}
