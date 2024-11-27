import 'package:flutter/material.dart';
import 'package:quest/components/personagem.dart';
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
      ),
      body: Container(
        color: Colors.black12,
        child: ListView(
          children: PersonagemInherited.of(context).personagemList,
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
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
