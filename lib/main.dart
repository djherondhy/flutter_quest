import 'package:flutter/material.dart';

import 'package:quest/models/Personagem.dart';
import 'package:quest/screens/form_screen.dart';

import 'package:quest/screens/initial_screen.dart';
import 'package:quest/services/api_service.dart';

void main() {
  runApp(const MyApp());
  ApiService service = ApiService();
  //service.register(Personagem(nome: "Zoro", classe: "Pirata", forca: 3, imagem: "https://i.pinimg.com/736x/52/c9/bc/52c9bcbaa70f35bb590f2e0e1371a487.jpg"));
  service.getAll();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quest',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            fontSize: 20,
          )
        ),

      ),
      home:const InitialScreen(),
    );
  }
}

