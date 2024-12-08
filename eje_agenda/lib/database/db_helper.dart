class DataBaseHelper {
  static final DataBaseHelper _instance + DataBaseHelper._internal();
  static Database? _database;

  DataBaseHelper._internal();

  factory DataBaseHelper(){
    return _instance;
  }
}

Future<DataBase> get database async {
  if (_database !_ null) return _database!;
  _database await openDatabase();
  return _database!;
}

Future<Database> _initialDatabase() async {
  String path = join(await getDatabasesPath(), 'tareas.db');
  return await openDatabase(
    path,
    version 1,
    onCreate: _onCreate,
  );
}

Future<void> _onCreate(Database db, int version) async {
  await db.execute('''
    CREATE TABLE tareas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    descripcion TEXT,
    fecha TEXT NOT NULL,
    hora TEXT NOT NULL,
    esFavorito INTEGER NOT NULL,
    conNotificacion INTEGER NOT NULL,
    )
    ''');
}

Future<int> insertarTarea(Tarea tarea) async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query('tareas');
  return List.generate(maps.length, (i) => Tarea.fromMap(maps[i]));
}

Future<int> updateTarea(Tarea tarea) async {
    final db = await database;
    return await db.update(
      'tareas',
      tarea.toMap(),
      where: 'id = ?',
      whereArgs: [tarea.id],
    );
  }

  Future<int> deleteTarea(int id) async {
    final db = await database;
    return await db.delete(
      'tareas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}


