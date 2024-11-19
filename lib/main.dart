import 'package:flutter/material.dart';
import 'package:quest/Widgets/personagem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('OnePiece Quest', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.deepPurple,
          leading: const Icon(Icons.gamepad, color: Colors.white,),
        ),
        body: Container(
          color: Colors.black12,
          child: ListView(
            children: [
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
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}

