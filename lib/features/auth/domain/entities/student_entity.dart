class StudentEntity {
  final String id;
  final String qrCodeId;
  final String nim;
  final String name;
  final String email;
  final String? password;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const StudentEntity({
    required this.id,
    required this.qrCodeId,
    required this.nim,
    required this.name,
    required this.email,
    this.password,
    this.createdAt,
    this.updatedAt,
  });
}
