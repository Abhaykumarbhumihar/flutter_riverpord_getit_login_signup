import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:dartz/dartz.dart';
import '../model/local_user_key.dart';
import '../model/user_enitity.dart';
import '../../local_key.dart';

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

  Future<Either<String, List<UserEntity>>> getAllUser() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(
        LocalKeys.dbName,
        orderBy: "id DESC",
      );
      final List<UserEntity> users = List.generate(
        maps.length,
            (index) {
          return UserEntity.fromJson(maps[index]);
        },
      );
      return Right(users);
    } catch (e) {
      return Left(e.toString());
    }
  }


  Future<Either<String, UserEntity>> login(UserEntity userEntity) async {
    final db = await database;

    final List<Map<String, dynamic>> user = await db.query(
      LocalKeys.dbName,
      where: '${LocalAuth.email} = ?',
      whereArgs: [userEntity.email],
      limit: 1,
    );

    if (user.isEmpty) {
      return Left('No user found with this email.');
    }

    final storedPassword = user.first[LocalAuth.password];
    if (storedPassword != userEntity.password) {
      return Left('Incorrect password.');
    }

    return Right(UserEntity.fromJson(user.first));
  }

  Future<Either<String, int>> addTaskk(UserEntity userEntity) async {
    final db = await database;

    final List<Map<String, dynamic>> existingUser = await db.query(
      LocalKeys.dbName,
      where: '${LocalAuth.email} = ?',
      whereArgs: [userEntity.email],
      limit: 1,
    );

    if (existingUser.isNotEmpty) {
      return const Left('An account with this email already exists.');
    }

    try {
      return Right(await db.transaction((txn) async {
        return await txn.insert(
          LocalKeys.dbName,
          userEntity.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
