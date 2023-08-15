import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  DatabaseHelper._();

  // Veritabanına erişim için bir Future<Database> döndüren getter metodu
  // Eğer _database null değilse mevcut veritabanını döndürür
  // Eğer _database null ise _initDatabase() metodu çağrılarak veritabanı başlatılır ve _database döndürülür
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDatabase();
    return _database;
  }

  // Veritabanını başlatmak için kullanılan özel bir metot
  Future<Database> _initDatabase() async {
    final String path = await getDatabasesPath();
    final String dbPath = join(path, 'todo.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  // Veritabanı oluşturma metodu
  // 'todo' adında bir tablo oluşturur
  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todo(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        taskName TEXT,
        taskCompleted INTEGER
      )
    ''');
  }

  // Tüm görevleri getiren metot
  Future<List<Map<String, dynamic>>> getTasks() async {
    final Database? db = await instance.database;
    return await db!.query('todo');
  }

  // Yeni bir görev eklemek için kullanılan metot
  Future<int> insertTask(String taskName, bool taskCompleted) async {
    final db = await database;
    return await db!.insert(
      'todo',
      {'taskName': taskName, 'taskCompleted': taskCompleted ? 1 : 0},
    );
  }

  // Bir görevin tamamlanma durumunu güncellemek için kullanılan metot
  Future<void> updateTask(int id, bool taskCompleted) async {
    final db = await database;
    await db!.update(
      'todo',
      {'taskCompleted': taskCompleted ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Bir görevi silmek için kullanılan metot
  Future<void> deleteTask(int id) async {
    final db = await database;
    await db!.delete(
      'todo',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
