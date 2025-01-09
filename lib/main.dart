import 'package:flutter/material.dart';
import 'package:quest/data/personagem_inherited.dart';
import 'package:quest/screens/form_screen.dart';

import 'package:quest/screens/initial_screen.dart';
import 'package:quest/services/api_service.dart';

void main() {
  runApp(const MyApp());
  ApiService service = ApiService();
  service.register("Olá mundo!");
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PersonagemInherited(child: const InitialScreen()),
    );
  }
}

