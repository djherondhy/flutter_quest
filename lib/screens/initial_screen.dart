import 'package:flutter/material.dart';
import 'package:quest/components/personagem.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('OnePiece Quest', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        leading: const Icon(Icons.gamepad, color: Colors.white,),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Container(
          color: Colors.black12,
          child: ListView(
            children: const [
              Personagem(
                  nome:'Luffy',
                  classe: 'Imperador',
                  forca: 4,
                  foto: 'assets/images/luffy.png'
              ),
              Personagem(
                  nome:'Zoro',
                  classe: 'Caçador',
                  forca: 3,
                  foto: 'assets/images/zoro.png'
              ),
              Personagem(
                  nome:'Law',
                  classe: 'Pirata',
                  forca: 3,
                  foto: 'assets/images/law.png'
              ),
              Personagem(
                  nome:'Garp',
                  classe: 'Marinheiro',
                  forca: 4,
                  foto: 'assets/images/garp.png'
              ),
              Personagem(
                  nome:'Kaido',
                  classe: 'Imperador',
                  forca: 5,
                  foto: 'assets/images/kaido.png'
              ),
              Personagem(
                  nome:'Nekomamushi',
                  classe: 'Mink',
                  forca: 3,
                  foto: 'assets/images/neko.png'
              ),
              SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            opacidade = !opacidade;
          });

        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
