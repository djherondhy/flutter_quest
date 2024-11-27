import 'package:flutter/material.dart';
import 'package:quest/components/form_components/url_input.dart';
import 'package:quest/data/personagem_inherited.dart';

import '../components/form_components/text_input.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.personagemContext});

  final BuildContext personagemContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController forceController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _addPersonagem() {
    if (_formKey.currentState!.validate()) {
      PersonagemInherited.of(widget.personagemContext).newPersonagem(
        nameController.text,
        classController.text,
        int.parse(forceController.text),
        imageController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Personagem registrado!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Personagem',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 13.0),
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: 330,
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          imageController.text,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Container(
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.deepPurpleAccent,
                              ),
                            );
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 8.0, left: 8.0, right: 8.0),
                      child: TextInput(
                          label: 'Nome',
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Este campo não pode ser vazio';
                            }
                            return null;
                          },
                          controller: nameController,
                          textInputType: TextInputType.text),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextInput(
                          label: 'Classe',
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Este campo não pode ser vazio';
                            }
                            return null;
                          },
                          controller: classController,
                          textInputType: TextInputType.text),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextInput(
                          label: 'Força',
                          validator: (String? value) {
                            if (value!.isEmpty ||
                                int.parse(value) > 5 ||
                                int.parse(value) < 1) {
                              return 'Insira uma força entre 1 e 5';
                            }
                            return null;
                          },
                          controller: forceController,
                          textInputType: TextInputType.number),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UrlInput(
                        label: 'Foto',
                        state: (String? value) {
                          setState(() {});
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Este campo não pode ser vazio';
                          }
                          return null;
                        },
                        controller: imageController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                        onPressed: _addPersonagem,
                        style: ElevatedButton.styleFrom(
                            elevation: 5,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            backgroundColor: Colors.deepPurpleAccent,
                            shadowColor: Colors.transparent,
                            minimumSize: const Size(40, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Adicionar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
