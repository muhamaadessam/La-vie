import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final bool? isPassword;
  final FormFieldValidator<String>? validation;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  CustomTextFormField({
    Key? key,
    required this.title,
    required this.isPassword,
    required this.controller,
    required this.validation, this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: const Color.fromRGBO(111, 111, 111, 1),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          keyboardType:keyboardType,
          validator: validation,
          controller: controller,
          obscureText: isPassword!,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color.fromRGBO(147, 147, 147, 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
