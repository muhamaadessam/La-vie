
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customHomeTab({
  required String? text,
  required TextStyle? textStyle,
  required ButtonStyle? buttonStyle,
  required VoidCallback? onTab,
}) {
  return ElevatedButton(
    onPressed: onTab,
    style: buttonStyle,
    child: SizedBox(
      height: 32,
      width: 51,
      child: Center(
        child: Text(
          text!,
          style: textStyle,
        ),
      ),
    ),
  );
}
