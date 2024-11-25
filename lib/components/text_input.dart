import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  TextInput({required this.label, required this.validator, required this.controller, required this.textInputType,super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Insira um nome';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: label,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.deepPurpleAccent,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.deepPurple,
            width: 2.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide:
          const BorderSide(color: Colors.redAccent, width: 1.0),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
