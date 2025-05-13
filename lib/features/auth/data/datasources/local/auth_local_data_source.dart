import '../../models/student_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveAuthToken(String token);
  Future<String?> getAuthToken();
  Future<void> clearAuthToken();
  Future<StudentModel> getStudentModel();
  Future<void> saveStudentModel(StudentModel? student);
}
