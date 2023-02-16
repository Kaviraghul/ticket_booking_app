// ignore_for_file: depend_on_referenced_packages

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  Database? _db;
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = initDatabase();
      return _db;
    }
  }

  initDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'bookings');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate());
    return db;
  }

  _onCreate() {}
}
