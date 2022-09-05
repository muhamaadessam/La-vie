import 'package:flutter/material.dart';
import '../../../Shared/Constant/text.dart';

ButtonStyle? buttonStyle1 = ButtonStyle(
  side: MaterialStateProperty.resolveWith(
        (states) => BorderSide(
      color: Colors.black.withOpacity(.13),
    ),
  ),
  elevation: MaterialStateProperty.resolveWith((states) => 0),
  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
);
ButtonStyle? buttonStyle2 = ButtonStyle(
  elevation: MaterialStateProperty.resolveWith((states) => 0),
);
TextStyle? textStyle1 = textStyle(
  color: Colors.grey[400],
  weight: FontWeight.w500,
  size: 12,
);
TextStyle? textStyle2 = textStyle(
  color: Colors.white,
  weight: FontWeight.w500,
  size: 12,
);