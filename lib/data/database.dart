import 'package:quest/data/personagem_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'quest.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(PersonagemDao.sqlTable);
    },
    version: 1,
  );
}


