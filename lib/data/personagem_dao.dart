import 'package:quest/components/personagem.dart';
import 'package:quest/data/database.dart';
import 'package:sqflite/sqflite.dart';

class PersonagemDao {
  static const String _tableName = 'personagem';

  static const String sqlTable = 'CREATE TABLE $_tableName ('
      '$_name TEXT,'
      '$_class TEXT, '
      '$_force INTEGER, '
      '$_image TEXT'
      ')';

  static const String _name = 'name';
  static const String _class = 'class';
  static const String _force = 'force';
  static const String _image = 'image';

  save(Personagem personagem) async {
    final Database database = await getDatabase();
    var itemExists = await find(personagem.nome);
    if (itemExists.isEmpty) {
      return await database.insert(_tableName, toMap(personagem));
    } else {

      return await database.update(
        _tableName,
        toMap(personagem),
        where: '$_name = ?',
        whereArgs: [personagem.nome],
      );
    }
  }

  Map<String, dynamic> toMap(Personagem personagem){
    final Map<String, dynamic> mapaDePersonagens = {};
    mapaDePersonagens[_name] = personagem.nome;
    mapaDePersonagens[_class] = personagem.classe;
    mapaDePersonagens[_force] = personagem.forca;
    mapaDePersonagens[_image] = personagem.foto;
    return mapaDePersonagens;
  }

  Future<List<Personagem>> findAll() async {

    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tableName);

    return toList(result);
  }

  List<Personagem> toList(List<Map<String, dynamic>> mapaDePersonagens) {
    final List<Personagem> personagens = [];
    for (Map<String, dynamic> linha in mapaDePersonagens) {
      final Personagem personagem = Personagem(
          nome: linha[_name],
          classe: linha[_class],
          forca: linha[_force],
          foto: linha[_image]);
      personagens.add(personagem);
    }
    return personagens;
  }

  Future<List<Personagem>> find(String nomeDoPersonagem) async {

    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeDoPersonagem],
    );

    return toList(result);
  }

  delete(String nomePersonagem) async{
    final Database database = await getDatabase();
    return database.delete(_tableName, where: '$_name = ?', whereArgs: [nomePersonagem]);
  }
}
