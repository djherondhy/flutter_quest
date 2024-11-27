import 'package:flutter/material.dart';

class UrlInput extends StatefulWidget {
  final String label;
  final String? Function(String?)? validator;
  final String? Function(String?)? state;
  final TextEditingController? controller;


  UrlInput({required this.label, required this.validator, required this.controller, required this.state, super.key});

  @override
  State<UrlInput> createState() => _UrlInputState();
}

class _UrlInputState extends State<UrlInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.state,
      controller: widget.controller,
      keyboardType: TextInputType.url,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.label,
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
