import 'package:flutter/material.dart';

import '../../../Shared/Constant/colors.dart';
import '../../../Shared/Constant/images.dart';
import '../../../Shared/Constant/text.dart';

class OneChoose extends StatelessWidget {
  const OneChoose({
    Key? key,
    required this.answer,
    required this.isChoose,required this.function,
  }) : super(key: key);
  final String? answer;
  final bool? isChoose;
  // ignore: prefer_typing_uninitialized_variables
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: function,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: primaryColor,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '$answer',
                style: textStyle(color: Colors.black, size: 15),
              ),
            ),
            IconButton(
              icon: Image.asset(isChoose!
                  ? '${imageAsset}EllipseFull.png'
                  : '${imageAsset}Ellipse.png'),
              onPressed: function,
            ),
          ],
        ),
      ),
    );
  }
}
