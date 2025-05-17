class ParkingLotSchema {
  static const String createParkingLotsTable = '''
    CREATE TABLE parking_lots (
      id TEXT PRIMARY KEY,
      name TEXT NOT NULL,
      vehicle_in_count INTEGER NOT NULL,
      max_capacity INTEGER NOT NULL,
      latitude REAL,
      longitude REAL,
      is_active INTEGER NOT NULL,
      inactive_description TEXT
    );
  ''';

  static const String createParkingSchedulesTable = '''
    CREATE TABLE parking_schedules (
      id TEXT PRIMARY KEY,
      day_of_week TEXT NOT NULL,
      open_time TIMESTAMP,
      closed_time TIMESTAMP,
      is_closed INTEGER NOT NULL
    );
  ''';

  static const String createParkingLotsHasParkingSchedulesTable = '''
    CREATE TABLE parking_lots_has_parking_schedules (
      id TEXT PRIMARY KEY,
      parking_lot_id TEXT NOT NULL,
      parking_schedule_id TEXT NOT NULL,
      FOREIGN KEY (parking_lot_id) REFERENCES parking_lots(id) ON DELETE CASCADE,
      FOREIGN KEY (parking_schedule_id) REFERENCES parking_schedules(id) ON DELETE CASCADE
    );
  ''';
}
