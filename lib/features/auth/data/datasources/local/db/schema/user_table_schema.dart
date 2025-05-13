class StudentTableSchema {
  static const String createTable = '''
    CREATE TABLE Students (
      id TEXT PRIMARY KEY,
      nim TEXT,
      name TEXT,
      email TEXT,
      password TEXT
    );
  ''';
}
