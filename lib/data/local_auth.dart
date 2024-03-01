import 'package:flutter_rivierpord_loginsignup/data/user_enitity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../local_key.dart';
import 'local_user_key.dart';

class LocalAuthsource {
  static final LocalAuthsource _instance = LocalAuthsource._();

  factory LocalAuthsource() => _instance;

  LocalAuthsource._() {
    _initDb();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'authuser.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${LocalKeys.dbName} (
        ${LocalAuth.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${LocalAuth.name} TEXT,
        ${LocalAuth.email} TEXT,
        ${LocalAuth.password} TEXT,
        ${LocalAuth.createdAt} TEXT,
        ${LocalAuth.updatedAt} TEXT
      )
    ''');
  }

  Future<int> addTask(UserEntity userEntity) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        LocalKeys.dbName,
        userEntity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<List<UserEntity>> getAllUser() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      LocalKeys.dbName,
      orderBy: "id DESC",
    );
    return List.generate(
      maps.length,
      (index) {
        return UserEntity.fromJson(maps[index]);
      },
    );
  }
}
