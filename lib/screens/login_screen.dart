import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quest/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthService service = AuthService();
  @override
  Widget build(BuildContext context) {
    login() {
      String username = _usernameController.text;
      String password = _passwordController.text;
      service.login(username: username, password: password);
      print('$username / $password');
    }

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
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          "Bem Vindo Capitão!",
                          style: GoogleFonts.inter(
                              fontSize: 25,
                              decoration: TextDecoration.none,
                              color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.bold),
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
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  hintText: 'Usuário',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurpleAccent,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(30)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurpleAccent,
                                          width: 2.0),
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
                                obscureText: true,
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  hintText: 'Senha',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurpleAccent,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(30)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurpleAccent,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: SizedBox(
                                width: 150,
                                child: ElevatedButton(
                                  onPressed: login,
                                  style: ElevatedButton.styleFrom(
                                      elevation: 5,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 15),
                                      backgroundColor: Colors.deepPurpleAccent,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
