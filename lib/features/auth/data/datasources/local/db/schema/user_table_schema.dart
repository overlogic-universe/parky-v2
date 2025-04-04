class UserTableSchema {
  static const String createTable = '''
    CREATE TABLE users (
      id TEXT PRIMARY KEY,
      student_id TEXT,
      name TEXT,
      email TEXT,
      password TEXT
    );
  ''';
}
