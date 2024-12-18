import 'dart:ffi';
import 'dart:io';
import 'package:eprogrammingappflutter/Model/db.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'database.db');
    var exists = await databaseExists(path);

    if (!exists) {
      await Directory(dirname(path)).create(recursive: true);
      ByteData data = await rootBundle.load('assets/database.db');
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
    }

    return await openDatabase(path);
  }

  Future<List<Map<String, dynamic>>> getTutorialsFromDatabase() async {
    final db = await database;
    return db.query('tutorials');
  }



  Future<Tutorial> getTutorial(int id) async {
    final db = await database;
    List<Map> result =
    await db.query('tutorials', where: 'id = ?', whereArgs: [id]);
    return Tutorial(
        id: result.first['id'],
        title: result.first['title'],
        description: result.first['description'],
        code:result.first['code'],
        videolinks:result.first['videolinks'],
        categoryId: result.first['category_id']);
  }

  Future<List<Tutorial>> getTutorials(int categoryID) async {
    final db = await database;
    List<Map> result = await db.query('tutorials',
        where: 'category_id = ?',
        whereArgs: [categoryID]
    );


    return List.generate(result.length, (i) {
      return Tutorial(
          id: result[i]['id'],
          title: result[i]['title'],
          description: result[i]['description'],
          code:result[i]['code'],
          videolinks:result[i]['videolinks'],
          categoryId: result[i]['category_id']
      );
    });

  }

/*
  Future<List<Category>> getCategories() async {
    final db = await database;
    List<Map> result = await db.query('categories');
    //print('Result from database: $result');

    return List.generate(result.length, (i) {
      return Category(
          id: result[i]['id'],
          name: result[i]['name'],
          icon: result[i]['icon']
      );
    });

  }*/
// ... implement methods for database operations ...
}
