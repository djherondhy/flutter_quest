import 'package:flutter/material.dart';
import 'package:quest/components/personagem_card.dart';
import 'package:quest/screens/form_screen.dart';
import 'package:quest/services/api_service.dart';

import '../models/Personagem.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  ApiService service = ApiService();
  late Future<List<Personagem>> personagens;

  @override
  void initState() {
    super.initState();
    personagens = service.getAll(); // Inicializa a lista
  }

  void refresh() {
    setState(() {
      personagens = service.getAll(); // Atualiza a lista
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OnePiece Quest',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        leading: const Icon(
          Icons.gamepad,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: refresh, // Atualiza ao pressionar
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Container(
        color: Colors.black12,
        child: FutureBuilder<List<Personagem>>(
          future: personagens,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Erro ao carregar personagens.'),
              );
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final personagem = snapshot.data![index];
                  return PersonagemCard(
                    personagem: personagem,
                    onDelete: refresh, // Callback para atualizar a lista
                  );
                },
              );
            } else {
              return const Center(
                child: Text('Não há personagens para exibir.'),
              );
            }
          },
        ),
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
          ).then((_) => refresh());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
