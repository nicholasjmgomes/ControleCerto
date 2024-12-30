import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextBox extends StatelessWidget {
  const TextBox(
      {this.controller,
      this.maxLength,
      this.maxLines,
      this.prefixText,
      this.keyboardType,
      this.inputFormatters,
      this.inputDecoration,
      this.autovalidateMode,
      required this.validator,
      super.key});

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration? inputDecoration;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?) validator;
  final String? prefixText;
  final int? maxLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixText: prefixText,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 3, 8, 77),
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      autovalidateMode: autovalidateMode,
      validator: validator,
    );
  }
}
