import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:VALTO/providers/gestorsesion.dart';

Future<Database> openDatabaseAndCreateTable() async {
  final databasePath = await getDatabasesPath();
  final path = join(databasePath, 'valto.db');

  return await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''CREATE TABLE users (id INTEGER ,name TEXT,guid TEXT)''');
      await db.execute('''CREATE TABLE perfil (IdPerfil INTEGER, IdSexo INTEGER )''');
      await db.execute('''CREATE TABLE sexo (IdSexo INTEGER ,Nombre TEXT,Imagen TEXT )''');
    },
  );
}

// Insertar un registro en la base de datos
Future<void> insertUser(String name,String guid) async {
  final db = await openDatabaseAndCreateTable();
  await db.insert(
    'users',
    {'name': name, 'guid': guid},
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
Future<void> insertUserAnonimo(String guid) async {
  final db = await openDatabaseAndCreateTable();
  await db.insert(
    'users',
    {'guid': guid},
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// Obtener todos los registros de la base de datos
Future<List<Map<String, dynamic>>> getUsers() async {
  final db = await openDatabaseAndCreateTable();
  return await db.query('users');
}
// Actualizar un registro en la base de datos
Future<void> updateUser(int id, String name, int age) async {
  final db = await openDatabaseAndCreateTable();
  await db.update(
    'users',
    {'name': name, 'age': age},
    where: 'id = ?',
    whereArgs: [id],
  );
}
Future<void> deleteUser(int id) async {
  final db = await openDatabaseAndCreateTable();
  await db.delete(
    'users',
    where: 'id = ?',
    whereArgs: [id],
  );
}
Future<bool> isDataExistsInSQLite() async {
  final db = await openDatabaseAndCreateTable();
  final result = await db.query('users');
  return result.isNotEmpty;
}
Future<String> insertUserInSQLServer() async {
  String uniqueIdentifier="";
  try {
    uniqueIdentifier = await getUniqueIdentifier();
    //print('Identificador único: $uniqueIdentifier');
  } catch (e) {
    // Manejar el error aquí si es necesario
    //print('Error: $e');
  }
  return uniqueIdentifier;
}
Future<void> insertUserIfNotExists() async {
  final dataExistsInSQLite = await isDataExistsInSQLite();

  if (!dataExistsInSQLite) {
    // Si no hay registros en SQLite, insertar en SQL Server
    String guid = await insertUserInSQLServer();

    // Luego, guardar el registro en SQLite
    await insertUserAnonimo(guid);
    await insertPerfil();
  } 
}

//Adimin SEXO
Future<List<Map<String, dynamic>>> getSexo() async {
  final db = await openDatabaseAndCreateTable();
  return await db.query('sexo');
}

Future<void> inserSexoIfNotExists(int id, String nombre,String imagen) async {
  final dataExistsInSQLite = await isSexoExistsInSQLite(id);

  if (!dataExistsInSQLite) {
    // Si no hay registros en SQLite, insertar en SQL Server
    insertSexo( id,  nombre, imagen);
  } 
  else{
    updateSexo( id,  nombre, imagen);

  }
}
Future<bool> isSexoExistsInSQLite(int id) async {
  final db = await openDatabaseAndCreateTable();
  final result = await db.query('sexo', where: 'IdSexo = ?', whereArgs: [id],);
  return result.isNotEmpty;
}
Future<void> insertSexo(int id, String nombre,String imagen) async {
  final db = await openDatabaseAndCreateTable();
  await db.insert(
    'sexo',
    {'IdSexo': id , 'Nombre':nombre, "Imagen":imagen},
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
Future<void> updateSexo(int id, String nombre,String imagen) async {
  final db = await openDatabaseAndCreateTable();
  await db.update(
    'sexo',
    {'Nombre':nombre, "Imagen":imagen},
     where: 'IdSexo = ?', whereArgs: [id],
  );
}

//PERFIL

Future<void> insertPerfil() async {
   final db = await openDatabaseAndCreateTable();
  await db.insert(
    'perfil',
    {'IdPerfil': 1, },
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
Future<void> insertSexoPerfil(id) async {
   final db = await openDatabaseAndCreateTable();
  await db.update(
    'perfil',
    {'IdSexo':id,},
     where: 'IdPerfil = ?', 
     whereArgs: [1],
  );
}
Future<List<Map<String, dynamic>>> getPerfil() async {
  final db = await openDatabaseAndCreateTable();
  return await db.query('perfil');
}

Future<void> borrarDatabase() async {
  final databasePath = await getDatabasesPath();
  final path = join(databasePath, 'valto.db');
  await deleteDatabase(path);
}