class ParkingLotSchema {
  static const String createParkingLotsTable = '''
    CREATE TABLE parking_lots (
      id TEXT PRIMARY KEY,
      name TEXT NOT NULL,
      vehicle_in_count INTEGER NOT NULL,
      max_capacity INTEGER NOT NULL,
      latitude REAL NOT NULL,
      longitude REAL NOT NULL,
      is_active BOOLEAN NOT NULL,
      inactive_description TEXT
    );
  ''';

  static const String createParkingSchedulesTable = '''
    CREATE TABLE parking_schedules (
      id TEXT PRIMARY KEY,
      day_of_week TEXT NOT NULL,
      open_time TIMESTAMP NOT NULL,
      closed_time TIMESTAMP NOT NULL,
      is_closed BOOLEAN NOT NULL
    );
  ''';

  static const String createParkingLotsHasParkingSchedulesTable = '''
    CREATE TABLE parking_lots_has_parking_schedules (
      id TEXT PRIMARY KEY,
      parking_lot_id TEXT NOT NULL,
      parking_schedule_id TEXT NOT NULL
    );
  ''';
}
