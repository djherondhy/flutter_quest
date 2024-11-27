import 'package:flutter/material.dart';
import 'package:quest/components/personagem.dart';

class PersonagemInherited extends InheritedWidget {
  PersonagemInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Personagem> personagemList = [
    Personagem(
      nome: 'Luffy',
      classe: 'Imperador',
      forca: 4,
      foto: 'assets/images/luffy.png',
    ),
    Personagem(
      nome: 'Zoro',
      classe: 'Caçador',
      forca: 3,
      foto: 'assets/images/zoro.png',
    ),
    Personagem(
      nome: 'Law',
      classe: 'Pirata',
      forca: 3,
      foto: 'assets/images/law.png',
    ),
    Personagem(
      nome: 'Garp',
      classe: 'Marinheiro',
      forca: 4,
      foto: 'assets/images/garp.png',
    ),
    Personagem(
      nome: 'Kaido',
      classe: 'Imperador',
      forca: 5,
      foto: 'assets/images/kaido.png',
    ),
    Personagem(
      nome: 'Nekomamushi',
      classe: 'Mink',
      forca: 3,
      foto: 'assets/images/neko.png',
    ),
  ];

  void newPersonagem(String name, String classe, int force, String foto) {
    personagemList.add(
      Personagem(nome: name, classe: classe, forca: force, foto: foto)
    );
  }

  static PersonagemInherited of(BuildContext context) {
    final PersonagemInherited? result =
        context.dependOnInheritedWidgetOfExactType<PersonagemInherited>();
    assert(result != null, 'No PersonagemInhrited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(PersonagemInherited old) {
    return old.personagemList.length != personagemList.length;
  }
}
