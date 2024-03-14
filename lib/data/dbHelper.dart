import 'package:gorevler/Models/todo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  Database? _db;

  Future<Database> get db async {
    _db ??= await initializeDb();
    return _db!;
  }

  Future<Database> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), "todo.db");
    var todoDb=await openDatabase(dbPath,version: 1,onCreate: createDb);
    return todoDb;
  }

  void createDb(Database db, int version) async{
    await db.execute("Create table Todo(id integer primary key, title text, detail text, category text, date text,creationDate text)");
  }

  Future<List<Map<String, dynamic>>> getTodo()async{
    final Database database = await db;
    return database.rawQuery("SELECT title, deail, FROM my_table");
  }

  Future<int> insert(Todo todo) async {
    final Database database = await db;
    var result = await database.insert("Todo", todo.toMap());
    return result;
  }

}
