import 'package:flutter/material.dart';
import 'package:quest/components/personagem_card.dart';
import 'package:quest/screens/form_screen.dart';
import 'package:quest/screens/start_screen.dart';
import 'package:quest/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/Personagem.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  ApiService service = ApiService();

  Future<String?> _returnToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("access"));
    return prefs.getString("access");
  }

  late Future<List<Personagem>> personagens;

  @override
  initState() {
    super.initState();
    _initializePersonagens();
  }

  Future<bool> verifyToken() async {
    String? token = await _returnToken();
    bool isValid = await service.isTokenValid(token!);
    if (!isValid) {
      return false;
    }

    return true;
  }

  void _initializePersonagens() async {
    String? token = await _returnToken();
    if (token != null) {
      setState(() {
        personagens = service.getAll(token);
      });
    } else {
      setState(() {
        personagens = Future.error("Token não encontrado.");
      });
    }
  }

  void refresh() async {
    String? token = await _returnToken();
    if (token != null) {
      bool isValid = await verifyToken();
      if (isValid) {
        setState(() {
          personagens = service.getAll(token);
        });
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (contextNew) => StartScreen(),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao obter token.')),
      );
    }
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
          IconButton(
            onPressed: refresh, // Atualiza ao pressionar
            icon: const Icon(Icons.more_vert),
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
              return Center(
                child: Text(
                  'Erro ao carregar personagens: ${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
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
