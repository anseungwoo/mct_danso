import 'package:sqflite/sqflite.dart';

import 'db_helpers.dart';

class DeleteDummy {
  DeleteDummy._();
  static final DeleteDummy _db = DeleteDummy._();
  factory DeleteDummy() => _db;

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await DBHelPer().initDB();
    return _database;
  }

  // 도전하기 더미 삭제
  void deleteAllChal() async {
    final db = await database;
    await db.rawDelete('DELETE FROM TB_CHAL');
  }

  // 연습하기 더미 삭제
  void deleteAllExer() async {
    final db = await database;
    await db.rawDelete('DELETE FROM TB_EXER');
  }
}
