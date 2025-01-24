import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quest/services/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService service = AuthService();

  @override
  Widget build(BuildContext context) {
    void register() {
      if (_formKey.currentState!.validate()) {
        String username = _usernameController.text;
        String password = _passwordController.text;


        service.register(username: username, password: password);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuário registrado com sucesso!')),
        );
      }
    }

    InputDecoration buildInputDecoration(String hintText) {
      return InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.deepPurpleAccent, width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.deepPurpleAccent, width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.redAccent, width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.redAccent, width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
      );
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.3,
            image: NetworkImage(
              "https://i.pinimg.com/736x/f2/d3/01/f2d3014cea40c969f0fe15e78a1b04f0.jpg",
            ),
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
                      "https://logosmarcas.net/wp-content/uploads/2021/10/One-Piece-Logo.png",
                    ),
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                            "Vamos Iniciar Sua Jornada!",
                            style: GoogleFonts.inter(
                              fontSize: 25,
                              decoration: TextDecoration.none,
                              color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 8.0),
                          child: TextFormField(
                            controller: _usernameController,
                            decoration:
                            buildInputDecoration('Crie seu nome de usuário'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira um nome de usuário';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 8.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: buildInputDecoration('Crie uma senha'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira uma senha';
                              } else if (value.length < 6) {
                                return 'A senha deve ter pelo menos 6 caracteres';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 8.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: _confirmPasswordController,
                            decoration:
                            buildInputDecoration('Confirme sua senha'),
                            validator: (value) {
                              if (value != _passwordController.text) {
                                return 'As senhas não coincidem';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: register,
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                backgroundColor: Colors.deepPurpleAccent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              child: Text(
                                "Registrar",
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
