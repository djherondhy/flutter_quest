import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.3,
            image: NetworkImage(
                "https://i.pinimg.com/736x/f2/d3/01/f2d3014cea40c969f0fe15e78a1b04f0.jpg"),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: 300,
                child: Center(
                  child: ClipRRect(

                    child: Image.network("https://logosmarcas.net/wp-content/uploads/2021/10/One-Piece-Logo.png"),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Bem Vindo Pirata!",
                          style: GoogleFonts.inter(
                            fontSize: 25,
                            decoration: TextDecoration.none,
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0,
                                  left: 30.0,
                                  right: 30.0,
                                  bottom: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Usuário',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepPurpleAccent,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(30)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepPurpleAccent, width: 2.0),
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0,
                                  left: 30.0,
                                  right: 30.0,
                                  bottom: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Senha',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepPurpleAccent,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(30)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepPurpleAccent, width: 2.0),
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0,
                                  bottom: 8.0),
                              child: SizedBox(
                                width: 150,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      elevation: 5,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 15),
                                      backgroundColor: Colors.deepPurpleAccent,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(100))),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Entrar",
                                          style: GoogleFonts.inter(
                                            fontSize: 15,
                                            decoration: TextDecoration.none,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
