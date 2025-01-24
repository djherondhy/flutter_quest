import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quest/screens/login_screen.dart';
import 'package:quest/screens/register_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
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
            child: SizedBox(
              width: 300,
              child: Center(
                child: ClipRRect(
                  child: Image.network(
                      "https://logosmarcas.net/wp-content/uploads/2021/10/One-Piece-Logo.png"),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                    child: Center(
                      child: Text(
                        "One Piece Crew",
                        style: GoogleFonts.roboto(
                            fontSize: 40,
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                    child: Center(
                      child: Text(
                        "Recrute seus piratas favoritos, monte sua tripulação dos sonhos e navegue pelos mares em busca do tesouro lendário!",
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      width: 320,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contextNew) => LoginScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  backgroundColor: Colors.deepPurpleAccent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
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
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed:  () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contextNew) => RegisterScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: Colors.white, // Cor da borda
                                      width: 2.0, // Largura da borda
                                    )),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Registrar",
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
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
