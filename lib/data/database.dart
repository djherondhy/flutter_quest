import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'quest.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(sqlTable);
    },
    version: 1,
  );
}
const String _tableName = 'personagem';

const String sqlTable = 'CREATE TABLE $_tableName ('
    '$_name TEXT,'
    '$_class TEXT, '
    '$_force INTEGER, '
    '$_image TEXT'
    ')';

const String _name = 'name';
const String _class = 'class';
const String _force = 'force';
const String _image = 'image';


