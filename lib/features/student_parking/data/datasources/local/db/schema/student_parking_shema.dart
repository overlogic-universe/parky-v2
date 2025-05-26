class StudentParkingSchema {
  static const String createStudentsTable = '''
    CREATE TABLE students (
      id TEXT PRIMARY KEY,
      qr_code_id TEXT NOT NULL,
      name TEXT NOT NULL,
      nim TEXT NOT NULL,
      email TEXT NOT NULL,
      password TEXT,
      created_at INTEGER,
      updated_at INTEGER
    );
  ''';

  static const String createVehiclesTable = '''
    CREATE TABLE vehicles (
      id TEXT PRIMARY KEY,
      plate TEXT NOT NULL,
      student_id TEXT NOT NULL REFERENCES students(id),
      created_at INTEGER,
      updated_at INTEGER
    );
  ''';

  static const String createParkingHistoriesTable = '''
    CREATE TABLE parking_histories (
      id TEXT PRIMARY KEY,
      status TEXT NOT NULL,
      parked_at TIMESTAMP,
      exited_at TIMESTAMP,
      created_at INTEGER,
      updated_at INTEGER
    );
  ''';
}
