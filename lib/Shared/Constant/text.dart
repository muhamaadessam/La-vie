import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle({FontWeight? weight, double? size,Color? color}) {
  return GoogleFonts.roboto(
    fontWeight: weight,
    fontSize: size,
    color: color,
  );
}
