class Personagem{
  String? id;
  String nome;
  String classe;
  int forca;
  String imagem;

  Personagem({
    required this.nome,
    required this.classe,
    required this.forca,
    required this.imagem,
  });

  Personagem.fromMap(Map<String, dynamic> map)
      : id = map["id"] != null ? map["id"].toString() : null,
        nome = map['nome'],
        forca = map['forca'],
        classe = map['classe'],
        imagem = map['imagem']
  ;

  Map<String, dynamic> toMap() {
    final map = {
      "nome": nome,
      "forca": forca,
      "classe": classe,
      "imagem": imagem
    };

    if (id != null) {
      map["id"] = id.toString();
    }
    return map;
  }

}

