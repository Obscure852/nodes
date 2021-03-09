import 'dart:io';
import 'package:nodes/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  Database _database;
  DatabaseHelper._instance();

  String usersTable = "usersTable";
  String id = "id";
  String usernameCol = "username";
  String emailCol = "email";
  String passwordCol = "password";
  String timeCol = "time";

  Future<Database> get db async{
    if(_database == null){
      _database = await _initDB();
    }
    return _database;
  }

  Future<Database> _initDB() async{
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "users.db";
    final usersDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return usersDB;
  }


  void _onCreate(Database db,int version) async{
    await db.execute('CREATE TABLE $usersTable($id INTEGER PRIMARY KEY AUTOINCREMENT,$usernameCol TEXT,$emailCol TEXT, $passwordCol TEXT,$timeCol TEXT)');
  }

  Future<int> insertUser(User user) async{
    Database db =  await this.db;
    int result = await db.insert(usersTable, user.toMap());
    return result;
  }
}