class StudentParkingSchema {
  static const String createVehicleTable = '''
      CREATE TABLE vehicles (
        id TEXT PRIMARY KEY,
        plate TEXT NOT NULL,
        student_id TEXT NOT NULL
      );
    ''';
  static const String createParkingHistoryTable = '''
      CREATE TABLE parking_histories (
        id TEXT PRIMARY KEY,
        status TEXT NOT NULL,
        last_activity INT NOT NULL,
        student_id TEXT NOT NULL
      );
    ''';
}
