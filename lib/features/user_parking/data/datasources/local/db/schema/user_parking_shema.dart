class UserParkingShema {
  static const String createVehicleTable = '''
      CREATE TABLE vehicles (
        id TEXT PRIMARY KEY,
        plate TEXT NOT NULL,
        user_id TEXT NOT NULL
      );
    ''';
  static const String createParkTable = '''
      CREATE TABLE parks (
        id TEXT PRIMARY KEY,
        status TEXT NOT NULL,
        last_activity INT NOT NULL,
        user_id TEXT NOT NULL
      );
    ''';
}
