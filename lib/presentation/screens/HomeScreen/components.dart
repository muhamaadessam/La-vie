
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customTab({required String? text}) {
  return  Padding(
    padding: const EdgeInsets.all(1.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(248, 248, 248, 1),
      ),
      width: 100,
      height: 32,
      child: Center(child: Text(text!)),
    ),
  );
}
