import 'dart:io';
import '../models/smallcase_db_model.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database!;

    // If database don't exists, create one
    _database = await initDB();

    return _database!;
  }

  // Create the database and the SmallcaseDb table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'SmallcaseDb_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE SmallcaseDB('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'idno TEXT,'
          'scid TEXT,'
          'name TEXT,'
          'version INTEGER,'
          'shortDescription TEXT,'
          'type TEXT,'
          'publisher TEXT,'
          'publisherName TEXT,'
          'rebalanceSchedule TEXT,'
          'lastRebalanced TEXT,'
          'imageUrl TEXT,'
          'daily INTEGER,'
          'weekly REAL,'
          'monthly REAL,'
          'quartely REAL,'
          'halfyearly REAL,'
          'yearly REAL,'
          'threeyear REAL,'
          'fiveYear REAL,'
          'sinceInception REAL,'
          'minInvestAmount INTEGER,'
          'divYield REAL,'
          'smallCapPercentage REAL,'
          'midCapPercentage REAL,'
          'largeCapPercentage REAL,'
          'sharpeRatio REAL,'
          'cagr REAL,'
          'pe REAL,'
          'riskLabel TEXT,'
          'minSipAmount INTEGER,'
          'benchmarkId TEXT,'
          'benchmarkIndex TEXT,'
          'benchmarkLabel TEXT,'
          ')');
    });
  }

  Future<void> createSmallcaseDb(List<SmallcaseDb> newSmallcaseDbList) async {
    if (newSmallcaseDbList == null) return;
    await deleteAllSmallcaseDbs();
    final db = await database;
    var i = 0;
    newSmallcaseDbList.forEach((element) async {
      i = await db.insert('SmallcaseDb', element.toJson());
      print("Inerting Smallcase $i");
    });
    // return res;
  }

  // Delete all SmallcaseDbs
  Future<int> deleteAllSmallcaseDbs() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM SmallcaseDb');

    return res;
  }

  Future<List<SmallcaseDb>> getAllSmallcaseDbs() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM SmallcaseDb");

    List<SmallcaseDb> list =
        res.isNotEmpty ? res.map((c) => SmallcaseDb.fromJson(c)).toList() : [];

    return list;
  }
}
