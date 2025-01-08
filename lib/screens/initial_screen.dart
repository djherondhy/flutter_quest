import 'package:flutter/material.dart';
import 'package:quest/components/personagem.dart';
import 'package:quest/data/personagem_dao.dart';
import 'package:quest/data/personagem_inherited.dart';
import 'package:quest/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('OnePiece Quest', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        leading: const Icon(
          Icons.gamepad,
          color: Colors.white,
        ),
        actions: [
              IconButton(onPressed: (){setState(() {
                
              });}, icon: Icon(Icons.refresh))
        ],
      ),
      body: Container(
        color: Colors.black12,
        child: FutureBuilder<List<Personagem>>(
            future: PersonagemDao().findAll(),
            builder: (context, snapshot) {
              List<Personagem>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(child: Column(children: [CircularProgressIndicator(), Text('Carregando')],),);
                  break;
                case ConnectionState.waiting:
                  return Center(child: Column(children: [CircularProgressIndicator(), Text('Carregando')],),);
                  break;
                case ConnectionState.active:
                  return Center(child: Column(children: [CircularProgressIndicator(), Text('Carregando')],),);
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Personagem personagem = items[index];
                            return personagem;
                          });
                    }
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: const Center(
                        child: Column(children: [
                          Icon(
                            Icons.error_outline,
                            size: 30,
                            color: Colors.deepPurpleAccent,
                          ),
                          Text(
                            'Não há nenhum personagem',
                            style: TextStyle(fontSize: 15),
                          ),
                        ]),
                      ),
                    );
                  }
                  return Text('Erro ao carregar personagens!');
                  break;
              }
              return Text('Erro desconhecido');
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                personagemContext: context,
              ),
            ),
          ).then((value) => setState(() {
            print('Recarregando');
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
