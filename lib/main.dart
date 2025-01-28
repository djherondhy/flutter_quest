import 'package:flutter/material.dart';
import 'package:quest/screens/initial_screen.dart';
import 'package:quest/screens/login_screen.dart';
import 'package:quest/screens/start_screen.dart';
import 'package:quest/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  bool isLogged = await verifyToken();

  runApp(MyApp(isLogged: isLogged,));

}

Future<bool> verifyToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("access");
  ApiService service = ApiService();
  if (token != null) {
    bool isValid = await service.isTokenValid(token!);
    if(isValid){
      return true;
    }
    else{
      return false;
    }
  }
  return false;
}


class MyApp extends StatefulWidget{
  final bool isLogged;
  const MyApp({super.key, required this.isLogged});

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
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            fontSize: 20,
          )
        ),

      ),
      home:(widget.isLogged) ?  const InitialScreen() :  const StartScreen(),
    );
  }
}

