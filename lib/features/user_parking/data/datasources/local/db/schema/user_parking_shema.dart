class UserParkingShema {
  static const String createVehicleTable = '''
      CREATE TABLE vehicles (
        id TEXT PRIMARY KEY,
        plate TEXT NOT NULL,
        userId TEXT NOT NULL
      );
    ''';
  static const String createParkTable = '''
      CREATE TABLE parks (
        id TEXT PRIMARY KEY,
        status TEXT NOT NULL,
        lastActivity TEXT NOT NULL,
        userId TEXT NOT NULL
      );
    ''';
}
